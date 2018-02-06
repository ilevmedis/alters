alter table pbl_doctorrulefee add (ispricedependent varchar2(1), price float(126));
update pbl_doctorrulefee set ispricedependent = '0';
commit;
alter table pbl_doctorrulefee modify ispricedependent not null; 