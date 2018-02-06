alter table pta_visit add (originaladmissiondate date, originaladmissionfyear number(38));
update pta_visit a set originaladmissiondate = (select min(admissiondate) from pta_visit b where b.visitid = a.visitid),
 originaladmissionfyear = (select min(fyearid) from pta_visit b where b.visitid = a.visitid)
  where inoutpatient = 1;