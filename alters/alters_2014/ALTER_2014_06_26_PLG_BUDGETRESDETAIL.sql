alter table PLG_BUDGETRESDETAIL add BUDGETRESSTATUSLOGID number(38);

alter table PLG_BUDGETRESDETAIL
  add constraint PLG_BUDGETRES_DT_STATLOG_FK foreign key (BUDGETRESSTATUSLOGID, COMPANYID)
  references plg_budgetresstatuslog (BUDGETRESSTATUSLOGID, COMPANYID);

update plg_budgetresdetail a set budgetresstatuslogid =
  (select b.budgetresstatuslogid from plg_budgetresstatuslog b where b.budgetresheaderid = a.budgetresheaderid and b.statuschangedate = a.transdate
  and b.newbudgetresstatus in (4,5))
    where a.budgetamount < 0 and a.fyearid = 2014 and a.budgetresheaderid<>-1;
