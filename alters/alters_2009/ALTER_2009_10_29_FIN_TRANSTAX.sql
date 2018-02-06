alter table fin_transtax add costcenterid varchar2(40);
alter table fin_transtax add constraint
  fin_costcenter_transtax_fk
  foreign key (costcenterid, companyid, fyearid)
  references fin_costcenter(costcenterid, companyid, fyearid);
create index fin_costcenter_transtax_fk on fin_transtax(costcenterid, companyid, fyearid);
