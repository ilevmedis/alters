create table inv_picklistformat(picklistformatid number(38) not null, companyid number(38) not null, 
  mnemonic varchar2(20) not null, descr varchar2(50) not null, isactive varchar2(1) not null,
  picklistformat clob not null, comments varchar2(100));
alter table inv_picklistformat add constraint inv_picklistformat_pk primary key (picklistformatid, companyid);


