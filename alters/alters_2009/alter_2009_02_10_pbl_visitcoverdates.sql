create table pbl_visitcoverdates(visitid number(38) not null, visitcoverdetailid number(38) not null, 
  companyid number(38) not null, fyearid number(38) not null,
  validsincedate date not null, validtilldate date, pricelistcoverid number(38) not null, 
  contractheaderid number(38) not null, discperc float(126), discruleheaderid number(38), 
  levelcoverid number(38) not null);
alter table pbl_visitcoverdates add constraint pbl_visitcoverdates_pk
  primary key (visitcoverdetailid, companyid, fyearid, validsincedate);
alter table pbl_visitcoverdates add constraint pta_visit_visitcoverdates_fk
  foreign key (visitid, companyid, fyearid) 
  references pta_visit(visitid, companyid, fyearid);
alter table pbl_visitcoverdates add constraint pbl_visitcover_coverdates_fk
  foreign key (visitcoverdetailid, companyid, fyearid) 
  references pbl_visitcoverdetail(visitcoverdetailid, companyid, fyearid)
  on delete cascade;
alter table pbl_visitcoverdates add constraint pricelist_visitcoverdates_fk
  foreign key (pricelistcoverid, companyid, fyearid) 
  references pbl_pricelistheader(pricelistheaderid, companyid, fyearid);
alter table pbl_visitcoverdates add constraint contract_visitcoverdates_fk
  foreign key (contractheaderid, companyid, fyearid) 
  references pbl_contractheader(contractheaderid, companyid, fyearid);
alter table pbl_visitcoverdates add constraint discrule_visitcoverdates_fk
  foreign key (discruleheaderid, companyid, fyearid) 
  references pbl_discruleheader(discruleheaderid, companyid, fyearid);

insert into pbl_visitcoverdates(visitid, visitcoverdetailid, companyid, fyearid,
  validsincedate, validtilldate, pricelistcoverid, 
  contractheaderid, discperc, discruleheaderid, levelcoverid)
select pbl_visitcoverdetail.visitid, pbl_visitcoverdetail.visitcoverdetailid, pbl_visitcoverdetail.companyid, 
  pbl_visitcoverdetail.fyearid, pta_visit.admissiondate, null, pbl_visitcoverdetail.pricelistcoverid, 
  pbl_visitcoverdetail.contractheaderid, pbl_visitcoverdetail.discperc, pbl_visitcoverdetail.discruleheaderid, 
  pbl_visitcoverdetail.levelcoverid
  from pta_visit, pbl_visitcoverdetail where 
  pbl_visitcoverdetail.visitid = pta_visit.visitid and 
pbl_visitcoverdetail.companyid = pta_visit.companyid and 
pbl_visitcoverdetail.fyearid = pta_visit.fyearid;
commit;
