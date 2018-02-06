alter table INV_ITEM add ISPUBLICTOALLEVENTTYPES varchar2(1);
update inv_item set ispublictoalleventtypes = '1';
commit;

alter table INV_ITEM modify ISPUBLICTOALLEVENTTYPES not null;
