alter table glg_journalaccount add (costcenterid varchar2(40));
alter table glg_journalaccount add constraint fin_costcenter_journalacc_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table pbl_chargeheader add (costcenterid varchar2(40));
alter table pbl_chargeheader add constraint fin_costcenter_chargehd_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table pbl_chargedetail add (costcenterid varchar2(40));
alter table pbl_chargedetail add constraint fin_costcenter_chargedt_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table pbl_chargeheader add (costcenterid varchar2(40));
alter table pbl_chargeheader add constraint fin_costcenter_chargehd_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table med_orderheader add (costcenterid varchar2(40));
alter table med_orderheader add constraint fin_costcenter_orderhd_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table med_orderdetail add (costcenterid varchar2(40));
alter table med_orderdetail add constraint fin_costcenter_orderdt_fk 
  foreign key (costcenterid, companyid, fyearid) 
  references fin_costcenter (costcenterid, companyid, fyearid);

alter table inv_eventtype add costcenterindicator number(38);
update inv_eventtype set costcenterindicator = 1 where eventtypeindicator not in (6, 9);
update inv_eventtype set costcenterindicator = 3 where eventtypeindicator in (6, 9);
commit;
alter table inv_eventtype modify costcenterindicator not null;