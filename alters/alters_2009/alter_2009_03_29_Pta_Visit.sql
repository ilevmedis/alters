alter table pta_visit add emergencystatusindicator number(38);
alter table pta_oupparameters add emergencydoctorroleid number(38);
alter table pta_oupparameters add constraint pbl_doctorrole_oupparams_fk
  foreign key (emergencydoctorroleid, companyid, fyearid)
  references pbl_doctorrole (doctorroleid, companyid, fyearid);
alter table sys_report add isrollingpages varchar2(1);
update sys_report set isrollingpages = '0';
commit;
alter table sys_report modify isrollingpages not null;
alter table sys_report add autorefreshinterval number(38);