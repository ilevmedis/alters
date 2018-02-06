create table glg_batchinput(batchinputid number(38), companyid number(38),
  fyearid number(38), inputdate date not null, 
  descr varchar2(50) not null, filename varchar2(200) not null, 
  filecontents blob);
alter table glg_batchinput add constraint glg_batchinput_pk 
  primary key(batchinputid, companyid, fyearid);
alter table glg_journal add batchinputid number(38);
alter table glg_journal add constraint
  glg_batchinput_journal_fk foreign key (batchinputid, companyid, fyearid)
  references glg_batchinput(batchinputid, companyid, fyearid);