create table PBL_PACKAGEDIAGNOSISCODELNK
(PACKAGEDIAGNOSISCODELNKID number(38) not null, companyid number(38) not null, fyearid number(38) not null,
  diagnosisgroupingid number(38) not null, diagnosiscodeid varchar2(40) not null, PACKAGEID number(38) not null);
alter table PBL_PACKAGEDIAGNOSISCODELNK
  add constraint PBL_PACKAGEDIAGNOSISCODELNK_PK primary key(PACKAGEDIAGNOSISCODELNKID, COMPANYID, FYEARID);

alter table PBL_PACKAGEDIAGNOSISCODELNK
  add constraint PBL_PACKDIAGNLNK_DIAGCODE_FK foreign key(DIAGNOSISCODEID, DIAGNOSISGROUPINGID, COMPANYID)
  references PTA_DIAGNOSISCODE (DIAGNOSISCODEID, DIAGNOSISGROUPINGID, COMPANYID);

alter table PBL_PACKAGEDIAGNOSISCODELNK
  add constraint PBL_PACKDIAGNLNK_DIAGGROUP_FK foreign key(DIAGNOSISGROUPINGID, COMPANYID)
  references PTA_DIAGNOSISGROUPING(DIAGNOSISGROUPINGID, COMPANYID);

alter table PBL_PACKAGEDIAGNOSISCODELNK
  add constraint PBL_PACKDIAGNLNK_PACKAGE_FK foreign key(PACKAGEID, COMPANYID, FYEARID)
  references PBL_PACKAGE (PACKAGEID, COMPANYID, FYEARID);

create index PBL_PACKDIAGNLNK_DIAGCODE_FK on PBL_PACKAGEDIAGNOSISCODELNK(DIAGNOSISCODEID, DIAGNOSISGROUPINGID, COMPANYID);
create index PBL_PACKDIAGNLNK_DIAGGROUP_FK on PBL_PACKAGEDIAGNOSISCODELNK(DIAGNOSISGROUPINGID, COMPANYID);
create index PBL_PACKDIAGNLNK_PACKAGE_FK  on PBL_PACKAGEDIAGNOSISCODELNK(PACKAGEID, COMPANYID, FYEARID);
