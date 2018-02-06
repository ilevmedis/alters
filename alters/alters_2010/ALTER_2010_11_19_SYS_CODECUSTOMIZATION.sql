create table sys_codecustomization(
  codecustomizationid number(38) not null,
  page varchar2(100) not null,
  event varchar2(50) not null,
  descr varchar2(100) not null,
  comments varchar2(200),
  developer varchar2(50) not null,
  isactive varchar2(1) not null,
  sourcecode clob);

alter table sys_codecustomization add constraint
  sys_codecustomization_pk primary key (codecustomizationid);
create index sys_codecustom_page_idx on sys_codecustomization(page);