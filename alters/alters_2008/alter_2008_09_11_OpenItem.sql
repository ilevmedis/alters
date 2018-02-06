alter table FIN_OPENITEM
  add constraint TRANSDT_OPENITEMHD foreign key (fintransdetailid,companyid,fintransdetailfyearid)
  references fin_transdetail (fintransdetailid,companyid,fyearid) on delete cascade;

alter table FIN_OPENITEMBINDING
  drop constraint OPENITEM_OPENITEMBINDING;
alter table FIN_OPENITEMBINDING
  add constraint OPENITEM_OPENITEMBINDING foreign key (OPENITEMID,COMPANYID,FYEARID)
  references FIN_OPENITEM (OPENITEMID,COMPANYID,FYEARID);

alter table FIN_OPENITEMBINDING modify TOTALAMOUNTCREDITBINDED null;
alter table FIN_OPENITEMBINDING modify TOTALAMOUNTDEBITBINDED null;
alter table FIN_OPENITEMBINDING modify AMOUNTCREDITREST null;
alter table FIN_OPENITEMBINDING modify AMOUNTDEBITREST null;

--EDB STATEMENT
alter table FIN_OPENITEMBINDING
  add constraint OPENITEM_OPENITEMBINDING foreign key (OPENITEMID,COMPANYID,FYEARID)
  references FIN_OPENITEM (OPENITEMID,COMPANYID,FYEARID) on delete RESTRICT;

ALTER TABLE fin_openitembinding
   ALTER COLUMN totalamountcreditbinded DROP NOT NULL;
ALTER TABLE fin_openitembinding
   ALTER COLUMN totalamountdebitbinded DROP NOT NULL;
ALTER TABLE fin_openitembinding
   ALTER COLUMN amountcreditrest DROP NOT NULL;
ALTER TABLE fin_openitembinding
   ALTER COLUMN amountdebitrest DROP NOT NULL;
