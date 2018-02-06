alter table glg_journalruledetail add (validsincedate date, validtilldate date);
update glg_journalruledetail set validsincedate='01-01-2000';
commit;
alter table glg_journalruledetail modify validsincedate not null;

update glg_journalruledetail set validtilldate='31-12-2099';
commit;
alter table glg_journalruledetail modify validtilldate not null;