alter table inv_item add (isdailydose varchar2(1));
update inv_item set isdailydose = '0';
commit;
alter table inv_item modify isdailydose not null;
