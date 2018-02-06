ALTERS IN TABLE INV_ITEM, INV_PARAMETERS (by ilev 18-feb-2008) 
--------------------------------------------------------
alter table inv_item add calculatedprice float(126);
alter table inv_eventtype add (calculatedpricethreshold float(126), calculatedpricecheckmode number(38));
UPDATE INV_EVENTTYPE SET calculatedpricecheckmode = 1;