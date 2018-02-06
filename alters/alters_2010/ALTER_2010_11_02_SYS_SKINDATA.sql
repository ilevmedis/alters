create table sys_skin(
  skinname varchar2(200),
  key varchar2(200),
  value varchar2(4000)
);

alter table sys_skin add constraint sys_skin_pk
  primary key(skinname, key);
