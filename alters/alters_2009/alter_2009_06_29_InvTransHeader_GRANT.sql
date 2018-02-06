alter table INV_TRANSHEADER add DOCTORID number(38);
alter table INV_TRANSHEADER add NOOFGRANTDAYS number(38);
alter table INV_TRANSHEADER add GRANTREASON varchar2(50);

alter table INV_TRANSHEADER
  add constraint FK_INV_TRANSDETAIL_DOCTOR foreign key (doctorid,companyid,fyearid)
  references pta_doctor (doctorid,companyid,fyearid);
