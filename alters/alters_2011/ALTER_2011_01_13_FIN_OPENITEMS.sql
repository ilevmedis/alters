alter table FIN_OPENITEMBINDING
  drop constraint OPENITEM_OPENITEMBINDING;

alter table FIN_OPENITEM
  drop constraint PK_FIN_OPENITEM cascade;
alter table FIN_OPENITEM
  drop constraint PTA_VISIT_OPENITEMHD;
alter table FIN_OPENITEM
  drop constraint TRANSPARTY_OPENITEMHD;

update fin_openitem set fyearid = null;

alter table FIN_OPENITEM drop column FYEARID;

alter table FIN_OPENITEM
  add constraint PK_FIN_OPENITEM primary key (OPENITEMID, COMPANYID);
alter table FIN_OPENITEM
  add constraint TRANSPARTY_OPENITEMHD foreign key (FINTRANSPARTYID, COMPANYID, FINTRANSDETAILFYEARID)
  references fin_transparty (FINTRANSPARTYID, COMPANYID, FYEARID);
alter table FIN_OPENITEM
  add constraint FINTRANSDETAIL_OPENITEMHD_FK foreign key (FINTRANSDETAILID, COMPANYID, FINTRANSDETAILFYEARID)
  references FIN_TRANSDETAIL (FINTRANSDETAILID, COMPANYID, FYEARID) on delete cascade;

create index FINTRANSDETAIL_OPENITEMHD_FK on FIN_OPENITEM (fintransdetailid, companyid, fintransdetailfyearid);
create index TRANSPARTY_OPENITEMHD on FIN_OPENITEM (FINTRANSPARTYID, COMPANYID, FINTRANSDETAILFYEARID);


alter table FIN_OPENITEMBINDING
  add constraint OPENITEM_OPENITEMBINDING foreign key (OPENITEMID, COMPANYID)
  references fin_openitem (OPENITEMID, COMPANYID);
