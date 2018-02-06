delete from inv_itemgroup where invitemid not in (select invitemid from inv_item);
commit;
delete from inv_itemgroup a where a.invitemid not in
(select b.invitemid from inv_item b
  where b.invitemid = a.invitemid
    and b.companyid = a.companyid
    and b.fyearid = a.fyearid);
commit;    
alter table INV_ITEMGROUP
 add constraint INV_ITEM_ITEMGROUP_FK foreign key (INVITEMID,COMPANYID,FYEARID)
 references inv_item (invitemid,companyid,fyearid) on delete cascade;
create index INV_ITEM_ITEMGROUP_FK on INV_ITEMGROUP (INVITEMID,COMPANYID,FYEARID);