ALTER TABLE INV_EVENTTYPE ADD ISMERGINGITEMS VARCHAR2(1) DEFAULT '0';
UPDATE INV_EVENTTYPE SET ISMERGINGITEMS = '0';
COMMIT;
ALTER TABLE INV_EVENTTYPE MODIFY ISMERGINGITEMS NOT NULL; 