alter table pbl_parameters add allowchargesafterdischarge varchar2(1);
update pbl_parameters set allowchargesafterdischarge='0';
commit;
alter table pbl_parameters modify allowchargesafterdischarge not null;