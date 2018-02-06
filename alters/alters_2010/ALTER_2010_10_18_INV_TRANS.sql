alter table inv_transheader add medorderheaderid number(38);
alter table inv_transheader add constraint med_orderheader_inv_trhd_fk
  foreign key (medorderheaderid, companyid, fyearid)
  references med_orderheader (orderheaderid, companyid, fyearid);
create index med_orderheader_inv_trhd_fk on inv_transheader (medorderheaderid, companyid, fyearid);

alter table inv_transdetail add (medorderdetailid number(38), medorderrecurrenceid number(38));
alter table inv_transdetail add constraint med_orderdetail_inv_trdt_fk
  foreign key (medorderdetailid, companyid, fyearid)
  references med_orderdetail (orderdetailid, companyid, fyearid);
create index med_orderdetail_inv_trdt_fk on inv_transdetail (medorderdetailid, companyid, fyearid);
alter table inv_transdetail add constraint med_orderrecurr_inv_trdt_fk
  foreign key (medorderrecurrenceid, companyid, fyearid)
  references med_orderrecurrence (orderrecurrenceid, companyid, fyearid);
create index med_orderrecurr_inv_trdt_fk on inv_transdetail (medorderrecurrenceid, companyid, fyearid);

alter table pta_facility add invstoreid number(38);
alter table pta_facility add constraint inv_store_pta_facility_fk
  foreign key (invstoreid, companyid, fyearid)
  references inv_store (invstoreid, companyid, fyearid);
create index inv_store_pta_facility_fk on pta_facility (invstoreid, companyid, fyearid);