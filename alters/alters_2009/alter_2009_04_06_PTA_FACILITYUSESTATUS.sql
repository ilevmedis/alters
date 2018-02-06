create table pta_facilityusestatus(facilityusestatusid number(38) not null, companyid number(38) not null, fyearid number(38) not null,
  facilityid varchar2(40) not null, sincedate date not null, tilldate date, usestatus number(38) not null);
alter table pta_facilityusestatus add constraint pta_facilityusestatus_pk primary key (facilityusestatusid, companyid, fyearid);
