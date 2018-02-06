alter table SYS_REPORT add AUTOPRINTKIND number(38);
alter table SYS_REPORT add FILENAME varchar2(255);
alter table SYS_REPORT add PRINTERSPOOLID number(38);

alter table SYS_REPORT add ISDELIMITED varchar2(1);
alter table SYS_REPORT add DELIMITEDCHAR varchar2(10);