-- Create table
create table PBL_CHARGEPACKAGEEXCLUDEDITEM
(
  CHARGEPACKAGEID             NUMBER(38) not null,
  COMPANYID                   NUMBER(38) not null,
  FYEARID                     NUMBER(38) not null,
  FINITEMID                   NUMBER(38),
  FINITEMGROUPINGID           NUMBER(38),
  FINITEMGROUPINGCODE         VARCHAR2(40),
  CHARGEPACKAGEEXCLUDEDID           NUMBER(38) not null,
  QUALIMIT                    FLOAT,
  QUACALCULATIONUNITINDICATOR NUMBER(38)
);
-- Create/Recreate primary, unique and foreign key constraints
alter table PBL_CHARGEPACKAGEEXCLUDEDITEM
  add constraint PK_PBL_CHRGPCKGEXCLITEM primary key (COMPANYID, FYEARID, CHARGEPACKAGEEXCLUDEDID);

alter table PBL_CHARGEPACKAGEEXCLUDEDITEM
  add constraint FK_ITEMGRPCODE_CHRGPCKGEXCL foreign key (FINITEMGROUPINGID, FINITEMGROUPINGCODE, COMPANYID, FYEARID)
  references FIN_ITEMGROUPINGCODE (FINITEMGROUPINGID, FINITEMGROUPINGCODE, COMPANYID, FYEARID);
alter table PBL_CHARGEPACKAGEEXCLUDEDITEM
  add constraint FK_FINITEM_CHRGPCKGEXCL foreign key (FINITEMID, FYEARID, COMPANYID)
  references fin_item (FINITEMID, FYEARID, COMPANYID);
-- Create/Recreate indexes
create index FK_FINITEM_CHRGPCKGEXCL on PBL_CHARGEPACKAGEEXCLUDEDITEM (finitemid, fyearid, companyid);
create index FK_ITEMGRPCODE_CHRGPCKGEXCL on PBL_CHARGEPACKAGEEXCLUDEDITEM (finitemgroupingid, finitemgroupingcode, companyid, fyearid);

alter table PBL_CHARGEPACKAGEEXCLUDEDITEM
  add constraint FK_CHRGPACG_CHRGPCKGEXCLITEM foreign key (CHARGEPACKAGEID, COMPANYID, FYEARID)
  references pbl_chargepackage (CHARGEPACKAGEID, COMPANYID, FYEARID) on delete cascade;
-- Create/Recreate indexes
create index FK_CHRGPACG_CHRGPCKGEXCLITEM on PBL_CHARGEPACKAGEEXCLUDEDITEM (chargepackageid, companyid, fyearid);
