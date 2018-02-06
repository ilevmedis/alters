alter table sys_logfile add (modelname varchar2(100), logchanges clob, rowpk varchar2(300));
alter table sys_logfile modify modelname default '-';
update sys_logfile set modelname = '-';
commit;
alter table sys_logfile modify modelname not null;
update sys_logfile set rowpk = objectpk;
commit;
alter table sys_logfile modify rowpk not null;
alter table sys_logfile drop primary key;
alter table sys_logfile add constraint sys_logfile_pk primary key
  (OBJECTID, OBJECTPK, MODELNAME, ROWPK, USERNAME, COMPANYID, LOGDATE, ACTION);