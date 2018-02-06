create table MED_MSGUSERS
(
  FYEARID   number(38) not null,
  COMPANYID number(38) not null,
  USERNAME  varchar2(20) not null
);

alter table MED_MSGUSERS
  add constraint PK_MED_MSGUSERS primary key (USERNAME, COMPANYID, FYEARID);

alter table MED_MSGUSERS
  add constraint FK_MSGUSERS_SYSUSERS foreign key (USERNAME, COMPANYID)
  references sys_user (USERNAME, COMPANYID) on delete cascade;

alter table MED_MSGUSERS
  add constraint FK_MSGUSERS_MEDPARAMS foreign key (COMPANYID, FYEARID)
  references med_parameters (COMPANYID, FYEARID) on delete cascade;

create index FK_MSGUSERS_SYSUSERS on MED_MSGUSERS (username, companyid);
create index FK_MSGUSERS_MEDPARAMS on MED_MSGUSERS (companyid, fyearid);


create table MED_MESSAGE
(
  MESSAGEID      number(38) not null,
  MESSAGEDATE    DATE not null,
  COMPANYID      number(38) not null,
  USERNAME       varchar2(20) not null,
  VISITID        number(38) not null,
  FYEARID        number(38) not null,
  TABLEPK        number(38) not null,
  ACTION         number(38) not null,
  MESSAGECOMMENT varchar2(100) not null,
  ISREAD         varchar2(1) not null,
  READDATE       DATE,
  PAGEFORM       varchar2(100) not null
);

alter table MED_MESSAGE
  add constraint PK_MED_MESSAGE primary key (MESSAGEID, COMPANYID, FYEARID);
alter table MED_MESSAGE
  add constraint FK_MED_MESSAGE_VISIT foreign key (VISITID, COMPANYID, FYEARID)
  references pta_visit (VISITID, COMPANYID, FYEARID);
alter table MED_MESSAGE
  add constraint FK_MED_MESSAGE_USER foreign key (USERNAME, COMPANYID)
  references sys_user (USERNAME, COMPANYID);

create index FK_MED_MESSAGE_VISIT on MED_MESSAGE (visitid, companyid, fyearid);
create index FK_MED_MESSAGE_USER on MED_MESSAGE (username, companyid);

alter table PBL_CHARGEPACKAGE ADD COMMENTS VARCHAR2(200);