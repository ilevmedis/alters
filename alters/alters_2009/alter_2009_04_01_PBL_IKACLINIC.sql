create table pbl_ikaclinic(ikaclinicid number(38) not null, 
  companyid number(38) not null, fyearid number(38) not null,
  mnemonic varchar2(20) not null, descr varchar2(50) not null,
  isactive varchar2(1) not null);
alter table pbl_ikaclinic add constraint pbl_ikaclinic_pk primary key (ikaclinicid, companyid, fyearid);

alter table pbl_visitbillingrule add ikaclinicid number(38);
alter table pbl_visitbillingrule add constraint 
  pbl_ikaclinic_billingrule_fk foreign key (ikaclinicid, companyid, fyearid)
  references pbl_ikaclinic(ikaclinicid, companyid, fyearid);

alter table pta_facility add ikaclinicid number(38);
alter table pta_facility add constraint 
  pbl_ikaclinic_facility_fk foreign key (ikaclinicid, companyid, fyearid)
  references pbl_ikaclinic(ikaclinicid, companyid, fyearid);

