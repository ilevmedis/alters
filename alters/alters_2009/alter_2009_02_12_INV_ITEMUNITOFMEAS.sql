alter table INV_ITEMUNITOFMEASURE add FINTRANSPARTYID number(38);

alter table INV_ITEMUNITOFMEASURE
  add constraint TRANSPARTY_ITEMUNITOFMEAS_FK foreign key (fintranspartyid,companyid,fyearid)
  references fin_transparty (fintranspartyid,companyid,fyearid);

alter table INV_ITEMUNITOFMEASURE add INVITEMUNITOFMEASUREID number(38);

create sequence ITEMUNITOFMEASURE_ID
minvalue 1
start with 1
increment by 1;

UPDATE INV_ITEMUNITOFMEASURE
  SET INVITEMUNITOFMEASUREID = ITEMUNITOFMEASURE_ID.NEXTVAL;
COMMIT;

alter table INV_ITEMUNITOFMEASURE
  drop constraint PK_INV_ITEMUNITOFMEASURE cascade;

alter table INV_ITEMUNITOFMEASURE
  add constraint PK_INV_ITEMUNITOFMEASURE primary key (invitemunitofmeasureid,companyid,fyearid);

alter table INV_ITEMUNITOFMEASURE MODIFY INVITEMUNITOFMEASUREID NOT NULL;

create index ITEM_UNIT_USETYPE_INDX on INV_ITEMUNITOFMEASURE 
(invitemid,unitofmeasureid,usetypeindicator,companyid,fyearid);

INSERT INTO SYS_SEQUENCE (COUNTER, COMPANYID, FYEARID, OBJECTID, OBJECTDESCRIPTION) 
  SELECT MAX(INVITEMUNITOFMEASUREID)+1 , 1, 0, 'INV_ITEMUNITOFMEASURE', 'INV_ITEM UNITS OF MEASURE'
  FROM INV_ITEMUNITOFMEASURE;
commit;
