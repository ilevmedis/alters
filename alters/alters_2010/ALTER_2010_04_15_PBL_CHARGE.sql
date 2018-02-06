ALTER TABLE PBL_CHARGEHEADER ADD (INOUTPATIENT NUMBER(38));
ALTER TABLE PBL_CHARGEDETAIL ADD (INOUTPATIENT NUMBER(38));
UPDATE PBL_CHARGEHEADER SET INOUTPATIENT =
  (SELECT INOUTPATIENT FROM PTA_VISIT WHERE
    PTA_VISIT.VISITID = PBL_CHARGEHEADER.VISITID AND
    PTA_VISIT.COMPANYID = PBL_CHARGEHEADER.COMPANYID AND
    PTA_VISIT.FYEARID = PBL_CHARGEHEADER.FYEARID);
UPDATE PBL_CHARGEDETAIL SET INOUTPATIENT =
  (SELECT INOUTPATIENT FROM PTA_VISIT WHERE
    PTA_VISIT.VISITID = PBL_CHARGEDETAIL.VISITID AND
    PTA_VISIT.COMPANYID = PBL_CHARGEDETAIL.COMPANYID AND
    PTA_VISIT.FYEARID = PBL_CHARGEDETAIL.FYEARID);
COMMIT;
  