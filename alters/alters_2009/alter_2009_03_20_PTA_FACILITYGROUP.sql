create table PTA_FACILITYGROUP
(
  FACILITYGROUPID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  MNEMONIC varchar2(20) not null,
  DESCR varchar2(50) not null,
  ISACTIVE varchar2(1) not null
);
alter table PTA_FACILITYGROUP
  add constraint PTA_FACILITYGROUP_PK primary key (FACILITYGROUPID,COMPANYID,FYEARID);


alter table pta_facility add (FACILITYGROUPID number(38));
alter table pta_facility add constraint
  PTA_FACILITYGROUP_FACILITY_FK 
  foreign key (FACILITYGROUPID,COMPANYID,FYEARID) 
  references PTA_FACILITYGROUP (FACILITYGROUPID,COMPANYID,FYEARID);