alter table inv_itemtransparty add ekaptycode varchar2(20);
create index inv_itemtransparty_ekapty on inv_itemtransparty(ekaptycode, companyid, fyearid);