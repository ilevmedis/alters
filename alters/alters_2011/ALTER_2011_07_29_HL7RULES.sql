create table SYS_HL7RULEHEADER
(
  COMPANYID       number(38) not null,
  HL7RULEHEADERID number(38) not null,
  MNEMONIC        varchar2(20) not null,
  DESCR           varchar2(200) not null,
  COMMENTS        varchar2(200),
  ISACTIVE        varchar2(1) not null
)
;
alter table SYS_HL7RULEHEADER
  add constraint SYS_HL7RULEHD_PK primary key (COMPANYID, HL7RULEHEADERID);

create table SYS_HL7RULEDETAIL
(
  COMPANYID       number(38) not null,
  HL7RULEDETAILID number(38) not null,
  HL7RULEHEADERID number(38) not null,
  HOSTNAME        varchar2(50) not null,
  PORTNUMBER      NUMBER(38) not null,
  MESSAGETYPE     number(38) not null,
  HL7VERSION      number(38) not null,
  RECEIVINGAPP    varchar2(30) not null,
  VALIDSINCEDATE  date not null,
  VALIDTILLDATE   date
)
;
alter table SYS_HL7RULEDETAIL
  add constraint SYS_HL7RULEDT_PK primary key (COMPANYID, HL7RULEDETAILID);
alter table SYS_HL7RULEDETAIL
  add constraint SYS_HL7RULEHD_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID) on delete cascade;

alter table ERP_EVENTTYPEMATRIX add HL7RULEHEADERID number(38);
alter table MED_ORDERHEADER add HL7RULEHEADERID number(38);
alter table MED_ORDERCANCELHEADER add HL7RULEHEADERID number(38);
alter table PTA_TRANSFER add HL7RULEHEADERID number(38);
alter table PTA_VISITADMISSION add HL7RULEHEADERID number(38);
alter table PTA_VISITADMISSIONCANCEL add HL7RULEHEADERID number(38);
alter table PTA_VISITDISCHARGE add HL7RULEHEADERID number(38);
alter table PTA_VISITDISCHARGECANCEL add HL7RULEHEADERID number(38);
alter table PBL_CHARGEHEADER add HL7RULEHEADERID number(38);
