alter table med_orderheader add(
  dapyvisittypeindicator number(38),
  orderdoctorid number(38),
  orderdoctorsurname varchar2(40),
  orderdoctorfirstname varchar2(20),
  orderdoctorcode varchar2(15),
  orderorganisationcode varchar2(10),
  approvaldoctorsurname varchar2(40),
  approvaldoctorfirstname varchar2(20),
  approvaldoctorcode varchar2(15),
  referenceno varchar2(20),
  issuedate date,
  refapprovaldate date
);
alter table med_orderheader add constraint pta_doctor_med_orderhd_fk
  foreign key(orderdoctorid, companyid, fyearid)
  references pta_doctor (doctorid, companyid, fyearid);
alter table pbl_chargeheader add(
  dapyvisittypeindicator number(38),
  orderdoctorid number(38),
  orderdoctorsurname varchar2(40),
  orderdoctorfirstname varchar2(20),
  orderdoctorcode varchar2(15),
  orderorganisationcode varchar2(10),
  approvaldoctorsurname varchar2(40),
  approvaldoctorfirstname varchar2(20),
  approvaldoctorcode varchar2(15),
  referenceno varchar2(20),
  issuedate date,
  refapprovaldate date
);
alter table pbl_chargeheader add constraint pta_doctor_pbl_chargehd_fk
  foreign key(orderdoctorid, companyid, fyearid)
  references pta_doctor (doctorid, companyid, fyearid);
alter table pta_doctor add (dapycode varchar2(20), ssn varchar2(20));
update pta_doctor set ssn=amka;
commit;
