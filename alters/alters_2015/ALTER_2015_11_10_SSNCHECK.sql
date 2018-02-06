alter table PTA_PARAMETERS add SSNCHECK number(38);

update PTA_PARAMETERS
  set SSNCHECK = 1;
commit;

alter table PTA_PARAMETERS  modify SSNCHECK not null;
alter table PTA_PARAMETERS  modify SSNCHECK default 1;
