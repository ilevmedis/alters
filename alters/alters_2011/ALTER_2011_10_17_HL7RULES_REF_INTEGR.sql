-- Create/Recreate primary, unique and foreign key constraints 
alter table ERP_EVENTTYPEMATRIX
  add constraint HL7RULEHD_EVENTTYPEMATRIX_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table MED_ORDERHEADER
  add constraint HL7RULEHD_MEDORDERHD_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table MED_ORDERCANCELHEADER
  add constraint HL7RULEHD_MEDORDERCANCELHD_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_TRANSFER
  add constraint HL7RULEHD_TRANSFER_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_VISITADMISSION
  add constraint HL7RULEHD_ADMISSION_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_VISITADMISSIONCANCEL
  add constraint HL7RULEHD_ADMISSIONCANCEL_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_VISITDISCHARGE
  add constraint HL7RULEHD_DISCHARGE_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_VISITDISCHARGECANCEL
  add constraint HL7RULEHD_DISCHARGECANCEL_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PBL_CHARGEHEADER
  add constraint HL7RULEHD_CHARGEHD_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);
