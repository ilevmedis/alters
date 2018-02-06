create table sys_reportschedule(
  reportscheduleid number(38) not null,
  reportid number(38) not null,
  companyid number(38) not null,
  isactive varchar2(1) not null,
  fyearid number(38) not null,
  appname varchar2(50) not null,
  lang varchar2(20) not null,
  username varchar2(20) not null,
  triggertype number(38) not null,
  repeatcount number(38),
  interval number(38),
  cronexpression varchar2(30),
  comments varchar2(200),
  criteria clob,
  appserver varchar2(50),
  lastupddate date);

alter table sys_reportschedule add constraint
  sys_reportschedule_pk primary key (reportscheduleid);
alter table sys_reportschedule add constraint
  sys_report_schedule_fk foreign key (reportid, companyid)
  references sys_report(reportid, companyid);
alter table sys_reportschedule add constraint
  sys_user_reportschedule_fk foreign key (username, companyid)
  references sys_user(username, companyid);
create index sys_report_schedule_fk on sys_reportschedule(reportid, companyid);
create index sys_user_reportschedule_fk on sys_reportschedule(username, companyid);