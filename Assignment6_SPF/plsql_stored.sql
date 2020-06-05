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
SQL> REM: Q1 Write a stored function to display the total number of
SQL> -- pizza's ordered by the given order number.
SQL> -- ************************************************************
SQL> drop FUNCTION total_pizza;

Function dropped.

SQL> CREATE FUNCTION total_pizza(oid IN orders.order_no%TYPE)
  2  RETURN int IS
  3  CURSOR c1 IS
  4  select * from order_list l join pizza p on(p.pizza_id=l.pizza_id);
  5  total number;
  6  BEGIN
  7  total:=0;
  8  FOR records in c1 LOOP
  9  if records.order_no=oid THEN
 10  total:= total + records.qty;
 11  END IF;
 12  END LOOP;
 13  return total;
 14  END total_pizza;
 15  /

Function created.

SQL> DECLARE
  2  oid orders.order_no%TYPE;
  3  total order_list.qty%TYPE;
  4  BEGIN
  5  oid:='&oid';
  6  total:=total_pizza(oid);
  7  IF  total = 0 THEN
  8  dbms_output.put_line(' No match ');
  9  ELSE
 10  dbms_output.put_line('Total order : '|| total);
 11  END IF;
 12  END;
 13  /
Enter value for oid: OP100
old   5: oid:='&oid';
new   5: oid:='OP100';
Total order : 11                                                                                                                                      

PL/SQL procedure successfully completed.

SQL> DECLARE
  2  oid orders.order_no%TYPE;
  3  total order_list.qty%TYPE;
  4  BEGIN
  5  oid:='&oid';
  6  total:=total_pizza(oid);
  7  IF  total = 0 THEN
  8  dbms_output.put_line(' No match ');
  9  ELSE
 10  dbms_output.put_line('Total order : '|| total);
 11  END IF;
 12  END;
 13  /
Enter value for oid: op231
old   5: oid:='&oid';
new   5: oid:='op231';
No match                                                                                                                                              

PL/SQL procedure successfully completed.

SQL> -- ************************************************************
SQL> REM: Q2 Write a PL/SQL block to calculate the total amount, discount and billable amount
SQL> --(Amount to be paid) as given below:
SQL> --For total amount > 2000 and total amount < 5000: Discount=5%
SQL> --For total amount > 5000 and total amount < 10000: Discount=10%
SQL> --For total amount > 10000: Discount=20%
SQL> --Calculate the billable amount (after the discount) and update the same in orders
SQL> --table.
SQL> --Bill Amount = Total - Discount.
SQL> -- ************************************************************
SQL> 
SQL> ALTER TABLE orders ADD total_amt number;

Table altered.

SQL> ALTER TABLE orders ADD bill_amt number;

Table altered.

SQL> 
SQL> CREATE OR REPLACE PROCEDURE bill  AS
  2  CURSOR c1 IS
  3  select * from order_list l join pizza p on(p.pizza_id= l.pizza_id);
  4  CURSOR c2 IS
  5  select * from orders FOR UPDATE OF total_amt, bill_amt;
  6  total number;
  7  bill number;
  8  BEGIN
  9  FOR ord IN c2 LOOP
 10  total:=0;
 11  bill:=0;
 12  FOR records IN c1 LOOP
 13  IF ord.order_no=records.order_no THEN
 14  total:= total + (records.unit_price*records.qty);
 15  END IF;
 16  
 17  IF total<2000 THEN
 18  bill:= total;
 19  ELSIF(total>2000 AND total<5000) THEN
 20  bill:= total*0.95;
 21  ELSIF (total > 5000 AND total<10000) THEN
 22  bill:= total*0.90;
 23  ELSE
 24  bill:= total*0.80;
 25  END IF;
 26  UPDATE orders SET total_amt= total where CURRENT OF c2;
 27  UPDATE orders SET bill_amt=bill where CURRENT OF c2;
 28  END LOOP;
 29  END LOOP;
 30  END bill;
 31  /

Procedure created.

SQL> DECLARE
  2  BEGIN
  3  bill();
  4  END;
  5  /

PL/SQL procedure successfully completed.

SQL> -- ************************************************************
SQL> REM: Q3 For the given order number, write a PL/SQL block to print the order as shown below:
SQL> -- Hint: Use the PL/SQL blocks created in 1 and 2..
SQL> -- ************************************************************
SQL> drop function final;

Function dropped.

SQL> CREATE FUNCTION final(oid IN orders.order_no%TYPE) RETURN int IS
  2  CURSOR c IS
  3  select* from orders o join customer c on(o.cust_id=c.cust_id);
  4  CURSOR c2 IS
  5  select* from order_list l join pizza p ON(p.pizza_id=l.pizza_id);
  6  flag number;
  7  sno number;
  8  tot number;
  9  tq number;
 10  dis number;
 11  BEGIN
 12  flag:=0;
 13  FOR records in c LOOP
 14  IF records.order_no=oid THEN
 15  bill();
 16  flag:=1;
 17  dbms_output.put_line('************************************************');
 18  dbms_output.put_line('Order  ' || records.order_no || chr(9)|| 'Customer Name ' || records.cust_name);
 19  dbms_output.put_line('Order Date  ' || records.order_date || '  Phone : ' || records.phone);
 20  dbms_output.put_line('************************************************');
 21  dbms_output.put_line('SNO'|| chr(9)||'PizzaType '|| chr(9)||'      Qty'|| chr(9)||'Unit Price'|| chr(9)||' Amount');
 22  sno:=1;
 23  tot:=0;
 24  tq:=0;
 25  FOR pizza_list IN c2 LOOP
 26  IF (pizza_list.order_no=oid) THEN
 27  dbms_output.put_line(sno || chr(9)|| pizza_list.pizza_type || chr(9)|| pizza_list.qty|| chr(9)|| pizza_list.unit_price|| chr(9)|| pizza_list.qty*pizza_list.unit_price);
 28  sno:=sno + 1;
 29  tq:= tq + pizza_list.qty;
 30  tot:=total_pizza(records.order_no);
 31  END IF;
 32  END LOOP;
 33  dbms_output.put_line('Total Quantity = ' || chr(9)||tot);
 34  dbms_output.put_line('************************************************');
 35  dbms_output.put_line('Total Amount : '|| records.total_amt);
 36  dis:=records.total_amt - records.bill_amt;
 37  dbms_output.put_line('Discount : '|| dis);
 38  dbms_output.put_line('************************************************');
 39  dbms_output.put_line('Amount to be paid : '|| records.bill_amt);
 40  dbms_output.put_line('************************************************');
 41  dbms_output.put_line('Great Offers! Discount up to 25% on DIWALI Festival Day...');
 42  dbms_output.put_line('************************************************');
 43  
 44  END IF;
 45  END LOOP;
 46  return flag;
 47  END final;
 48  /

Function created.

SQL> DECLARE
  2  flag number;
  3  oid orders.order_no%TYPE;
  4  BEGIN
  5  oid:='&oid';
  6  flag:= final(oid);
  7  IF flag=0 THEN
  8  dbms_output.put_line('No Order Found');
  9  END IF;
 10  END;
 11  /
Enter value for oid: OP100
old   5: oid:='&oid';
new   5: oid:='OP100';
************************************************
Order  OP100    Customer Name Hari
Order Date  28-JUN-15  Phone : 9001200031
************************************************
SNO     PizzaType             Qty       Unit Price       Amount
1       pan     3       130     390
2       grilled 2       230     460
3       italian 1       200     200
4       spanish 5       260     1300
Total Quantity =        11
************************************************
Total Amount : 2350
Discount : 117.5
************************************************
Amount to be paid : 2232.5
************************************************
Great Offers! Discount up to 25% on DIWALI Festival Day...
************************************************

PL/SQL procedure successfully completed.

SQL> SPOOL OFF;
