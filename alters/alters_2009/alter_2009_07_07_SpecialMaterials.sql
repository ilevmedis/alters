alter table INV_EVENTTYPE add ISUSINGSPECIALMATERIALS varchar2(1);

update inv_eventtype set ISUSINGSPECIALMATERIALS ='0';
commit;

alter table INV_EVENTTYPE modify ISUSINGSPECIALMATERIALS not null;

alter table INV_TRANSDETAIL add ISUSINGSPECIALMATERIALS varchar2(1);
alter table INV_TRANSDETAIL add ORDERTOFINTRANSPARTYID number(38);
alter table INV_TRANSDETAIL add CONSTPRICE varchar2(1);

update INV_TRANSDETAIL set ISUSINGSPECIALMATERIALS ='0', CONSTPRICE = '0';
commit;

alter table INV_TRANSDETAIL modify ISUSINGSPECIALMATERIALS not null;
alter table INV_TRANSDETAIL modify CONSTPRICE not null;

alter table INV_TRANSDETAIL
  add constraint FK_ORDERTOTRANSPARTY_INVTRNSDT foreign key (ORDERTOFINTRANSPARTYID,COMPANYID,FYEARID)
  references fin_transparty (fintranspartyid,companyid,fyearid);


create table INV_EVENTTYPELNK
(
  INVEVENTTYPELNKID number(38),
  COMPANYID number(38),
  FYEARID number(38),
  MASTEREVENTTYPEID number(38),
  RELATIVEEVENTTYPEID number(38),
  MODULEID VARCHAR2(10)
);
alter table INV_EVENTTYPELNK
  add constraint PK_INVEVENTTYPELNK primary key (inveventtypelnkid,companyid,fyearid);
alter table INV_EVENTTYPELNK
  add constraint FK_MASTREVENTTYPE_EVENTTYPELNK foreign key (mastereventtypeid,companyid,fyearid, moduleid)
  references inv_eventtype (inveventtypeid,companyid,fyearid,moduleid);
alter table INV_EVENTTYPELNK
  add constraint FK_RELEVENTTYPE_EVENETYPELNK foreign key (relativeeventtypeid,companyid,fyearid, moduleid)
  references inv_eventtype (inveventtypeid,companyid,fyearid,moduleid);
