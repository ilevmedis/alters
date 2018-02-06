create table src_supplyreqstatus(
  supplyreqstatusid number(38) not null,
  companyid number(38) not null,
  mnemonic varchar2(20) not null,
  descr varchar2(100) not null,
  isactive varchar2(1) not null,
  comments varchar2(200)
);
alter table src_supplyreqstatus
  add constraint src_supplyreqstatus_pk
  primary key(supplyreqstatusid, companyid);

create table src_supplyreqstatuspattern(
  supplyreqstatuspatternid number(38) not null,
  companyid number(38) not null,
  mnemonic varchar2(20) not null,
  descr varchar2(100) not null,
  isactive varchar2(1) not null,
  initialsupplyreqstatusid number(38) not null,
  comments varchar2(200)
);
alter table src_supplyreqstatuspattern
  add constraint src_supplyreqstatuspattern_pk
    primary key(supplyreqstatuspatternid, companyid);
alter table src_supplyreqstatuspattern
  add constraint src_supplyreqstatus_pattern_fk
    foreign key(initialsupplyreqstatusid, companyid)
    references src_supplyreqstatus(supplyreqstatusid, companyid);

create table src_supplyreqstatusrule(
  supplyreqstatusruleid number(38) not null,
  companyid number(38) not null,
  supplyreqstatuspatternid number(38) not null,
  fromsupplyreqstatusid number(38) not null,
  tosupplyreqstatusid number(38) not null
);
alter table src_supplyreqstatusrule
  add constraint src_supplyreqstatusrule_pk
    primary key(supplyreqstatusruleid, companyid);
alter table src_supplyreqstatusrule
  add constraint src_supplyreqstatus_fromrul_fk
    foreign key(fromsupplyreqstatusid, companyid)
    references src_supplyreqstatus(supplyreqstatusid, companyid);
alter table src_supplyreqstatusrule
  add constraint src_supplyreqstatus_torule_fk
    foreign key(tosupplyreqstatusid, companyid)
    references src_supplyreqstatus(supplyreqstatusid, companyid);
alter table src_supplyreqstatusrule
  add constraint src_supplyreqstatpat_rule_fk
    foreign key(supplyreqstatuspatternid, companyid)
    references src_supplyreqstatuspattern(supplyreqstatuspatternid, companyid)
    on delete cascade;

create table src_supplyrequeststatuslog(
  statuslogid number(38) not null,
  companyid number(38) not null,
  supplyrequestid number(38) not null,
  statusdate date not null,
  fromsupplyreqstatusid number(38) not null,
  tosupplyreqstatusid number(38) not null,
  comments varchar2(200)
);
alter table src_supplyrequeststatuslog
  add constraint src_supplyrequeststatuslog_pk
  primary key(statuslogid, companyid);
alter table src_supplyrequeststatuslog
  add constraint src_supplyreqstatus_fromlog_fk
    foreign key(fromsupplyreqstatusid, companyid)
    references src_supplyreqstatus(supplyreqstatusid, companyid);
alter table src_supplyrequeststatuslog
  add constraint src_supplyreqstatus_tolog_fk
    foreign key(tosupplyreqstatusid, companyid)
    references src_supplyreqstatus(supplyreqstatusid, companyid);
alter table src_supplyrequeststatuslog
  add constraint src_supplyrequest_statuslog_fk
    foreign key(supplyrequestid, companyid)
    references src_supplyrequest(supplyrequestid, companyid)
    on delete cascade;


create table src_supplyreqcategory(
  supplyreqcategoryid number(38) not null,
  companyid number(38) not null,
  mnemonic varchar2(20) not null,
  descr varchar2(100) not null,
  isactive varchar2(1) not null,
  supplyreqstatuspatternid number(38),
  comments varchar2(200)
);
alter table src_supplyreqcategory
  add constraint src_supplyreqcategory_pk
   primary key(supplyreqcategoryid, companyid);
alter table src_supplyreqcategory
  add constraint src_supplyreqstatpat_categ_fk
  foreign key(supplyreqstatuspatternid, companyid)
  references src_supplyreqstatuspattern(supplyreqstatuspatternid, companyid);

alter table src_supplyrequest add (
  supplyreqcategoryid number(38),
  supplyreqstatuspatternid number(38),
  supplyreqstatusid number(38)
);
alter table src_supplyrequest
  add constraint src_supplyreqstatpat_supreq_fk
  foreign key(supplyreqstatuspatternid, companyid)
  references src_supplyreqstatuspattern(supplyreqstatuspatternid, companyid);
alter table src_supplyrequest
  add constraint src_supplyreqcateg_supreq_fk
  foreign key(supplyreqcategoryid, companyid)
  references src_supplyreqcategory(supplyreqcategoryid, companyid);
