alter table PTA_OUPPARAMETERS add ORDERDOCTORROLEID number(38);

alter table PBL_CHARGEHEADER add ORDERPERSONID number(38);

alter table PBL_CHARGEHEADER
  add constraint MED_ORDERPERSON_CHARGEHD_FK foreign key (ORDERPERSONID, COMPANYID, FYEARID)
  references med_orderperson (ORDERPERSONID, COMPANYID, FYEARID);

create index MED_ORDERPERSON_CHARGEHD_FK on PBL_CHARGEHEADER (orderpersonid, companyid, fyearid);
