alter table pbl_packageitem add isexcludedfrompackage varchar2(1);
update pbl_packageitem set isexcludedfrompackage='0';
commit;
alter table pbl_packageitem modify isexcludedfrompackage not null;
