alter table PTA_FACILITYUSESTATUS add (LOCATIONTYPE number(38), CLINICFACILITYID varchar2(40));
alter table PTA_FACILITYUSESTATUS
  add constraint PTA_FACILITYCLIN_USESTATUS_FK
  foreign key(CLINICFACILITYID, COMPANYID, FYEARID)
  references PTA_FACILITY(FACILITYID, COMPANYID, FYEARID);

update pta_facilityusestatus set locationtype =
  (select locationtype from pta_facility
    where pta_facility.facilityid = pta_facilityusestatus.facilityid and
      pta_facility.companyid = pta_facilityusestatus.companyid and
      pta_facility.fyearid = pta_facilityusestatus.fyearid);
update pta_facilityusestatus set clinicfacilityid =
  (select clinicfacilityid from pta_facility
    where pta_facility.facilityid = pta_facilityusestatus.facilityid and
      pta_facility.companyid = pta_facilityusestatus.companyid and
      pta_facility.fyearid = pta_facilityusestatus.fyearid);
insert into pta_facilityusestatus(COMPANYID, FYEARID, FACILITYID, FACILITYUSESTATUSID, USESTATUS, LOCATIONTYPE, CLINICFACILITYID, SINCEDATE)
  select COMPANYID, FYEARID, FACILITYID, PTA_FACILITYUSESTATUS_SEQ.NEXTVAL, USESTATUS, LOCATIONTYPE, CLINICFACILITYID, '01-jan-2016'
  from PTA_FACILITY where facilitytype = 4 and fyearid=2016  and not exists(select * from pta_facilityusestatus where
    pta_facilityusestatus.facilityid = pta_facility.facilityid and
    pta_facilityusestatus.companyid = pta_facility.companyid and
    pta_facilityusestatus.fyearid = pta_facility.fyearid);
