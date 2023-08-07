Build Trading Company System | Python & PyQt5 & MYSQLdb

// features provided by the application
	 the movement of the products into the stock from suppliers and from the stock to the customers 
	 Each movement considered as a bill with all required information
	 either bill in from supplier (invoice) or bill out to customer (burchase)
	 The system also manages the products and their categories 
	 manages information of employees' roles and permissions
	 manages customers and suppliers' information and orders from suppliers to customers.
	 some employees have permisiion to add, edit, delete data.
	 the system also have stock where price and remaining quantity of each product are stored.

// steps to run the Trading Company application successfully
1- setup Mysql on Your computer
2- open 'trading_company_DB.sql' with any editor --> copy all the code in the file
3- go to mysql workbench --> file --> new Query tab --> paste the code and select all then run it
4- refresh all schemas then trading_company schema will simply appear
5- note that by defult you have one employee named 'Ali' and his login username is '1' & password is '1'
you can simply change these data and click apply
6- I used some libraries you may need to install them (pyqt5, mysqldb and python for sure)
7- simply run the 'trading_company.py' file to start the program .
