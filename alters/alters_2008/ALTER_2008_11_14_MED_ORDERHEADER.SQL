alter table med_orderheader add (rsceventtypeid number(38),rscmoduleid varchar2(10));
alter table MED_ORDERHEADER
  add constraint RSC_EVENTTYPE_MEDORDERHEADER foreign key (RSCEVENTTYPEID,COMPANYID,FYEARID,RSCMODULEID)
  references RSC_EVENTTYPE (RSCEVENTTYPEID,COMPANYID,FYEARID,MODULEID);

--Edb statement
alter table med_orderheader add rsceventtypeid number(38);
alter table med_orderheader add rscmoduleid varchar2(10);
alter table MED_ORDERHEADER
  add constraint RSC_EVENTTYPE_MEDORDERHEADER foreign key (RSCEVENTTYPEID,COMPANYID,FYEARID,RSCMODULEID)
  references RSC_EVENTTYPE (RSCEVENTTYPEID,COMPANYID,FYEARID,MODULEID) on delete restrict;
--End edb