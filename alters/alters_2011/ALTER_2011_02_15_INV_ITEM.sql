--These FK's must exists
/*
alter table INV_ITEMCODE
  add constraint INV_ITEM_INV_ITEMCODE foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;

alter table INV_ITEMGROUP
  add constraint INV_ITEM_ITEMGROUP_FK foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;


alter table INV_ITEMLOT
  add constraint INV_ITEM_INV_ITEMLOT foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;

alter table INV_ITEMSTOREDATA
  add constraint INV_ITEM_INV_ITEMSTOREDATA foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;


alter table INV_ITEMTRANSPARTY
  add constraint INV_ITEM_INVITEMTRANSPARTY foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;


alter table INV_ITEMUNITOFMEASURE
  add constraint INV_ITEM_ITEMUNITOFMEASURE foreign key (INVITEMID, COMPANYID, FYEARID)
  references inv_item (INVITEMID, COMPANYID, FYEARID) on delete cascade;
*/
