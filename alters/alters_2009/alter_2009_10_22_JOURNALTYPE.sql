alter table glg_eventtype add (journaltype number(38));
update glg_eventtype set journaltype = 1;
commit;
alter table glg_eventtype modify journaltype not null;
