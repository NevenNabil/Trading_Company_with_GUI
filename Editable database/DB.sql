CREATE TABLE customer_category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(40),
PRIMARY KEY(ctg_id)
) ;

CREATE TABLE supplier_category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(40),
PRIMARY KEY(ctg_id)
) ;

CREATE TABLE product_category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(40),
PRIMARY KEY(ctg_id)
) ;

CREATE TABLE expenses_category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(40),
PRIMARY KEY(ctg_id)
) ;

CREATE TABLE cheque_category(
ctg_id int NOT NULL AUTO_INCREMENT,
ctg_name VARCHAR(40),
PRIMARY KEY(ctg_id)
) ;



CREATE TABLE region(
region_id int NOT NULL AUTO_INCREMENT,
region_name CHAR(20) NOT NULL,
PRIMARY KEY(region_id)
) ;

CREATE TABLE employee(
person_id int NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
nationalID VARCHAR(15) NOT NULL,
region_id int NOT NULL,
address VARCHAR(20),
birth_date date,
email VARCHAR(50),
salary decimal(15,2),
PRIMARY KEY(person_id),
FOREIGN KEY (region_id) REFERENCES region(region_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;

CREATE TABLE login(
emp_id int NOT NULL,
username VARCHAR(20) unique,
password VARCHAR(20) unique,
PRIMARY KEY(username,password),
FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ; 





CREATE TABLE role(
role_id int NOT NULL AUTO_INCREMENT,
role_name VARCHAR(20) ,
role_descibtion VARCHAR(20) ,
PRIMARY KEY(role_id)
) ;

CREATE TABLE permissions(
per_role_id int NOT NULL AUTO_INCREMENT,
per_name CHAR(20) NOT NULL,
PRIMARY KEY(per_role_id)
) ;

CREATE TABLE emp_has(
emp_id int NOT NULL,
role_id int NOT NULL,
per_role_id int NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY (role_id) REFERENCES role(role_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY (per_role_id) REFERENCES permissions(per_role_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;





CREATE TABLE customer(
person_id int NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
area VARCHAR(20),
address VARCHAR(20),
tax_no VARCHAR(25),
email VARCHAR(50),
ctg_id int NOT NULL,
PRIMARY KEY(person_id),
FOREIGN KEY (ctg_id) REFERENCES customer_category(ctg_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;

CREATE TABLE supplier(
person_id int NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
phone VARCHAR(15) NOT NULL,
area VARCHAR(20),
address VARCHAR(20),
tax_no VARCHAR(25),
email VARCHAR(50),
ctg_id int NOT NULL,
PRIMARY KEY(person_id),
FOREIGN KEY (ctg_id) REFERENCES supplier_category(ctg_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;

CREATE TABLE supplies(
person_id int NOT NULL,
prod_id int NOT NULL,
PRIMARY KEY(person_id, prod_id),
FOREIGN KEY (person_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;

CREATE TABLE bill_in(
bill_id int NOT NULL AUTO_INCREMENT,
bill_date date NOT NULL,
emp_id int NOT NULL,
bill_sup_id int NOT NULL,
PRIMARY KEY(bill_id)
) ;

CREATE TABLE bill_body_in(
bill_body_in_id int NOT NULL AUTO_INCREMENT,
bill_in_id int NOT NULL,
prod_id int NOT NULL,
quantity int(30) NOT NULL,
price decimal(6,1),
discount decimal(6,1) default 0.0,
PRIMARY KEY(bill_body_in_id)
) ;

CREATE TABLE bill_out(
bill_id int NOT NULL AUTO_INCREMENT,
bill_date date NOT NULL,
emp_id int NOT NULL,
bill_cus_id int NOT NULL,
PRIMARY KEY(bill_id)
) ;

CREATE TABLE bill_body_out(
bill_body_out_id int NOT NULL AUTO_INCREMENT,
bill_out_id int NOT NULL,
prod_id int NOT NULL,
quantity int(30) NOT NULL,
price decimal(6,1),
discount decimal(6,1) default 0.0,
PRIMARY KEY(bill_body_out_id)
) ;


CREATE TABLE product(
prod_id int NOT NULL AUTO_INCREMENT,
prod_name VARCHAR(20),
code VARCHAR(20) unique,
ctg_id int NOT NULL,
PRIMARY KEY(prod_id),
FOREIGN KEY (ctg_id) REFERENCES product_category(ctg_id)
   ON DELETE CASCADE  ON UPDATE CASCADE
) ;

CREATE TABLE stock(
stock_id int NOT NULL AUTO_INCREMENT,
prod_id int NOT NULL,
quantity int(255) NOT NULL,
price decimal(6,1),
PRIMARY KEY(stock_id)
) ;




    ALTER TABLE bill_in
 ADD CONSTRAINT in_bill_emp  FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT in_bill_sup   FOREIGN KEY (bill_sup_id) REFERENCES supplier(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_body_in
 ADD CONSTRAINT in_bodytohead  FOREIGN KEY (bill_in_id) REFERENCES bill_in(bill_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT in_prod_bill   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_out
 ADD CONSTRAINT out_bill_emp  FOREIGN KEY (emp_id) REFERENCES employee(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT out_bill_cus   FOREIGN KEY (bill_cus_id) REFERENCES customer(person_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
       ALTER TABLE bill_body_out
 ADD CONSTRAINT out_bodytohead  FOREIGN KEY (bill_out_id) REFERENCES bill_out(bill_id)
   ON DELETE CASCADE  ON UPDATE CASCADE,
 ADD CONSTRAINT out_prod_bill   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
	  ALTER TABLE stock
 ADD CONSTRAINT stock_id   FOREIGN KEY (prod_id) REFERENCES product(prod_id)
   ON DELETE CASCADE  ON UPDATE CASCADE;
   
   
   
   
INSERT INTO  region ( region_name)
VALUES ('Sarayat'),
('Zagazig'),
('Giza'),
('Shaqia'),
('Cairo');

INSERT INTO employee (name, phone ,nationalID ,region_id ,address ,birth_date ,email, salary )
VALUES  ('Niveen', '012589654458','42422523420','1','maamon','2021-12-03','neven40@gmail.com','4000'),
('Islam', '01525469523','424225423420','2','Khalifa','2021-12-03','islaam@gmail.com','3500'),
('Alaa', '01025436598','424422523420','3','El-Tahrir','2021-12-03','Alaa399@gmail.com','4500'),
('Ibrahim', '01232532697','424225234230','4','Fire El-Nasser','2021-12-03','Ibrahim38@gmail.com','6000'),
('Ali', '01025125463','424122523420','5','Ain Shams','2021-12-03','AliFikry200@gmail.com','7500');

INSERT INTO  login ( emp_id,username ,password)
VALUES ('1', 'n123','123'),
('2', 'Islam345','ert25vh'),
('3', 'Alaa125','dffr56hbb21'),
('4', 'Ibrahim654','wer12f52'),
('5', '1','1');
