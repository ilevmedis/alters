alter table pta_facility add facilityvisitpartindicator number(38);
create table pta_visitpartscheme
(
  visitpartschemeid number(38) not null,
  facilityvisitpartindicator number(38) not null,
  facilityvisitpartorder number(38) not null,
  companyid number(38) not null,
  fyearid number(38) not null,
  durationindays number(38) not null,
  visitpartindicator number(38) not null
);
alter table PTA_VISITPARTSCHEME
  add constraint VISITPARTSCHEME_PK primary key (VISITPARTSCHEMEID, COMPANYID, FYEARID);
alter table pbl_chargeheader add visitpartindicator number(38);
alter table pbl_pricelistdetail add (isvisitpartdependent varchar2(1), visitpartindicator number(38));
update pbl_pricelistdetail set isvisitpartdependent='0';
commit;
alter table pbl_pricelistdetail modify isvisitpartdependent not null;

