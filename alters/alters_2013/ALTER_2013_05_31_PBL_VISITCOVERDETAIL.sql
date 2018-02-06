ALTER TABLE PBL_VISITCOVERDETAIL ADD (
  ISEANOUNCEMENT VARCHAR2(1) DEFAULT '0' NOT NULL,
  EANOUNCMENTADMISSIONNUM VARCHAR2(15),
  EANOUNCMENTADMISSIONDATE DATE,
  EANOUNCMENTDISCHARGENUM VARCHAR2(15),
  EANOUNCMENTDISCHARGEDATE DATE,
  ORDERDOCTORTAXNO VARCHAR2(10),
  APPROVALDOCTORTAXNO VARCHAR2(10),
  CHRONICDIAGNOSISGROUPINGID NUMBER(38),
  CHRONICDIAGNOSISCODEID VARCHAR2(40)
  );
ALTER TABLE PBL_VISITCOVERDETAIL
  ADD CONSTRAINT PTA_DIAGNOSISCD_VISITCOVER_FK
   FOREIGN KEY (CHRONICDIAGNOSISCODEID, CHRONICDIAGNOSISGROUPINGID, COMPANYID)
   REFERENCES PTA_DIAGNOSISCODE(DIAGNOSISCODEID, DIAGNOSISGROUPINGID, COMPANYID);

ALTER TABLE MED_ORDERHEADER ADD (APPROVALDOCTORTAXNO VARCHAR2(10), ORDERDOCTORTAXNO VARCHAR2(10));
ALTER TABLE PBL_CHARGEHEADER ADD (APPROVALDOCTORTAXNO VARCHAR2(10), ORDERDOCTORTAXNO VARCHAR2(10));
ALTER TABLE PTA_DOCTOR ADD TAXREGISTRATIONNO VARCHAR2(10);
UPDATE PTA_DOCTOR SET TAXREGISTRATIONNO = (SELECT TAXREGISTRATIONNO FROM FIN_TRANSPARTY WHERE
  FIN_TRANSPARTY.FINTRANSPARTYID = PTA_DOCTOR.FINTRANSPARTYID AND
  FIN_TRANSPARTY.COMPANYID = PTA_DOCTOR.COMPANYID AND
  FIN_TRANSPARTY.FYEARID = PTA_DOCTOR.FYEARID) WHERE FINTRANSPARTYID IS NOT NULL;
ALTER TABLE PBL_DOCTORROLE ADD ISATTENDINGPHYSICIAN VARCHAR2(1) DEFAULT '0' NOT NULL;
ALTER TABLE PBL_INSURANCESCHEMEHEADER ADD DAPYCODE VARCHAR2(10);
ALTER TABLE SYS_METADATA ADD (FREETEXT1 VARCHAR2(30), FREETEXT2 VARCHAR2(30), FREETEXT3 VARCHAR2(30));
