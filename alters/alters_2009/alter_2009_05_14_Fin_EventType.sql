alter table fin_eventtype add (defaulttaxscenarioid number(38), iscreatingdetailsfromtaxes varchar2(1));
alter table fin_eventtype add constraint fin_taxscenario_eventtype_fk 
  foreign key (defaulttaxscenarioid, companyid, fyearid)
  references fin_taxscenario (taxscenarioid, companyid, fyearid);
update fin_eventtype set iscreatingdetailsfromtaxes = '1';
commit;
alter table fin_eventtype modify iscreatingdetailsfromtaxes not null;
update fin_eventtype set defaulttaxscenarioid = (select taxscenarioid from fin_taxscenario where 
  fin_taxscenario.companyid = fin_eventtype.companyid and fin_taxscenario.fyearid = fin_eventtype.fyearid 
  and fin_taxscenario.isdefault='1') where exists (select taxscenarioid from fin_taxscenario where 
  fin_taxscenario.companyid = fin_eventtype.companyid and fin_taxscenario.fyearid = fin_eventtype.fyearid 
  and fin_taxscenario.isdefault='1') and eventtypeindicator = 1;
commit;
