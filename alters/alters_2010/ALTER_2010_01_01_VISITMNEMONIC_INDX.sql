create index VISIT_MNEMONIC_INDX on PTA_VISIT (MNEMONIC, COMPANYID, FYEARID);
create index VISIT_LASTNAME_INDX on PTA_VISIT (LASTNAME, COMPANYID, FYEARID);
create index MNEMONIC_INDX on PTA_PATIENT (mnemonic, companyid);