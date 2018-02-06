CREATE TABLE PTA_EOPYYHL7ERROR (
  ERRORID NUMBER(38) NOT NULL,
  SEGMENT VARCHAR2(3) NOT NULL,
  POS1 NUMBER(38),
  POS2 NUMBER(38),
  POS3 NUMBER(38),
  DESCR VARCHAR2(200) NOT NULL
);
ALTER TABLE PTA_EOPYYHL7ERROR
  ADD CONSTRAINT PTA_EOPYYHL7ERROR_PK
  PRIMARY KEY(ERRORID);

CREATE TABLE PTA_EOPYYHL7MSGERROR (
  EOPYYHL7MSGERRORID NUMBER(38) NOT NULL,
  EOPYYHL7MSGID NUMBER(38) NOT NULL,
  COMPANYID NUMBER(38) NOT NULL,
  ERRORID NUMBER(38) NOT NULL
);
ALTER TABLE PTA_EOPYYHL7MSGERROR
  ADD CONSTRAINT PTA_EOPYYHL7MSGERROR_PK
  PRIMARY KEY(EOPYYHL7MSGERRORID, COMPANYID);
ALTER TABLE PTA_EOPYYHL7MSGERROR
  ADD CONSTRAINT PTA_EOPYYHL7ERROR_ERRORMSG_FK
  FOREIGN KEY(ERRORID)
  REFERENCES PTA_EOPYYHL7ERROR(ERRORID);
ALTER TABLE PTA_EOPYYHL7MSGERROR
  ADD CONSTRAINT PTA_EOPYYHL7MSG_ERRORMSG_FK
  FOREIGN KEY(EOPYYHL7MSGID, COMPANYID)
  REFERENCES PTA_EOPYYHL7MSG(EOPYYHL7MSGID, COMPANYID)
  ON DELETE CASCADE;


