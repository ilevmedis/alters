alter table src_supplyrequest add (orderpersonid number(38), orderpersonfyearid number(38));
alter table src_supplyrequest 
  add constraint personel_src_supplyrequest 
  foreign key (orderpersonid, companyid, orderpersonfyearid) references prs_personel (personid, companyid, fyearid);

