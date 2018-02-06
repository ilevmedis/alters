create table pbl_doctorfee
 (doctorfeeid number(38) not null, companyid number(38) not null, fyearid number(38) not null,
   erpeventtypeid number(38) not null, pbleventtypeid number(38) not null, moduleid varchar2(10) not null,
   pbleventtypeindicator number(38) not null, pbleventid number(38) not null,
   fintransdetailid number(38), fintransdetailfyearid number(38), 
   chargedetailid number(38), chargedetailfyearid number(38),
   debitfintransdetailid number(38), debitfintransdetailfyearid number(38), 
   visitid number(38), visitfyearid number(38),
   finitemid number(38), finitemfyearid number(38),   
   costcenterid varchar2(40), costcenterfyearid number(38),
   doctorid number(38) not null, internaleventno varchar2(20) not null,
   invoicedate date, chargedate date, servicedate date,
   transactiondate date, calcamount float(126), calcdate date, isautocalculated varchar2(1) not null,
   amountdebit float(126), amountcredit float(126), 
   isonhold varchar2(1) not null, reason varchar2(50), comments varchar2(50),
   amounttobind float(126), totalamountbinded float(126), amountlefttobind float(126), isclosed varchar2(1) not null);
alter table pbl_doctorfee add constraint
  pbl_doctorfee_pk primary key (companyid, doctorfeeid);

alter table pbl_doctorfee add constraint
  erp_eventtype_doctorfee_fk foreign key (erpeventtypeid, companyid, fyearid)
  references erp_eventtype (erpeventtypeid, companyid, fyearid);


alter table pbl_doctorfee add constraint
  pbl_eventtype_doctorfee_fk foreign key (pbleventtypeid, companyid, fyearid, moduleid)
  references pbl_eventtype (pbleventtypeid, companyid, fyearid, moduleid);

alter table pbl_doctorfee add constraint
  fin_Transdetail_doctorfee_fk foreign key (fintransdetailid, companyid, fintransdetailfyearid)
  references fin_transdetail(fintransdetailid, companyid, fyearid);
alter table pbl_doctorfee add constraint
  pbl_chargedetail_doctorfee_fk foreign key (chargedetailid, companyid, chargedetailfyearid)
  references pbl_chargedetail(chargedetailid, companyid, fyearid);
alter table pbl_doctorfee add constraint
  fin_item_doctorfee_fk foreign key (finitemid, companyid, finitemfyearid)
  references fin_item(finitemid, companyid, fyearid);
alter table pbl_doctorfee add constraint
  pta_doctor_doctorfee_fk foreign key (doctorid, companyid, fyearid)
  references pta_doctor(doctorid, companyid, fyearid);
alter table pbl_doctorfee add constraint
  pta_visit_doctorfee_fk foreign key (visitid, companyid, visitfyearid)
  references pta_visit(visitid, companyid, fyearid);
alter table pbl_doctorfee add constraint
  fin_Transdebit_doctorfee_fk foreign key (debitfintransdetailid, companyid, debitfintransdetailfyearid)
  references fin_transdetail(fintransdetailid, companyid, fyearid);
alter table pbl_doctorfee add constraint fin_costcenter_doctorfee_fk
  foreign key (costcenterid, companyid, costcenterfyearid)
  references fin_costcenter(costcenterid, companyid, fyearid);

-- σύνδεση υπολογισμένων αμοιβών ιατρών με πληρωμές ιατρών
create table pbl_doctorfeelink(doctorfeelinkid number(38) not null, 
  doctorfeeid number(38) not null, companyid number(38) not null, 
  relativedoctorfeeid number(38) not null, amountbinded float(126));
alter table pbl_doctorfeelink add constraint pbl_doctorfeelink_pk primary key (doctorfeelinkid, companyid);
alter table pbl_doctorfeelink add constraint pbl_doctorfee_feelink_fk
  foreign key (companyid, doctorfeeid)
  references pbl_doctorfee(companyid, doctorfeeid) on delete cascade;
alter table pbl_doctorfeelink add constraint pbl_doctorfee_relfeelink_fk
  foreign key (companyid, relativedoctorfeeid)
  references pbl_doctorfee(companyid,doctorfeeid);

alter table PBL_DOCTORRULEFEE
  drop constraint doctor_rel_doctorrulefee_fk;

alter table PBL_DOCTORRULEFEE
  drop constraint docrule_rel_doctorrulefee_fk;

alter table PBL_DOCTORRULEFEE drop column RELATEDDOCTOR_DOCTORID;
alter table PBL_DOCTORRULEFEE drop column RELATEDDOCTOR_DOCTORROLEID;

alter table pbl_doctorrulefee modify inoutpatient null;

alter table pbl_doctorrulefee add (relateddoctordoctorid number(38), relateddoctordoctorroleid number(38));
alter table pbl_doctorrulefee add isrelateddoctordependent varchar2(1);
update pbl_doctorrulefee  set isrelateddoctordependent = '0';
commit;
alter table pbl_doctorrulefee modify isrelateddoctordependent not null;

alter table pbl_doctorrulefee add constraint doctor_rel_doctorrulefee_fk
  foreign key (relateddoctordoctorid, companyid, fyearid)
  references pta_doctor(doctorid, companyid, fyearid);
alter table pbl_doctorrulefee add constraint docrule_rel_doctorrulefee_fk 
  foreign key (relateddoctordoctorroleid, companyid, fyearid)
  references pbl_doctorrole(doctorroleid, companyid, fyearid);
