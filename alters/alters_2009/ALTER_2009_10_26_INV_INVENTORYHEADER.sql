alter table inv_inventoryheader add (frominvitemgroupingid number(38),
  frominvitemgroupingcode varchar2(40), toinvitemgroupingid number(38),
  toinvitemgroupingcode varchar2(40));
update inv_inventoryheader set frominvitemgroupingid = invitemgroupingid,
  frominvitemgroupingcode = invitemgroupingcode,
  toinvitemgroupingid = invitemgroupingid, toinvitemgroupingcode = invitemgroupingcode;
commit;
alter table inv_inventoryheader add constraint
  fromitemgroup_inventory_fk foreign key
  (frominvitemgroupingid, frominvitemgroupingcode, companyid, fyearid)
  references inv_itemgroupingcode (invitemgroupingid, invitemgroupingcode, companyid, fyearid);
alter table inv_inventoryheader add constraint
  toitemgroup_inventory_fk foreign key
  (toinvitemgroupingid, toinvitemgroupingcode, companyid, fyearid)
  references inv_itemgroupingcode (invitemgroupingid, invitemgroupingcode, companyid, fyearid);
create index fromitemgroup_inventory_fk on inv_inventoryheader
  (frominvitemgroupingid, frominvitemgroupingcode, companyid, fyearid);
create index toitemgroup_inventory_fk on inv_inventoryheader
  (toinvitemgroupingid, toinvitemgroupingcode, companyid, fyearid);
alter table inv_inventoryheader drop column invitemgroupingid;
alter table inv_inventoryheader drop column invitemgroupingcode;