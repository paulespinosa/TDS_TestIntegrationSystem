INSERT INTO dbo.Client VALUES ('SBAC') 
INSERT INTO dbo.Client VALUES ('SBAC_PT') 

INSERT INTO dbo.ComputationLocations VALUES ('TIS') 

-- all supported rules
INSERT INTO dbo.ComputationRules VALUES ('ItemCount',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('ItemCountScored',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('MultipleStrandItemCount','Same as ItemCount but uses all relevant items on the specified list of strands') 
INSERT INTO dbo.ComputationRules VALUES ('MultipleStrandItemCountScored','Same as ItemCountScored but uses all relevant items on the specified list of strands')
INSERT INTO dbo.ComputationRules VALUES ('MultiStrandRawScore',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('RawScore',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACAccommodationUseCodes',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACAttemptedness',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACMultiSegmentTheta',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACMultiStrandTheta',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACNumBlocks',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACNumBlocksProficient',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACTheta',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('ScaleScore',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SEBasedPerformanceIndicator',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SEBasedPLWithRounding',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('TestPerformanceLevel',NULL) 
INSERT INTO dbo.ComputationRules VALUES ('SBACCATMultiStrandTheta',NULL)
INSERT INTO dbo.ComputationRules VALUES ('SBACCATTheta',NULL)
