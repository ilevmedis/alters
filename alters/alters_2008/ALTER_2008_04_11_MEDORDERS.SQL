alter table med_eventtype add medordertypeindicator number(38);
update med_eventtype set medordertypeindicator=1 where medeventtypeindicator in (1,2);
commit;


alter table med_orderheader add medordertypeindicator number(38);
update med_orderheader set medordertypeindicator=1;
commit;
alter table med_orderheader modify medordertypeindicator not null;
--edb
ALTER TABLE med_orderheader ALTER COLUMN medordertypeindicator SET NOT NULL;


alter table med_orderdetail add (medordertypeindicator number(38), 
  invitemid number(38), qua float(126), unitofmeasureid number(38));
--edb
alter table med_orderdetail add medordertypeindicator number(38); 
alter table med_orderdetail add invitemid number(38);
alter table med_orderdetail add qua number(38,10);
alter table med_orderdetail add unitofmeasureid number(38);

alter table med_orderdetail add constraint inv_item_med_orderdetail_fk foreign key (invitemid, companyid, fyearid)
  references inv_item (invitemid, companyid, fyearid);
create index inv_item_med_orderdetail_i on med_orderdetail (invitemid, companyid, fyearid);
update med_orderdetail set medordertypeindicator=1;
commit;
alter table med_orderdetail modify medordertypeindicator not null;
--edb
ALTER TABLE med_orderdetail ALTER COLUMN medordertypeindicator SET NOT NULL;

alter table med_orderdetail modify (servicemasterid null,servicemastergroupid null);

--edb
alter table med_orderdetail ALTER COLUMN servicemasterid SET null
alter table med_orderdetail ALTER COLUMN servicemastergroupid SET null;

