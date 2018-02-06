alter table pbl_parameters add finitemdrugschargeid number(38);
alter table pbl_parameters
  add constraint finitemdrugs_pbl_parms_fk
  foreign key(finitemdrugschargeid, companyid, fyearid)
  references fin_item(finitemid, companyid, fyearid);
