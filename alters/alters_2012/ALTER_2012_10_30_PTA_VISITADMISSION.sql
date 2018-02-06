alter table pta_visitadmission
  add constraint pta_admreason_admission_fk
   foreign key (admissionreasonid, companyid, fyearid)
   references pta_admissionreason(admissionreasonid, companyid, fyearid);