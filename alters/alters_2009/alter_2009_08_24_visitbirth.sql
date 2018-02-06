alter table pta_visitbirth drop column mnemonic;
alter table pta_visitbirth drop column ptaeventid;
alter table pta_visitbirth drop column ptaeventtypeid;
alter table pta_visitbirth add (birthno number(38) not null,
  lastname varchar2(50) not null, firstname varchar2(50),
  motherlastname varchar2(50) not null, motherfirstname varchar2(50) not null,
  fatherlastname varchar2(50), fatherfirstname varchar2(50),
  dateofbirth date not null, timeofbirth timestamp not null,
  genderid number(38) not null, birthoutcomeindicator number(38) not null,
  deliverymethodindicator number(38) not null,
  gestationweeks number(38), gestationdays number(38), weight float(126), height float(126),
  comments varchar2(100));
alter table pta_visit add (mothervisitid number(38));
alter table pta_visit add constraint pta_visit_mothervisit
  foreign key (mothervisitid, companyid, fyearid)
  references pta_visit(visitid, companyid, fyearid);
