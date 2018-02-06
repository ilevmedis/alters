alter table glg_journal add journalruleheaderid number(38);
alter table glg_journal add constraint glg_journalrulehd_journal_fk
  foreign key (companyid, fyearid, journalruleheaderid)
  references glg_journalruleheader(companyid, fyearid, journalruleheaderid);
alter table glg_journallinkerror add journalid number(38);
alter table glg_journallinkerror add constraint
  glg_journal_linkerror_fk foreign key (companyid, fyearid, journalid)
  references glg_journal (companyid, fyearid, journalid)
  on delete cascade;
create index glg_journal_linkerror_fk on glg_journallinkerror (companyid, fyearid, journalid);

