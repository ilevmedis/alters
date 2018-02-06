ALTER TABLE PBL_CHARGEHEADER ADD(ISEPRESCR VARCHAR2(1) DEFAULT '0' NOT NULL, ISEPRESCRUPDATED VARCHAR2(1) DEFAULT '0' NOT NULL, EPRESCRUPDDATE DATE);
ALTER TABLE MED_ORDERHEADER ADD(ISEPRESCR VARCHAR2(1) DEFAULT '0' NOT NULL, ISEPRESCRUPDATED VARCHAR2(1) DEFAULT '0' NOT NULL, EPRESCRUPDDATE DATE);
CREATE INDEX PBL_CHARGEHEADER_EPRESCR_I ON PBL_CHARGEHEADER (ISEPRESCR, ISEPRESCRUPDATED, COMPANYID, FYEARID);