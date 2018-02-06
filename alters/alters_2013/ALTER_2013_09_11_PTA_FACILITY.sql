ALTER TABLE PTA_FACILITY ADD CLINICFACILITYID VARCHAR2(40);
ALTER TABLE PTA_FACILITY ADD CONSTRAINT CLINICFACILITY_FACILITY_FK FOREIGN KEY (CLINICFACILITYID, COMPANYID, FYEARID)
  REFERENCES PTA_FACILITY(FACILITYID, COMPANYID, FYEARID);