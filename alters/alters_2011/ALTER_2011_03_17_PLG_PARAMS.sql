alter table PLG_PARAMETERS add ISUSINGBUDGETRES varchar2(1);

update PLG_PARAMETERS set ISUSINGBUDGETRES='0';
commit;

alter table PLG_PARAMETERS modify ISUSINGBUDGETRES not null;
