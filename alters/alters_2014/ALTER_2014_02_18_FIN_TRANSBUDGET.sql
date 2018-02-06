create table plg_fintransbudget(
  companyid number(38) not null,
  fyearid number(38) not null,
  fintransheaderid number(38) not null,
  fintransheaderfyearid number(38) not null,
  budgetindicator number(38) not null
);

alter table plg_fintransbudget
  add constraint plg_fintransbudget_pk
  primary key (companyid, fyearid, fintransheaderid, fintransheaderfyearid);

alter table plg_fintransbudget
  add constraint fin_transhd_plg_fintransb_fk
  foreign key (companyid, fintransheaderid, fintransheaderfyearid)
  references fin_transheader(companyid, fintransheaderid, fyearid)
  on delete cascade;
create index fin_transhd_plg_fintransb_fk
  on plg_fintransbudget
  (companyid, fintransheaderid, fintransheaderfyearid);

insert into plg_fintransbudget(companyid, fyearid, fintransheaderid, fintransheaderfyearid, budgetindicator)
  select fin_transheader.companyid, fin_transheader.fyearid,
    fin_transheader.fintransheaderid, fin_transheader.fyearid, 1 from fin_transheader, erp_fyear
  where fin_transheader.eventtypeindicator = 1 and
    erp_fyear.companyid = fin_transheader.companyid and
    erp_fyear.fyearid = fin_transheader.fyearid;

insert into plg_fintransbudget(companyid, fyearid, fintransheaderid, fintransheaderfyearid, budgetindicator)
  select fin_transheader.companyid, erp_fyear.fyearid,
    fin_transheader.fintransheaderid, fin_transheader.fyearid, 2
    from fin_transheader, erp_fyear
  where fin_transheader.eventtypeindicator = 1 and
    erp_fyear.companyid = fin_transheader.companyid and
    erp_fyear.fyearid > fin_transheader.fyearid and
    (fin_transheader.isbudgetc = '0' or erp_fyear.fyearid <> 2013);

insert into plg_fintransbudget(companyid, fyearid, fintransheaderid, fintransheaderfyearid, budgetindicator)
  select fin_transheader.companyid, erp_fyear.fyearid,
    fin_transheader.fintransheaderid, fin_transheader.fyearid, 3 from fin_transheader, erp_fyear
  where fin_transheader.eventtypeindicator = 1 and
    erp_fyear.companyid = fin_transheader.companyid and
    erp_fyear.fyearid > fin_transheader.fyearid and
    fin_transheader.isbudgetc = '1' and
    erp_fyear.fyearid = 2013;

alter table plg_budgetresdetail add budgetindicator number(38);
update plg_budgetresdetail set budgetindicator = 3 where fyearid = 2013 and isbudgetc = '1';
update plg_budgetresdetail set budgetindicator = 1 where
  inventoryindicator = '0' and (isbudgetc = '0' or fyearid <> 2013);
update plg_budgetresdetail set budgetindicator = 2 where
  inventoryindicator = '1' and (isbudgetc = '0' or fyearid <> 2013);
alter table plg_budgetresdetail modify budgetindicator not null;
alter table plg_budgetresdetail modify (inventoryindicator null, isbudgetc null);

alter table plg_budgetexec add budgetindicator number(38);
update plg_budgetexec set budgetindicator = 3 where budgetfyearid = 2013 and isbudgetc = '1';
update plg_budgetexec set budgetindicator = 1 where
  budgetfyearid = fyearid and (isbudgetc = '0' or budgetfyearid <> 2013);
update plg_budgetexec set budgetindicator = 2 where
  budgetfyearid <> fyearid and (isbudgetc = '0' or budgetfyearid <> 2013);
alter table plg_budgetexec modify budgetindicator not null;