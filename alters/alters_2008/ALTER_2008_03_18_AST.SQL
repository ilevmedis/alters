alter table FIN_TRANSDETAIL
  drop constraint AST_ASSET_TO_FIN_TRANSDETAIL;
alter table FIN_TRANSDETAIL
  drop constraint AST_ASSETENTITY_TO_FINTRANSDET;


create table ast_asset(invitemid number(38), companyid number(38) not null, fyearid number(38) not null, 
  registryno varchar2(20) not null, ownershipmethod number(38) not null, brand varchar2(50), 
  model varchar2(50), countryid number(38), deprmethod number(38) not null, 
  deprnormalfactor number(38), depradditionalfactor number(38), deprinactivityfactor number(38), 
  deprloanfactor number(38), comments varchar2(200));
alter table ast_asset add constraint ast_asset_pk primary key (invitemid, companyid, fyearid);


alter table ast_asset
  add constraint inv_item_ast_asset_fk foreign key (invitemid, companyid, fyearid)
  references inv_item (invitemid, companyid, fyearid) on delete cascade;

create table ast_assetpart(invitemid number(38), companyid number(38) not null, fyearid number(38) not null, 
  registryno varchar2(20) not null, brand varchar2(50), model varchar2(50), countryid number(38), 
  comments varchar2(200), sn varchar2(50), assetparttype number(38) not null, suppliername varchar2(100),
  suppliercode varchar2(30), supplierdescr varchar2(100), purchasedata varchar2(30), purchasedate date not null,
  deprstartdate date, deprenddate date, purchaseprice float(126) not null, purchasequa float(126) not null,
  purchasevalue float(126) not null, isdepreciated varchar2(1) not null, istotallydepriciatedinfiscal varchar2(1) not null,
  deprminprice float(126), invtransdetailfyearid number(38), invtransdetailid number(38));

--EBD STATEMENT 
create table ast_assetpart(invitemid number(38), companyid number(38) not null, fyearid number(38) not null, 
  registryno varchar2(20) not null, brand varchar2(50), model varchar2(50), countryid number(38), 
  comments varchar2(200), sn varchar2(50), assetparttype number(38) not null, suppliername varchar2(100),
  suppliercode varchar2(30), supplierdescr varchar2(100), purchasedata varchar2(30), purchasedate date not null,
  deprstartdate date, deprenddate date, purchaseprice number(38,10) not null, purchasequa number(38,10) not null,
  purchasevalue number(38,10) not null, isdepreciated varchar2(1) not null, istotallydepriciatedinfiscal varchar2(1) not null,
  deprminprice number(38,10), invtransdetailfyearid number(38), invtransdetailid number(38));

alter table ast_assetpart add constraint ast_assetpart_pk primary key (invitemid, companyid, fyearid);

alter table ast_assetpart
  add constraint inv_item_ast_assetpart_fk foreign key (invitemid, companyid, fyearid)
  references inv_item (invitemid, companyid, fyearid) on delete cascade;

alter table ast_assetpart
  add constraint invtransdetail_astassetpart_fk foreign key (invtransdetailid, companyid, invtransdetailfyearid)
  references inv_transdetail (invtransdetailid, companyid, fyearid);


create table ast_assetpartlink(assetpartlinkid number(38) not null, companyid number(38) not null,
  fyearid number(38) not null, assetid number(38) not null, assetpartid number(38) not null,
  sincedate date not null, tilldate date, invtransdetailid number(38), invtransdetailfyearid number(38));

alter table ast_assetpartlink add constraint ast_assetpartlink_pk primary key (assetpartlinkid, companyid, fyearid);

alter table ast_assetpartlink
  add constraint asset_assetpartlink_fk foreign key (assetid, companyid, fyearid)
  references ast_asset(invitemid, companyid, fyearid) on delete cascade;

alter table ast_assetpartlink
  add constraint assetpart_assetpartlink_fk foreign key (assetpartid, companyid, fyearid)
  references ast_assetpart(invitemid, companyid, fyearid);

alter table inv_item add itemtype number(38);
update inv_item set itemtype=1;
commit;
alter table inv_item modify itemtype not null;

alter table fin_transdetail drop column assetentityid;
alter table fin_transdetail add assetpartid number(38);

alter table fin_transdetail
  add constraint asset_fintransdetail_fk foreign key (assetid, companyid, fyearid)
  references ast_asset(invitemid, companyid, fyearid);

alter table fin_transdetail
  add constraint assetpart_fintransdetail_fk foreign key (assetpartid, companyid, fyearid)
  references ast_assetpart(invitemid, companyid, fyearid);

alter table fin_transheader add (sincedeprdate date, tilldeprdate date, sincedeprperiod number(38), tilldeprperiod number(38));
alter table fin_transheader
  add constraint sinceperiod_fintransheader_fk foreign key (sincedeprperiod, companyid, fyearid)
  references glg_period(periodid, companyid, fyearid);
alter table fin_transheader
  add constraint tillperiod_fintransheader_fk foreign key (tilldeprperiod, companyid, fyearid)
  references glg_period(periodid, companyid, fyearid);
alter table fin_transdetail add (normaldeprvalue float(126), additionaldeprvalue float(126), inactivitydeprvalue float(126), loandeprvalue float(126));

--edb statement
alter table fin_transdetail add (normaldeprvalue number(38,10), additionaldeprvalue number(38,10), inactivitydeprvalue number(38,10), loandeprvalue number(38,10));
