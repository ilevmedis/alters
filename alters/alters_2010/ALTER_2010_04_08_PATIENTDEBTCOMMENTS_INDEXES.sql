create index DATE_PATIENTCOMMENT on PTA_PATIENTDEBTCOMMENT (COMMENTDATE, COMPANYID);
create index USER_DATE_COMMENT on PTA_PATIENTDEBTCOMMENT (ENTRYUSER, COMMENTDATE, COMPANYID);