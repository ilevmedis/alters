alter table prs_personel add (username varchar2(20));
alter table prs_personel 
  add constraint sys_user_personel 
  foreign key (username, companyid) references sys_user (username, companyid);

