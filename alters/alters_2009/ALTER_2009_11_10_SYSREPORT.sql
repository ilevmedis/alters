alter table sys_report add updatesqlstmt clob;
alter table sys_report add isautoprintdisabled varchar2(1);
update sys_report set isautoprintdisabled = '0';
commit;
alter table sys_report modify isautoprintdisabled not null;
alter table sys_report add isclosingwinafterconfirmation varchar2(1);
update sys_report set isclosingwinafterconfirmation = '0';
commit;
alter table sys_report modify isclosingwinafterconfirmation not null;
alter table sys_report add extendeddescr varchar2(100);