alter table FIN_TRANSPARTY add INVOICETYPE number(38);

update fin_eventtype set invoicekindindicator = 5
  where invoicekindindicator = 4;
commit;

update fin_transparty
  set invoicetype = 2
  where ISCLIENT ='1';

update fin_transparty
  set invoicetype = 3
  where ISINSURANCEPROVIDER = '1' and ISCLIENT ='0';

commit;
