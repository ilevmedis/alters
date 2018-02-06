create table sys_attachment(
  attachmentid number(38) not null,
  companyid number(38) not null,
  objectid varchar2(100) not null,
  objectpk varchar2(200) not null,
  attachmentdate date not null,
  attachmenttype varchar2(50) not null,
  fileName varchar2(200),
  descr varchar2(50),
  contents blob
);
alter table sys_attachment
  add constraint sys_attachment_pk
  primary key(attachmentid, companyid);
create index sys_attachment_object on sys_attachment(objectid, objectpk);