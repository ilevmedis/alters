ALTER TABLE PTA_DIAGNOSISCODE ADD ISALLOWINGSELECTION VARCHAR2(1) DEFAULT '1';
UPDATE PTA_DIAGNOSISCODE SET ISALLOWINGSELECTION = DECODE(HASCHILDREN, '1', '0', '1');
COMMIT;
ALTER TABLE PTA_DIAGNOSISCODE MODIFY ISALLOWINGSELECTION NOT NULL;