alter table fin_transdetail add (
  fintranspartyid_xep number(38)
);
alter table fin_transdetail
 add constraint fin_transp_findetail_xep_fk
 foreign key(fintranspartyid_xep, companyid, fyearid)
 references fin_transparty(fintranspartyid, companyid, fyearid);
create index fin_transp_findetail_xep_fk on fin_transdetail (fintranspartyid_xep, companyid, fyearid);
update fin_transdetail set fintranspartyid_xep = fintranspartyid
   where eventtypeindicator = 1 and iscredit = '1' and fintranspartyid is not null;