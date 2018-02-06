alter table inv_eventtype add isinvitemchoicechangingline varchar2(1);
update inv_eventtype set isinvitemchoicechangingline = '0';
commit;
alter table inv_eventtype modify isinvitemchoicechangingline not null;

