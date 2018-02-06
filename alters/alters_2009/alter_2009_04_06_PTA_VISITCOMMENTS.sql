create table pta_visitcomments(visitcommentsid number(38) not null, companyid number(38) not null, fyearid number(38) not null, 
  visitid number(38) not null, commentsdate date not null, comments varchar2(100) not null);
alter table pta_visitcomments add constraint pta_visitcomments_pk primary key (visitcommentsid, companyid, fyearid );
alter table pta_visitcomments add constraint pta_visit_comments_fk 
  foreign key (visitid, companyid, fyearid) 
  references pta_visit(visitid, companyid, fyearid);
