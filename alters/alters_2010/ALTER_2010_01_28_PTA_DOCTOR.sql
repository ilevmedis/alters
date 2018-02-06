alter table pta_doctor add (doctorrankindicator number(38), isincludedinmerid varchar2(1));
update pta_doctor set isincludedinmerid = '1';
commit;
alter table pta_doctor modify isincludedinmerid not null;
