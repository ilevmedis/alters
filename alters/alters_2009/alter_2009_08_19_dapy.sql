alter table pbl_visitcoverdetail add (isjobdisease varchar2(1), isjobaccident varchar2(1), ismultiplesurgeries varchar2(1), deathindicator number(38),
  dapyvisittypeindicator number(38), orderdoctorsurname varchar2(40), orderdoctorfirstname varchar2(20), orderdoctorcode varchar2(15),
  orderorganisationcode varchar2(10)
);
update pbl_visitcoverdetail set isjobdisease='0', isjobaccident='0', ismultiplesurgeries = '0';
commit;
alter table pbl_visitcoverdetail modify (isjobdisease not null, isjobaccident not null, ismultiplesurgeries not null);
alter table pbl_level add ikacode varchar2(10);
alter table pta_facility add ikacode varchar2(10);
