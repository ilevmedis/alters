create table PBL_DOCTORRULEDOCTORLNK
(
  DOCTORRULEDOCTORLNKID number(38) not null,
  COMPANYID             number(38) not null,
  FYEARID               number(38) not null,
  DOCTORID              number(38) not null,
  DOCTORRULEHEADERID    number(38) not null,
  SINCEDATE             date not null,
  TILLDATE              date
)
;
-- Create/Recreate primary, unique and foreign key constraints
alter table PBL_DOCTORRULEDOCTORLNK
  add constraint PBL_DOCTORRULEDOCTORLNK_PK primary key (DOCTORRULEDOCTORLNKID, COMPANYID, FYEARID);
alter table PBL_DOCTORRULEDOCTORLNK
  add constraint FK_DCRULEDCLNK_DOCTOR foreign key (DOCTORID, COMPANYID, FYEARID)
  references PTA_DOCTOR (DOCTORID, COMPANYID, FYEARID);
alter table PBL_DOCTORRULEDOCTORLNK
  add constraint FK_DCRULEDC_DCRULEHD foreign key (DOCTORRULEHEADERID, COMPANYID, FYEARID)
  references PBL_DOCTORRULEHEADER (DOCTORRULEHEADERID, COMPANYID, FYEARID);
-- Create/Recreate indexes
create index FK_DCRULEDCLNK_DOCTOR on PBL_DOCTORRULEDOCTORLNK (doctorid, companyid, fyearid);
create index FK_DCRULEDC_DCRULEHD on PBL_DOCTORRULEDOCTORLNK (doctorruleheaderid, companyid, fyearid);
