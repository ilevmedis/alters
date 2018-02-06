alter table pbl_visitcoverexclusions add (validsincedate date, validtilldate date);
update pbl_visitcoverexclusions set validsincedate = (select pta_visit.admissiondate
  from pta_visit, pbl_visitcoverdetail where
  pbl_visitcoverdetail.visitcoverdetailid = pbl_visitcoverexclusions.visitcoverdetailid and
  pbl_visitcoverdetail.companyid = pbl_visitcoverexclusions.companyid and
  pbl_visitcoverdetail.fyearid = pbl_visitcoverexclusions.fyearid and
  pta_visit.visitid = pbl_visitcoverdetail.visitid and
  pta_visit.companyid = pbl_visitcoverdetail.companyid and
  pta_visit.fyearid = pbl_visitcoverdetail.fyearid);
commit;
alter table pbl_visitcoverexclusions modify validsincedate not null;