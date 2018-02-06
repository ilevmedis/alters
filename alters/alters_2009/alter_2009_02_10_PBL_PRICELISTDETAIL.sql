alter table pbl_pricelistdetail add relpricelistheaderid number(38);

alter table pbl_pricelistdetail
  add constraint PRICELISTDT_RELPRICELISTHD_FK foreign key (relpricelistheaderid, companyid, fyearid)
  references pbl_pricelistheader (pricelistheaderid, companyid, fyearid);

--edb foreign key
alter table pbl_pricelistdetail
  add constraint PRICELISTDT_RELPRICELISTHD_FK foreign key (relpricelistheaderid, companyid, fyearid)
  references pbl_pricelistheader (pricelistheaderid, companyid, fyearid) on delete restrict;
