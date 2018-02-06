alter table inv_transheader add (orderfaxno varchar2(20), orderrecipient varchar2(50), expectedpurchasedate date, 
  orderpersonid number(38), recipientpersonid number(38), comments varchar2(200));
alter table inv_transheader 
  add constraint personel_invtranshd_orderprs 
  foreign key (orderpersonid, companyid, fyearid) references prs_personel (personid, companyid, fyearid);
alter table inv_transheader add constraint personel_invtranshd_recipient
  foreign key (recipientpersonid, companyid, fyearid) references prs_personel (personid, companyid, fyearid);
