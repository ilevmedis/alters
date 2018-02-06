alter table pta_entrancebook add comments varchar2(20);
alter table sys_printerheadstatus add ischangingbook varchar2(1);
update sys_printerheadstatus set ischangingbook='1';
commit;
alter table sys_printerheadstatus modify ischangingbook not null;