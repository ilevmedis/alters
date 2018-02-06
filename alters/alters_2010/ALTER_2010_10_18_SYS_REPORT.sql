alter table SYS_REPORT add AUTOPRINTKIND number(38);
alter table SYS_REPORT add FILENAME varchar2(255);
alter table SYS_REPORT add PRINTERSPOOLID number(38);

alter table SYS_REPORT add ISDELIMITED varchar2(1);
update SYS_REPORT set ISDELIMITED = '0';
commit;
alter table SYS_REPORT modify ISDELIMITED not null;
alter table SYS_REPORT add DELIMITEDCHAR varchar2(10);