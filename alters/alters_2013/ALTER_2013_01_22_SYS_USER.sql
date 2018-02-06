alter table sys_user add(lang varchar2(10), cssfilename varchar2(50));
alter table sys_user add constraint sys_cssfile_sys_user_fk
  foreign key(cssfilename)
  references sys_cssfile(cssfilename);
