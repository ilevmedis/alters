create table dap_parameters(
  companyid number(38) not null,
  contractnum varchar2(20) not null,
  hospitalcode varchar2(10) not null,
  hospitalname varchar2(100) not null,
  taxregistrationno varchar2(9) not null,
  taxbranchcode varchar2(10) not null,
  approvaldoctorsurname varchar2(50),
  approvaldoctorfirstname varchar2(50),
  approvaldoctorssn varchar2(11),
  approvaldoctortaxno varchar2(9)
);
alter table dap_parameters
  add constraint dap_parameters_pk
  primary key(companyid);


create table dap_req(
  companyid number(38) not null,
  reqid number(38) not null,
  reqdate date not null,
  descr varchar2(50),
  reqmonth number(38) not null,
  reqyear number(38) not null,
  requesttypeindicator number(38) not null,
  invoiceno varchar2(15),
  invoicedate date,
  invoicenetvalue float(126),
  invoicevatvalue float(126)
);
alter table dap_req
  add constraint dap_req_pk
  primary key(reqid);

create table dap_visit(
  companyid number(38) not null,
  reqid number(38) not null,
  visitid number(38) not null,
  visitno varchar2(15) not null,
  admissiondate date not null,
  admissiontime timestamp(6),
  dischargeno varchar2(15),
  dischargedate date,
  dischargetime timestamp(6),
  iseanouncement varchar2(1) not null,
  eanouncementadmissionnum varchar2(15),
  eanouncementdischargenum varchar2(15),
  outcomeindicator number(38),
  approvaldate date,
  countryid number(38),
  chronicdiagnosisgroupingid number(38),
  chronicdiagnosiscodeid varchar2(40),
  diagnosisgroupingid number(38),
  diagnosiscodeid varchar2(40),
  ispatientstaying varchar2(1) not null,
  attendingdoctorsurname varchar2(50),
  attendingdoctorfirstname varchar2(50),
  attendingdoctorssn varchar2(11),
  attendingdoctortaxno varchar2(9),
  isDirectInsured varchar2(1) not null,
  insuranceLevel varchar2(5),
  lastname varchar2(50) not null,
  firstname varchar2(50) not null,
  fatherfirstname varchar2(50),
  motherfirstname varchar2(50),
  insurancenumber varchar2(20),
  taxregistrationno varchar2(9),
  idnumber varchar2(15),
  patientssn varchar2(9),
  genderid number(38) not null,
  birthdate date,
  street varchar2(50),
  streetnum varchar2(10),
  zipcode varchar2(5),
  prefecturename varchar2(50),
  municipalityname varchar2(50),
  phonenumber varchar2(10),
  deathindicator number(38),
  insuranceindicator number(38)
  approvaldoctorsurname varchar2(50),
  approvaldoctorfirstname varchar2(50),
  approvaldoctorssn varchar2(11),
  approvaldoctortaxno varchar2(9),
);
alter table dap_visit
  add constraint dap_visit_pk
  primary key (reqvisitid);
alter table dap_visit
  add constraint pta_diagnosiscode_dap_visit_fk
  foreign key (companyid, diagnosisgroupingid, diagnosiscodeid)
  references pta_diagnosiscode(companyid, diagnosisgroupingid, diagnosiscodeid);
alter table dap_visit
  add constraint chronicdiagnosiscode_dap_visit_fk
  foreign key (companyid, chronicdiagnosisgroupingid, chronicdiagnosiscodeid)
  references pta_diagnosiscode(companyid, diagnosisgroupingid, diagnosiscodeid);
alter table dap_visit
  add constraint sys_country_dap_visit_fk
  foreign key (countryid)
  references sys_country(countryid);
alter table dap_visit
  add constraint dap_req_visit_fk
  foreign key (reqid)
  references dap_req(reqid)
  on delete cascade;

create table dap_item(
  servicetype varchar2(2) not null,
  servicecode varchar2(20) not null,
  coding varchar2(2) not null,
  descr varchar2(1000) not null
);
alter table dap_item
  add constraint dap_item_pk
  primary key(servicetype, servicecode);


create table dap_itemprice(
  servicetype varchar2(2) not null,
  servicecode varchar2(20) not null,
  validsincedate date not null,
  validtilldate date,
  price float(126)
);
alter table dap_itemprice
  add constraint dap_itemprice_pk
  primary key(servicetype, servicecode, validsincedate);
alter table dap_itemprice
  add constraint dap_item_price_fk
  foreign key(servicetype, servicecode)
  references dap_item(servicetype, servicecode) on delete cascade;

create table dap_charge(
  companyid number(38) not null,
  reqid number(38) not null,
  visitid number(38) not null,
  chargeid number(38) not null,
  linenumber number(38) not null,
  servicetype varchar2(2) not null,
  servicecode varchar2(20) not null,
  orderdoctorsurname varchar2(50),
  orderdoctorfirstname varchar2(50),
  orderdoctorssn varchar2(11),
  orderdoctortaxno varchar2(9),
  qua float(126),
  price float(126),
  chargedate date,
  startdate date,
  enddate date,
  totalValue float(126),
  insuranceValue float(126),
  patientValue float(126),
  levelCharge varchar2(5),
  patientPerc float(126),
  clinicCode varchar2(5),
  insuranceLevel varchar2(5),
  vatPerc float(126),
  isLaparoscopic varchar2(1),
  supplierTaxNo varchar2(9)
);
alter table dap_charge
  add constraint dap_charge_pk
  primary key(reqchargeid);
alter table dap_charge
  add constraint dap_visit_charge_fk
  foreign key(visitid)
  references dap_visit(visitid)
  on delete cascade;
alter table dap_charge
  add constraint dap_item_charge_fk
  foreign key(servicetype, servicecode)
  references dap_item(servicetype, servicecode);
