alter table fin_transdetail add taxid number(38);
alter table fin_transdetail add constraint fin_tax_fin_transdetail
  foreign key (taxid, companyid, fyearid) references fin_tax(taxid, companyid, fyearid);