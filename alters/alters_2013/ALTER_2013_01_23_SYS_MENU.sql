alter table sys_menu add lang varchar2(10);
update sys_menu set lang='el';
alter table sys_menu modify lang not null;