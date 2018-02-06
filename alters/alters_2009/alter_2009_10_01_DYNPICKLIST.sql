-- Create table
create table INV_DYNPICKLISTHEADER
(
  INVDYNPICKLISTHEADERID number(38) not null,
  COMPANYID              number(38) not null,
  FYEARID                number(38) not null,
  PICKLISTFORMATID       number(38) not null,
  INVSTOREID             number(38) not null,
  ISACTIVE               varchar2(50) not null,
  LINESPERPAGE           number(38) not null,
  COLSPERPAGE            number(38) not null,
  HEADER                 clob,
  FOOTER                 clob
);
-- Create/Recreate primary, unique and foreign key constraints
alter table INV_DYNPICKLISTHEADER
  add constraint PK_INVDYNPICKLISTHD primary key (INVDYNPICKLISTHEADERID, COMPANYID, FYEARID);
alter table INV_DYNPICKLISTHEADER
  add constraint FK_INVSTORE_DYNPICKLISTHD foreign key (INVSTOREID, COMPANYID, FYEARID)
  references inv_store (INVSTOREID, COMPANYID, FYEARID);
alter table INV_DYNPICKLISTHEADER
  add constraint FK_PICKLIST_DYNPICKLISTHD foreign key (PICKLISTFORMATID, COMPANYID)
  references inv_picklistformat (PICKLISTFORMATID, COMPANYID);
-- Create/Recreate indexes
create index FK_INVSTORE_DYNPICKLISTHD on INV_DYNPICKLISTHEADER (linesperpage, companyid, fyearid);
create index FK_PICKLIST_DYNPICKLISTHD on INV_DYNPICKLISTHEADER (picklistformatid, companyid);


-- Create table
create table INV_DYNPICKLISTDETAIL
(
  INVDYNPICKLISTDETAILID number(38) not null,
  COMPANYID              number(38) not null,
  FYEARID                number(38) not null,
  INVDYNPICKLISTHEADERID number(38) not null,
  LINENUM                number(38) not null,
  GROUPNAME              varchar2(50),
  INVITEMID              number(38)
)
;
-- Create/Recreate primary, unique and foreign key constraints
alter table INV_DYNPICKLISTDETAIL
  add constraint PK_INVDYNPICKLISTDETAIL primary key (INVDYNPICKLISTDETAILID, COMPANYID, FYEARID);
alter table INV_DYNPICKLISTDETAIL
  add constraint FK_INVDYNPICKLISTHD_DT foreign key (INVDYNPICKLISTHEADERID, COMPANYID, FYEARID)
  references inv_dynpicklistheader (INVDYNPICKLISTHEADERID, COMPANYID, FYEARID) on delete cascade;
alter table INV_DYNPICKLISTDETAIL
  add constraint FK_INVITEM_DYNPICKLISTDT foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID);
-- Create/Recreate indexes
create index FK_INVDYNPICKLISTHD_DT on INV_DYNPICKLISTDETAIL (invdynpicklistheaderid, companyid, fyearid);
create index FK_INVITEM_DYNPICKLISTDT on INV_DYNPICKLISTDETAIL (invitemid, companyid, fyearid);
