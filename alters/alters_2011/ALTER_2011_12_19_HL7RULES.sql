alter table PBL_CHARGEHEADER
  drop constraint HL7RULEHD_CHARGEHD_FK;

alter table PTA_VISITDISCHARGE
  drop constraint HL7RULEHD_DISCHARGE_FK;

alter table PTA_VISITADMISSION
  disable constraint HL7RULEHD_ADMISSION_FK;

update pta_visitadmission a
  set a.hl7ruleheaderid = null
  where a.hl7ruleheaderid = 0;
update pta_visitdischarge a
  set a.hl7ruleheaderid = null
  where a.hl7ruleheaderid = 0;

update pbl_chargeheader a
  set a.hl7ruleheaderid = null
  where a.hl7ruleheaderid = 0;

alter table PTA_VISITADMISSION
  add constraint HL7RULEHD_ADMISSION_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PTA_VISITDISCHARGE
  add constraint HL7RULEHD_DISCHARGE_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);

alter table PBL_CHARGEHEADER
  add constraint HL7RULEHD_CHARGEHD_FK foreign key (COMPANYID, HL7RULEHEADERID)
  references sys_hl7ruleheader (COMPANYID, HL7RULEHEADERID);
