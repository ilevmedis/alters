create table sys_cssfile(
  cssfilename varchar2(50) not null,
  descr varchar2(50) not null,
  comments varchar2(200)
);
alter table sys_cssfile add constraint sys_cssfile_pk primary key (cssfilename);
