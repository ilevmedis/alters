-- Create table
create table FIN_EVENTTYPELNK
(
  FINEVENTTYPELNKID  number(38) not null,
  COMPANYID          number(38) not null,
  FYEARID            number(38) not null,
  MASTEREVENTTYPEID  number(38) not null,
  RELATEDEVENTTYPEID number(38) not null,
  MODULEID           varchar2(10) not null
)

-- Create/Recreate primary, unique and foreign key constraints
alter table FIN_EVENTTYPELNK
  add constraint PK_FINEVENTTYPELNK primary key (FINEVENTTYPELNKID, COMPANYID, FYEARID);
alter table FIN_EVENTTYPELNK
  add constraint FK_MASTERTYPE_FINEVENTTYPELNK foreign key (MASTEREVENTTYPEID, FYEARID, COMPANYID, MODULEID)
  references fin_eventtype (FINEVENTTYPEID, FYEARID, COMPANYID, MODULEID);
alter table FIN_EVENTTYPELNK
  add constraint FK_RELTYPE_FINEVENETYPELNK foreign key (RELATEDEVENTTYPEID, FYEARID, COMPANYID, MODULEID)
  references fin_eventtype (FINEVENTTYPEID, FYEARID, COMPANYID, MODULEID);
-- Create/Recreate indexes
create index FK_MASTERTYPE_FINEVENTTYPELNK on FIN_EVENTTYPELNK (mastereventtypeid, fyearid, companyid, moduleid);
create index FK_RELTYPE_FINEVENETYPELNK on FIN_EVENTTYPELNK (relatedeventtypeid, fyearid, companyid, moduleid);
