alter table fin_eventtype modify mnemonic varchar2(20);
alter table fin_bankaccount modify mnemonic varchar2(20);
create table fin_banknotestatus (banknotestatusid number(38) not null, companyid number(38) not null, 
  fyearid number(38) not null, mnemonic varchar2(20), descr varchar2(50), isactive varchar2(1) not null, isdefault varchar2(1));
alter table fin_banknotestatus add constraint fin_banknotestatus_pk primary key (banknotestatusid, companyid, fyearid);
insert into fin_banknotestatus values (1, 1, 2008, 'ΧΑΡΤΟΦΥΛΑΚΙΟ', 'ΧΑΡΤΟΦΥΛΑΚΙΟ', '1', '0');
insert into fin_banknotestatus values (2, 1, 2008, 'ΣΕ ΤΡΙΤΟΥΣ', 'ΣΕ ΤΡΙΤΟΥΣ', '1', '0');


alter table fin_eventtype add (banknotestatusid number(38), ispayablebanknotevalid varchar2(1), 
  isreceivablebanknotevalid varchar2(1), validbankaccounttypesdebit varchar2(20), validbankaccounttypescredit varchar2(20));
alter table fin_eventtype add constraint fin_banknotestat_eventtype_fk foreign key (banknotestatusid, companyid, fyearid)
  references fin_banknotestatus (banknotestatusid, companyid, fyearid);
update fin_eventtype set ispayablebanknotevalid='0', isreceivablebanknotevalid='0';
commit;
alter table fin_eventtype modify (ispayablebanknotevalid not null, isreceivablebanknotevalid not null);
alter table fin_eventtype modify (ispayablebanknotevalid default '0', isreceivablebanknotevalid default '0');

--ebd
ALTER TABLE fin_eventtype ALTER COLUMN ispayablebanknotevalid SET NOT NULL;
ALTER TABLE fin_eventtype ALTER COLUMN isreceivablebanknotevalid SET NOT NULL;
--end of edb
  
create table fin_validbanknotestatus(validbanknotestatusid number(38) not null, companyid number(38) not null, 
  fyearid number(38) not null, fineventtypeid number(38) not null, moduleid varchar2(10) not null, banknotestatusid number(38) not null);
alter table fin_validbanknotestatus add constraint fin_validbanknotestatus_pk primary key (validbanknotestatusid, companyid, fyearid);
alter table fin_validbanknotestatus add constraint fin_eventtype_valbnknotest_fk 
  foreign key (fineventtypeid, fyearid, companyid, moduleid)
  references fin_eventtype (fineventtypeid, fyearid, companyid, moduleid) on delete cascade;
create index fin_eventtype_valbnknotest_i on fin_validbanknotestatus (fineventtypeid, fyearid, companyid, moduleid);
alter table fin_validbanknotestatus add constraint fin_banknotest_valbnknotest_fk 
  foreign key (banknotestatusid, companyid, fyearid)
  references fin_banknotestatus (banknotestatusid, companyid, fyearid);
create index fin_banknotest_valbnknotest_i on fin_validbanknotestatus (banknotestatusid, companyid, fyearid);

alter table fin_banknote add (banknotekind number(38), banknoteissuedate date, banknoteissueplace varchar2(50),
  bankbranch varchar2(50), bankaccountno varchar2(30), issuerfintranspartyid number(38), issuername varchar2(50),
  issueraddress varchar2(100), issuertaxregistrationno varchar2(10), guarantorname varchar2(50), 
  banknotestatusid number(38));
update fin_banknote set banknoteissuedate = banknotedate;
update fin_banknote set banknotestatusid = 2 where banknoteorigin = 1;
update fin_banknote set banknotestatusid = 1 where banknoteorigin = 2;
alter table fin_banknote drop column banknotestatus;
alter table fin_banknote drop column banknotedate;
alter table fin_banknote add constraint fin_banknotestatus_banknote_fk 
  foreign key (banknotestatusid, companyid, fyearid)
  references fin_banknotestatus (banknotestatusid, companyid, fyearid);


alter table fin_transdetail add (iscreatingbanknote varchar2(1) default '0', prevbanknotestatusid number(38),
    newbanknotestatusid number(38));

update fin_transdetail set iscreatingbanknote='0' where banknoteid is null;
update fin_transdetail set iscreatingbanknote='1' where banknoteid is not null;

alter table fin_transdetail modify iscreatingbanknote not null;

--edb
ALTER TABLE fin_transdetail ALTER COLUMN iscreatingbanknote  SET NOT NULL;
--end of edb

alter table fin_transdetail add constraint prevbanknotest_transdetail_fk 
  foreign key (prevbanknotestatusid, companyid, fyearid)
  references fin_banknotestatus (banknotestatusid, companyid, fyearid);
alter table fin_transdetail add constraint newbanknotest_transdetail_fk 
  foreign key (newbanknotestatusid, companyid, fyearid)
  references fin_banknotestatus (banknotestatusid, companyid, fyearid);


alter table fin_bankaccount add seqid number(38);
alter table fin_bankaccount add constraint erp_seq_fin_bankaccount
  foreign key (seqid, companyid, fyearid) references erp_seq (seqid, companyid, fyearid);


alter table fin_parameters add applybanknoterestrictions varchar2(1);
update fin_parameters set applybanknoterestrictions='1';
commit;
alter table fin_parameters modify applybanknoterestrictions not null;

--edb
ALTER TABLE fin_parameters ALTER COLUMN applybanknoterestrictions SET NOT NULL;
--end of edb

INSERT INTO SYS_SEQUENCE (COMPANYID,FYEARID,OBJECTID,COUNTER,OBJECTDESCRIPTION) VALUES (1,0,'FIN_BANKNOTESTATUS',3,'BANKNOTE STATUS')