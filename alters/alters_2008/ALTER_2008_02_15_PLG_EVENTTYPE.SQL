ALTERS IN TABLE PLG_EVENTTYPE (by ilev 15-feb-2008) 
--------------------------------------------------------
ALTER TABLE PLG_EVENTTYPE ADD BUDGETORGID NUMBER(38);
alter table PLG_EVENTTYPE
  add constraint FK_PLG_BUDGETORG_PLG_EVENTTYPE foreign key (BUDGETORGID,FYEARID,COMPANYID)
  references plg_budgetorg (budgetorgid,fyearid,companyid);