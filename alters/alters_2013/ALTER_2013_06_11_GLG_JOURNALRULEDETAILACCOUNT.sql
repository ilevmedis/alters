alter table glg_journalruledetailaccount add (temp clob);
update glg_journalruledetailaccount set temp = applyexpression;
commit;
update glg_journalruledetailaccount set applyexpression = null;
commit;
alter table glg_journalruledetailaccount drop column applyexpression;
alter table glg_journalruledetailaccount rename column temp to applyexpression;