alter table plg_budgetexec add (budgetfyearid number(38));
update plg_budgetexec set budgetfyearid=fyearid;
commit;
alter table plg_budgetexec modify budgetfyearid not null;