create table pta_birthadmissionparams(
  companyid number(38) not null,
  fyearid number(38) not null,
  clinicid varchar2(40) not null,
  bedid varchar2(40) not null,
  pricelistheaderid number(38) not null,
  birthmunicipalityid number(38) not null,
  birthprefectureid number(38) not null,
  birthcityid number(38) not null,
  birthcountryid number(38) not null,
  esyeprofessionid number(38) not null,
  erpeventtypeid number(38) not null,
  ptaeventtypeid number(38) not null,
  ptamoduleid varchar2(10) not null,
  pbleventtypeid number(38),
  pblmoduleid varchar2(10));
alter table pta_birthadmissionparams
  add constraint pta_birthadmissionparams_pk
  primary key (companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint pta_bed_birthadmparams_fk
  foreign key (bedid, companyid, fyearid)
  references pta_facility (facilityid, companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint pta_clinic_birthadmparams_fk
  foreign key (clinicid, companyid, fyearid)
  references pta_facility (facilityid, companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint pbl_pricel_birthadmparams_fk
  foreign key (pricelistheaderid, companyid, fyearid)
  references pbl_pricelistheader (pricelistheaderid, companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint sys_city_birthadmparams_fk
  foreign key (birthcityid, companyid)
  references sys_city (cityid, companyid);
alter table pta_birthadmissionparams
  add constraint sys_municip_birthadmparams_fk
  foreign key (birthmunicipalityid, companyid)
  references sys_municipality (municipalityid, companyid);
alter table pta_birthadmissionparams
  add constraint sys_prefect_birthadmparams_fk
  foreign key (birthprefectureid, companyid)
  references sys_prefecture (prefectureid, companyid);
alter table pta_birthadmissionparams
  add constraint sys_country_birthadmparams_fk
  foreign key (birthcountryid)
  references sys_country (countryid);
alter table pta_birthadmissionparams
  add constraint pta_esyeprof_birthadmparams_fk
  foreign key (esyeprofessionid, companyid)
  references pta_esyeprofession (esyeprofessionid, companyid);
alter table pta_birthadmissionparams
  add constraint erp_evttype_birthadmparams_fk
  foreign key (erpeventtypeid, companyid, fyearid)
  references erp_eventtype (erpeventtypeid, companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint pta_evttype_birthadmparams_fk
  foreign key (ptaeventtypeid, ptamoduleid, companyid, fyearid)
  references pta_eventtype (ptaeventtypeid, moduleid, companyid, fyearid);
alter table pta_birthadmissionparams
  add constraint pbl_evttype_birthadmparams_fk
  foreign key (pbleventtypeid, pblmoduleid, companyid, fyearid)
  references pbl_eventtype (pbleventtypeid, moduleid, companyid, fyearid);

