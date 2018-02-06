create table sys_logmessage(
  messageid number(38) not null,
  messagetypeindicator number(38) not null,
  logdate date not null,
  username varchar(20),
  companyid number(38),
  remoteaddress varchar2(20),
  message clob,
  messageinfo varchar2(20),
  pagename varchar2(100),
  sessionid number(38),
  executiontime number(38)  
);
alter table sys_logmessage add constraint sys_logmessage_pk
  primary key(messageid);
alter table sys_logmessage add constraint sys_user_logmessage_fk
  foreign key(username, companyid)
  references sys_user(username, companyid);

create index sys_user_logmessage_fk on sys_logmessage(username, companyid);
create index sys_logmessage_pagename on sys_logmessage(pagename);
create index sys_logmessage_logdate on sys_logmessage(logdate);
