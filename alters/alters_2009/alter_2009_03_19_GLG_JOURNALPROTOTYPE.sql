create table GLG_JOURNALPROTOTYPE
(
  JOURNALPROTOTYPEID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  MNEMONIC varchar2(20) not null,
  DESCR varchar2(100) not null,
  JOURNALTYPE number(38) not null,
  REASON varchar2(100),
  COMMENTS varchar2(100),
  SINCEDATE date not null,
  TILLDATE date not null,
  ISACTIVE varchar2(1) not null
);
alter table GLG_JOURNALPROTOTYPE
  add constraint GLG_JOURNALPROTOTYPE_PK primary key (journalprototypeid,companyid,fyearid);


create table GLG_JOURNALACCOUNTPROTOTYPE
(
  ACCOUNTPROTOTYPEID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  JOURNALPROTOTYPEID number(38) not null,
  JOURNALTYPE number(38) not null,
  ACCOUNTID varchar2(40) not null,
  LINENUM number(38) not null,
  REASON varchar2(100),
  COSTCENTERID varchar2(40),
  AMOUNTDEBITEXPRESSION varchar2(200),
  AMOUNTCREDITEXPRESSION varchar2(200)
);
alter table GLG_JOURNALACCOUNTPROTOTYPE
  add constraint GLG_JOURNALACCOUNTPROTOTYPE_PK primary key (accountprototypeid,companyid,fyearid);
alter table GLG_JOURNALACCOUNTPROTOTYPE
  add constraint JOURNAL_ACCOUNT_PROTOTYPE_FK foreign key (journalprototypeid,companyid,fyearid)
  references glg_journalprototype (journalprototypeid,companyid,fyearid) on delete cascade;
alter table GLG_JOURNALACCOUNTPROTOTYPE
  add constraint JOURNACCTPROT_GLG_ACCOUNT_FK foreign key (accountid,fyearid,companyid)
  references glg_account (accountid,fyearid,companyid);
alter table GLG_JOURNALACCOUNTPROTOTYPE
  add constraint JOURNACCPROT_FIN_COSTCENT_FK foreign key (costcenterid,companyid,fyearid)
  references fin_costcenter (costcenterid,companyid,fyearid);
