create table inv_tempinventoryhd(
  inventoryheaderid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  room number(38),
  mobileunitid number(38) not null,
  isinventoryupdated varchar2(1) not null);
alter table inv_tempinventoryhd
  add constraint inv_tempinventoryhd_pk
  primary key(inventoryheaderid, companyid, fyearid, mobileunitid);
alter table inv_tempinventoryhd
  add constraint inv_inventoryhd_inv_tempinv_fk
  foreign key(inventoryheaderid, companyid, fyearid)
  references inv_inventoryheader(inventoryheaderid, companyid, fyearid);
create index inv_inventoryhd_inv_tempinv_fk on inv_tempinventoryhd (inventoryheaderid, companyid, fyearid);

create table inv_tempinventorydt(
  inventoryheaderid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  mobileunitid number(38) not null,
  invitemid number(38) not null,
  quainbuyunit float(126),
  quainsendtostoreunit float(126));
alter table inv_tempinventorydt
  add constraint inv_tempinventorydt_pk
  primary key(inventoryheaderid, companyid, fyearid, mobileunitid, invitemid);
alter table inv_tempinventorydt
  add constraint inv_tempinventoryhd_dt_fk
  foreign key (inventoryheaderid, companyid, fyearid, mobileunitid)
  references inv_tempinventoryhd (inventoryheaderid, companyid, fyearid, mobileunitid)
  on delete cascade;
alter table inv_tempinventorydt
  add constraint inv_item_tempinventory_dt_fk
  foreign key (invitemid, companyid, fyearid)
  references inv_item (invitemid, companyid, fyearid);
create index inv_item_tempinventory_dt_fk on inv_tempinventorydt (invitemid, companyid, fyearid);


