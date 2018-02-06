create table sys_modelcustomization(
  modelcustomizationid number(38) not null,
  classname varchar2(200) not null,
  isactive varchar2(1) not null,
  additionalcolumns clob,
  additionalaliases clob,
  additionaljoins clob);
alter table sys_modelcustomization add constraint
  sys_modelcustomization_pk primary key (modelcustomizationid);
create index sys_modelcustom_class_idx on sys_modelcustomization (classname);