alter table PTA_VISIT add outvisitid number(38);
alter table PTA_VISIT add outfyearid number(38);
-- Create/Recreate primary, unique and foreign key constraints 
alter table PTA_VISIT
  add constraint FK_PTA_VISIT_OUTVISIT foreign key (OUTVISITID, COMPANYID, OUTFYEARID)
  references pta_visit (VISITID, COMPANYID, FYEARID);
-- Create/Recreate indexes 
create index FK_PTA_VISIT_OUTVISIT on PTA_VISIT (OUTVISITID, COMPANYID, OUTFYEARID);
