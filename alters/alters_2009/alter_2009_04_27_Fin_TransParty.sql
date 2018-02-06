alter table fin_transparty add isbank varchar2(1);
update fin_transparty set isbank = '0';
commit;
alter table fin_transparty modify isbank not null;

alter table fin_transdetail add (collateralbankid number(38), collateraldate date, collateralcomments varchar2(50));
alter table fin_transdetail add constraint fin_transparty_collateral_fk
  foreign key (collateralbankid, companyid, fyearid)
  references fin_transparty (fintranspartyid, companyid, fyearid);






