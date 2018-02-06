create table pbl_packagenodiscitem(
  packagenodiscitemid number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  packageid number(38) not null,
  finitemid number(38),
  finitemgroupingid number(38),
  finitemgroupingcode varchar2(40)
);
alter table pbl_packagenodiscitem
  add constraint pbl_packagenodiscitem_pk primary key
  (packagenodiscitemid, companyid, fyearid);
alter table pbl_packagenodiscitem
  add constraint pbl_package_pkgnodiscitem_fk foreign key
   (packageid, companyid, fyearid)
     references pbl_package (packageid, companyid, fyearid);
alter table pbl_packagenodiscitem
  add constraint fin_item_packagenodiscitem_fk foreign key
   (finitemid, companyid, fyearid)
     references fin_item (finitemid, companyid, fyearid);
alter table pbl_packagenodiscitem
  add constraint fin_itemgrpcode_pckdiscitem_fk foreign key
   (finitemgroupingid, finitemgroupingcode, companyid, fyearid)
     references fin_itemgroupingcode(finitemgroupingid, finitemgroupingcode, companyid, fyearid);
create index pbl_package_pkgnodiscitem_fk
  on pbl_packagenodiscitem (packageid, companyid, fyearid);
create index fin_item_packagenodiscitem_fk
  on pbl_packagenodiscitem (finitemid, companyid, fyearid);
create index fin_itemgrpcode_pckdiscitem_fk
  on pbl_packagenodiscitem (finitemgroupingid, finitemgroupingcode, companyid, fyearid);

