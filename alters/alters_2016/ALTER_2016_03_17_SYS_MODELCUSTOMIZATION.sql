alter table sys_modelcustomization add (
  isnewmodel varchar2(1) default '0' not null,
  descr varchar2(100),
  comments varchar2(200)
);
alter table sys_modelcustomization modify classname null;