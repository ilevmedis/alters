create table sys_browsercustomization 
  (browsercustomizationid number(38) not null, companyid number(38) not null, 
   page varchar2(100) not null, username varchar2(20), criteriatablecolumnsno number(38),
   neworderby varchar2(100), criteriadefinition clob, columndefinition clob);
alter table sys_browsercustomization add constraint sys_browsercustomization_pk primary key (browsercustomizationid, companyid);

alter table sys_browsercustomization add constraint user_browsercustomization_fk 
  foreign key (username, companyid) references sys_user (username, companyid) 
  on delete cascade;

create index browsercustomization_page_i on sys_browsercustomization (page, companyid);
create index browsercustomization_user_i on sys_browsercustomization (page, username, companyid);

  