alter table inv_picklistformat add isdisplayingtranspartycode varchar2(1);
update inv_picklistformat set isdisplayingtranspartycode = '0';
commit;
alter table inv_picklistformat modify isdisplayingtranspartycode varchar2(1) not null; 