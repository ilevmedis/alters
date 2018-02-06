create table inv_alternativedrug (alternativedrugid number(38) not null,
  companyid number(38) not null, fyearid number(38) not null,
  invitemid number(38) not null,
  alternativeitemindicator number(38) not null,
  alternativeitemid number(38) not null);
alter table inv_alternativedrug
  add constraint inv_alternativedrug_pk
  primary key(alternativedrugid, companyid, fyearid);
alter table inv_alternativedrug
  add constraint inv_item_alternativedrug_fk
  foreign key(invitemid, companyid, fyearid)
  references inv_item(invitemid, companyid, fyearid)
  on delete cascade;
alter table inv_alternativedrug
  add constraint inv_altitem_alternativedrug_fk
  foreign key(alternativeitemid, companyid, fyearid)
  references inv_item(invitemid, companyid, fyearid);
create index inv_item_alternativedrug_fk
  on inv_alternativedrug(invitemid, companyid, fyearid);
create index inv_altitem_alternativedrug_fk
  on inv_alternativedrug(alternativeitemid, companyid, fyearid);    