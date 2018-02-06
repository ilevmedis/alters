
create table PLG_SUBSIDY
(
  SUBSIDYID       number(38) not null,
  COMPANYID       number(38) not null,
  FYEARID         number(38) not null,
  FUNDINGSOURCEID number(38) not null,
  TOTALAMOUNT     FLOAT not null,
  XEP2ID number(38) not null
);

-- Create/Recreate primary, unique and foreign key constraints
alter table PLG_SUBSIDY
  add constraint PLG_SUBSIDY_PK primary key (SUBSIDYID, COMPANYID, FYEARID);
alter table PLG_SUBSIDY
  add constraint FK_SUBSIDY_FOUNDING foreign key (FUNDINGSOURCEID, COMPANYID)
  references plg_fundingsource (FUNDINGSOURCEID, COMPANYID);
alter table PLG_SUBSIDY
  add constraint FK_SUBSIDY_XEP2 foreign key (XEP2ID, FYEARID, COMPANYID)
  references plg_xep2 (XEP2ID, FYEARID, COMPANYID) on delete cascade;
alter table PLG_SUBSIDY

-- Create/Recreate indexes
create index FK_SUBSIDY_FOUNDING on PLG_SUBSIDY (fundingsourceid, companyid);
create index FK_SUBSIDY_XEP2 on PLG_SUBSIDY (xep2id, fyearid, companyid);
