alter table GLG_EVENTTYPE add PERIODKINDINDICATOR number(38);

update glg_eventtype set periodkindindicator = 1;
commit;

alter table GLG_EVENTTYPE modify PERIODKINDINDICATOR not null;


