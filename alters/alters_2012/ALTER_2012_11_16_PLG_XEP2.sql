alter table plg_xep2 add (xep2indicator number(38) default 1, fintranspartyid number(38));
update plg_xep2 set xep2indicator = 1;
commit;
alter table plg_xep2 modify xep2indicator not null;


alter table plg_xep1 add (xep2indicator number(38) default 1);
update plg_xep1 set xep2indicator = 1;
commit;
alter table plg_xep1 modify xep2indicator not null;
