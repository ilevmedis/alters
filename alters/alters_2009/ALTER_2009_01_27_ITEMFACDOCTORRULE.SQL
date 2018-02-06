create table FIN_ITEMFACILITYDOCTORRULE
(
  ITEMFACILITYDOCTORRULEID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  FINITEMID number(38) not null,
  FACILITYID VARCHAR2(40),
  DOCTORID number(38),
  DOCTORROLEID number(38),
  RULETYPE number(38) not null
);

alter table FIN_ITEMFACILITYDOCTORRULE
  add constraint FIN_ITEMFACILITYDOCTORRULE_PK primary key (itemfacilitydoctorruleid,companyid,fyearid);
alter table FIN_ITEMFACILITYDOCTORRULE
  add constraint FACILITY_ITEMFACDOCRULE_FK foreign key (facilityid,companyid,fyearid)
  references pta_facility (facilityid,companyid,fyearid);
alter table FIN_ITEMFACILITYDOCTORRULE
  add constraint DOCTOR_ITEMFACDOCRULE_FK foreign key (doctorid,companyid,fyearid)
  references pta_doctor (doctorid,companyid,fyearid);
alter table FIN_ITEMFACILITYDOCTORRULE
  add constraint DOCTORROLE_ITEMFACDOCRULE_FK foreign key (doctorroleid,companyid,fyearid)
  references pbl_doctorrole (doctorroleid,companyid,fyearid);
