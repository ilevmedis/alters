alter table PLG_DIAVGIAPARAMS add ISCONNECTINGTODIAVGEIA  varchar2(1) default '1';
update PLG_DIAVGIAPARAMS set ISCONNECTINGTODIAVGEIA = '1';
commit;
alter table PLG_DIAVGIAPARAMS modify ISCONNECTINGTODIAVGEIA not null;