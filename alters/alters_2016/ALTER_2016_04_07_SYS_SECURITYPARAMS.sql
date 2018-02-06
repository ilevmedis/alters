create table sys_securityparams(
  companyid number(38) not null,
  encryptpasswords varchar2(1) default '0' not null,
  minpasswordlength number(38),
  passwordcomplexityindicator number(38),
  lockaccountretries number(38)
);
alter table sys_securityparams
  add constraint sys_securityparams_pk
  primary key(companyid);