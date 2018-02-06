create table sys_coords(
  page varchar2(100) not null,
  username varchar2(20) not null,
  width number(38) not null,
  height number(38) not null);
alter table sys_coords add constraint sys_coords_pk primary key(page, username);