create or replace view pta_patientdebt as
select pta_visit.companyid, pta_visit.fyearid, pta_visit.visitid visitid, pta_visit.patientid patientid, pta_visit.mnemonic visitmnemonic,
  pta_patient.mnemonic patientmnemonic, pta_visit.lastname, pta_visit.firstname,
  pta_visit.admissiondate, pta_visit.dischargedate, pta_visitadmission.admissioncomments,
  pta_visitadmission.visitadmissionid,
  pta_visitdischarge.dischargecomments, therapon.doctorid therapondoctorid, therapon.lastname theraponlastname,
    therapon.firstname theraponfirstname, sistisas.doctorid sistisasdoctorid, sistisas.lastname sistisaslastname,
    sistisas.firstname sistisasfirstname, pta_visit.debtcategoryindicator, pta_visit.inoutpatient,
     pta_visit.visitdebt,
     pta_visit.patientdebt,
     pta_visit.banknotedebt
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
