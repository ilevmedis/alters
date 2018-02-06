create table fin_breakitem(
  finitemid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  newfinitem1id number(38) not null,
  newfinitem2id number(38) not null
);
alter table fin_breakitem add constraint fin_breakitem_pk
   primary key (finitemid, companyid, fyearid);
alter table fin_breakitem add constraint fin_item_fin_breakitem_fk
   foreign key(finitemid, companyid, fyearid)
   references fin_item (finitemid, companyid, fyearid);
alter table fin_breakitem add constraint fin_item1_fin_breakitem_fk
   foreign key (newfinitem1id, companyid, fyearid)
   references fin_item(finitemid, companyid, fyearid);
alter table fin_breakitem add constraint fin_item2_fin_breakitem_fk
   foreign key (newfinitem2id, companyid, fyearid)
   references fin_item(finitemid, companyid, fyearid);

