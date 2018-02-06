alter table PTA_SSNPARAMETERS add ISCONNECTINGTOINSURWEBSERVICE VARCHAR2(1) DEFAULT '0';
alter table PTA_SSNPARAMETERS add insurwebserviceusername VARCHAR2(20);
alter table PTA_SSNPARAMETERS add insurwebservicepassword VARCHAR2(20);
alter table PTA_SSNPARAMETERS add overwritepatientdata NUMBER(38);

update PTA_SSNPARAMETERS set overwritepatientdata = 2;
commit;

alter table SYS_PREFECTURE add IDIKACODE VARCHAR2(10);
alter table SYS_MUNICIPALITY add IDIKACODE VARCHAR2(10);
