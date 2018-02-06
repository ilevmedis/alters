alter table pbl_chargeheader add dapyrelatedfinitemid number(38);
alter table pbl_chargeheader
  add constraint fin_item_chargeheader_fk
  foreign key (dapyrelatedfinitemid, companyid, fyearid)
  references fin_item(finitemid, companyid, fyearid);


alter table inv_transheader add dapyrelatedfinitemid number(38);
alter table inv_transheader
  add constraint fin_item_intransheader_fk
  foreign key (dapyrelatedfinitemid, companyid, fyearid)
  references fin_item(finitemid, companyid, fyearid);