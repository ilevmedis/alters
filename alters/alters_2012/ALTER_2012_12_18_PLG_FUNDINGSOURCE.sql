CREATE TABLE PLG_FUNDINGSOURCE(
  FUNDINGSOURCEID NUMBER(38) NOT NULL,
  COMPANYID NUMBER(38) NOT NULL,
  MNEMONIC VARCHAR2(20) NOT NULL,
  DESCR VARCHAR2(100) NOT NULL,
  ISACTIVE VARCHAR2(1) NOT NULL,
  COMMENTS VARCHAR2(200));
ALTER TABLE PLG_FUNDINGSOURCE
  ADD CONSTRAINT PLG_FUNDINGSOURCE_PK
  PRIMARY KEY(FUNDINGSOURCEID, COMPANYID);
ALTER TABLE PLG_XEP1 ADD FUNDINGSOURCEID NUMBER(38);
ALTER TABLE PLG_XEP1
  ADD CONSTRAINT PLG_FUNDINGSOURCE_XEP1_FK
  FOREIGN KEY(FUNDINGSOURCEID, COMPANYID)
  REFERENCES PLG_FUNDINGSOURCE(FUNDINGSOURCEID, COMPANYID);
CREATE INDEX PLG_FUNDINGSOURCE_XEP1_FK ON PLG_XEP1(FUNDINGSOURCEID, COMPANYID);
ALTER TABLE PLG_XEP2 ADD FUNDINGSOURCEID NUMBER(38);
ALTER TABLE PLG_XEP2
  ADD CONSTRAINT PLG_FUNDINGSOURCE_XEP2_FK
  FOREIGN KEY(FUNDINGSOURCEID, COMPANYID)
  REFERENCES PLG_FUNDINGSOURCE(FUNDINGSOURCEID, COMPANYID);
CREATE INDEX PLG_FUNDINGSOURCE_XEP2_FK ON PLG_XEP2(FUNDINGSOURCEID, COMPANYID);

CREATE OR REPLACE VIEW PLGVIEW_MOVEESODA AS
SELECT
      CREDIT.FINTRANSHEADERID, CREDIT.FINTRANSDETAILID, CREDIT.AMOUNTCREDIT, PLG_ACCOUNT.MNEMONIC,
       CREDIT.PLGACCOUNTID, CREDIT.INTERNALEVENTDATE, CREDIT.COMPANYID, CREDIT.INCEXPINDICATOR, CREDIT.TOTALAMOUNT,
       CREDIT.PREDISCAMOUNT, CREDIT.DISCAMOUNT, CREDIT.BUDGETORGID, PLG_XEP2.XEP2ID, PLG_XEP2.XEP2DATE, PLG_XEP2.PAYMENTDATE,
         PLG_XEP2.FYEARID "XEP2_FYEARID", PLG_XEP2.PLGSTATUS "XEP2_STATUS", PLG_XEP2.PRINTEDTRANSPARTY,
         PLG_XEP2.ISDELETED, PLG_XEP2.INTERNALEVENTNO "XEP2_INTERNALEVENTNO",
         PLG_XEP2.TOTALAMOUNT "XEP2_TOTALAMOUNT", PLG_XEP2.NETAMOUNT "XEP2_NETAMOUNT", PLG_XEP2.FUNDINGSOURCEID
    FROM PLG_XEP2,PLG_EVENT,ERP_EVENT,FIN_EVENT,FIN_TRANSHEADER,FIN_TRANSDETAIL CREDIT, PLG_ACCOUNT
    WHERE PLG_EVENT.PLGEVENTID = PLG_XEP2.PLGEVENTID
      AND PLG_EVENT.FYEARID = PLG_XEP2.FYEARID
      AND PLG_EVENT.COMPANYID = PLG_XEP2.COMPANYID
      AND FIN_EVENT.ERPEVENTID = ERP_EVENT.ERPEVENTID
      AND FIN_EVENT.FYEARID = ERP_EVENT.FYEARID
      AND FIN_EVENT.COMPANYID = ERP_EVENT.COMPANYID
      AND ERP_EVENT.ERPEVENTID = PLG_EVENT.ERPEVENTID
      AND ERP_EVENT.FYEARID = PLG_EVENT.FYEARID
      AND ERP_EVENT.COMPANYID = PLG_EVENT.COMPANYID
      AND FIN_EVENT.FINEVENTID = FIN_TRANSHEADER.FINEVENTID
      AND FIN_EVENT.FYEARID = FIN_TRANSHEADER.FYEARID
      AND FIN_EVENT.COMPANYID = FIN_TRANSHEADER.COMPANYID
      AND CREDIT.FYEARID = FIN_TRANSHEADER.FYEARID
      AND CREDIT.FINTRANSHEADERID = FIN_TRANSHEADER.FINTRANSHEADERID
      AND CREDIT.COMPANYID = FIN_TRANSHEADER.COMPANYID
      AND CREDIT.PLGACCOUNTID IS NOT NULL
      AND PLG_ACCOUNT.ACCOUNTID=CREDIT.PLGACCOUNTID
      AND PLG_ACCOUNT.INCEXPINDICATOR=CREDIT.INCEXPINDICATOR
      AND PLG_ACCOUNT.FYEARID=CREDIT.FYEARID
      AND PLG_ACCOUNT.COMPANYID=CREDIT.COMPANYID
      AND general_nvl(FIN_TRANSHEADER.EVENTTYPEINDICATOR,0) <> 14
      AND general_nvl(CREDIT.EVENTTYPEINDICATOR,0) <> 14
      AND PLG_XEP2.INCEXPINDICATOR = '1' AND
			CREDIT.ISCREDIT='1';

CREATE OR REPLACE VIEW PLGVIEW_MOVE AS
SELECT TRHD.FINTRANSHEADERID "FINTRANSHEADERID",
TRHD.EXTERNALEVENTNO "EXTERNALEVENTNO", TRHD.EXTERNALEVENTTYPE "EXTERNALEVENTTYPE",
   TRHD.EXTERNALEVENTDATE "EXTERNALEVENTDATE",
   DTALL.FINTRANSDETAILID "FINTRANSDETAILID", DTALL.FYEARID "FINTRANSDETAIL_FYEAR", DTALL.COMPANYID "COMPANYID",
   DTALL.FINTRANSPARTYID "FINTRANSPARTYID", DTALL.INTERNALEVENTDATE "INTERNALEVENTDATE", DTALL.PLGACCOUNTID "PLGACCOUNTID",
   DTALL.BANKNOTEID "BANKNOTEID", DTALL.AMOUNTDEBIT "AMOUNTDEBIT", DTALL.AMOUNTCREDIT "AMOUNTCREDIT",
   DTALL.INCEXPINDICATOR "INCEXPINDICATOR", DTALL.TOTALAMOUNT "TOTALAMOUNT", DTALL.PREDISCAMOUNT "PREDISCAMOUNT",
   DTALL.NETAMOUNT "NETAMOUNT", DTALL.DISCAMOUNT "DISCAMOUNT", DTALL.VATAMOUNT "VATAMOUNT", DTALL.DISCPERC "DISCPERC",
   DTALL.BANKACCOUNTID "BANKACCOUNTID", DTALL.VATPERC "VATPERC", DTALL.DESCR "DESCR", DTALL.VALUEKEPYO "VALUEKEPYO",
   DTALL.INVENTORYINDICATOR "INVENTORYINDICATOR", DTALL.VATID "VATID", DTALL.BUDGETORGID "BUDGETORGID",
   DTALL.PLGSTATUS "PLGSTATUS",
   DTALL.ORGTAXAMOUNT "ORGTAXAMOUNT", DTALL.TRANSPARTYTAXAMOUNT "TRANSPARTYTAXAMOUNT",
   XEP2.XEP2ID "XEP2ID", XEP2.FYEARID "XEP2_FYEARID", XEP2.PLGSTATUS "XEP2_STATUS", XEP2.XEP2DATE "XEP2DATE",
   XEP2.APPROVEDATE "APPROVEDATE", XEP2.PAYMENTDATE "PAYMENTDATE", XEP2.REASON "XEP2_REASON", XEP2.APPROVENO "APPROVENO",
   XEP2.PRINTEDTRANSPARTY "PRINTEDTRANSPARTY", CREDIT.ISDELETED "ISDELETED", XEP2.INTERNALEVENTNO "XEP2_INTERNALEVENTNO",
   XEP2.NETAMOUNT "XEP2_NETAMOUNT", XEP2.VATAMOUNT "XEP2_VATAMOUNT", XEP2.TOTALAMOUNT "XEP2_TOTALAMOUNT",
   XEP2.ORGTAXAMOUNT "XEP2_ORGTAXAMOUNT", XEP2.TRANSPARTYTAXAMOUNT "XEP2_TRANSPARTYTAXAMOUNT",
   XEP1.XEP1ID "XEP1ID", XEP1.XEP1DATE "XEP1DATE", XEP1.INTERNALEVENTNO "XEP1_INTERNALEVENTNO", XEP2.FUNDINGSOURCEID "FUNDINGSOURCEID"
    FROM FIN_TRANSDETAIL CREDIT LEFT OUTER JOIN PLG_XEP1DETAIL XEP1DT
            ON CREDIT.COMPANYID = XEP1DT.COMPANYID
              AND CREDIT.FYEARID = XEP1DT.FINTRANSDETAILFYEARID
              AND CREDIT.FINTRANSDETAILID = XEP1DT.FINTRANSDETAILID
            LEFT OUTER JOIN PLG_XEP1 XEP1
            ON XEP1DT.COMPANYID = XEP1.COMPANYID
              AND XEP1DT.FYEARID = XEP1.FYEARID
              AND XEP1DT.XEP1ID = XEP1.XEP1ID
            LEFT OUTER JOIN PLG_XEP2DETAIL XEP2DT
            ON XEP1.COMPANYID = XEP2DT.COMPANYID
              AND XEP1.FYEARID = XEP2DT.FYEARID
              AND XEP1.XEP1ID = XEP2DT.XEP1ID
            LEFT OUTER JOIN PLG_XEP2 XEP2
            ON XEP2DT.COMPANYID = XEP2.COMPANYID
              AND XEP2DT.FYEARID = XEP2.FYEARID
              AND XEP2DT.XEP2ID = XEP2.XEP2ID,
          FIN_TRANSHEADER TRHD, FIN_TRANSDETAIL DTALL
    WHERE CREDIT.PLGACCOUNTID IS NULL
      AND CREDIT.COMPANYID = TRHD.COMPANYID
      AND CREDIT.FYEARID = TRHD.FYEARID
      AND CREDIT.FINTRANSHEADERID = TRHD.FINTRANSHEADERID
      AND TRHD.COMPANYID = DTALL.COMPANYID
      AND TRHD.FYEARID = DTALL.FYEARID
      AND TRHD.FINTRANSHEADERID = DTALL.FINTRANSHEADERID
      AND general_nvl(CREDIT.EVENTTYPEINDICATOR,0) <> 14
      AND general_nvl(TRHD.EVENTTYPEINDICATOR,0) <> 14
      AND general_nvl(DTALL.EVENTTYPEINDICATOR,0) <> 14;
