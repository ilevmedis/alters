alter table pbl_visitcoverdetail add orderdoctorid number(38);
alter table pbl_visitcoverdetail
  add constraint pta_doctor_visitcoverdetail_fk
   foreign key(orderdoctorid, companyid, fyearid)
   references pta_doctor(doctorid, companyid, fyearid);
