alter table PTA_PARAMETERS add CHKCLIENTPENDINGISSUES varchar2(1);
UPDATE PTA_PARAMETERS SET CHKCLIENTPENDINGISSUES='0';
COMMIT;
alter table PTA_PARAMETERS modify CHKCLIENTPENDINGISSUES not null;

alter table PTA_OUPPARAMETERS add CHKCLIENTPENDINGISSUES varchar2(1);
UPDATE PTA_OUPPARAMETERS SET CHKCLIENTPENDINGISSUES='0';
COMMIT;
alter table PTA_OUPPARAMETERS modify CHKCLIENTPENDINGISSUES not null;
