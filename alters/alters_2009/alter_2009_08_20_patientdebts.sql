alter table pta_parameters add patientdebtthreshold float(126);

alter table pta_visit add (ispatientowing varchar2(1), debtcategoryindicator number(38), ispatientcontacted varchar2(1));
update pta_visit set ispatientowing='0', ispatientcontacted='0';
alter table pta_visit modify (ispatientowing not null, ispatientcontacted not null);
create index pta_visit_ispatientowing_idx on pta_visit (iscanceled, ispatientowing);

create or replace view pta_patientdebt as
  select pta_visit.companyid, pta_visit.fyearid, pta_visit.visitid visitid, pta_visit.patientid patientid, pta_visit.mnemonic visitmnemonic,
  pta_patient.mnemonic patientmnemonic, pta_visit.lastname, pta_visit.firstname,
  pta_visit.admissiondate, pta_visit.dischargedate, pta_visitadmission.admissioncomments,
  pta_visitdischarge.dischargecomments, therapon.doctorid therapondoctorid, therapon.lastname theraponlastname,
    therapon.firstname theraponfirstname, sistisas.doctorid sistisasdoctorid, sistisas.lastname sistisaslastname,
    sistisas.firstname sistisasfirstname, pta_visit.debtcategoryindicator, pta_visit.inoutpatient,
      (select nvl(sum(fin_transdetail.amountdebit),0)-nvl(sum(fin_transdetail.amountcredit),0)
        from fin_transdetail where
      fin_transdetail.visitid = pta_visit.visitid and fin_transdetail.companyid = pta_visit.companyid and fin_transdetail.fyearid = pta_visit.fyearid and
      fin_transdetail.transacteeindicator=1 and fin_transdetail.patienttypeindicator in (1,3)) visitdebt,
      (select sum(fin_transdetail.amountdebit)-sum(fin_transdetail.amountcredit) from fin_transdetail, pta_visit allvisits where
      allvisits.patientid = pta_visit.patientid and allvisits.companyid = pta_visit.companyid and
      fin_transdetail.visitid = allvisits.visitid and fin_transdetail.companyid = allvisits.companyid and fin_transdetail.fyearid = allvisits.fyearid and
      fin_transdetail.transacteeindicator=1 and fin_transdetail.patienttypeindicator in (1,3)) patientdebt,
      (select nvl(sum(fin_transdetail.amountdebit),0)-nvl(sum(fin_transdetail.amountcredit),0)
        from fin_transdetail, fin_transdetail clientcredit, fin_transdetail bankdebit, fin_banknote, fin_banknotestatus
        where bankdebit.fintransheaderid = clientcredit.fintransheaderid and
         bankdebit.companyid = clientcredit.companyid and
         bankdebit.fyearid = clientcredit.fyearid and
         fin_banknote.banknoteid = bankdebit.banknoteid and
         fin_banknote.companyid = bankdebit.companyid  and
         fin_banknotestatus.banknotestatusid = fin_banknote.banknotestatusid and
         fin_banknotestatus.companyid = fin_banknote.companyid and
         fin_banknotestatus.fyearid = fin_banknote.fyearid and
         clientcredit.eventtypeindicator in (3,4,5,6,7,8) and
         clientcredit.transacteeindicator = 1 and
         bankdebit.transacteeindicator = 7 and
         clientcredit.visitid = pta_visit.visitid and
         clientcredit.companyid = pta_visit.companyid and
         clientcredit.visitfyearid = pta_visit.fyearid and
         fin_banknotestatus.isdefault = '1' and
         fin_transdetail.banknoteid = fin_banknote.banknoteid and
         fin_transdetail.companyid = fin_banknote.companyid) banknotedebt
      from pta_visit
        inner join pta_patient on
          pta_patient.patientid = pta_visit.patientid and
          pta_patient.companyid = pta_visit.companyid
        inner join pta_visitadmission on
          pta_visitadmission.visitid = pta_visit.visitid and
          pta_visitadmission.companyid = pta_visit.companyid and
          pta_visitadmission.fyearid = pta_visit.fyearid
        left outer join pta_visitdischarge on
          pta_visitdischarge.visitid = pta_visit.visitid and
          pta_visitdischarge.companyid = pta_visit.companyid and
          pta_visitdischarge.fyearid = pta_visit.fyearid and
          pta_visitdischarge.iscanceled = '0'
        left outer join pta_visitdoctorheader on
          pta_visitdoctorheader.visitid = pta_visit.visitid and
          pta_visitdoctorheader.companyid = pta_visit.companyid and
          pta_visitdoctorheader.fyearid = pta_visit.fyearid and
          pta_visitdoctorheader.isfirstvisitdoctor = '1'
        left outer join pta_visitdoctordetail therapon_detail on
          therapon_detail.visitdoctorheaderid = pta_visitdoctorheader.visitdoctorheaderid and
          therapon_detail.companyid = pta_visitdoctorheader.companyid and
          therapon_detail.fyearid = pta_visitdoctorheader.fyearid and
          therapon_detail.doctorroleid = 1
        left outer join pta_doctor therapon on
          therapon.doctorid = therapon_detail.doctorid and
          therapon.companyid = therapon_detail.companyid and
          therapon.fyearid = therapon_detail.fyearid
        left outer join pta_visitdoctordetail sistisas_detail on
          sistisas_detail.visitdoctorheaderid = pta_visitdoctorheader.visitdoctorheaderid and
          sistisas_detail.companyid = pta_visitdoctorheader.companyid and
          sistisas_detail.fyearid = pta_visitdoctorheader.fyearid and
          sistisas_detail.doctorroleid = 2
        left outer join pta_doctor sistisas on
          sistisas.doctorid = sistisas_detail.doctorid and
          sistisas.companyid = sistisas_detail.companyid and
          sistisas.fyearid = sistisas_detail.fyearid
      where
        pta_visit.iscanceled = '0' and pta_visit.ispatientowing = '1';

create table pta_patientdebtcomment(visitid number(38) not null, companyid number(38) not null,
  visitfyearid number(38) not null, commentid number(38) not null,
  commentdate date not null, comments varchar2(100) not null, iscreatingalert varchar2(1) not null,
  alertdate date,
  entryuser varchar2(20) not null, entrydatetime timestamp not null);
alter table pta_patientdebtcomment add constraint pta_patientdebtcomment_pk
  primary key (commentid, companyid);
alter table pta_patientdebtcomment add constraint visit_patientdebtcomment_fk
  foreign key (visitid, companyid, visitfyearid) references pta_visit (visitid, companyid, fyearid);

alter table fin_banknote add (debtcategoryindicator number(38));