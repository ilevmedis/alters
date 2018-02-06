create table inv_storeapproveusers(
  invstoreid number(38) not null,
  fyearid number(38) not null,
  companyid number(38) not null,
  username varchar2(20) not null,
  isapprovingfintranspartyorders varchar2(1) not null,
  isapprovingstoreorders varchar2(1) not null
);
alter table inv_storeapproveusers add constraint inv_storeapproveusers_pk
  primary key(invstoreid, fyearid, companyid, username);
alter table inv_storeapproveusers add constraint inv_store_approveusers_fk
  foreign key(invstoreid, fyearid, companyid)
  references inv_store(invstoreid, fyearid, companyid);
alter table inv_storeapproveusers add constraint sys_user_approveusers_fk
  foreign key(username, companyid)
  references sys_user(username, companyid);

