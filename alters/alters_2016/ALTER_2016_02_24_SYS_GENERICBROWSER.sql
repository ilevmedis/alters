create table sys_customform(
  customformid number(38) not null,
  companyid number(38) not null,
  isactive varchar2(1) not null,
  descr varchar2(100) not null,
  title varchar2(50) not null,
  titlelocalekey varchar2(100) not null,
  classname varchar2(200),
  modelcustomizationid number(38),
  comments varchar2(200)
);
alter table sys_customform
  add constraint sys_customform_pk
  primary key(customformid, companyid);

/*alter table sys_browsercustomization add customformid number(38);
alter table sys_browsercustomization
  add constraint sys_customform_customiz_fk
     foreign key(customformid, companyid)
     references sys_genericbrowser(customformid, companyid);
create index sys_customform_customiz_fk
 on sys_browsercustomization(customformid, companyid);

 */