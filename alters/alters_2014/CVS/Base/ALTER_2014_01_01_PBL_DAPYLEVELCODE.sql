create table pbl_dapylevelcode(
  companyid number(38) not null,
  fyearid number(38) not null,
  levelid number(38) not null,
  facilityid varchar2(40) not null,
  onedaystayindicator number(38) not null,
  dapycode varchar2(10) not null
);
alter table pbl_dapylevelcode
  add constraint pbl_dapylevelcode_pk
  primary key(companyid, fyearid, levelid, facilityid, onedaystayindicator);
alter table pbl_dapylevelcode
  add constraint pbl_level_dapylevelcode_fk
  foreign key(levelid, companyid, fyearid)
  references pbl_level(levelid, companyid, fyearid);
alter table pbl_dapylevelcode
  add constraint pta_facility_dapylevelcode_fk
  foreign key(facilityid, companyid, fyearid)
  references pta_facility(facilityid, companyid, fyearid);


INSERT INTO PBL_DAPYLEVELCODE(COMPANYID, FYEARID, LEVELID, FACILITYID, DAPYCODE, ONEDAYSTAYINDICATOR)
  SELECT PBL_LEVEL.COMPANYID, PBL_LEVEL.FYEARID, PBL_LEVEL.LEVELID, PTA_FACILITY.FACILITYID, PBL_LEVEL.IKACODE,1
    FROM PBL_LEVEL, PTA_FACILITY
    WHERE PBL_LEVEL.FYEARID = 2014 AND PTA_FACILITY.FYEARID = 2014 AND PTA_FACILITY.FACILITYTYPE = 1
      AND PTA_FACILITY.HASCHILDREN = '0' AND PBL_LEVEL.IKACODE IS NOT NULL;

INSERT INTO PBL_DAPYLEVELCODE(COMPANYID, FYEARID, LEVELID, FACILITYID, DAPYCODE, ONEDAYSTAYINDICATOR)
  SELECT PBL_LEVEL.COMPANYID, PBL_LEVEL.FYEARID, PBL_LEVEL.LEVELID, PTA_FACILITY.FACILITYID, PBL_LEVEL.IKACODE,2
    FROM PBL_LEVEL, PTA_FACILITY
    WHERE PBL_LEVEL.FYEARID = 2014 AND PTA_FACILITY.FYEARID = 2014 AND PTA_FACILITY.FACILITYTYPE = 1
      AND PTA_FACILITY.HASCHILDREN = '0' AND PBL_LEVEL.IKACODE IS NOT NULL;