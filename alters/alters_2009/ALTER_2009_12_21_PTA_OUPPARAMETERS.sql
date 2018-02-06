alter table pta_oupparameters add defaultfinitemid number(38);
alter table pta_oupparameters
  add constraint fin_item_oupparameters_fk
  foreign key (defaultfinitemid, companyid, fyearid)
  references fin_item (finitemid, companyid, fyearid);