create table PBL_STUDYSTATUS
(
  STUDYSTATUSID    number(38) not null,
  COMPANYID        number(38) not null,
  MNEMONIC         varchar2(20) not null,
  DESCR            varchar2(100) not null,
  ISUSEDFORINVOICE varchar2(1) not null
);

alter table PBL_STUDYSTATUS
  add constraint PBL_STUDYSTATUS_PK primary key (STUDYSTATUSID, COMPANYID);


create table PBL_CLINICALSTUDY
(
  CLINICALSTUDYID     number(38) not null,
  COMPANYID           number(38) not null,
  MNEMONIC            varchar2(20) not null,
  DESCR               varchar2(300) not null,
  ISACTIVE            varchar2(1) not null,
  ISINTERVENED        varchar2(1) not null,
  COORDINATOR         varchar2(150),
  SIGNEDBY            varchar2(150),
  MANAGEMENTINDICATOR number(38),
  STUDYSTATUSID       number(38) not null,
  ISEMERGENCY         varchar2(1) not null,
  COMMENTS            varchar2(300),
  ECONOMICALCOMMENTS  varchar2(300),
  ENDSTUDYDATE        date,
  PAYMENTWAY          varchar2(300),
  ISAPPROVED          varchar2(1) not null,
  APPROVEDDATE        date,
  BUDGETAMOUNT        FLOAT,
  HOSPDEDUCTIONAMOUNT FLOAT
);

alter table PBL_CLINICALSTUDY
  add constraint PBL_CLINICALSTUDY_PK primary key (CLINICALSTUDYID, COMPANYID);
alter table PBL_CLINICALSTUDY
  add constraint FK_STUDYSTATUS_CLINICALSTUDY foreign key (STUDYSTATUSID, COMPANYID)
  references pbl_studystatus (STUDYSTATUSID, COMPANYID);

create table PBL_CLINICALSTUDYFINTRANSPARTY
(
  CLINICALSTUDYFINTRANSPARTYID number(38) not null,
  COMPANYID                    number(38) not null,
  FYEARID                      number(38) not null,
  FINTRANSPARTYID              number(38) not null,
  CLINICALSTUDYID              number(38) not null
);

alter table PBL_CLINICALSTUDYFINTRANSPARTY
  add constraint PBL_CLINSTUDYFINTRNSPARTY_PK primary key (CLINICALSTUDYFINTRANSPARTYID, COMPANYID, FYEARID);
alter table PBL_CLINICALSTUDYFINTRANSPARTY
  add constraint FK_TRNSPARTY_CLINSTUDY foreign key (FINTRANSPARTYID, COMPANYID, FYEARID)
  references fin_transparty (FINTRANSPARTYID, COMPANYID, FYEARID);
alter table PBL_CLINICALSTUDYFINTRANSPARTY
  add constraint FK_CLINSTUDY_CLSTUDTRNSPART foreign key (CLINICALSTUDYID, COMPANYID)
  references pbl_clinicalstudy (CLINICALSTUDYID, COMPANYID) on delete cascade;

alter table PLG_XEP2 add CLINICALSTUDYID number(38);

alter table PLG_XEP2
  add constraint FK_CLINICALSTUDY_XEP2 foreign key (CLINICALSTUDYID, COMPANYID)
  references pbl_clinicalstudy (CLINICALSTUDYID, COMPANYID);

alter table FIN_TRANSHEADER add CLINICALSTUDYID number(38);

alter table FIN_TRANSHEADER
  add constraint FL_CLINICALSTUDY_FINTRANSHD foreign key (CLINICALSTUDYID, COMPANYID)
  references pbl_clinicalstudy (CLINICALSTUDYID, COMPANYID);

create table PBL_CLINICALPAYMENT
(
  CLINICALPAYMENTID number(38) not null,
  COMPANYID         number(38) not null,
  PAYMENTDATE       date not null,
  PAYMENTAMOUNT     FLOAT not null,
  CLINICALSTUDYID   number(38) not null
);
alter table PBL_CLINICALPAYMENT
  add constraint PK_PBL_CLINICALPAYMENT primary key (CLINICALPAYMENTID, COMPANYID);
alter table PBL_CLINICALPAYMENT
  add constraint FK_PBL_CLINICALSTUDY_PAYMENT foreign key (CLINICALSTUDYID, COMPANYID)
  references pbl_clinicalstudy (CLINICALSTUDYID, COMPANYID) on delete cascade;

insert into sys_object (objectid, objecttype, descr, yearmigrationorder, yearmigrationaction, ismigrated) values ('PBL_CLINICALSTUDYFINTRANSPARTY', 1, 'LINK BETWEEN FINTRANSPARTY AND CLINICAL STUDY', 210, 1,'1');
commit;
