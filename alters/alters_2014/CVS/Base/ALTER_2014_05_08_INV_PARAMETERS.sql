alter table inv_parameters add (
  isconnectingtoekapty varchar2(1) default '0' not null,
  ekapty_invitemcodingid number(38),
  ekapty_usertoken varchar2(50)
);