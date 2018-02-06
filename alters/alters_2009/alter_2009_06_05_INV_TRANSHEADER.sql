alter table INV_TRANSHEADER add ORDERSTORETRANSHEADERID number(38);
alter table INV_TRANSHEADER add ORDERSTOREFYEARID number(38);
alter table INV_TRANSHEADER
  add constraint FK_ORDERSTORE_ORDERBUY foreign key (orderstoretransheaderid,companyid,orderstorefyearid)
  references inv_transheader (invtransheaderid,companyid,fyearid);
