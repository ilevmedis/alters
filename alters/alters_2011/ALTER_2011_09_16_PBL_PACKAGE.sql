alter table pbl_package modify descr varchar2(250);
alter table pbl_package add averagelengthofstay number(38);
alter table pbl_package add isken varchar2(1);
update pbl_package set isken = '0';
commit;
alter table pbl_package modify isken not null;
alter table pbl_chargepackage add (averagelengthofstay number(38), isken varchar2(1));
update pbl_chargepackage set isken='0';
commit;
alter table pbl_chargepackage modify isken not null;
create table pbl_chargepackageadditional(chargepackageadditionalid number(38) not null, companyid number(38) not null,
  fyearid number(38) not null, chargepackageid number(38) not null, packageid number(38) not null, averagelengthofstay number(38), isken varchar2(1) not null);
alter table pbl_chargepackageadditional add constraint pbl_chargepackageaddtional_pk
  primary key (chargepackageadditionalid, companyid, fyearid);
alter table pbl_chargepackageadditional add constraint pbl_chargepackage_addition_fk
  foreign key (chargepackageid, companyid, fyearid)
  references pbl_chargepackage(chargepackageid, companyid, fyearid)
  on delete cascade;
alter table pbl_chargepackageadditional add constraint pbl_package_additional_fk
  foreign key (packageid, companyid, fyearid)
  references pbl_package(packageid, companyid, fyearid);