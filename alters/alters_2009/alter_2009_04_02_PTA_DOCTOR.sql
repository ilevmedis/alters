alter table pta_doctor add facilityid varchar2(40);
alter table pta_doctor add constraint pta_facility_doctor_fk
  foreign key (facilityid, companyid, fyearid) 
  references pta_facility (facilityid, companyid, fyearid);