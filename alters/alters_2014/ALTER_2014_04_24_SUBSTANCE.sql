create table INV_GROUPATC
(
  GROUPATCID number(38) not null,
  COMPANYID   number(38) not null,
  MNEMONIC    varchar2(30) not null,
  DESCR       varchar2(150) not null,
  ISACTIVE    varchar2(1) not null
  );

alter table INV_GROUPATC
  add constraint PK_INV_GROUPATC primary key (GROUPATCID, COMPANYID);

create table INV_SUBSTANCE
(
  SUBSTANCEID number(38) not null,
  COMPANYID   number(38) not null,
  MNEMONIC    varchar2(20) not null,
  DESCR       varchar2(150) not null,
  ISACTIVE    varchar2(1) not null
  );

alter table INV_SUBSTANCE
  add constraint PK_INV_SUBSTANCE primary key (SUBSTANCEID, COMPANYID);

create table INV_ITEMSUBSTANCE
(
  ITEMSUBSTANCEID    number(38) not null,
  COMPANYID          number(38) not null,
  FYEARID            number(38) not null,
  INVITEMID          number(38) not null,
  SUBSTANCEID        number(38) not null,
  SUBSTANCETYPE      number(38) not null
);

alter table INV_ITEMSUBSTANCE
  add constraint PK_INV_ITEMSUBSTANCE primary key (ITEMSUBSTANCEID, COMPANYID, FYEARID);

alter table INV_ITEMSUBSTANCE
  add constraint FK_ITEMSUB_INV_ITEM foreign key (INVITEMID, COMPANYID, FYEARID)
  references INV_ITEM (INVITEMID, COMPANYID, FYEARID) on delete cascade;
alter table INV_ITEMSUBSTANCE
  add constraint FK_ITEMSUB_SUBSTANCE foreign key (SUBSTANCEID, COMPANYID)
  references INV_SUBSTANCE (SUBSTANCEID, COMPANYID);

-- Create/Recreate indexes
create index FK_ITEMSUB_INV_ITEM on INV_ITEMSUBSTANCE (invitemid, companyid, fyearid);
create index FK_ITEMSUB_SUBSTANCE on INV_ITEMSUBSTANCE (substanceid, companyid);

create table INV_SUBSTANCEGROUPATC
(
  SUBSTANCEGROUPATCID    number(38) not null,
  COMPANYID              number(38) not null,
  GROUPATCID             number(38) not null,
  SUBSTANCEID            number(38) not null
);

alter table INV_SUBSTANCEGROUPATC
  add constraint PK_INV_SUBSTANCEGROUPATC primary key (SUBSTANCEGROUPATCID, COMPANYID);

alter table INV_SUBSTANCEGROUPATC
  add constraint FK_SUBGRPATC_GROUPATC foreign key (GROUPATCID, COMPANYID)
  references INV_GROUPATC (GROUPATCID, COMPANYID) on delete cascade;

alter table INV_SUBSTANCEGROUPATC
  add constraint FK_SUBGRPATC_SUBSTANCE foreign key (SUBSTANCEID, COMPANYID)
  references INV_SUBSTANCE (SUBSTANCEID, COMPANYID);

-- Create/Recreate indexes
create index FK_SUBGRPATC_GROUPATC on INV_SUBSTANCEGROUPATC (GROUPATCID, companyid);
create index FK_SUBGRPATC_SUBSTANCE on INV_SUBSTANCEGROUPATC (substanceid, companyid);

insert into sys_object (objectid, objecttype, descr, yearmigrationorder, yearmigrationaction, ismigrated)
  values ('INV_ITEMSUBSTANCE', 1, 'INV_ITEMSUBSTANCE', 312, 1,'1');
commit;