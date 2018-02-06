create table pbl_dapy(
  companyid number(38) not null,
  reqheaderid number(38) not null,
  visitid number(38) not null,
  visitfyearid number(38) not null,
  visitmnemonic varchar2(20) not null,
  lastname varchar2(50) not null,
  firstname varchar2(50) not null,
  insurancecode varchar2(20),
  insurancenumber varchar2(30),
  patientssn varchar2(20),
  admissiondate date not null,
  dischargedate date not null,
  linenum number(38) not null,
  servicetype varchar2(2) not null,
  servicecode varchar2(30) not null,
  servicecoding varchar2(2) not null,
  servicedescr varchar2(100) not null,
  chargedate date,
  sincedate date,
  tilldate date,
  qua float(126),
  totalvalue float(126),
  insurancevalue float(126),
  patientvalue float(126)
);
alter table pbl_dapy
  add constraint pbl_dapy_pk
  primary key(reqheaderid, companyid, visitid, visitfyearid, linenum);
alter table pbl_dapy
  add constraint pbl_reqheader_pbl_dapy_fk
  foreign key(reqheaderid, companyid)
  references pbl_reqheader(reqheaderid, companyid);
alter table pbl_dapy
  add constraint pta_visit_pbl_dapy_fk
  foreign key(visitid, companyid, visitfyearid)
  references pta_visit(visitid, companyid, fyearid);
