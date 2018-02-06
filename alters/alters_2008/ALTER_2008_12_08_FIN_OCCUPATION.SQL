create table FIN_OCCUPATION
(
  OCCUPATIONID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null,
  ISACTIVE varchar2(1) not null,
  MNEMONIC varchar2(20),
  DESCR varchar2(100),
  KEPYOID varchar2(20)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table FIN_OCCUPATION
  add constraint FIN_OCCUPATION_PK primary key (occupationid,companyid,fyearid);

create table FIN_TRANSPARTYOCCUPATION
(
  TRANSPARTYOCCUPATIONID number(38) not null,
  OCCUPATIONID number(38) not null,
  FINTRANSPARTYID number(38) not null,
  COMPANYID number(38) not null,
  FYEARID number(38) not null
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table FIN_TRANSPARTYOCCUPATION
  add constraint FIN_TRANSPARTYOCCUP_PK primary key (transpartyoccupationid,companyid,fyearid);
alter table FIN_TRANSPARTYOCCUPATION
  add constraint TRANSPARTY_TRANSPARTOCCUP_FK foreign key (fintranspartyid,companyid,fyearid)
  references fin_transparty (fintranspartyid,companyid,fyearid) on delete cascade;
alter table FIN_TRANSPARTYOCCUPATION
  add constraint OCCUP_TRANSPARTOCCUP_FK foreign key (occupationid,companyid,fyearid)
  references fin_occupation (occupationid,companyid,fyearid);

--EDB STATEMENT
alter table FIN_TRANSPARTYOCCUPATION
  add constraint OCCUP_TRANSPARTOCCUP_FK foreign key (occupationid,companyid,fyearid)
  references fin_occupation (occupationid,companyid,fyearid) on delete restrict;
