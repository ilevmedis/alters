ALTER TABLE MED_ORDERHEADER ADD ORDERRECEIPTFACILITY VARCHAR2(40);
ALTER TABLE MED_ORDERHEADER
  ADD CONSTRAINT ORDERRECEIPTFACIL_ORDERHD_FK
  FOREIGN KEY(ORDERRECEIPTFACILITY, COMPANYID, FYEARID)
  REFERENCES PTA_FACILITY(FACILITYID, COMPANYID, FYEARID);