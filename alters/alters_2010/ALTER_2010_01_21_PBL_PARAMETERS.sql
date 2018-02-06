alter table pbl_parameters add ispricelistinmemory varchar2(1);
update pbl_parameters set ispricelistinmemory = '1';
commit;
alter table pbl_parameters modify ispricelistinmemory not null;

