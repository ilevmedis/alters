alter table pta_patientfileeventtype add iscopyinglasttrans varchar2(1);
update pta_patientfileeventtype set iscopyinglasttrans='0';
commit;
alter table pta_patientfileeventtype modify iscopyinglasttrans not null;