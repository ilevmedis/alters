﻿alter table PTA_PARAMETERS add TRANSFERCHARGESFROMOUP varchar2(1);

UPDATE PTA_PARAMETERS SET TRANSFERCHARGESFROMOUP ='1';
COMMIT;

alter table PTA_PARAMETERS modify TRANSFERCHARGESFROMOUP not null;