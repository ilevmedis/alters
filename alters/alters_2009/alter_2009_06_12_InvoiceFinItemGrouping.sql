alter table pbl_contractheader add invoicefinitemgroupingid number(38);
alter table pbl_contractheader add constraint fin_itemgrouping_contract_fk
  foreign key (invoicefinitemgroupingid, companyid, fyearid)
  references fin_itemgrouping (finitemgroupingid, companyid, fyearid);

alter table fin_transheader add finitemgroupingid number(38);
alter table fin_transheader add finitemgroupingcode varchar2(40);
alter table fin_transheader add constraint itemgroupingcd_fintranshd_fk
  foreign key (finitemgroupingid, finitemgroupingcode, companyid, fyearid)
  references fin_itemgroupingcode(finitemgroupingid, finitemgroupingcode, companyid, fyearid);

