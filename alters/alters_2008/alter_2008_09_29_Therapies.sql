alter table RSC_SERVICERESOURCECONSUMPTION add LINENUM number(38) not null;
alter table RSC_SERVICERESOURCECONSUMPTION add ISINDEPENDENTLYSCHEDULED varchar2(1) not null;

--Edb Statement
ALTER TABLE RSC_SERVICERESOURCECONSUMPTION ALTER COLUMN LINENUM SET NOT NULL;
ALTER TABLE RSC_SERVICERESOURCECONSUMPTION ALTER COLUMN ISINDEPENDENTLYSCHEDULED SET NOT NULL;
--End edb Statement

alter table RSC_SERVICERESOURCECONSUMPTION add QUADENOMINATOR number(38);
UPDATE RSC_SERVICERESOURCECONSUMPTION
  SET QUADENOMINATOR = 1;
COMMIT;
alter table RSC_SERVICERESOURCECONSUMPTION modify QUADENOMINATOR not null;

--Edb Statement
ALTER TABLE RSC_SERVICERESOURCECONSUMPTION ALTER COLUMN QUADENOMINATOR SET NOT NULL;
--End Edb

alter table RSC_RESOURCEALLOCATION add ORDERHEADERID number(38);
alter table RSC_RESOURCEALLOCATION add ORDERDETAILID number(38);
alter table RSC_RESOURCEALLOCATION add QUADENOMINATOR number(38);
alter table RSC_RESOURCEALLOCATION add QUANUMERATOR number(38);
alter table RSC_RESOURCEALLOCATION add SERVICEID number(38);
alter table RSC_RESOURCEALLOCATION add QUAALLOCATED FLOAT(126);

--Edb Statement
alter table RSC_RESOURCEALLOCATION add QUAALLOCATED number(38,10);
--End Edb Statement

alter table RSC_RESOURCEALLOCATION add COMMENTS varchar2(50);
UPDATE RSC_RESOURCEALLOCATION
  SET QUANUMERATOR = 1, QUADENOMINATOR = 1, QUAALLOCATED = 1;
COMMIT;

alter table RSC_RESOURCEALLOCATION modify QUADENOMINATOR not null;
alter table RSC_RESOURCEALLOCATION modify QUANUMERATOR not null;
alter table RSC_RESOURCEALLOCATION modify QUAALLOCATED not null;

--Edb Statement
ALTER TABLE RSC_RESOURCEALLOCATION ALTER COLUMN QUADENOMINATOR  SET NOT NULL;
ALTER TABLE RSC_RESOURCEALLOCATION ALTER COLUMN SET QUANUMERATOR NOT NULL;
ALTER TABLE RSC_RESOURCEALLOCATION ALTER COLUMN SET QUAALLOCATED NOT NULL;
--End edb Statement

alter table RSC_RESOURCEALLOCATION
  add constraint MED_ORDERHD_ALLOCATE foreign key (orderheaderid,companyid,fyearid)
  references med_orderheader (orderheaderid,companyid,fyearid);
alter table RSC_RESOURCEALLOCATION
  add constraint MED_SERVICE_ALLOCATE foreign key (serviceid,companyid)
  references med_service (serviceid,companyid);

--Edb Statement
alter table RSC_RESOURCEALLOCATION
  add constraint MED_ORDERHD_ALLOCATE foreign key (orderheaderid,companyid,fyearid)
  references med_orderheader (orderheaderid,companyid,fyearid) on delete restrict;

alter table RSC_RESOURCEALLOCATION
  add constraint MED_SERVICE_ALLOCATE foreign key (serviceid,companyid)
  references med_service (serviceid,companyid) on delete restrict;
--End Edb Statement

alter table RSC_RESOURCEALLOCATION
  add constraint MED_ORDERDT_ALLOCATE foreign key (orderdetailid,companyid,fyearid)
  references med_orderdetail (orderdetailid,companyid,fyearid) on delete cascade;
