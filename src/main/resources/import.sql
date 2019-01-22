

insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (1,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Science (Computational Mathematics)','Bachelor of Science (Computational Mathematics)');
update course_seq set next_val= '2' where next_val='1';
insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (2,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Science (Chemical Sciences)','Bachelor of Science (Chemical Sciences)');
update course_seq set next_val= '3' where next_val='2';
insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (3,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Science (Marine Biology)','Bachelor of Science (Marine Biology)');
update course_seq set next_val= '4' where next_val='3';
insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (4,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Science (Financial Mathematics)','Bachelor of Science (Financial Mathematics)');
update course_seq set next_val= '5' where next_val='4';
insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (5,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Computer Science (Software Engineering)','Bachelor of Computer Science (Software Engineering)');
update course_seq set next_val= '6' where next_val='5';
insert into course (id,created_by,created_date,last_modified_by,last_modified_date,status,course_name,course_description) values (6,'SYSTEM','2019-01-19 00:00:00','SYSTEM','2019-01-19 00:00:00',1,'Bachelor of Computer Science with Maritime Informatics','Bachelor of Computer Science with Maritime Informatics');
update course_seq set next_val= '7' where next_val='6';

insert into student (id,created_by,created_date,last_modified_by,last_modified_date,status,address,country,course_id,email,mobile_no,name,postcode,state) values (1,'SYSTEM','2019-01-21 00:00:00','SYSTEM','2019-01-21 00:00:00',1,'No 7F','Malaysia',5,'aizadezad@yahoo.com','0135155193','Mohd Aizad','55100','Kuala Lumpur');
update student_sequence set next_val= '2' where next_val='1';
insert into student (id,created_by,created_date,last_modified_by,last_modified_date,status,address,country,course_id,email,mobile_no,name,postcode,state) values (2,'SYSTEM','2019-01-21 00:00:00','SYSTEM','2019-01-21 00:00:00',1,'No 7F','Malaysia',2,'arimalutazzi@yahoo.com','0139052612','Izzatul Amira','55100','Kuala Lumpur');
update student_sequence set next_val= '3' where next_val='2';
insert into student (id,created_by,created_date,last_modified_by,last_modified_date,status,address,country,course_id,email,mobile_no,name,postcode,state) values (3,'SYSTEM','2019-01-21 00:00:00','SYSTEM','2019-01-21 00:00:00',1,'No 7F','Malaysia',1,'aizadnami@yahoo.com','0135155192','Amira','55100','Kuala Lumpur');
update student_sequence set next_val= '4' where next_val='3';
insert into student (id,created_by,created_date,last_modified_by,last_modified_date,status,address,country,course_id,email,mobile_no,name,postcode,state) values (4,'SYSTEM','2019-01-21 00:00:00','SYSTEM','2019-01-21 00:00:00',1,'No 7F','Malaysia',5,'aizadezad@google.com','0135155122','Nami','55100','Kuala Lumpur');
update student_sequence set next_val= '5' where next_val='4';
