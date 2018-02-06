alter table sys_report add (isfixedrowsperpage varchar2(1));
update sys_report set isfixedrowsperpage = '0';
commit;
alter table sys_report modify isfixedrowsperpage not null;
