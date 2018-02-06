create table pta_ssnparameters (companyid number(38) not null, fyearid number(38) not null,
  ssnpatientcodingid number(38),
  isconnectingtowebservice varchar2(1) not null, webserviceusername varchar2(20), webservicepassword varchar2(20),
  isusingproxy varchar2(1) not null, proxy varchar2(30), proxyport varchar2(10));
alter table pta_ssnparameters add constraint pta_ssnparameters_pk primary key (companyid, fyearid);
alter table pta_ssnparameters add constraint pta_patientcoding_ssnparams_fk
  foreign key (ssnpatientcodingid, companyid)
  references pta_patientcoding (patientcodingid, companyid);




