alter table MED_ORDERHEADER add EOPYYPARAMETERSID number(38);
alter table MED_ORDERHEADER
  add constraint
  PTA_EOPYYPARAMS_ORDERHD_FK
  foreign key(EOPYYPARAMETERSID, COMPANYID, FYEARID)
  references PTA_EOPYYPARAMETERS(EOPYYPARAMETERSID, COMPANYID, FYEARID);

