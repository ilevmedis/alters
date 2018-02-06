(Atza 10-dec-2007) Alter table Pta_Visit 4 Change FYEAR 
--------------------------------------------------------
alter table PTA_VISIT add PREVFYEARID number(38);
alter table PTA_VISIT add PREVVISITID number(38);
alter table PTA_VISIT add ISTRANSFERREDTONEXTFYEAR varchar2(1);
alter table PTA_VISIT add ISTRANSFERREDFROMPREVFYEAR varchar2(1);

UPDATE PTA_VISIT
  SET ISTRANSFERREDTONEXTFYEAR='0',
  ISTRANSFERREDFROMPREVFYEAR = '0';
COMMIT;

alter table PTA_VISIT modify ISTRANSFERREDTONEXTFYEAR not null;
alter table PTA_VISIT modify ISTRANSFERREDFROMPREVFYEAR not null;
