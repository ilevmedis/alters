create table plg_budgetresheader(
  budgetresheaderid number(38) not null,
  companyid number(38) not null,
  mnemonic varchar2(20),
  descr varchar2(200) not null,
  budgetexecid number(38),
  budgetresstatus number(38) not null,
  budgetresdate date not null,
  approvaldate date,
  comments varchar2(200),
  protocolno varchar(20),
  protocoldate date,
  extendeddescr clob,
  legislation clob);

alter table plg_budgetresheader add constraint plg_budgetresheader_pk
  primary key(budgetresheaderid, companyid);
alter table plg_budgetresheader add constraint plg_budgetexec_budgetreshd_fk
  foreign key(budgetexecid, companyid)
  references plg_budgetexec(budgetexecid, companyid) on delete cascade;
create index plg_bdgtexec_bdgthd_fk on plg_budgetresheader(budgetexecid, companyid);

create table plg_budgetresdetail(
  budgetresdetailid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  budgetresheaderid number(38),
  budgetresstatus number(38) not null,
  budgetorgid number(38) not null,
  plgaccountid varchar2(40) not null,
  incexpindicator varchar2(1) not null,
  transdate date not null,
  descr varchar2(100),
  inventoryindicator varchar2(1) not null,
  ischeckingbudget varchar2(1) not null,
  budgetamount float(126) not null,
  creationindicator number(38) not null,
  comments varchar2(200));

alter table plg_budgetresdetail add constraint plg_budgetresdetail_pk
  primary key(budgetresdetailid, companyid);

alter table plg_budgetresdetail add constraint plg_budgetorg_budgetresdt_fk
  foreign key(budgetorgid, companyid, fyearid)
  references plg_budgetorg(budgetorgid, companyid, fyearid);
alter table plg_budgetresdetail add constraint plg_budgetreshd_budgetresdt_fk
  foreign key(budgetresheaderid, companyid)
  references plg_budgetresheader(budgetresheaderid, companyid) on delete cascade;
alter table plg_budgetresdetail add constraint plg_account_budgetresdt_fk
  foreign key(plgaccountid, fyearid, companyid, incexpindicator)
  references plg_account(accountid, fyearid, companyid, incexpindicator);

create index plg_budgetorg_budgetresdt_fk on plg_budgetresdetail(budgetorgid, companyid, fyearid);
create index plg_budgetreshd_budgetresdt_fk on plg_budgetresdetail(budgetresheaderid, companyid);
create index plg_account_budgetresdt_fk on plg_budgetresdetail(plgaccountid, fyearid, companyid, incexpindicator);

create table plg_budgetresstatuslog(
  budgetresstatuslogid number(38) not null,
  companyid number(38) not null,
  budgetresheaderid number(38) not null,
  newbudgetresstatus number(38) not null,
  statuschangedate date not null,
  username varchar2(20) not null,
  descr varchar2(100));

alter table plg_budgetresstatuslog add constraint plg_budgetresstatuslog_pk
  primary key(budgetresstatuslogid, companyid);
alter table plg_budgetresstatuslog add constraint plg_budreshd_budresstatus_fk
  foreign key(budgetresheaderid, companyid)
  references plg_budgetresheader(budgetresheaderid, companyid) on delete cascade;
alter table plg_budgetresstatuslog add constraint sys_user_budresstatus_fk
  foreign key(username, companyid)
  references sys_user(username, companyid);

create index plg_budreshd_budresstatus_fk on plg_budgetresstatuslog(budgetresheaderid, companyid);
create index sys_user_budresstatus_fk on plg_budgetresstatuslog(username, companyid);

create table plg_budgetexec(
  budgetexecid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  budgetresheaderid number(38) not null,
  creationindicator number(38) not null,
  invtransheaderid number(38),
  fintransheaderid number(38),
  contractheaderid number(38),
  budgetorgid number(38) not null,
  plgaccountid varchar2(40) not null,
  incexpindicator varchar2(1) not null,
  budgetexecamount float(126) not null,
  budgetexecdate date not null,
  iscreatingbudgetres varchar2(1) not null,
  comments varchar2(100));

alter table plg_budgetexec add constraint plg_budgetexec_pk
  primary key(budgetexecid, companyid);

alter table plg_budgetexec add constraint plg_budgetorg_budgetexec_fk
  foreign key(budgetorgid, companyid, fyearid)
  references plg_budgetorg(budgetorgid, companyid, fyearid);
alter table plg_budgetexec add constraint plg_budgetreshd_budgetexec_fk
  foreign key(budgetresheaderid, companyid)
  references plg_budgetresheader(budgetresheaderid, companyid);
alter table plg_budgetexec add constraint plg_account_budgetexec_fk
  foreign key(plgaccountid, fyearid, companyid, incexpindicator)
  references plg_account(accountid, fyearid, companyid, incexpindicator);
alter table plg_budgetexec add constraint inv_trhd_budgetexec_fk
  foreign key(invtransheaderid, companyid, fyearid)
  references inv_transheader(invtransheaderid, companyid, fyearid) on delete cascade;

alter table plg_budgetexec add constraint fin_trhd_budgetexec_fk
  foreign key(fintransheaderid, companyid, fyearid)
  references fin_transheader(fintransheaderid, companyid, fyearid) on delete cascade;

alter table plg_budgetresheader add constraint plg_bdgtexec_bdgthd_fk
  foreign key(budgetexecid, companyid)
  references plg_budgetexec (budgetexecid, companyid) on delete cascade

create index plg_budgetorg_budgetexec_fk on plg_budgetexec(budgetorgid, companyid, fyearid);
create index plg_budgetreshd_budgetexec_fk on plg_budgetexec(budgetresheaderid, companyid);
create index plg_account_budgetexec_fk on plg_budgetexec(plgaccountid, fyearid, companyid, incexpindicator);
create index inv_trhd_budgetexec_fk on plg_budgetexec(invtransheaderid, companyid, fyearid);
create index fin_trhd_budgetexec_fk on plg_budgetexec(fintransheaderid, companyid, fyearid);

alter table INV_CONTRACTHEADER add BUDGETRESHEADERID NUMBER(38);

alter table INV_CONTRACTHEADER
  add constraint BDGRESHD_CONTRACTHD_FK foreign key (BUDGETRESHEADERID, COMPANYID)
  references plg_budgetresheader (BUDGETRESHEADERID, COMPANYID);
create index BDGRESHD_CONTRACTHD_FK on INV_CONTRACTHEADER (BUDGETRESHEADERID, COMPANYID);


