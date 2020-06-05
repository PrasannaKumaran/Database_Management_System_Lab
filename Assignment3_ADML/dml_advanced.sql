SQL> --*****************************************************
SQL> --CS 2258                               B.Senthil Kumar
SQL> --DBMS LabAsst. Prof
SQL> --        Computer Science Department
SQL> --                 SSN College of Engineering
SQL> --                        senthil@ssn.edu.in
SQL> --*****************************************************
SQL> --           AIRLINES DATASET
SQL> --                 Version 1.0
SQL> --                February 05, 2013
SQL> --*****************************************************
SQL> --Sources:
SQL> --         To create airlines database run the following
SQL> --two script files which will create and populate
SQL> -- the databases.
SQL> --
SQL> --******************************************************
SQL> -- run the SQL script files
SQL> 
SQL> @D:Prasanna/air_cre.sql
SP2-0310: unable to open file "D:Prasanna/air_cre.sql"
SQL> @D:Prasanna/air_pop.sql
SP2-0310: unable to open file "D:Prasanna/air_pop.sql"
SQL> 
SQL> --**********END OF AIRLINES DB CREATION*****************
SQL> 
SQL> 
SQL> REM: 1)1. Display the flight number,departure date and time of a flight, its route details and aircraft
SQL> name of type either Schweizer or Piper that departs during 8.00 PM and 9.00 PM.
SP2-0734: unknown command beginning "name of ty..." - rest of line ignored.
SQL> 
SQL> 
SQL> select fl.flno,fl.departs,fl.dtime,r.routeid,r.orig_airport,r.dest_airport,r.distance from Fl_schedule fl
  2  join flights f on(f.flightno=fl.flno)
  3  join routes r on(r.routeid=f.rid)
  4  join aircraft a ON(f.aid=a.aid)
  5  where a.type IN('Schweizer','Piper') AND fl.dtime between '2000' and '2100';

FLNO    DEPARTS        DTIME ROUTEI ORIG_AIRPORT         DEST_AIRPORT           
------- --------- ---------- ------ -------------------- --------------------   
  DISTANCE                                                                      
----------                                                                      
AS-5062 13-APR-05       2010 MM203  Madison              Minneapolis            
       247                                                                      
                                                                                
RP-5018 15-APR-05       2100 MC201  Madison              Chicago                
       150                                                                      
                                                                                

SQL> 
SQL> 
SQL> REM: 2)For all the routes, display the flight number, origin and destination airport, if a flight is
SQL> assigned for that route.
SP2-0734: unknown command beginning "assigned f..." - rest of line ignored.
SQL> 
SQL> select f.flightno,r.orig_airport,r.dest_airport from flights f,routes
  2   r where f.rid=r.routeid;

FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                       
------- -------------------- --------------------                               
9E-3749 Detroit              Montreal                                           
MQ-4477 Detroit              New York                                           
MQ-4565 Detroit              New York                                           
CX-7520 Los Angeles          Dallas                                             
WS-5060 Los Angeles          Dallas                                             
QF-3045 Los Angeles          Dallas                                             
JJ-7456 Los Angeles          Washington D.C.                                    
JJ-2482 Los Angeles          Washington D.C.                                    
SN-8814 Los Angeles          Washington D.C.                                    
WN-484  Los Angeles          Chicago                                            
WN-434  Los Angeles          Chicago                                            

FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                       
------- -------------------- --------------------                               
B6-474  Los Angeles          Boston                                             
B6-482  Los Angeles          Boston                                             
VA-6551 Los Angeles          Sydney                                             
VA-2    Los Angeles          Sydney                                             
DJ-2    Los Angeles          Sydney                                             
SQ-11   Los Angeles          Tokyo                                              
AI-7205 Los Angeles          Tokyo                                              
MH-93   Los Angeles          Tokyo                                              
HA-3    Los Angeles          Honolulu                                           
HA-1    Los Angeles          Honolulu                                           
UA-1428 Los Angeles          Honolulu                                           

FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                       
------- -------------------- --------------------                               
A5-3376 Chicago              Los Angeles                                        
A5-3246 Chicago              New York                                           
9E-3851 Madison              Detroit                                            
9E-3622 Madison              Detroit                                            
G7-6205 Madison              New York                                           
EV-5134 Madison              New York                                           
RP-5018 Madison              Chicago                                            
G7-3664 Madison              Chicago                                            
FX-2351 Madison              Pittsburgh                                         
AS-5958 Madison              Minneapolis                                        
AS-5062 Madison              Minneapolis                                        

FLIGHTN ORIG_AIRPORT         DEST_AIRPORT                                       
------- -------------------- --------------------                               
DL-3402 Pittsburgh           New York                                           
CY-1846 New York             London                                             
BA-178  New York             London                                             
IB-4618 New York             London                                             
VS-26   New York             London                                             
AF-23   New York             Paris                                              
AF-11   New York             Paris                                              
RJ-7056 New York             Paris                                              
AF-12   Los Angeles          New York                                           

42 rows selected.

SQL> 
SQL> REM: 3)For all aircraft with cruisingrange over 5,000 miles, find the name of the aircraft and the
SQL> average salary of all pilots certified for this aircraft.
SP2-0734: unknown command beginning "average sa..." - rest of line ignored.
SQL> 
SQL> select avg(salary),aname from (select aname,ename,salary from employee e join certified c
  2  on(c.eid=e.eid) join aircraft a on(a.aid=c.aid)
  3  where aname IN (select a.aname from aircraft a ,certified c,employee e where (a.aid=c.aid)
  4  and a.cruisingrange>5000 and e.eid=c.eid group by a.aname)) group by aname;

AVG(SALARY) ANAME                                                               
----------- ------------------------------                                      
 217597.667 Airbus A340-300                                                     
 257973.333 Boeing 777-300                                                      
     209557 Boeing 767-400ER                                                    
  244776.75 Boeing 747-400                                                      
  242685.75 Lockheed L1011 Tristar                                              

SQL> 
SQL> REM: 4)Show the employee details such as id, name and salary who are not pilots and whose salary
SQL> is more than the average salary of pilots.
SP2-0734: unknown command beginning "is more th..." - rest of line ignored.
SQL> 
SQL> select e.eid,e.ename,e.salary from employee e where e.eid NOT IN (select c.eid from certified c)
  2  AND e.salary > (select avg(salary) from employee c where c.eid IN  (select eid from certified));

       EID ENAME                              SALARY                            
---------- ------------------------------ ----------                            
 486512566 David Anderson                     743001                            

SQL> 
SQL> REM: 5)Find the id and name of pilots who were certified to operate some aircrafts but at least one
SQL> of that aircraft is not scheduled from any routes.
SP2-0734: unknown command beginning "of that ai..." - rest of line ignored.
SQL> 
SQL> select DISTINCT e.eid,e.ename from employee e join certified c ON(e.eid=c.eid)
  2   join aircraft a ON(c.aid=a.aid) where a.aid NOT IN
  3  (select f.aid from routes r,flights f where f.rid!=r.routeid);

       EID ENAME                                                                
---------- ------------------------------                                       
 390487451 Lawrence Sperry                                                      
 269734834 George Wright                                                        
 573284895 Eric Cooper                                                          
 574489456 William Jones                                                        
 567354612 Lisa Walker                                                          
 556784565 Mark Young                                                           
 356187925 Robert Brown                                                         
  90873519 Elizabeth Taylor                                                     
 142519864 Betty Adams                                                          

9 rows selected.

SQL> 
SQL> REM: 6)Display the origin and destination of the flights having at least three departures with
SQL> maximum distance covered.
SP2-0734: unknown command beginning "maximum di..." - rest of line ignored.
SQL> 
SQL> select r.orig_airport,r.dest_airport,fl.departs from fl_schedule fl join flights f on(f.flightno=fl.flno)
  2  join routes r on(r.routeid=f.rid) where (distance = (select max(distance) from routes));

ORIG_AIRPORT         DEST_AIRPORT         DEPARTS                               
-------------------- -------------------- ---------                             
Los Angeles          Sydney               14-APR-05                             
Los Angeles          Sydney               21-APR-05                             
Los Angeles          Sydney               13-APR-05                             

SQL> 
SQL> REM: 7)Display name and salary of pilot whose salary is more than the average salary of any pilots
SQL> for each route other than flights originating from Madison airport.
SP2-0734: unknown command beginning "for each r..." - rest of line ignored.
SQL> 
SQL> select ename,salary from employee where salary > ANY(select avg(e.salary) from employee e join
  2  certified c on(e.eid=c.eid) join aircraft a on(a.aid=c.aid) join flights f on(f.aid=a.aid)
  3  join routes r on(r.routeid=f.rid) where r.dest_airport!='Madison');

ENAME                              SALARY                                       
------------------------------ ----------                                       
Lisa Walker                        256481                                       
Karen Scott                        205187                                       
Lawrence Sperry                    212156                                       
Angela Martinez                    212156                                       
Joseph Thompson                    212156                                       
Betty Adams                        227489                                       
George Wright                      289950                                       
David Anderson                     743001                                       
Mark Young                         205187                                       

9 rows selected.

SQL> 
SQL> REM: 8)Display the flight number, aircraft type, source and destination airport of the aircraft having
SQL> maximum number of flights to Honolulu.
SP2-0734: unknown command beginning "maximum nu..." - rest of line ignored.
SQL> 
SQL> select f.flightno,a.type,r.orig_airport,r.dest_airport from aircraft a
  2  join flights f ON(a.aid=f.aid) join routes r ON(r.routeid=f.rid)
  3  where dest_airport = 'Honolulu' and a.aid=(select a.aid from flights f
  4  join routes r on(f.rid=r.routeid) join aircraft a on(a.aid=f.aid) and
  5  r.dest_airport='Honolulu' group by a.aid having count(*) =
  6  (select max(c) as m from (select count(*) as c from flights f1,aircraft a1,routes r1
  7  where f1.rID=r1.routeID and a1.aid=f1.aid and r1.dest_airport='Honolulu'
  8   group by a1.aid)));

FLIGHTN TYPE       ORIG_AIRPORT         DEST_AIRPORT                            
------- ---------- -------------------- --------------------                    
HA-3    Airbus     Los Angeles          Honolulu                                
HA-1    Airbus     Los Angeles          Honolulu                                

SQL> 
SQL> REM: 9)Display the pilot(s) who are certified exclusively to pilot all aircraft in a type.
SQL> 
SQL> select e.eid,e.ename ,a.type from employee e join certified c
  2  on(c.eid=e.eid)
  3  join aircraft a on(a.aid=c.aid)
  4   where c.eid in
  5   (
  6           select c1.eid
  7           from certified c1, aircraft a1
  8           where c1.aid=a1.aid
  9           having count(distinct a1.type)=1
 10           group by c1.eid
 11   )
 12   group by a.type,e.ename,e.eid having count(*) =
 13  (select count(air.aid) from aircraft air where air.type=a.type) ;

       EID ENAME                          TYPE                                  
---------- ------------------------------ ----------                            
 287321212 Michael Miller                 Piper                                 
 574489457 Milo Brooks                    Schweizer                             
 390487451 Lawrence Sperry                Airbus                                
  90873519 Elizabeth Taylor               Saab                                  
 356187925 Robert Brown                   Saab                                  
 548977562 William Ward                   Piper                                 

6 rows selected.

SQL> 
SQL> REM: 10)Name the employee(s) who is earning the maximum salary among the airport having
SQL> maximum number of departures.
SP2-0734: unknown command beginning "maximum nu..." - rest of line ignored.
SQL> 
SQL>  SELECT distinct eid,ename,salary
  2      FROM employee e
  3      WHERE salary=(SELECT MAX(salary)
  4                    FROM employee e
  5                    JOIN certified c
  6                    USING(eid)
  7                    JOIN flights f
  8                    USING(aid)
  9        JOIN routes r
 10        ON(rid=r.routeid)
 11                  GROUP BY(orig_airport)
 12                    HAVING orig_airport=(SELECT orig_airport
 13                                         FROM routes r JOIN flights f
 14                                         ON(routeid=rid)
 15                                         GROUP BY orig_airport
 16                                         HAVING count(*)=(SELECT MAX(count(*))
 17                   FROM routes r JOIN flights f
 18                   ON(routeid=rid)
 19                   GROUP BY orig_airport)));

       EID ENAME                              SALARY                            
---------- ------------------------------ ----------                            
 269734834 George Wright                      289950                            

SQL> 
SQL> REM: 11)Display the departure chart as follows:
SQL> flight number, departure(date,airport,time), destination airport, arrival time, aircraft name
SP2-0734: unknown command beginning "flight num..." - rest of line ignored.
SQL> for the flights from New York airport during 15 to 19th April 2005. Make sure that the route
SP2-0734: unknown command beginning "for the fl..." - rest of line ignored.
SQL> contains at least two flights in the above specified condition.
SP2-0734: unknown command beginning "contains a..." - rest of line ignored.
SQL> 
SQL> select fl.flno,(fl.departs||' '||fl.dtime||' '||f.aid)"departure",
  2  r.dest_airport,fl.atime,a.aname from fl_schedule fl join flights f
  3   on (fl.flno=f.flightno) join routes r on(f.rid=r.routeid) join aircraft a
  4  on(a.aid=f.aid) where r.orig_airport='New York' and
  5   fl.departs between '15-apr-2005' and '19-apr-2005';

FLNO                                                                            
-------                                                                         
departure                                                                       
--------------------------------------------------------------------------------
DEST_AIRPORT              ATIME ANAME                                           
-------------------- ---------- ------------------------------                  
BA-178                                                                          
15-APR-05 1140 10                                                               
London                     1020 Boeing 757-300                                  
                                                                                
AF-11                                                                           
17-APR-05 1340 10                                                               
Paris                      1530 Boeing 757-300                                  

FLNO                                                                            
-------                                                                         
departure                                                                       
--------------------------------------------------------------------------------
DEST_AIRPORT              ATIME ANAME                                           
-------------------- ---------- ------------------------------                  
                                                                                
IB-4618                                                                         
18-APR-05 1310 9                                                                
London                     1150 Lockheed L1011 Tristar                          
                                                                                

SQL> 
SQL> 
SQL> REM: 12)A customer wants to travel from Madison to New York with no more than two changes of
SQL> flight. List the flight numbers from Madison if the customer wants to arrive in New York by
SP2-0734: unknown command beginning "flight. Li..." - rest of line ignored.
SQL> 6.50 p.m.
SP2-0042: unknown command "6.50 p.m." - rest of line ignored.
SQL> 
SQL> (select distinct f.flightno from flights f join routes r on(f.rid=r.routeid) join fl_schedule fl on(fl.flno=f.flightno)
  2  where r.orig_airport='Madison' and r.dest_airport='New York' and fl.atime<=1850)
  3  UNION
  4  (
  5  select distinct f.flightno from (flights f join routes r on(f.rid=r.routeid) join fl_schedule fl on(fl.flno=f.flightno))
  6  join ( flights f1 join routes r1 on(f1.rid=r1.routeid) join fl_schedule fl1 on (fl1.flno=f1.flightno))
  7  on(r.dest_airport = r1.orig_airport)
  8  where r.orig_airport ='Madison' and r1.dest_airport='New York' and fl.atime<= fl1.dtime and fl1.atime<=1850)
  9  UNION
 10  ( select distinct f.flightno from
 11  (
 12  (flights f join routes r on (f.rid=r.routeid) join fl_schedule fl on(fl.flno=f.flightno)
 13  )
 14  join
 15  ( flights f1 join routes r1 on (f1.rid=r1.routeid) join fl_schedule fl1 on(fl1.flno=f1.flightno)
 16  )
 17  on(r.dest_airport=r1.orig_airport)
 18  )
 19  join
 20  (flights f2 join routes r2 on(f2.rid=r2.routeid) join fl_schedule fl2 on(fl2.flno=f2.flightno)
 21  )
 22  on (r1.dest_airport=r2.orig_airport)
 23  where
 24  r.orig_airport = 'Madison' and r2.dest_airport='New York' and (fl.atime<=fl1.dtime)
 25   and (fl1.atime<=fl2.dtime) and fl2.atime<=1850);

FLIGHTN                                                                         
-------                                                                         
9E-3851                                                                         
FX-2351                                                                         
G7-6205                                                                         

SQL> 
SQL> 
SQL> REM: 13)Display the id and name of employee(s) who are not pilots.
SQL> 
SQL> SELECT distinct eid, ename
  2      FROM employee e
  3      WHERE e.eid IN (SELECT e1.eid
  4                      FROM employee e1
  5                   MINUS
  6                   SELECT c.eid
  7                   FROM certified c);

       EID ENAME                                                                
---------- ------------------------------                                       
 254099823 Patricia Jones                                                       
 489456522 Linda Davis                                                          
 489221823 Richard Jackson                                                      
 310454877 Chad Stewart                                                         
 552455348 Dorthy Lewis                                                         
 248965255 Barbara Wilson                                                       
 348121549 Haywood Kelly                                                        
 486512566 David Anderson                                                       
 619023588 Jennifer Thomas                                                      
  15645489 Donald King                                                          

10 rows selected.

SQL> 
SQL> REM: 14)Display the id and name of employee(s) who pilots the aircraft from Los Angels and Detroit
SQL> airport.
SP2-0042: unknown command "airport." - rest of line ignored.
SQL> 
SQL> SELECT distinct eid,ename
  2      FROM employee e
  3      JOIN certified c
  4      USING(eid)
  5      JOIN flights f
  6      USING(aid)
  7      JOIN routes r
  8      ON(rid=r.routeid)
  9      WHERE r.orig_airport='Los Angeles'
 10  INTERSECT
 11  SELECT distinct eid,ename
 12      FROM employee e
 13      JOIN certified c
 14      USING(eid)
 15      JOIN flights f
 16      USING(aid)
 17      JOIN routes r
 18      ON(rid=r.routeid)
 19      WHERE r.orig_airport='Detroit';

       EID ENAME                                                                
---------- ------------------------------                                       
 159542516 William Moore                                                        
 269734834 George Wright                                                        
 556784565 Mark Young                                                           
 567354612 Lisa Walker                                                          
 573284895 Eric Cooper                                                          

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> spool off;
