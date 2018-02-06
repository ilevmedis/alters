create table fin_cashier(cashierid number(38) not null, companyid number(38) not null,
  fyearid number(38) not null, mnemonic varchar2(20) not null, 
  descr varchar2(50) not null, isactive varchar2(1) not null);
alter table fin_cashier add constraint fin_cahhier_pk primary key (cashierid, companyid, fyearid);

alter table fin_transheader add cashierid number(38);
alter table fin_transheader add constraint fin_cashier_transheader 
  foreign key  (cashierid, companyid, fyearid)
  references fin_cashier (cashierid, companyid, fyearid);
alter table fin_transdetail add cashierid number(38);
alter table fin_transdetail add constraint fin_cashier_transdetail
  foreign key  (cashierid, companyid, fyearid)
  references fin_cashier (cashierid, companyid, fyearid);