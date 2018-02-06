alter table PBL_PARAMETERS add ISINVOICINGDISCOUNTS varchar2(1);

update pbl_parameters
  set ISINVOICINGDISCOUNTS = '1';
  commit;

alter table PBL_PARAMETERS modify ISINVOICINGDISCOUNTS not null;
