﻿ALTERS IN TABLE PTA_PARAMETERS (by Atza 4-dec-2007)
---------------------------------------------------
ALTER TABLE PTA_PARAMETERS ADD CHKFORORDERSPENDING VARCHAR2(1);
ALTER TABLE PTA_PARAMETERS ADD CHKFORGRANTSPENDING VARCHAR2(1);

update pta_parameters
  set CHKFORORDERSPENDING = '0', CHKFORGRANTSPENDING='0';
commit;

alter table PTA_PARAMETERS modify CHKFORORDERSPENDING not null;
alter table PTA_PARAMETERS modify CHKFORGRANTSPENDING not null;
