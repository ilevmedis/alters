alter table med_orderheader add (patientid number(38), ptaeventtypeid number(38), ptamoduleid varchar2(10));
alter table med_orderheader add constraint pta_patient_med_order_fk
  foreign key (patientid, companyid) references pta_patient(patientid, companyid);
alter table med_orderheader add constraint pta_eventtype_med_order_fk
  foreign key (ptaeventtypeid, ptamoduleid, fyearid, companyid) references pta_eventtype(ptaeventtypeid, moduleid, fyearid, companyid);
alter table med_orderdetail modify visitid null;
alter table rsc_resourceallocation modify visitid null;
