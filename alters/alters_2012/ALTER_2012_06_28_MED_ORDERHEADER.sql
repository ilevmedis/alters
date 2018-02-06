alter table med_orderheader add (invmoduleid varchar2(10), inveventtypeid number(38));
alter table med_orderheader add constraint inv_eventtype_med_orderhd_fk foreign key(invmoduleid, inveventtypeid, companyid, fyearid)
   references inv_eventtype(moduleid, inveventtypeid, companyid, fyearid);
alter table med_parameters add prescriptioninvstoreid number(38);
alter table med_parameters add constraint inv_store_med_params_fk foreign key (prescriptioninvstoreid, companyid, fyearid)
   references inv_store(invstoreid, companyid, fyearid);
alter table med_orderdetail add (diagnosisgroupingid number(38), diagnosiscodeid varchar2(40));
alter table med_orderdetail add constraint pta_diagnosiscd_med_orderdt_fk foreign key(diagnosisgroupingid, diagnosiscodeid, companyid)
   references pta_diagnosiscode(diagnosisgroupingid, diagnosiscodeid, companyid);
create index pta_diagnosiscd_med_orderdt_fk on med_orderdetail(diagnosisgroupingid, diagnosiscodeid, companyid);