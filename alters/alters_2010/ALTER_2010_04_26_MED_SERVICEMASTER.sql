ALTER TABLE MED_SERVICEMASTER ADD ISCOPYINGLASTDATA VARCHAR2(1) DEFAULT '0';
UPDATE MED_SERVICEMASTER SET ISCOPYINGLASTDATA = '0';
COMMIT;
ALTER TABLE MED_SERVICEMASTER MODIFY ISCOPYINGLASTDATA NOT NULL;