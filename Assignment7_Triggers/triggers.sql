SQL> set echo on
SQL> @D:/triggers/air_main.sql
SQL> --*****************************************************
SQL> --CS 2258				     B.Senthil Kumar
SQL> --DBMS Lab 			     Asst. Prof
SQL> -- 			 Computer Science Department
SQL> -- 			  SSN College of Engineering
SQL> -- 				  senthil@ssn.edu.in
SQL> --*****************************************************
SQL> -- 	       AIRLINES DATASET
SQL> -- 		Version 1.0
SQL> -- 	       February 05, 2013
SQL> --*****************************************************
SQL> --Sources:
SQL> -- 	To create airlines database run the following
SQL> --      two script files which will create and populate
SQL> --      the databases.
SQL> --
SQL> --******************************************************
SQL> -- run the SQL script files
SQL> 
SQL> @D:/triggers/air_cre.sql
SQL> --*****************************************************
SQL> --CS 2258				     B.Senthil Kumar
SQL> --DBMS Lab 			     Asst. Prof
SQL> -- 			 Computer Science Department
SQL> -- 			  SSN College of Engineering
SQL> -- 				  senthil@ssn.edu.in
SQL> --*****************************************************
SQL> -- 	       AIRLINES DATASET
SQL> -- 		Version 1.0
SQL> -- 	       February 05, 2013
SQL> --*****************************************************
SQL> --Sources:
SQL> -- 	This dataset is prepared for the assignment
SQL> --      on Subqueries and Join in SQL to students. This
SQL> --      is a test dataset.
SQL> --      The below SQL create the relations for airlines
SQL> --      database with constraints.
SQL> --
SQL> --******************************************************
SQL> 
SQL> drop table fl_schedule;

Table dropped.

SQL> drop table flights;

Table dropped.

SQL> drop table routes;

Table dropped.

SQL> drop table certified;

Table dropped.

SQL> drop table employee;

Table dropped.

SQL> drop table aircraft;

Table dropped.

SQL> 
SQL> create table aircraft(
  2  	     aid number(4) constraint aid_pk primary key,
  3  	     aname varchar2(30),
  4  	     type varchar2(10),
  5  	     cruisingrange number(6)
  6  	     );

Table created.

SQL> 
SQL> create table employee(
  2  	     eid number(9) constraint eid_pk primary key,
  3  	     ename varchar2(30),
  4  	     salary number(10,2)
  5  	     );

Table created.

SQL> 
SQL> create table certified(
  2  	     eid number(9),
  3  	     aid number(4),
  4  	     constraint eaid_pk primary key(eid,aid),
  5  	     constraint eid_fk foreign key(eid) references employee,
  6  	     constraint aid_fk foreign key(aid) references aircraft
  7  	     );

Table created.

SQL> 
SQL> create table routes(
  2  	     routeID varchar2(6) constraint rid_pk primary key,
  3  	     orig_airport varchar2(20),
  4  	     dest_airport varchar2(20),
  5  	     distance number(6)
  6  	     );

Table created.

SQL> 
SQL> create table flights(
  2  	     flightNo varchar2(7) constraint fno_pk primary key,
  3  	     rID varchar2(6),
  4  	     aid number(4),
  5  	     constraint fl_aid_fk foreign key(aid) references aircraft,
  6  	     constraint rid_fk foreign key(rid) references routes
  7  	     );

Table created.

SQL> 
SQL> create table fl_schedule(
  2  	     flno varchar2(7),
  3  	     departs date,
  4  	     dtime number(4),
  5  	     arrives date,
  6  	     atime number(4),
  7  	     price number(7,2),
  8  	     constraint fno_dep_pk primary key (flno,departs),
  9  	     constraint fno_fk foreign key(flno) references flights
 10  	     );

Table created.

SQL> 
SQL> --********************END OF CREATE**********************************
SQL> @D:/triggers/air_pop.sql
SQL> --*****************************************************
SQL> --CS 2258				     B.Senthil Kumar
SQL> --DBMS Lab 			     Asst. Prof
SQL> -- 			 Computer Science Department
SQL> -- 			  SSN College of Engineering
SQL> -- 				  senthil@ssn.edu.in
SQL> --*****************************************************
SQL> -- 	       AIRLINES DATASET
SQL> -- 		Version 1.0
SQL> -- 	       February 05, 2013
SQL> --*****************************************************
SQL> --Sources:
SQL> -- 	This dataset is prepared for the assignment
SQL> --      on Subqueries and Join in SQL to students. This
SQL> --      is a test dataset.
SQL> --      The below SQL statements will populate the
SQL> --      airlines database. The flight schedule contains
SQL> --      information pertained to flights during 12 to 22
SQL> --      April 2005. Do NOT MODIFY the instances.
SQL> --
SQL> --******************************************************
SQL> --
SQL> -- Populating Aircraft
SQL> --aircraft(aid, aname, type, cruisingrange)
SQL> 
SQL> INSERT INTO  aircraft VALUES (1,'Boeing 747-400','Boeing',8430);

1 row created.

SQL> INSERT INTO  aircraft VALUES (2,'Boeing 737-800','Boeing',3383);

1 row created.

SQL> INSERT INTO  aircraft VALUES (3,'Airbus A340-300','Airbus',7120);

1 row created.

SQL> INSERT INTO  aircraft VALUES (4,'British Aerospace Jetstream 41','BAe',1502);

1 row created.

SQL> INSERT INTO  aircraft VALUES (5,'Embraer ERJ-145','Embraer',1530);

1 row created.

SQL> INSERT INTO  aircraft VALUES (6,'SAAB 340','Saab',2128);

1 row created.

SQL> INSERT INTO  aircraft VALUES (7,'Piper PA-46 Meridian','Piper',520);

1 row created.

SQL> INSERT INTO  aircraft VALUES (8,'Tupolev Tu-154','Tupolev',4103);

1 row created.

SQL> INSERT INTO  aircraft VALUES (16,'Schweizer 2-33','Schweizer',300);

1 row created.

SQL> INSERT INTO  aircraft VALUES (9,'Lockheed L1011 Tristar','Lockheed',6900);

1 row created.

SQL> INSERT INTO  aircraft VALUES (10,'Boeing 757-300','Boeing',4010);

1 row created.

SQL> INSERT INTO  aircraft VALUES (11,'Boeing 777-300','Boeing',6441);

1 row created.

SQL> INSERT INTO  aircraft VALUES (12,'Boeing 767-400ER','Boeing',6475);

1 row created.

SQL> INSERT INTO  aircraft VALUES (13,'Airbus A320','Airbus',2605);

1 row created.

SQL> INSERT INTO  aircraft VALUES (14,'Airbus A319','Airbus',1805);

1 row created.

SQL> INSERT INTO  aircraft VALUES (15,'Boeing 727','Boeing',1504);

1 row created.

SQL> 
SQL> 
SQL> -- Populating employee relation
SQL> --employee(eid, ename, salary)
SQL> 
SQL> INSERT INTO  employee VALUES (242518965,'James Smith',120433);

1 row created.

SQL> INSERT INTO  employee VALUES (141582651,'Mary Johnson',178345);

1 row created.

SQL> INSERT INTO  employee VALUES (011564812,'John Williams',153972);

1 row created.

SQL> INSERT INTO  employee VALUES (567354612,'Lisa Walker',256481);

1 row created.

SQL> INSERT INTO  employee VALUES (552455318,'Larry West',101745);

1 row created.

SQL> INSERT INTO  employee VALUES (550156548,'Karen Scott',205187);

1 row created.

SQL> INSERT INTO  employee VALUES (390487451,'Lawrence Sperry',212156);

1 row created.

SQL> INSERT INTO  employee VALUES (274878974,'Michael Miller',99890);

1 row created.

SQL> INSERT INTO  employee VALUES (254099823,'Patricia Jones',24450);

1 row created.

SQL> INSERT INTO  employee VALUES (356187925,'Robert Brown',44740);

1 row created.

SQL> INSERT INTO  employee VALUES (355548984,'Angela Martinez',212156);

1 row created.

SQL> INSERT INTO  employee VALUES (310454876,'Joseph Thompson',212156);

1 row created.

SQL> INSERT INTO  employee VALUES (489456522,'Linda Davis',127984);

1 row created.

SQL> INSERT INTO  employee VALUES (489221823,'Richard Jackson',23980);

1 row created.

SQL> INSERT INTO  employee VALUES (548977562,'William Ward',84476);

1 row created.

SQL> INSERT INTO  employee VALUES (310454877,'Chad Stewart',33546);

1 row created.

SQL> INSERT INTO  employee VALUES (142519864,'Betty Adams',227489);

1 row created.

SQL> INSERT INTO  employee VALUES (269734834,'George Wright',289950);

1 row created.

SQL> INSERT INTO  employee VALUES (287321212,'Michael Miller',48090);

1 row created.

SQL> INSERT INTO  employee VALUES (552455348,'Dorthy Lewis',92013);

1 row created.

SQL> INSERT INTO  employee VALUES (248965255,'Barbara Wilson',43723);

1 row created.

SQL> INSERT INTO  employee VALUES (159542516,'William Moore',48250);

1 row created.

SQL> INSERT INTO  employee VALUES (348121549,'Haywood Kelly',32899);

1 row created.

SQL> INSERT INTO  employee VALUES (090873519,'Elizabeth Taylor',32021);

1 row created.

SQL> INSERT INTO  employee VALUES (486512566,'David Anderson',743001);

1 row created.

SQL> INSERT INTO  employee VALUES (619023588,'Jennifer Thomas',54921);

1 row created.

SQL> INSERT INTO  employee VALUES (015645489,'Donald King',18050);

1 row created.

SQL> INSERT INTO  employee VALUES (556784565,'Mark Young',205187);

1 row created.

SQL> INSERT INTO  employee VALUES (573284895,'Eric Cooper',114323);

1 row created.

SQL> INSERT INTO  employee VALUES (574489456,'William Jones',105743);

1 row created.

SQL> INSERT INTO  employee VALUES (574489457,'Milo Brooks',12000);

1 row created.

SQL> 
SQL> 
SQL> -- Populating Certified relation
SQL> --certified(eid, aid)
SQL> 
SQL> INSERT INTO certified VALUES (567354612,1);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,2);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,10);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,11);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,12);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,15);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,7);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,9);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,3);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,4);

1 row created.

SQL> INSERT INTO certified VALUES (567354612,5);

1 row created.

SQL> INSERT INTO certified VALUES (552455318,2);

1 row created.

SQL> INSERT INTO certified VALUES (552455318,14);

1 row created.

SQL> INSERT INTO certified VALUES (550156548,1);

1 row created.

SQL> INSERT INTO certified VALUES (550156548,12);

1 row created.

SQL> INSERT INTO certified VALUES (390487451,3);

1 row created.

SQL> INSERT INTO certified VALUES (390487451,13);

1 row created.

SQL> INSERT INTO certified VALUES (390487451,14);

1 row created.

SQL> INSERT INTO certified VALUES (274878974,10);

1 row created.

SQL> INSERT INTO certified VALUES (274878974,12);

1 row created.

SQL> INSERT INTO certified VALUES (355548984,8);

1 row created.

SQL> INSERT INTO certified VALUES (355548984,9);

1 row created.

SQL> INSERT INTO certified VALUES (310454876,8);

1 row created.

SQL> INSERT INTO certified VALUES (310454876,9);

1 row created.

SQL> INSERT INTO certified VALUES (548977562,7);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,1);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,11);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,12);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,10);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,3);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,2);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,13);

1 row created.

SQL> INSERT INTO certified VALUES (142519864,7);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,1);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,2);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,3);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,4);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,5);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,6);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,7);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,8);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,9);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,10);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,11);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,12);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,13);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,14);

1 row created.

SQL> INSERT INTO certified VALUES (269734834,15);

1 row created.

SQL> INSERT INTO certified VALUES (552455318,7);

1 row created.

SQL> INSERT INTO certified VALUES (556784565,5);

1 row created.

SQL> INSERT INTO certified VALUES (556784565,2);

1 row created.

SQL> INSERT INTO certified VALUES (556784565,3);

1 row created.

SQL> INSERT INTO certified VALUES (573284895,3);

1 row created.

SQL> INSERT INTO certified VALUES (573284895,4);

1 row created.

SQL> INSERT INTO certified VALUES (573284895,5);

1 row created.

SQL> INSERT INTO certified VALUES (574489456,8);

1 row created.

SQL> INSERT INTO certified VALUES (574489456,6);

1 row created.

SQL> INSERT INTO certified VALUES (574489457,16);

1 row created.

SQL> INSERT INTO certified VALUES (287321212,7);

1 row created.

SQL> INSERT INTO certified VALUES (242518965,2);

1 row created.

SQL> INSERT INTO certified VALUES (242518965,10);

1 row created.

SQL> INSERT INTO certified VALUES (141582651,2);

1 row created.

SQL> INSERT INTO certified VALUES (141582651,10);

1 row created.

SQL> INSERT INTO certified VALUES (141582651,12);

1 row created.

SQL> INSERT INTO certified VALUES (011564812,2);

1 row created.

SQL> INSERT INTO certified VALUES (011564812,10);

1 row created.

SQL> INSERT INTO certified VALUES (356187925,6);

1 row created.

SQL> INSERT INTO certified VALUES (159542516,5);

1 row created.

SQL> INSERT INTO certified VALUES (159542516,7);

1 row created.

SQL> INSERT INTO certified VALUES (090873519,6);

1 row created.

SQL> 
SQL> 
SQL> -- Populating Routes relation
SQL> --routes(routeID, orig_airport, dest_airport, distance)
SQL> 
SQL> INSERT INTO routes VALUES ('LW100','Los Angeles','Washington D.C.',2308);

1 row created.

SQL> INSERT INTO routes VALUES ('LC101','Los Angeles','Chicago',1749);

1 row created.

SQL> INSERT INTO routes VALUES ('LD102','Los Angeles','Dallas',1251);

1 row created.

SQL> INSERT INTO routes VALUES ('LB103','Los Angeles','Boston',2606);

1 row created.

SQL> INSERT INTO routes VALUES ('LS104','Los Angeles','Sydney',7487);

1 row created.

SQL> INSERT INTO routes VALUES ('LT105','Los Angeles','Tokyo',5478);

1 row created.

SQL> INSERT INTO routes VALUES ('LH106','Los Angeles','Honolulu',2551);

1 row created.

SQL> INSERT INTO routes VALUES ('CL150','Chicago','Los Angeles',1749);

1 row created.

SQL> INSERT INTO routes VALUES ('CN151','Chicago','New York',802);

1 row created.

SQL> INSERT INTO routes VALUES ('MD200','Madison','Detroit',319);

1 row created.

SQL> INSERT INTO routes VALUES ('DN250','Detroit','New York',470);

1 row created.

SQL> INSERT INTO routes VALUES ('DM251','Detroit','Montreal',517);

1 row created.

SQL> INSERT INTO routes VALUES ('MN204','Madison','New York',789);

1 row created.

SQL> INSERT INTO routes VALUES ('MC201','Madison','Chicago',150);

1 row created.

SQL> INSERT INTO routes VALUES ('MP202','Madison','Pittsburgh',510);

1 row created.

SQL> INSERT INTO routes VALUES ('MM203','Madison','Minneapolis',247);

1 row created.

SQL> INSERT INTO routes VALUES ('MNY300','Minneapolis','New York',991);

1 row created.

SQL> INSERT INTO routes VALUES ('PN350','Pittsburgh','New York',303);

1 row created.

SQL> INSERT INTO routes VALUES ('PC351','Pittsburgh','Chicago',409);

1 row created.

SQL> INSERT INTO routes VALUES ('NYL400','New York','London',3471);

1 row created.

SQL> INSERT INTO routes VALUES ('NYP401','New York','Paris',3631);

1 row created.

SQL> INSERT INTO routes values('LNY107','Los Angeles','New York',2510);

1 row created.

SQL> 
SQL> 
SQL> -- Populating Fligts relations
SQL> --flights(flightNo, rID, aid)
SQL> 
SQL> INSERT INTO flights VALUES ('9E-3749','DM251',4);

1 row created.

SQL> INSERT INTO flights VALUES ('MQ-4477','DN250',5);

1 row created.

SQL> INSERT INTO flights VALUES ('MQ-4565','DN250',5);

1 row created.

SQL> INSERT INTO flights VALUES ('CX-7520','LD102',4);

1 row created.

SQL> INSERT INTO flights VALUES ('WS-5060','LD102',5);

1 row created.

SQL> INSERT INTO flights VALUES ('QF-3045','LD102',15);

1 row created.

SQL> INSERT INTO flights VALUES ('JJ-7456','LW100',13);

1 row created.

SQL> INSERT INTO flights VALUES ('JJ-2482','LW100',13);

1 row created.

SQL> INSERT INTO flights VALUES ('SN-8814','LW100',2);

1 row created.

SQL> INSERT INTO flights VALUES ('WN-484','LC101',14);

1 row created.

SQL> INSERT INTO flights VALUES ('WN-434','LC101',13);

1 row created.

SQL> INSERT INTO flights VALUES ('B6-474','LB103',2);

1 row created.

SQL> INSERT INTO flights VALUES ('B6-482','LB103',2);

1 row created.

SQL> INSERT INTO flights VALUES ('VA-6551','LS104',1);

1 row created.

SQL> INSERT INTO flights VALUES ('VA-2','LS104',1);

1 row created.

SQL> INSERT INTO flights VALUES ('DJ-2','LS104',1);

1 row created.

SQL> INSERT INTO flights VALUES ('SQ-11','LT105',11);

1 row created.

SQL> INSERT INTO flights VALUES ('AI-7205','LT105',12);

1 row created.

SQL> INSERT INTO flights VALUES ('MH-93','LT105',11);

1 row created.

SQL> INSERT INTO flights VALUES ('HA-3','LH106',13);

1 row created.

SQL> INSERT INTO flights VALUES ('HA-1','LH106',13);

1 row created.

SQL> INSERT INTO flights VALUES ('UA-1428','LH106',2);

1 row created.

SQL> INSERT INTO flights VALUES ('A5-3376','CL150',14);

1 row created.

SQL> INSERT INTO flights VALUES ('A5-3246','CN151',4);

1 row created.

SQL> INSERT INTO flights VALUES ('9E-3851','MD200',5);

1 row created.

SQL> INSERT INTO flights VALUES ('9E-3622','MD200',4);

1 row created.

SQL> INSERT INTO flights VALUES ('G7-6205','MN204',4);

1 row created.

SQL> INSERT INTO flights VALUES ('EV-5134','MN204',15);

1 row created.

SQL> INSERT INTO flights VALUES ('RP-5018','MC201',16);

1 row created.

SQL> INSERT INTO flights VALUES ('G7-3664','MC201',5);

1 row created.

SQL> INSERT INTO flights VALUES ('FX-2351','MP202',7);

1 row created.

SQL> INSERT INTO flights VALUES ('AS-5958','MM203',16);

1 row created.

SQL> INSERT INTO flights VALUES ('AS-5062','MM203',7);

1 row created.

SQL> INSERT INTO flights VALUES ('DL-3402','PN350',15);

1 row created.

SQL> INSERT INTO flights VALUES ('CY-1846','NYL400',8);

1 row created.

SQL> INSERT INTO flights VALUES ('BA-178','NYL400',10);

1 row created.

SQL> INSERT INTO flights VALUES ('IB-4618','NYL400',9);

1 row created.

SQL> INSERT INTO flights VALUES ('VS-26','NYL400',8);

1 row created.

SQL> INSERT INTO flights VALUES ('AF-23','NYP401',10);

1 row created.

SQL> INSERT INTO flights VALUES ('AF-11','NYP401',10);

1 row created.

SQL> INSERT INTO flights VALUES ('RJ-7056','NYP401',8);

1 row created.

SQL> INSERT INTO flights values('AF-12','LNY107',10);

1 row created.

SQL> 
SQL> 
SQL> -- Populating Fl_schedule relation
SQL> --fl_schedule(flno, departs, dtime, arrives, atime, price)
SQL> 
SQL> INSERT INTO fl_schedule VALUES ('9E-3851','12-apr-2005',0710,'12-apr-2005',0800,120.40);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('CX-7520','12-apr-2005',0730,'12-apr-2005',0840,225.43);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('JJ-7456','12-apr-2005',0930,'12-apr-2005',1240,235.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WS-5060','12-apr-2005',0930,'12-apr-2005',1042,227.60);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AI-7205','12-apr-2005',1010,'13-apr-2005',1850,785.19);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('CY-1846','12-apr-2005',1040,'13-apr-2005',0920,250.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('DL-3402','12-apr-2005',1140,'12-apr-2005',1220,116.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AS-5958','12-apr-2005',1210,'14-apr-2005',1300,220.15);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('QF-3045','12-apr-2005',1320,'12-apr-2005',1440,227.60);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('9E-3749','12-apr-2005',1940,'14-apr-2005',2020,170.40);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('G7-3664','13-apr-2005',0535,'13-apr-2005',0610,112.45);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-484','13-apr-2005',0800,'13-apr-2005',0935,220.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('HA-3','13-apr-2005',1230,'13-apr-2005',1555,375.23);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AS-5062','13-apr-2005',2010,'14-apr-2005',2100,120.11);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('VA-2','13-apr-2005',2030,'15-apr-2005',0430,1300.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('A5-3376','13-apr-2005',2030,'13-apr-2005',2150,220.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('FX-2351','14-apr-2005',0810,'14-apr-2005',0900,208.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AF-23','14-apr-2005',1020,'15-apr-2005',1210,320.70);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('B6-474','14-apr-2005',1710,'14-apr-2005',2120,261.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('G7-6205','22-apr-2005',1725,'22-apr-2005',1850,202.34);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('VA-6551','14-apr-2005',2230,'16-apr-2005',0610,1278.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('9E-3851','15-apr-2005',1035,'15-apr-2005',1140,120.40);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('HA-1','15-apr-2005',1110,'15-apr-2005',1445,375.23);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('BA-178','15-apr-2005',1140,'16-apr-2005',1020,250.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('SQ-11','15-apr-2005',1230,'16-apr-2005',2055,780.99);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('JJ-2482','15-apr-2005',1230,'15-apr-2005',1540,235.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('MQ-4477','15-apr-2005',1510,'15-apr-2005',1600,180.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('A5-3246','15-apr-2005',1810,'15-apr-2005',1900,202.45);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('RP-5018','15-apr-2005',2100,'15-apr-2005',2155,225.45);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WS-5060','16-apr-2005',0930,'16-apr-2005',1042,227.60);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-484','16-apr-2005',0940,'16-apr-2005',1110,220.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-434','16-apr-2005',1410,'16-apr-2005',1530,225.10);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('MH-93','17-apr-2005',0440,'18-apr-2005',1315,783.30);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('G7-3664','17-apr-2005',0725,'17-apr-2005',0815,112.45);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('CX-7520','17-apr-2005',0730,'17-apr-2005',0840,225.43);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AF-11','17-apr-2005',1340,'18-apr-2005',1530,320.70);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('9E-3622','17-apr-2005',1655,'17-apr-2005',1750,118.40);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('EV-5134','17-apr-2005',2135,'17-apr-2005',2240,202.34);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('B6-482','18-apr-2005',0330,'18-apr-2005',0740,261.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('DL-3402','18-apr-2005',1140,'18-apr-2005',1220,116.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('IB-4618','18-apr-2005',1310,'19-apr-2005',1150,250.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('UA-1428','18-apr-2005',1420,'18-apr-2005',1740,425.38);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('MQ-4565','18-apr-2005',1810,'18-apr-2005',1900,180.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('JJ-7456','19-apr-2005',0930,'19-apr-2005',1240,235.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-484','19-apr-2005',1000,'19-apr-2005',1120,220.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('QF-3045','19-apr-2005',1320,'19-apr-2005',1440,227.60);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WS-5060','20-apr-2005',0930,'20-apr-2005',1042,227.60);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('RJ-7056','20-apr-2005',1810,'21-apr-2005',2020,320.70);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('FX-2351','21-apr-2005',0810,'21-apr-2005',0900,208.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('AF-23','21-apr-2005',1020,'22-apr-2005',1210,320.70);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('VS-26','21-apr-2005',1340,'22-apr-2005',1230,250.50);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('VA-6551','21-apr-2005',2230,'23-apr-2005',0610,1278.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('G7-3664','22-apr-2005',0535,'22-apr-2005',0610,112.45);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('CX-7520','22-apr-2005',0730,'22-apr-2005',0840,225.43);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('SN-8814','22-apr-2005',1030,'22-apr-2005',1335,245);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-484','22-apr-2005',1200,'22-apr-2005',1325,220.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('JJ-2482','22-apr-2005',1230,'22-apr-2005',1540,235.98);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('WN-434','22-apr-2005',1540,'22-apr-2005',1700,225.10);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('B6-474','22-apr-2005',1710,'22-apr-2005',2120,261.56);

1 row created.

SQL> INSERT INTO fl_schedule VALUES ('A5-3246','22-apr-2005',1810,'22-apr-2005',1900,202.45);

1 row created.

SQL> INSERT INTO fl_schedule values('AF-12','22-apr-05',1245,'22-apr-05',1850,450.25);

1 row created.

SQL> 
SQL> --**************************END OF INSERT****************************
SQL> 
SQL> --**********END OF AIRLINES DB CREATION*****************
SQL> 
SQL> CLEAR SCREEN;

SQL> SET ECHO ON;
SQL> SET SERVEROUTPUT ON;
SQL> SET LINESIZE 150;
SQL> -- ************************************************************
SQL> REM: Q1. The date of arrival should be always later than or on the same date of departure
SQL> -- ************************************************************
SQL> 
SQL> CREATE OR REPLACE TRIGGER arr_dep BEFORE INSERT OR UPDATE OR DELETE
  2  ON fl_schedule FOR EACH ROW
  3  DECLARE
  4  BEGIN
  5  
  6  if(:NEW.departs >= :NEW.arrives OR( :NEW.departs <= :NEW.arrives AND :NEW.atime <= :NEW.dtime)) THEN
  7  RAISE_APPLICATION_ERROR(-20314,'Arrival date should be after departure date!');
  8  END IF;
  9  END;
 10  /

Trigger created.

SQL> 
SQL> REM: TRIGGERED FIRED
SQL> INSERT INTO fl_schedule VALUES ('9E-3851','30-apr-2005',0710,'01-apr-2002',0800,120.40);
INSERT INTO fl_schedule VALUES ('9E-3851','30-apr-2005',0710,'01-apr-2002',0800,120.40)
            *
ERROR at line 1:
ORA-20314: Arrival date should be after departure date! 
ORA-06512: at "SYSTEM.ARR_DEP", line 5 
ORA-04088: error during execution of trigger 'SYSTEM.ARR_DEP' 


SQL> 
SQL> REM: CONDITON SATISFIED
SQL> INSERT INTO fl_schedule VALUES ('9E-3851','30-apr-2005',0710,'01-MAY-2005',0800,220.40);

1 row created.

SQL> 
SQL> -- ************************************************************
SQL> REM: Q2 Flight number CX7520 is scheduled only on Tuesday, Friday and Sunday.
SQL> -- ************************************************************
SQL> CREATE OR REPLACE TRIGGER day_restrict_7520
  2  BEFORE INSERT OR UPDATE ON fl_schedule
  3  FOR EACH ROW
  4  DECLARE
  5  BEGIN
  6  IF :NEW.flno='CX-7520' THEN
  7    IF to_char(:new.departs, 'D') in (2,4,5,7) THEN
  8  RAISE_APPLICATION_ERROR(-25314,'Flight CX-7520 scheduled on wrong days!');
  9    END IF;
 10  END IF;
 11  END;
 12  /

Trigger created.

SQL> REM: TRIGGERED FIRED
SQL> INSERT INTO fl_schedule VALUES ('CX-7520','30-apr-2005',0710,'01-apr-2002',0800,120.40);
INSERT INTO fl_schedule VALUES ('CX-7520','30-apr-2005',0710,'01-apr-2002',0800,120.40)
            *
ERROR at line 1:
ORA-21000: error number argument to raise_application_error of -25314 is out of range 
ORA-06512: at "SYSTEM.DAY_RESTRICT_7520", line 5 
ORA-04088: error during execution of trigger 'SYSTEM.DAY_RESTRICT_7520' 


SQL> 
SQL> REM: CONDITON SATISFIED
SQL> INSERT INTO fl_schedule VALUES ('CX-7520','29-apr-2005',0710,'01-MAY-2005',0800,220.40);

1 row created.

SQL> 
SQL> 
SQL> -- ************************************************************
SQL> REM: Q3 An aircraft is assigned to a flight only if its cruising range is more than the distance of the
SQL> -- flights' route.
SQL> -- ************************************************************
SQL> 
SQL> CREATE OR REPLACE TRIGGER cruise_fix
  2  BEFORE INSERT OR UPDATE
  3  ON flights
  4  FOR EACH ROW
  5  DECLARE
  6  flag number;
  7  CURSOR c IS SELECT a.cruisingrange,r.distance from aircraft a JOIN routes r ON r.routeid=:new.rid and a.aid=:new.aid;
  8  BEGIN
  9  FOR r in c LOOP
 10  IF r.cruisingrange < r.distance  THEN
 11  flag:=1;
 12  END IF;
 13  END LOOP;
 14  IF flag= 1 THEN
 15  RAISE_APPLICATION_ERROR(-31512,'Cruising range less than distance');
 16  END IF;
 17  END;
 18  /

Trigger created.

SQL> REM: TRIGGERED FIRED
SQL> UPDATE flights
  2  SET rid='NYL400'
  3  WHERE flightNo='JJ-7456';
UPDATE flights
       *
ERROR at line 1:
ORA-21000: error number argument to raise_application_error of -31512 is out of range 
ORA-06512: at "SYSTEM.CRUISE_FIX", line 11 
ORA-04088: error during execution of trigger 'SYSTEM.CRUISE_FIX' 


SQL> REM BELOW is the proof that the cruising range was less than distance of route
SQL> SELECT * FROM flights WHERE flightNo='JJ-7456';

FLIGHTN RID           AID                                                                                                                             
------- ------ ----------                                                                                                                             
JJ-7456 LW100          13                                                                                                                             

SQL> REM Violating trigger assigncraft upon insertion
SQL> INSERT INTO flights VALUES ('JJ-7456','LW100',4);
INSERT INTO flights VALUES ('JJ-7456','LW100',4)
            *
ERROR at line 1:
ORA-21000: error number argument to raise_application_error of -31512 is out of range 
ORA-06512: at "SYSTEM.CRUISE_FIX", line 11 
ORA-04088: error during execution of trigger 'SYSTEM.CRUISE_FIX' 


SQL> REM: CONDITION SATISFIED
SQL> REM Allowing Insertion/Updation When CruisingRange > Distance of flight's route
SQL> UPDATE flights
  2  SET aid=3
  3  WHERE flightNo='JJ-7456';

1 row updated.

SQL> 
SQL> 
SQL> spool off;
