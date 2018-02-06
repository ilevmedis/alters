alter table pta_visit add (WAITILISTID number(38));
alter table pta_visit add (WAITILISTFYEARID number(38));

alter table PTA_VISIT
  add constraint WAITLIST_VISIT_FK foreign key (waitilistid,companyid,waitilistfyearid)
  references pta_visit (visitid,companyid,fyearid);
