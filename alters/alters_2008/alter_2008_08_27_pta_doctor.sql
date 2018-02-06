alter table pta_doctor add speciality varchar2(50);

create table pta_doctorexcludedrole(doctorexcludedroleid number(38) not null, companyid number(38) not null, 
  fyearid number(38) not null, doctorid number(38) not null, doctorroleid number(38) not null);
alter table pta_doctorexcludedrole add constraint pta_doctorexcludedrole_pk primary key 
  (doctorexcludedroleid, companyid, fyearid);
alter table pta_doctorexcludedrole add constraint pta_doctor_doctorexcludedrole 
  foreign key(doctorid, companyid, fyearid) references pta_doctor(doctorid, companyid, fyearid) on delete cascade;
alter table pta_doctorexcludedrole add constraint pbl_doctorrole_excludedrole 
  foreign key(doctorroleid, companyid, fyearid) references pbl_doctorrole(doctorroleid, companyid, fyearid);
 
