-- Create the sproc that will create the synonyms in the next step

/****** Object:  StoredProcedure [dbo].[Create_Synonyms]    Script Date: 01/26/2015 16:45:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- creates a synonym for each type of object in source db with prefix 
-- common types are given below (use the type code in a comma-delimited string)
-- TDS Session database requires 2 sets of synonyms:
-- TDSCONFIGS_<tables> and ITEMBANK_ + all tables, functions, and procedures
/*
type	type_desc

FN	SQL_SCALAR_FUNCTION
IF	SQL_INLINE_TABLE_VALUED_FUNCTION
P 	SQL_STORED_PROCEDURE
TF	SQL_TABLE_VALUED_FUNCTION
U 	USER_TABLE
V 	VIEW
*/
CREATE PROCEDURE [dbo].[Create_Synonyms] ( @dbname varchar(1000),  @itsconfigs int = 0, @tdsconfigs int = 0, @scoreConfigs int = 0,  @deleteonly bit = 0, @silent bit = 1)
as
begin
    if (not exists (select * from sys.objects where type = 'U' and name = '_Synonyms')) begin
        CREATE TABLE [dbo].[_Synonyms]  ( 
            [dbname]	varchar(200) NOT NULL,
            [_date] 	datetime NOT NULL,
            [prefix]	varchar(200) NOT NULL,
            CONSTRAINT [PK_Synonyms] PRIMARY KEY([prefix])
        )
    end
    set nocount on;
    declare @query nvarchar(max);
    declare @tname varchar(200), @syn varchar(200);
    declare @objectTypes varchar(100);

    declare @prefix varchar(100);

    if (@itsconfigs  + @tdsconfigs + @scoreCOnfigs <> 1) begin
        print 'Ambiguous request: select ONE of itsconfigs or tdsconfigs';
        return;
    end

    if (@itsconfigs = 1) set @prefix = 'ITSCONFIGS_';
    else if (@tdsconfigs = 1) set @prefix = 'TDSCONFIGS_';
    else if (@scoreConfigs = 1) set @prefix = 'SCORECONFIGS_';

    set @objectTypes = 
    case @prefix
    when 'TDSCONFIGS_' then '''U'''
    when 'ITSCONFIGS_' then '''U'''
    when 'SCORECONFIGS_' then '''U'''
    else 'UNKNOWN'
    end;

    if (@objectTypes = 'UNKNOWN') begin
        print 'Unknown synonym' + @prefix;
        return;
    end

    create table  #objects (tname varchar(200));

-- first, drop all the existing synonyms with this prefix
    insert into #objects (tname)
    select name from sys.objects
    where type_desc = 'SYNONYM' and name like @prefix + '%';

    while (exists (select * from #objects)) begin
        select top 1 @tname = tname from #objects;
        delete from #objects where @tname = tname;
        set @query = N'DROP SYNONYM ' + @tname;
        exec sp_executeSQL @query;
    end

    delete from _Synonyms where prefix = @prefix;
    if (@deleteonly = 1) return;        -- user only wants to drop the synonyms, not create new ones

-- next, get all the user tables from the source database
    set @query = N'insert into #objects (tname) select name from ' + @dbname + '.sys.objects where type in (' + @objectTypes + ')';
-- select @query; return;
    exec sp_ExecuteSQL @query;
/*
    create a synonym for each table using this pattern
    CREATE SYNONYM <prefix><tname>
    FOR <dbname>.dbo.<tname>
*/
    while (exists (select * from #objects)) begin
        select top 1 @tname = tname from #objects;
        delete from #objects where tname = @tname;
        set @syn = @prefix + @tname;
        if (exists (select * from sys.objects where name = @syn)) begin
            set @query = 'DROP SYNONYM ' + @syn;
            exec sp_ExecuteSQL @query;
        end
        if (@tname like 'MSpub_%' or @tname like 'MSPeer_%' )   -- attempt to exclude replication subscriber tables
            continue;
        set @query = 'CREATE SYNONYM ' + @syn + ' FOR ' + @dbname + '.dbo.' + @tname;
        exec sp_ExecuteSQL @query;
    end
    -- record the synonym set
    insert into _Synonyms (prefix, dbname, _date) select @prefix, @dbname, getdate();
    if (@silent = 0) begin
        select name, type_desc
        from sys.objects where name like @prefix + '%'
        order by name;
    end
end
GO