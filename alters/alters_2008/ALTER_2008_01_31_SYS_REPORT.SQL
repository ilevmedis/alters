﻿ALTERS IN TABLE SYS_REPORT (by ilev 31-jan-2008) ADDED ISASKINGFORCOPIES (FULL PAGE ASCII REPORTS)
---------------------------------------------------------------------------------------------------
ALTER TABLE SYS_REPORT ADD ISASKINGFORCOPIES VARCHAR2(1);
UPDATE SYS_REPORT SET ISASKINGFORCOPIES='0';
COMMIT;
ALTER TABLE SYS_REPORT MODIFY ISASKINGFORCOPIES NOT NULL;
