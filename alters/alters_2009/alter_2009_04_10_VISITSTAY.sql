﻿CREATE OR REPLACE VIEW PTA_VISITSTAY AS
SELECT 
       PTA_FACILITY.COMPANYID,
       PTA_FACILITY.FYEARID,
       PTA_FACILITY.FACILITYID,
	     PTA_VISIT.MNEMONIC,
       PTA_VISIT.LASTNAME,
       PTA_VISIT.FIRSTNAME,
       PTA_VISIT.BIRTHDATE,
       PTA_VISIT.GENDERID,
       PTA_VISIT.SEVERITYID,
       PTA_VISIT.ISCONTAGIOUS,
       PTA_VISIT.VISITID,
       PTA_VISIT.PATIENTID,
       PTA_VISITADMISSION.VISITADMISSIONID,
  	   (
       SELECT 	
                PTA_DIAGNOSISCODE.DESCR
       FROM 	
                
                
                PTA_VISITDIAGNOSIS LEFT OUTER JOIN PTA_DIAGNOSISCODE ON 
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_DIAGNOSISCODE.COMPANYID  AND
                PTA_VISITDIAGNOSIS.DIAGNOSISCODEID = PTA_DIAGNOSISCODE.DIAGNOSISCODEID  AND
                PTA_VISITDIAGNOSIS.DIAGNOSISGROUPINGID = PTA_DIAGNOSISCODE.DIAGNOSISGROUPINGID
                LEFT OUTER JOIN PTA_DIAGNOSISGROUPING ON
                PTA_VISITDIAGNOSIS.DIAGNOSISGROUPINGID = PTA_DIAGNOSISGROUPING.DIAGNOSISGROUPINGID  AND
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_DIAGNOSISGROUPING.COMPANYID  
                
       WHERE
                PTA_VISITDIAGNOSIS.ISMAINDIAGNOSIS = '1' AND 
                PTA_VISITDIAGNOSIS.DIAGNOSISUSEINDICATOR = 1 AND
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_VISIT.COMPANYID AND
                PTA_VISITDIAGNOSIS.FYEARID = PTA_VISIT.FYEARID AND
                PTA_VISITDIAGNOSIS.VISITID = PTA_VISIT.VISITID AND
                PTA_DIAGNOSISCODE.DIAGNOSISGROUPINGID = PTA_DIAGNOSISGROUPING.DIAGNOSISGROUPINGID  AND
                PTA_DIAGNOSISCODE.COMPANYID = PTA_DIAGNOSISGROUPING.COMPANYID  
                
                
                ) DIAGNOSISCODE,  
        (
        SELECT 	
                PTA_VISITDIAGNOSIS.DIAGNOSISTEXT
        FROM 	
                
                
                PTA_VISITDIAGNOSIS LEFT OUTER JOIN PTA_DIAGNOSISCODE ON 
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_DIAGNOSISCODE.COMPANYID  AND
                PTA_VISITDIAGNOSIS.DIAGNOSISCODEID = PTA_DIAGNOSISCODE.DIAGNOSISCODEID  AND
                PTA_VISITDIAGNOSIS.DIAGNOSISGROUPINGID = PTA_DIAGNOSISCODE.DIAGNOSISGROUPINGID
                LEFT OUTER JOIN PTA_DIAGNOSISGROUPING ON
                PTA_VISITDIAGNOSIS.DIAGNOSISGROUPINGID = PTA_DIAGNOSISGROUPING.DIAGNOSISGROUPINGID  AND
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_DIAGNOSISGROUPING.COMPANYID  
                
        WHERE
                PTA_VISITDIAGNOSIS.ISMAINDIAGNOSIS = '1' AND 
                PTA_VISITDIAGNOSIS.DIAGNOSISUSEINDICATOR = 1 AND
                PTA_VISITDIAGNOSIS.COMPANYID = PTA_VISIT.COMPANYID AND
                PTA_VISITDIAGNOSIS.FYEARID = PTA_VISIT.FYEARID AND
                PTA_VISITDIAGNOSIS.VISITID = PTA_VISIT.VISITID AND
                PTA_DIAGNOSISCODE.DIAGNOSISGROUPINGID = PTA_DIAGNOSISGROUPING.DIAGNOSISGROUPINGID  AND
                PTA_DIAGNOSISCODE.COMPANYID = PTA_DIAGNOSISGROUPING.COMPANYID  
                
                
                ) DIAGNOSISTEXT  
FROM 	
      PTA_FACILITY,
      PTA_TRANSFER,
      PTA_VISIT,
      PTA_VISITADMISSION
WHERE	
      PTA_FACILITY.COMPANYID = PTA_TRANSFER.COMPANYID AND      
      PTA_FACILITY.FYEARID = PTA_TRANSFER.FYEARID AND      
      PTA_FACILITY.FACILITYID = PTA_TRANSFER.TOFACILITYID AND      
      PTA_TRANSFER.COMPANYID=PTA_VISIT.COMPANYID AND 
      PTA_TRANSFER.FYEARID=PTA_VISIT.FYEARID AND
      PTA_TRANSFER.VISITID=PTA_VISIT.VISITID AND 
      PTA_VISITADMISSION.VISITID=PTA_VISIT.VISITID AND 
      PTA_VISITADMISSION.COMPANYID=PTA_VISIT.COMPANYID AND 
      PTA_VISITADMISSION.FYEARID=PTA_VISIT.FYEARID AND 
      PTA_VISITADMISSION.ISCANCELED='0' AND
      PTA_VISIT.VISITSTATUS=1 AND 
      PTA_VISIT.ISCANCELED='0'AND 
      PTA_TRANSFER.ISLASTTRANSFER='1' AND
      PTA_FACILITY.ISACTIVE = '1' AND
      PTA_FACILITY.USESTATUS = '1'

