alter table FIN_TRANSPARTY add TAXORIGINCOUNTRYID number(38);

update fin_transparty
  set taxorigincountryid =
(select countryid from sys_country a
  where isdefault = '1');
commit;

alter table FIN_TRANSPARTY modify TAXORIGINCOUNTRYID not null;
