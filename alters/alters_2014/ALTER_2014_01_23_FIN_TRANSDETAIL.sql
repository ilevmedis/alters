alter table fin_transdetail add vatkepyo float(126);
update fin_transdetail set vatkepyo = vatamount where transacteeindicator = 2 and eventtypeindicator = 1 and fyearid = 2014;
alter table fin_eventtype add (invoicetype number(38), kepyocode number(38));
update fin_eventtype set invoicetype = 2 where invoicekindindicator = 3;
update fin_eventtype set invoicetype = 3 where invoicekindindicator in (2,4);
update fin_eventtype set invoicetype = 3 where eventtypeindicator = 1 and kepyooper != 0 and kepyooper is not null;
update fin_eventtype set invoicetype = 2 where eventtypeindicator = 1 and (kepyooper = 0 or kepyooper is null);

