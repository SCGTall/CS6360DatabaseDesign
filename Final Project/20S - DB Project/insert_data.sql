--insert data
INSERT INTO ADMIN (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password)
	VALUES (0, 'Charles', 'Lee', to_date('01/01/1997','mm/dd/yyyy'), '637021836', 'adminL', '123450');
INSERT INTO ADMIN (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password)
	VALUES (1, 'Maya', 'Mitchell', to_date('04/05/2000','mm/dd/yyyy'), '642023947', 'adminM', '123451');
INSERT INTO ADMIN (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password)
	VALUES (2, 'Yale', 'Holmes', to_date('06/08/2000','mm/dd/yyyy'), '642020982', 'adminH', '123452');

INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (100, 'Medhurst', 'Tess', to_date('01/29/1991','mm/dd/yyyy'), '473263311', 'medts', '6789321469', '4829571662449868', '4494 Wilson Avenue Plano TX 75023', '4494 Wilson Avenue Plano TX 75023', '7112659193', 'medts@gmail.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (101, 'Hayes', 'Mitchel', to_date('07/17/1972','mm/dd/yyyy'), '640270626', 'hymchel', '1289312', '5487744475243527', '932 Worthington Drive Plano TX 75074', '932 Worthington Drive Plano TX 75074', '6758447400', 'medts@outlook.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (102, 'Hegmann', 'Louie', to_date('12/28/1994','mm/dd/yyyy'), '428108007', 'medts', '341152341', '5132304934743739', '4223 Jones Street Plano TX 75074', '848 Liberty Street Plano TX 75074', '2668550710', 'medts@gmail.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (103, 'Nitzsche', 'Peter', to_date('04/27/1976','mm/dd/yyyy'), '254583012', 'medts', '411244', '4282707503474943', '3276 Bew Street Plano TX 75023', '3276 Bew Street Plano TX 75023', '5145318471', 'medts@gmail.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (104, 'Feest', 'Mac', to_date('02/23/1985','mm/dd/yyyy'), '574139459', 'medts', '46432343', '5363611860216070', '3344 Giraffe Hill Drive Plano TX 75074', '3344 Giraffe Hill Drive Plano TX 75074', '9662915045', 'medts@yahoo.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (105, 'Schimmel', 'Josue', to_date('07/19/1970','mm/dd/yyyy'), '216989805', 'medts', '123214634', '4785356083460880', '681 Ersel Street Plano TX 75024', '681 Ersel Street Plano TX 75024', '5199784733', 'medts@yahoo.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (106, 'Cassin', 'Mohammad', to_date('03/23/1995','mm/dd/yyyy'), '650225591', 'medts', '1234435', '4544744072628934', '625 Pike Street Plano TX 75023', '625 Pike Street Plano TX 75023', '9955654039', 'medts@gmail.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (107, 'Hand', 'Pierce', to_date('06/21/1984','mm/dd/yyyy'), '008563748', 'medts', '3126343', '5147150343069577', '855 Whispering Pines Circle Plano 75074', '4793 Worthington Drive TX 75074', '6204541799', 'medts@yahoo.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (108, 'Jast', 'Winton', to_date('05/07/1978','mm/dd/yyyy'), '004241896', 'medts', '123153213', '4428127299245099', '3627 Wilson avenue Richardson TX 75081', '3627 Wilson avenue Richardson TX 75081', '5476014382', 'medts@outlook.com');
INSERT INTO CUSTOMER (AccountID, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)
	VALUES (109, 'Satterfield', 'Amie', to_date('11/29/1983','mm/dd/yyyy'), '447210825', 'medts', '4533123', '4314861869792679', '2757 Lightning Point Drive Richardson TX 75080', '4891 Liberty Street Plano TX 75074', '8888729366', 'medts@gmail.com');

INSERT INTO PRODUCT (ProductID, Name, Price, Description, Image, ExpirationDate, Num)
	VALUES (0, 'chef cappuccino', 6.25, 'Highly recommend!', NULL, 1, 0);
INSERT INTO PRODUCT (ProductID, Name, Price, Description, Image, ExpirationDate, Num)
	VALUES (1, 'meemaw doughnut', 2.00, 'Meemaw special!', NULL, 1, 0);	
INSERT INTO PRODUCT (ProductID, Name, Price, Description, Image, ExpirationDate, Num)
	VALUES (2, 'rocky ice cream', 3.00, 'Zero or infinite.', NULL, 3, 0);
INSERT INTO PRODUCT (ProductID, Name, Price, Description, Image, ExpirationDate, Num)
	VALUES (3, 'llet tonnac', 10.00, 'Coming soon.', NULL, 1, 0);

INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (0, 0, 0, 5, to_date('04/24/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (1, 0, 0, 5, to_date('04/25/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (2, 1, 5, 20, to_date('04/25/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (3, 2, 0, 5, to_date('04/24/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (4, 2, 1, 5, to_date('04/25/2020','mm/dd/yyyy'));

INSERT INTO FOOD_ORDER (OrderID, AccountID, PurchaseDate, TotalPrice, Comments)
	VALUES (0, 100, to_date('04/25/2020','mm/dd/yyyy'), 33.77, 'First purchase.');
INSERT INTO FOOD_ORDER (OrderID, AccountID, PurchaseDate, TotalPrice, Comments)
	VALUES (1, 106, to_date('04/25/2020','mm/dd/yyyy'), 41.42, 'First purchase.');
INSERT INTO FOOD_ORDER (OrderID, AccountID, PurchaseDate, TotalPrice, Comments)
	VALUES (2, 109, to_date('04/25/2020','mm/dd/yyyy'), 18.16, 'First purchase.');

INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (0, 0, 2);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (0, 1, 4);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (0, 2, 2);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (1, 0, 2);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (1, 1, 10);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (2, 0, 1);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (2, 1, 1);
INSERT INTO ORDER_OWN_PRODUCT (OrderID, ProductID, Num)
	VALUES (2, 2, 2);

INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (0, 0, 'chef cappuccino', 6.25, 2);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (0, 1, 'meemaw doughnut', 2.0, 4);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (0, 2, 'rocky ice cream', 3.0, 2);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (1, 0, 'chef cappuccino', 6.25, 2);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (1, 1, 'meemaw doughnut', 2.00, 10);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (2, 0, 'chef cappuccino', 6.25, 1);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (2, 1, 'meemaw doughnut', 2.00, 1);
INSERT INTO ORDER_DETAIL (OrderID, ProductID, Name, Price, Num)
	VALUES (2, 2, 'rocky ice cream', 3.00, 2);

INSERT INTO CART (AccountID, TotalPrice)
	VALUES (101, 0);
INSERT INTO CART (AccountID, TotalPrice)
	VALUES (106, 0);

INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num)
	VALUES (101, 0, 2);
INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num)
	VALUES (101, 1, 2);
INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num)
	VALUES (101, 2, 2);
INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num)
	VALUES (106, 0, 2);
INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num)
	VALUES (106, 1, 10);

INSERT INTO WISHLIST (AccountID)
	VALUES (105);

INSERT INTO WISHLIST_OWN_PRODUCT (AccountID, ProductID)
	VALUES (105, 3);
						
