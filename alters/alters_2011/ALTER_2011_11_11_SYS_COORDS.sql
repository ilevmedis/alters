alter table sys_coords add isminimized varchar2(1);
update sys_coords set isminimized = '0';
commit;
alter table sys_coords modify isminimized default '0';
alter table sys_coords modify isminimized not null;