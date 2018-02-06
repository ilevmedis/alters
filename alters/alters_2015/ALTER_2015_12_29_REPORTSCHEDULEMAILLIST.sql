create table SYS_REPORTSCHEDULEMAILLIST
(
  REPORTSCHEDULEID         number(38) not null,
  REPORTSCHEDULEMAILLISTID number(38) not null,
  COMPANYID                number(38) not null,
  RECIPIENTNAME            varchar2(100),
  RECIPIENTMAIL            varchar2(50)
);

alter table SYS_REPORTSCHEDULEMAILLIST
  add constraint SYS_REPORTSCHEDULEMAILLIST_PK primary key (REPORTSCHEDULEMAILLISTID);
alter table SYS_REPORTSCHEDULEMAILLIST
  add constraint SYS_REPORTSCHEDULE_FK foreign key (REPORTSCHEDULEID)
  references sys_reportschedule (REPORTSCHEDULEID) on delete cascade;
