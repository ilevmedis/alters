ALTER TABLE PTA_EOPYYPARAMETERS ADD (
  INPWS_USERNAME               VARCHAR2(20),
  INPWS_PASSWORD               VARCHAR2(20),
  INPWS_DIGITALCERTIFICATENUM  VARCHAR2(30),
  INPWS_CLIENTKEYSTOREFILE     VARCHAR2(20),
  INPWS_CLIENTKEYSTOREPASSWORD VARCHAR2(20),
  INPWS_CLIENTKEYALIAS         VARCHAR2(20),
  INPWS_CLIENTKEYPASSWORD      VARCHAR2(20),
  INPWS_CERTFILE               VARCHAR2(20),
  INPWS_ISCONNECTINGTOWS       VARCHAR2(1) DEFAULT '0' NOT NULL,
  INPWS_ISUSINGPROXY           VARCHAR2(1) DEFAULT '0' NOT NULL,
  INPWS_PROXY                  VARCHAR2(30),
  INPWS_PROXYPORT              VARCHAR2(10),
  INPWS_ADMISSIONSEQID         NUMBER(38),
  INPWS_DISCHARGESEQID         NUMBER(38),
  INPWS_TRANSFERSEQID          NUMBER(38)
);

