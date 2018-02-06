create table PBL_DOCTORROLERULE
(
  DOCTORROLERULEID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  STARTDATE date not null,
  ENDDATE date,
  DOCTORID number(38) not null,
  DOCTORROLEID number(38) not null,
  FINITEMGROUPINGID number(38) not null,
  FINITEMGROUPINGCODE varchar2(40) not null
);
alter table PBL_DOCTORROLERULE
  add constraint PBL_DOCTORROLERULE_PK primary key (doctorroleruleid,companyid,fyearid);
alter table PBL_DOCTORROLERULE
  add constraint DOCTOR_DOCTORROLERULE_FK foreign key (doctorid,companyid,fyearid)
  references pta_doctor (doctorid,companyid,fyearid);
alter table PBL_DOCTORROLERULE
  add constraint DOCTORROLE_DOCTORROLERULE_FK foreign key (doctorroleid,companyid,fyearid)
  references pbl_doctorrole (doctorroleid,companyid,fyearid);
alter table PBL_DOCTORROLERULE
  add constraint ITEMGROUPCODE_DOCROLERULE_FK foreign key (finitemgroupingid,finitemgroupingcode,companyid,fyearid)
  references fin_itemgroupingcode (finitemgroupingid,finitemgroupingcode,companyid,fyearid);
