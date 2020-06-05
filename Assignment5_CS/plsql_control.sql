SQL> drop table order_list;

Table dropped.

SQL> drop table orders;

Table dropped.

SQL> drop table pizza;

Table dropped.

SQL> drop table customer;

Table dropped.

SQL> 
SQL> create table customer
  2  (
  3  cust_id VARCHAR(5),
  4  cust_name VARCHAR2(20),
  5  address VARCHAR2(30),
  6  phone number(10),
  7  CONSTRAINT pk_customer PRIMARY KEY(cust_id)
  8  );

Table created.

SQL> create table pizza
  2  (
  3  pizza_id VARCHAR2(5),
  4  pizza_type VARCHAR2(20),
  5  unit_price number(5),
  6  CONSTRAINT pk_pizza PRIMARY KEY(pizza_id)
  7  );

Table created.

SQL> create table orders
  2  (
  3  order_no VARCHAR2(20),
  4  cust_id VARCHAR2(5),
  5  order_date DATE,
  6  delv_date DATE,
  7  CONSTRAINT pk_orders PRIMARY KEY(order_no),
  8  CONSTRAINT fk_custid FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
  9  );

Table created.

SQL> create table order_list
  2  (
  3  order_no VARCHAR2(20),
  4  pizza_id VARCHAR2(20),
  5  qty number(2),
  6  CONSTRAINT pk_orderList PRIMARY KEY(order_no,pizza_id),
  7  CONSTRAINT fk_orderNo FOREIGN KEY(order_no) REFERENCES orders(order_no),
  8  CONSTRAINT fk_pizzaID FOREIGN KEY(pizza_id) REFERENCES pizza(pizza_id)
  9  );

Table created.

SQL> 
SQL> @D:/a5/Pizza_DB.sql
SQL> --*****************************************************
SQL> --UCS1412				     B.Senthil Kumar
SQL> --Database Lab			     Asst. Prof
SQL> -- 			 Computer Science Department
SQL> -- 			  SSN College of Engineering
SQL> -- 				  senthil@ssn.edu.in
SQL> --*****************************************************
SQL> -- 	       PIZZA ORDERING DATASET
SQL> -- 		Version 1.0
SQL> -- 	       February 05, 2015
SQL> --*****************************************************
SQL> --Sources:
SQL> -- 	This dataset is prepared for the assignment
SQL> --      on DML, PL/SQL blocks in Database Programming.
SQL> --      This is a test dataset - pizza ordered on 28 & 29th Jun 2015.
SQL> --      Do NOT MODIFY the instances.
SQL> --
SQL> --******************************************************
SQL> 
SQL> 
SQL> REm customer(cust_id, cust_name, address, phone)
SQL> REM pizza (pizza_id, pizza_type, unit_price)
SQL> REM orders(order_no, cust_id, order_date ,delv_date, total_amt)
SQL> REM order_list(order_no, pizza_id, qty)
SQL> 
SQL> 
SQL> REM ------------------------------------------------------------------------------------------
> 
SQL> REM customer(cust_id, cust_name,address,phone)
SQL> 
SQL> insert into customer values('c001','Hari','32 RING ROAD,ALWARPET',9001200031);

1 row created.

SQL> insert into customer values('c002','Ashok','42 bull ROAD,numgambakkam',9444120003);

1 row created.

SQL> insert into customer values('c003','Raj','12a RING ROAD,ALWARPET',9840112003);

1 row created.

SQL> insert into customer values('c004','Raghu','P.H ROAD,Annanagar',9845712993);

1 row created.

SQL> insert into customer values('c005','Sindhu','100 feet ROAD,vadapalani',9840166677);

1 row created.

SQL> insert into customer values('c006','Brinda','GST ROAD, TAMBARAM', 9876543210);

1 row created.

SQL> 
SQL> 
SQL> 
SQL> REM pizza (pizza_id, pizza_type, unit_price)
SQL> 
SQL> insert into pizza values('p001','pan',130);

1 row created.

SQL> insert into pizza values('p002','grilled',230);

1 row created.

SQL> insert into pizza values('p003','italian',200);

1 row created.

SQL> insert into pizza values('p004','spanish',260);

1 row created.

SQL> 
SQL> REM insert into pizza values('p005','supremo',250);
SQL> 
SQL> 
SQL> 
SQL> REM orders(order_no, cust_id, order_date ,delv_date)
SQL> 
SQL> insert into orders values('OP100','c001','28-JUN-2015','30-JUN-2015');

1 row created.

SQL> insert into orders values('OP200','c002','28-JUN-2015','30-JUN-2015');

1 row created.

SQL> insert into orders values('OP300','c003','29-JUN-2015','01-JUL-2015');

1 row created.

SQL> insert into orders values('OP400','c004','29-JUN-2015','01-JUL-2015');

1 row created.

SQL> insert into orders values('OP500','c001','29-JUN-2015','01-JUL-2015');

1 row created.

SQL> insert into orders values('OP600','c002','29-JUN-2015','01-JUL-2015');

1 row created.

SQL> 
SQL> 
SQL> 
SQL> REM order_list(order_no, pizza_id, qty)
SQL> 
SQL> insert into order_list values('OP100','p001',3);

1 row created.

SQL> insert into order_list values('OP100','p002',2);

1 row created.

SQL> insert into order_list values('OP100','p003',1);

1 row created.

SQL> insert into order_list values('OP100','p004',5);

1 row created.

SQL> 
SQL> insert into order_list values('OP200','p003',2);

1 row created.

SQL> insert into order_list values('OP200','p001',6);

1 row created.

SQL> insert into order_list values('OP200','p004',8);

1 row created.

SQL> 
SQL> insert into order_list values('OP300','p003',3);

1 row created.

SQL> 
SQL> insert into order_list values('OP400','p001',3);

1 row created.

SQL> insert into order_list values('OP400','p004',1);

1 row created.

SQL> 
SQL> insert into order_list values('OP500','p003',6);

1 row created.

SQL> insert into order_list values('OP500','p004',5);

1 row created.

SQL> insert into order_list values('OP500','p001',2);

1 row created.

SQL> 
SQL> insert into order_list values('OP600','p002',3);

1 row created.

SQL> 
SQL> --******************************************************
SQL> CLEAR SCREEN;

SQL> SET ECHO ON;
SQL> SET SERVEROUTPUT ON;
SQL> SET LINESIZE 150;
SQL> -- ************************************************************
SQL> REM: Q1 Check Whether the given pizza type is available or not
SQL> 
SQL> -- ************************************************************
SQL> 
SQL> CREATE OR REPLACE PROCEDURE check_pizza_type(p_type IN pizza.pizza_type%TYPE) AS
  2  CURSOR p IS
  3  SELECT *
  4  FROM pizza;
  5  c number;
  6  BEGIN
  7  c:=0;
  8  FOR pizza_rec IN p LOOP
  9  IF pizza_rec.pizza_type=p_type THEN
 10  c:=c + 1;
 11  END IF;
 12  END LOOP;
 13  IF  c = 0 THEN
 14  dbms_output.put_line(' No matching pizza type in database ');
 15  ELSE
 16  dbms_output.put_line('Match found!');
 17  END IF;
 18  END check_pizza_type;
 19  /

Procedure created.

SQL> DECLARE
  2  p_type pizza.pizza_type%TYPE;
  3  BEGIN
  4  p_type:= '&pizza_type';
  5  check_pizza_type(p_type);
  6  END;
  7  /
Enter value for pizza_type: pan
old   4: p_type:= '&pizza_type';
new   4: p_type:= 'pan';
Match found!                                                                                                                                          

PL/SQL procedure successfully completed.

SQL> DECLARE
  2  p_type pizza.pizza_type%TYPE;
  3  BEGIN
  4  p_type:= '&pizza_type';
  5  check_pizza_type(p_type);
  6  END;
  7  /
Enter value for pizza_type: paparazi
old   4: p_type:= '&pizza_type';
new   4: p_type:= 'paparazi';
No matching pizza type in database                                                                                                                    

PL/SQL procedure successfully completed.

SQL> -- ************************************************************
SQL> REM: Q2 For the given customer name and a range of order date, find whether a customer had
SQL> -- placed any order, if so display the number of orders placed by the customer along
SQL> -- with the order number(s).
SQL> -- ************************************************************
SQL> 
SQL> CREATE OR REPLACE PROCEDURE placed(
  2  name IN customer.cust_name%TYPE,
  3  start_date IN DATE,
  4  end_date IN DATE) AS
  5  CURSOR c IS
  6  SELECT * from orders o
  7  join customer c ON(o.cust_id=c.cust_id);
  8  nos NUMBER;
  9  BEGIN
 10  nos:=0;
 11  FOR records IN c LOOP
 12  IF records.cust_name=name AND  records.order_date>=start_date AND records.order_date<=end_date  THEN
 13  nos:= nos + 1;
 14  dbms_output.put_line('Order Found ! Order No' || records.order_no);
 15  END IF;
 16  END LOOP;
 17  IF nos=0 THEN
 18  dbms_output.put_line('No orders Found !');
 19  ELSE
 20  dbms_output.put_line('Number of orders: ' || nos);
 21  END IF;
 22  END placed;
 23  /

Procedure created.

SQL> 
SQL> DECLARE
  2  name customer.cust_name%TYPE;
  3  start_date DATE;
  4  end_date DATE;
  5  BEGIN
  6  name:='&customer_name';
  7  start_date:= '&start_date';
  8  end_date:= '&end_date';
  9  placed(name,start_date,end_date);
 10  END;
 11  /
Enter value for customer_name: Hari
old   6: name:='&customer_name';
new   6: name:='Hari';
Enter value for start_date: 22-JUN-2015
old   7: start_date:= '&start_date';
new   7: start_date:= '22-JUN-2015';
Enter value for end_date: 22-JUL-2015
old   8: end_date:= '&end_date';
new   8: end_date:= '22-JUL-2015';
Order Found ! Order NoOP100                                                                                                                           
Order Found ! Order NoOP500                                                                                                                           
Number of orders: 2                                                                                                                                   

PL/SQL procedure successfully completed.

SQL> 
SQL> DECLARE
  2  name customer.cust_name%TYPE;
  3  start_date DATE;
  4  end_date DATE;
  5  BEGIN
  6  name:='&customer_name';
  7  start_date:= '&start_date';
  8  end_date:= '&end_date';
  9  placed(name,start_date,end_date);
 10  END;
 11  /
Enter value for customer_name: Hari
old   6: name:='&customer_name';
new   6: name:='Hari';
Enter value for start_date: 29-JUN-2015
old   7: start_date:= '&start_date';
new   7: start_date:= '29-JUN-2015';
Enter value for end_date: 04-JUL-2015
old   8: end_date:= '&end_date';
new   8: end_date:= '04-JUL-2015';
Order Found ! Order NoOP500                                                                                                                           
Number of orders: 1                                                                                                                                   

PL/SQL procedure successfully completed.

SQL> -- ****************************************************************************************
SQL> -- Q3 Display the customer name along with the details of pizza type and its quantity
SQL> --    ordered for the given order number. Also find the total quantity ordered for the given
SQL> --    order number as shown below:
SQL> -- ****************************************************************************************
SQL> 
SQL> CREATE OR REPLACE PROCEDURE details(
  2  ono orders.order_no%TYPE
  3  ) AS
  4  CURSOR c1 IS
  5  select * from  orders o join customer c ON(o.cust_id=c.cust_id);
  6  CURSOR c2 IS
  7  select * from order_list l join pizza p ON(p.pizza_id=l.pizza_id);
  8  nos number:=0;
  9  BEGIN
 10  FOR records IN c1 LOOP
 11  IF records.order_no = ono THEN
 12  dbms_output.put_line('Customer Name: ' || records.cust_name);
 13  dbms_output.put_line('Ordered the Following Pizzas');
 14  dbms_output.put_line('PIZZA TYPE' || chr(9) || 'QTY');
 15  FOR pizza_records in c2 LOOP
 16  IF pizza_records.order_no=records.order_no THEN
 17  dbms_output.put_line(pizza_records.pizza_type || chr(9) || chr(9) || pizza_records.qty);
 18  nos := nos + pizza_records.qty;
 19  END IF;
 20  END LOOP;
 21  END IF;
 22  END LOOP;
 23  if nos=0 THEN
 24  dbms_output.put_line('No orders Found!');
 25  ELSE
 26  dbms_output.put_line('Total Quantity:' || nos);
 27  END IF;
 28  END details;
 29  /

Procedure created.

SQL> 
SQL> 
SQL> DECLARE
  2  ono orders.order_no%TYPE;
  3  BEGIN
  4  ono:= '&ono';
  5  details(ono);
  6  END;
  7  /
Enter value for ono: OP100
old   4: ono:= '&ono';
new   4: ono:= 'OP100';
Customer Name: Hari                                                                                                                                   
Ordered the Following Pizzas                                                                                                                          
PIZZA TYPE	QTY                                                                                                                                        
pan		3                                                                                                                                                
grilled		2                                                                                                                                            
italian		1                                                                                                                                            
spanish		5                                                                                                                                            
Total Quantity:11                                                                                                                                     

PL/SQL procedure successfully completed.

SQL> 
SQL> DECLARE
  2  ono orders.order_no%TYPE;
  3  BEGIN
  4  ono:= '&ono';
  5  details(ono);
  6  END;
  7  /
Enter value for ono: OP203
old   4: ono:= '&ono';
new   4: ono:= 'OP203';
No orders Found!                                                                                                                                      

PL/SQL procedure successfully completed.

SQL> -- ****************************************************************************************
SQL> -- Q4 Display the total number of orders that contains one pizza type, two pizza type
SQL> --    and so on
SQL> -- ****************************************************************************************
SQL> 
SQL> CREATE OR REPLACE PROCEDURE order_types
  2   AS
  3  CURSOR c1 IS
  4  select count(DISTINCT pizza_type) AS nos,order_no  from order_list l join pizza p ON(p.pizza_id=l.pizza_id) group by order_no;
  5  counts number;
  6  BEGIN
  7  FOR count_type IN 1..4 LOOP
  8  counts:=0;
  9  FOR records in c1 LOOP
 10  if(records.nos=count_type) THEN
 11  counts:= counts + 1;
 12  END IF;
 13  END LOOP;
 14  dbms_output.put_line('Orders having  ' || count_type || ' pizza type :  ' || counts);
 15  END LOOP;
 16  END order_types;
 17  /

Procedure created.

SQL> DECLARE
  2  BEGIN
  3  order_types();
  4  END;
  5  /
Orders having  1 pizza type :  2                                                                                                                      
Orders having  2 pizza type :  1                                                                                                                      
Orders having  3 pizza type :  2                                                                                                                      
Orders having  4 pizza type :  1                                                                                                                      

PL/SQL procedure successfully completed.

SQL> SPOOL OFF;
