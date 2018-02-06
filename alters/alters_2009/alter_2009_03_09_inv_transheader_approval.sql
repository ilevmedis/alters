alter table inv_transheader add (approvepersonid number(38), approvedate date, orderstatus number(38));

alter table inv_transheader 
  add constraint pers_invtranshd_approveprs
  foreign key (approvepersonid, companyid, fyearid) references prs_personel (personid, companyid, fyearid);
