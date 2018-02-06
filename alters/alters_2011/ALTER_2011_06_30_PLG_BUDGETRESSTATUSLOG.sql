alter table plg_budgetresstatuslog add (taxeosfineventtypeid number(38), taxeosjournalruleheaderid number(38), taxeosfinmoduleid varchar2(10));
alter table plg_budgetresstatuslog
  add constraint journalrule_budresstatus_fk foreign key
    (taxeosjournalruleheaderid, companyid, fyearid)
    references glg_journalruleheader(journalruleheaderid, companyid, fyearid);
alter table plg_budgetresstatuslog
  add constraint fin_eventtyype_budresstatus_fk foreign key
    (taxeosfineventtypeid, companyid, fyearid, taxeosfinmoduleid)
    references fin_eventtype(fineventtypeid, companyid, fyearid, moduleid);