create table pta_patientfilestatus(companyid number(38) not null,
  statusid number(38) not null, isactive varchar2(1) not null,
  mnemonic varchar2(20) not null, descr varchar2(50) not null);
alter table pta_patientfilestatus add constraint pta_patientfilestatus_pk
  primary key (statusid, companyid);

create table pta_patientfile(patientid number(38) not null,
  companyid number(38) not null, patientfileid number(38) not null,
  filemnemonic varchar2(20), position varchar2(20),
  comments varchar2(100), statusid number(38) not null);
alter table pta_patientfile add constraint pta_patientfile_pk
  primary key (patientfileid, companyid);
alter table pta_patientfile add constraint pta_patient_patientfile_fk
  foreign key (patientid, companyid) references pta_patient (patientid, companyid);
alter table pta_patientfile add constraint pta_patientfilestatus_file_fk
  foreign key (statusid, companyid) references pta_patientfilestatus (statusid, companyid);

create table pta_patientfileeventtype(companyid number(38) not null,
  eventtypeid number(38) not null, isactive varchar2(1) not null,
  mnemonic varchar2(20) not null, descr varchar2(50) not null,
  originstatusid number(38), destinationstatusid number(38) not null,
  isgeneratingfile varchar2(1) not null);
alter table pta_patientfileeventtype add constraint pta_patientfileeventtype_pk
  primary key (eventtypeid, companyid);
alter table pta_patientfileeventtype add constraint pta_patfileeventtype_origin_fk
  foreign key (originstatusid, companyid) references pta_patientfilestatus (statusid, companyid);
alter table pta_patientfileeventtype add constraint pta_patfileeventtype_dest_fk
  foreign key (destinationstatusid, companyid) references pta_patientfilestatus (statusid, companyid);

create table pta_patientfiletrans(companyid number(38) not null, fyearid number(38) not null,
  patientfiletransid number(38) not null, patientfileid number(38) not null,
  eventtypeid number(38) not null, transdate date not null,
  persondescr varchar2(50), doctorid number(38), facilityid varchar2(40), comments varchar2(100),
  originstatusid number(38), destinationstatusid number(38) not null);
alter table pta_patientfiletrans add constraint pta_patientfiletrans_pk
  primary key (patientfiletransid, companyid);
alter table pta_patientfiletrans add constraint pta_patfileevttype_trans_fk
  foreign key (eventtypeid, companyid) references pta_patientfileeventtype (eventtypeid, companyid);
alter table pta_patientfiletrans add constraint pta_patientfiletrans_origin_fk
  foreign key (originstatusid, companyid) references pta_patientfilestatus (statusid, companyid);
alter table pta_patientfiletrans add constraint pta_patientfiletrans_dest_fk
  foreign key (destinationstatusid, companyid) references pta_patientfilestatus (statusid, companyid);
