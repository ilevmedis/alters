ALTER TABLE PBL_REQDETAIL ADD CONSTRAINT
  PTA_VISIT_REQDETAIL_FK FOREIGN KEY (VISITID, COMPANYID, VISITFYEARID)
  REFERENCES PTA_VISIT(VISITID, COMPANYID, FYEARID);

-- CHECK WHETHER INDEX ALREADY EXISTS
CREATE INDEX PTA_VISIT_REQDETAIL_FK ON PBL_REQDETAIL (VISITID, COMPANYID, VISITFYEARID);

ALTER TABLE PBL_REQDETAIL ADD CONSTRAINT
  FIN_TRANSHD_REQDETAIL_FK FOREIGN KEY (REQFINTRANSHEADERID, COMPANYID, REQFINTRANSHEADERFYEARID)
  REFERENCES FIN_TRANSHEADER(FINTRANSHEADERID, COMPANYID, FYEARID);

CREATE INDEX FIN_TRANSHD_REQDETAIL_FK ON PBL_REQDETAIL (REQFINTRANSHEADERID, COMPANYID, REQFINTRANSHEADERFYEARID);  
