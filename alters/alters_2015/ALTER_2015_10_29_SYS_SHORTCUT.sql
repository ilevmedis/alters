alter table SYS_SHORTCUT modify TITLE VARCHAR2(30);
alter table SYS_SHORTCUT modify DESCR VARCHAR2(50);
update SYS_SHORTCUT set TITLE = DESCR where title = substr(descr, 1, 20);
commit;
