alter table SYS_USER add(
  PASSWORDMAXAGE number(38),
  LASTPASSWORDCHANGE date,
  ISACCOUNTLOCKED varchar2(1) default '0' not null,
  CHANGEPASSWORDONFIRSTLOGON varchar2(1) default '0' not null,
  ISENCRYPTED varchar2(1) default '0' not null
);
create index sys_logfile_user_indx on sys_logfile (companyid, username, action);
--- create index for all sys_logfile instances
--- compute statistics

-- !!!!!! for attikon updated isEncrypted to '1'