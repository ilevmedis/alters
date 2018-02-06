create table inv_barcodeparams(
  companyid number(38) not null,
  fyearid number(38) not null,
  barcodeinitstr clob,
  barcodelabelstr clob not null);
alter table inv_barcodeparams
  add constraint inv_barcodeparams_pk
  primary key (companyid, fyearid);
-- !!!!!!! USE FOLLOWING INSERT STATEMENT ONLY FOR FILO TO SUPPORT ZEBRA S4M !!!!!
insert into inv_barcodeparams(companyid, fyearid, barcodeinitstr, barcodelabelstr)
  values(1, 2009, null, 'I8,1,001'||chr(10)||chr(13)||
        'ON,D'||chr(10)||chr(13)||
        'Q175,1'||chr(10)||chr(13)||
        'q343'||chr(10)||chr(13)||
        'S4'||chr(10)||chr(13)||
        'D15'||chr(10)||chr(13)||
        'ZT'||chr(10)||chr(13)||
        'JF'||chr(10)||chr(13)||
        'N'||chr(10)||chr(13)||
        'B34,58,0,3,2,4,70,B,##COLUMN:NAME=INV_ITEM.MNEMONIC##'||chr(10)||chr(13)||
        'A29,6,0,z,1,1,N,##COLUMN:NAME=DESCR1##'||chr(10)||chr(13)||
        'A29,32,0,z,1,1,N,##COLUMN:NAME=DESCR2##'||chr(10)||chr(13)||
        'P1'||chr(10)||chr(13));
