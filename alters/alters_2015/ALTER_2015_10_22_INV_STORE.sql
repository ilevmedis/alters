alter table INV_STORE add ISUSEDFORBALANCE2 VARCHAR2(1);

update inv_store
  set isusedforbalance2 = '1';
commit;

alter table INV_STORE modify ISUSEDFORBALANCE2 not null;
alter table INV_STORE modify ISUSEDFORBALANCE2 default 1;
