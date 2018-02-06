create table sys_verchange(
  verchangeid number(38) not null,
  descr varchar2(200) not null,
  comments varchar2(200),
  changeindicator number(38) not null,
  changedate date not null,
  sqlstmt clob not null,
  errormessage clob,
  isapplied varchar2(1) not null,
  applydate date
);
alter table sys_verchange
  add constraint sys_verchange_pk
  primary key(verchangeid);

create table sys_verchangeresult(
  verchangeresultid number(38) not null,
  verchangeid number(38) not null,
  sqlstmt clob not null,
  isexecuted varchar2(1) not null,
  executiondate date,
  executionduration number(38),
  isapplied varchar2(1) not null,
  applydate date,
  errormessage clob
);
alter table sys_verchangeresult
  add constraint sys_verchangeresult_pk
  primary key(verchangeresultid);
alter table sys_verchangeresult
  add constraint sys_verchange_result_fk
  foreign key(verchangeid)
  references sys_verchange(verchangeid);
create index sys_verchange_result_fk on sys_verchangeresult (verchangeid);
