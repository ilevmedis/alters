﻿We added the InOutPAtient to the view
-----------------------------------------


CREATE OR REPLACE VIEW PTA_LASTPATIENTVISIT AS
select PTA_VISIT.VISITID,PTA_VISIT.COMPANYID,  PTA_VISIT.FYEARID,PTA_VISIT.MNEMONIC,
   PTA_VISIT.PATIENTID ,PTA_VISIT.FIRSTNAME,PTA_VISIT.LASTNAME,PTA_VISIT.FATHERFIRSTNAME,PTA_VISIT.MIDDLENAME,PTA_VISIT.MOTHERFIRSTNAME,
   PTA_VISIT.FATHERLASTNAME,PTA_VISIT.MOTHERLASTNAME,PTA_VISIT.EMAIL,PTA_VISIT.IDNUMBER,PTA_VISIT.PASSPORTNUMBER,
   PTA_VISIT.IDDATE,PTA_VISIT.IDISSUER,PTA_VISIT.PASSPORTDATE,PTA_VISIT.TAXREGISTRATIONNO,PTA_VISIT.TAXBRANCHID,
   PTA_VISIT.GENDERID,PTA_VISIT.PARTNERLASTNAME,PTA_VISIT.PARTNERFIRSTNAME,PTA_VISIT.ISVIP,PTA_VISIT.ISBENEFICIARY,
   PTA_VISIT.ESYEPROFESSIONID,PTA_VISIT.LEGALIZATIONPAPER,PTA_VISIT.NATIONALITYID,PTA_VISIT.NATIONALITYTYPEID,
   PTA_VISIT.MARITALSTATUSID,PTA_VISIT.RELEGIONID,PTA_VISIT.PASSPORTCOUNTRYID,PTA_VISIT.BIRTHCOUNTRYID,PTA_VISIT.BIRTHMUNICIPALITYID,
   PTA_VISIT.BIRTHPREFECTUREID,PTA_VISIT.LIVINGPREFECTUREID,PTA_VISIT.LIVINGCITYID,PTA_VISIT.LIVINGMUNICIPALITYID,PTA_VISIT.CITIZENSHIPID,
   PTA_VISIT.BIRTHDATE,PTA_VISIT.BIRTHCITYID,SYS_ADDRESS.ADDRESSID,SYS_ADDRESS.COUNTRYID,SYS_ADDRESS.STREET1,
   SYS_ADDRESS.STREET1NUM,SYS_ADDRESS.STREET2,SYS_ADDRESS.STREET2NUM,SYS_ADDRESS.DISTRICTID,SYS_ADDRESS.ISMAINADDRESS,
   SYS_ADDRESS.CITYID,SYS_PHONE.PHONEID,SYS_PHONE.PHONETYPE,SYS_PHONE.ACCESSPHONE,SYS_PHONE.PHONENUMBER,SYS_ADDRESS.DISTRICT UNCODEDLIVINGDISTRICT,
   SYS_CITY.NAME CITYNAME,
   PTA_VISIT.ADMISSIONDATE  LASTVISITDATE,
   0 ISUNKNOWN,
   PBL_VISITCOVERDETAIL.FINTRANSPARTYID, PATIENT.MNEMONIC PATIENTMNEMONIC, PTA_VISIT.INOUTPATIENT INOUTPATIENT
from
   PTA_VISIT LEFT OUTER JOIN PBL_VISITCOVERDETAIL ON
     PBL_VISITCOVERDETAIL.VISITID = PTA_VISIT.VISITID AND
     PBL_VISITCOVERDETAIL.COMPANYID = PTA_VISIT.COMPANYID AND 
     PBL_VISITCOVERDETAIL.FYEARID = PTA_VISIT.FYEARID AND
     PBL_VISITCOVERDETAIL.WHOCOVERSINDICATOR = 2
    LEFT OUTER JOIN SYS_ADDRESS ON
      PTA_VISIT.VISITID = SYS_ADDRESS.VISITID AND
      PTA_VISIT.COMPANYID = SYS_ADDRESS.COMPANYID AND
      PTA_VISIT.FYEARID = SYS_ADDRESS.FYEARID AND
      SYS_ADDRESS.ISMAINADDRESS = '1'
    LEFT OUTER JOIN SYS_CITY ON 
      SYS_CITY.CITYID=SYS_ADDRESS.CITYID 
      AND SYS_CITY.COMPANYID=SYS_ADDRESS.COMPANYID
    LEFT OUTER JOIN SYS_PHONE ON
      PTA_VISIT.VISITID = SYS_PHONE.VISITID AND
      PTA_VISIT.COMPANYID = SYS_PHONE.COMPANYID AND
      PTA_VISIT.FYEARID = SYS_PHONE.FYEARID AND
      SYS_PHONE.ACCESSPHONE = 1,    
   PTA_PATIENT PATIENT
where
   PTA_VISIT.PATIENTID = PATIENT.PATIENTID
   AND PTA_VISIT.COMPANYID = PATIENT.COMPANYID
   AND PTA_VISIT.ISCANCELED = 0
   AND PTA_VISIT.VISITSTATUS IN (1,2)
   AND PATIENT.ISACTIVE = 1
   AND PATIENT.ISDELETED = 0
   AND (SELECT MAX(PTA_VISIT.ADMISSIONDATE) FROM PTA_VISIT WHERE 
    PTA_VISIT.PATIENTID=PATIENT.PATIENTID
    AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
    AND PTA_VISIT.ISCANCELED = 0
    AND PTA_VISIT.VISITSTATUS IN (1,2)
    ) = PTA_VISIT.ADMISSIONDATE 
    AND (SELECT MAX(PTA_VISIT.VISITID) FROM PTA_VISIT WHERE
             PTA_VISIT.PATIENTID=PATIENT.PATIENTID
             AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
             AND PTA_VISIT.ISCANCELED = 0
             AND PTA_VISIT.VISITSTATUS IN (1,2)             
             AND PTA_VISIT.ADMISSIONDATE = (SELECT MAX(PTA_VISIT.ADMISSIONDATE) FROM PTA_VISIT WHERE 
             PTA_VISIT.PATIENTID=PATIENT.PATIENTID
             AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
             AND PTA_VISIT.ISCANCELED = 0
             AND PTA_VISIT.VISITSTATUS IN (1,2))
             AND PTA_VISIT.ISCANCELED = 0
             ) = PTA_VISIT.VISITID
 UNION
select PTA_VISIT.VISITID,PTA_VISIT.COMPANYID,  PTA_VISIT.FYEARID,PTA_VISIT.MNEMONIC,
   PTA_VISIT.PATIENTID ,PTA_VISIT.FIRSTNAME,PTA_VISIT.LASTNAME,PTA_VISIT.FATHERFIRSTNAME,PTA_VISIT.MIDDLENAME,PTA_VISIT.MOTHERFIRSTNAME,
   PTA_VISIT.FATHERLASTNAME,PTA_VISIT.MOTHERLASTNAME,PTA_VISIT.EMAIL,PTA_VISIT.IDNUMBER,PTA_VISIT.PASSPORTNUMBER,
   PTA_VISIT.IDDATE,PTA_VISIT.IDISSUER,PTA_VISIT.PASSPORTDATE,PTA_VISIT.TAXREGISTRATIONNO,PTA_VISIT.TAXBRANCHID,
   PTA_VISIT.GENDERID,PTA_VISIT.PARTNERLASTNAME,PTA_VISIT.PARTNERFIRSTNAME,PTA_VISIT.ISVIP,PTA_VISIT.ISBENEFICIARY,
   PTA_VISIT.ESYEPROFESSIONID,PTA_VISIT.LEGALIZATIONPAPER,PTA_VISIT.NATIONALITYID,PTA_VISIT.NATIONALITYTYPEID,
   PTA_VISIT.MARITALSTATUSID,PTA_VISIT.RELEGIONID,PTA_VISIT.PASSPORTCOUNTRYID,PTA_VISIT.BIRTHCOUNTRYID,PTA_VISIT.BIRTHMUNICIPALITYID,
   PTA_VISIT.BIRTHPREFECTUREID,PTA_VISIT.LIVINGPREFECTUREID,PTA_VISIT.LIVINGCITYID,PTA_VISIT.LIVINGMUNICIPALITYID,PTA_VISIT.CITIZENSHIPID,
   PTA_VISIT.BIRTHDATE,PTA_VISIT.BIRTHCITYID,SYS_ADDRESS.ADDRESSID,SYS_ADDRESS.COUNTRYID,SYS_ADDRESS.STREET1,
   SYS_ADDRESS.STREET1NUM,SYS_ADDRESS.STREET2,SYS_ADDRESS.STREET2NUM,SYS_ADDRESS.DISTRICTID,SYS_ADDRESS.ISMAINADDRESS,
   SYS_ADDRESS.CITYID,SYS_PHONE.PHONEID,SYS_PHONE.PHONETYPE,SYS_PHONE.ACCESSPHONE,SYS_PHONE.PHONENUMBER,SYS_ADDRESS.DISTRICT UNCODEDLIVINGDISTRICT,
   SYS_CITY.NAME CITYNAME,
   PTA_VISIT.ADMISSIONDATE  LASTVISITDATE,
   0 ISUNKNOWN,
   PBL_VISITCOVERDETAIL.FINTRANSPARTYID, PATIENT.MNEMONIC PATIENTMNEMONIC, PTA_VISIT.INOUTPATIENT INOUTPATIENT
from
   PTA_VISIT LEFT OUTER JOIN PBL_VISITCOVERDETAIL ON
     PBL_VISITCOVERDETAIL.VISITID = PTA_VISIT.VISITID AND
     PBL_VISITCOVERDETAIL.COMPANYID = PTA_VISIT.COMPANYID AND 
     PBL_VISITCOVERDETAIL.FYEARID = PTA_VISIT.FYEARID AND
     PBL_VISITCOVERDETAIL.WHOCOVERSINDICATOR = 2
    LEFT OUTER JOIN SYS_ADDRESS ON
      PTA_VISIT.VISITID = SYS_ADDRESS.VISITID AND
      PTA_VISIT.COMPANYID = SYS_ADDRESS.COMPANYID AND
      PTA_VISIT.FYEARID = SYS_ADDRESS.FYEARID AND
      SYS_ADDRESS.ISMAINADDRESS = '1'
    LEFT OUTER JOIN SYS_CITY ON 
      SYS_CITY.CITYID=SYS_ADDRESS.CITYID
      AND SYS_CITY.COMPANYID=SYS_ADDRESS.COMPANYID
    LEFT OUTER JOIN SYS_PHONE ON
      PTA_VISIT.VISITID = SYS_PHONE.VISITID AND
      PTA_VISIT.COMPANYID = SYS_PHONE.COMPANYID AND
      PTA_VISIT.FYEARID = SYS_PHONE.FYEARID AND
      SYS_PHONE.ACCESSPHONE = 1,    
   PTA_PATIENT PATIENT
where
   PTA_VISIT.PATIENTID = PATIENT.PATIENTID
   AND PTA_VISIT.COMPANYID = PATIENT.COMPANYID
   AND PTA_VISIT.ISCANCELED = 0
   AND PTA_VISIT.VISITSTATUS IN (3)
   AND PATIENT.ISACTIVE = 1
   AND PATIENT.ISDELETED = 0
   AND (SELECT MAX(PTA_VISIT.ADMISSIONDATE) FROM PTA_VISIT WHERE 
    PTA_VISIT.PATIENTID=PATIENT.PATIENTID
    AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
    AND PTA_VISIT.ISCANCELED = 0
    AND PTA_VISIT.VISITSTATUS = 3    
    ) = PTA_VISIT.ADMISSIONDATE 
    AND (SELECT MAX(PTA_VISIT.VISITID) FROM PTA_VISIT WHERE
             PTA_VISIT.PATIENTID=PATIENT.PATIENTID
             AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
             AND PTA_VISIT.ADMISSIONDATE = (SELECT MAX(PTA_VISIT.ADMISSIONDATE) FROM PTA_VISIT WHERE 
             PTA_VISIT.PATIENTID=PATIENT.PATIENTID
             AND PTA_VISIT.COMPANYID =PATIENT.COMPANYID 
             AND PTA_VISIT.ISCANCELED = 0
             AND PTA_VISIT.VISITSTATUS = 3)
             AND PTA_VISIT.ISCANCELED = 0
             ) = PTA_VISIT.VISITID
AND PATIENT.PATIENTID NOT IN 
      (SELECT CHK.PATIENTID FROM PTA_VISIT CHK
        WHERE CHK.COMPANYID = PATIENT.COMPANYID
          AND CHK.PATIENTID = PATIENT.PATIENTID
          AND CHK.VISITSTATUS IN (1,2)
      )

