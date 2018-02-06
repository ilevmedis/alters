create table pbl_reqinsurance(reqheaderid number(38) not null, companyid number(38) not null, 
  fyearid number(38) not null, fintranspartyid number(38) not null);
alter table pbl_reqinsurance add constraint pbl_reqinsurance_pk primary key (reqheaderid, companyid, fintranspartyid);

alter table pbl_reqinsurance add constraint pbl_reqheader_reqinsurance_fk 
  foreign key (reqheaderid, companyid) references pbl_reqheader (reqheaderid, companyid)
  on delete cascade;

alter table pbl_reqinsurance add constraint fin_transparty_reqinsurance_fk 
  foreign key (fintranspartyid, companyid, fyearid) references fin_transparty (fintranspartyid, companyid, fyearid);
