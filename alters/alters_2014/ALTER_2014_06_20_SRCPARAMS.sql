create table SRC_PARAMETERS
(
  FYEARID            NUMBER(38) not null,
  COMPANYID          NUMBER(38) not null,
  SUPPLYREQUESTSEQID NUMBER(38)
);

alter table SRC_PARAMETERS
  add constraint PK_SRC_PARAMETERS primary key (FYEARID, COMPANYID);
