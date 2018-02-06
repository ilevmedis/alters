alter table fin_transheader add xep1id number(38);
alter table fin_transheader add constraint plg_xep1_transheader_fk
  foreign key (xep1id, companyid, fyearid)
  references plg_xep1 (xep1id, companyid, fyearid);






