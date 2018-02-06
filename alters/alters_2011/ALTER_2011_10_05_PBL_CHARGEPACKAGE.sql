alter table pbl_chargepackageadditional add (linenum number(38) not null, isfirstpackage varchar2(1) not null);
alter table pbl_chargedetail add (chargepackageadditionalid number(38));
create index pbl_chargepckgdd_chargedt_fk on pbl_chargedetail (chargepackageadditionalid, companyid, fyearid);
alter table pbl_chargepackage add totalaveragelengthofstay number(38);

create sequence pbl_chargepackageadditiona_seq
minvalue 1
maxvalue 999999999999999999999999999
start with 1
increment by 1;

insert into pbl_chargepackageadditional(chargepackageadditionalid, companyid, fyearid, chargepackageid,
  packageid, averagelengthofstay, isken, linenum, isfirstpackage)
  select pbl_chargepackageadditiona_seq.nextval, companyid, fyearid, chargepackageid, packageid, null, '0', 1, '1'
  from pbl_chargepackage where not exists (select * from pbl_chargepackageadditional where
    pbl_chargepackageadditional.chargepackageid = pbl_chargepackage.chargepackageid and
    pbl_chargepackageadditional.companyid = pbl_chargepackage.companyid and
    pbl_chargepackageadditional.fyearid = pbl_chargepackage.fyearid);

commit;
