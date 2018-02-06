create table MED_ORDEREXECDOCTOR(
  ORDERDETAILID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  DOCTORID number(38) not null,
  DOCTORROLEID number(38) not null,
  ISDELETED varchar2(1) not null,
  ORDEREXECDOCTORID number(38) not null
);

alter table MED_ORDEREXECDOCTOR
  add constraint PK_MED_ORDEREXECDOCTOR primary key (orderexecdoctorid,companyid,fyearid);
alter table MED_ORDEREXECDOCTOR
  add constraint ORDERDT_ORDEREXECDOCTOR foreign key (orderdetailid,companyid,fyearid)
  references med_orderdetail (orderdetailid,companyid,fyearid) on delete cascade;
alter table MED_ORDEREXECDOCTOR
  add constraint DOCROLE_ORDEREXECDOCTOR foreign key (doctorroleid,companyid,fyearid)
  references pbl_doctorrole (doctorroleid,companyid,fyearid);
alter table MED_ORDEREXECDOCTOR
  add constraint DOCTOR_ORDEREXECDOCTOR foreign key (doctorid,companyid,fyearid)
  references pta_doctor (doctorid,companyid,fyearid);
