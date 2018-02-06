alter table pbl_insuranceschemedetail add (isinsapprnoreqforinpatient varchar2(1), isinsapprnoreqforoutpatient varchar2(1));
update pbl_insuranceschemedetail set isinsapprnoreqforinpatient = '0', isinsapprnoreqforoutpatient = '0';
commit;
alter table pbl_insuranceschemedetail modify (isinsapprnoreqforinpatient not null, isinsapprnoreqforoutpatient not null);