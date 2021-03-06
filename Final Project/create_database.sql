CREATE TABLE CUSTOMER (
	AccountID	INT,
	Fname		VARCHAR(25) NOT NULL,
	Lname		VARCHAR(25) NOT NULL,
	DateOfBirth	DATE,
	SSN			CHAR(9),
	UserName	VARCHAR(25) NOT NULL,
	Password	VARCHAR(25) NOT NULL,
	Payment		VARCHAR(20) NOT NULL,
	MailAddr	CHAR(50) NOT NULL,
	BillAddr	CHAR(50) NOT NULL,
	Phone		CHAR(10),
	Email		VARCHAR(40),
	PRIMARY KEY	(AccountID)
);

CREATE TABLE ADMIN (
	AccountID	INT,
	Fname		VARCHAR(25) NOT NULL,
	Lname		VARCHAR(25) NOT NULL,
	DateOfBirth	DATE,
	SSN			CHAR(9),
	UserName	VARCHAR(25) NOT NULL,
	Password	VARCHAR(25) NOT NULL,
	PRIMARY KEY (AccountID)
);

CREATE TABLE PRODUCT (
	ProductID	INT,
	Name		VARCHAR(50) NOT NULL,
	Price		DECIMAL(10, 2) NOT NULL,
	Description	VARCHAR(200),
	Image		VARCHAR(50),
	ExpirationDate	INT NOT NULL,
	Num	        INT NOT NULL,
	PRIMARY KEY (ProductID)
);

CREATE TABLE BATCH (
	BatchID		INT,
	ProductID   INT NOT NULL,
	StoreNum	INT NOT NULL,
	StockNum	INT NOT NULL,
	StockDate	DATE NOT NULL,
	PRIMARY KEY (BatchID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);

CREATE TABLE FOOD_ORDER (
	OrderID		INT,
	AccountID	INT NOT NULL,
	PurchaseDate	DATE NOT NULL,
	TotalPrice	DECIMAL(10, 2) NOT NULL,
	Comments	VARCHAR(200),
	PRIMARY KEY (OrderID),
	FOREIGN KEY (AccountID) REFERENCES CUSTOMER(AccountID) ON DELETE CASCADE
);

CREATE TABLE ORDER_OWN_PRODUCT (
	OrderID		INT,
	ProductID	INT,
	Num 	    INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES FOOD_ORDER(OrderID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);

CREATE TABLE ORDER_DETAIL (
	OrderID		INT,
	ProductID	INT,
	Name		VARCHAR(50) NOT NULL,
	Price		DECIMAL(10, 2) NOT NULL,
	Num 	    INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES FOOD_ORDER(OrderID) ON DELETE CASCADE
);

CREATE TABLE CART (
	AccountID	INT NOT NULL,
	TotalPrice	DECIMAL(10, 2) NOT NULL,
	PRIMARY KEY (AccountID),
	FOREIGN KEY (AccountID) REFERENCES CUSTOMER(AccountID) ON DELETE CASCADE
);

CREATE TABLE CART_OWN_PRODUCT (
	AccountID	INT,
	ProductID	INT,
	Num		INT NOT NULL,
	PRIMARY KEY (AccountID, ProductID),
	FOREIGN KEY (AccountID) REFERENCES CUSTOMER(AccountID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);

CREATE TABLE WISHLIST (
	AccountID	INT NOT NULL,
	PRIMARY KEY (AccountID),
	FOREIGN KEY (AccountID) REFERENCES CUSTOMER(AccountID) ON DELETE CASCADE
);

CREATE TABLE WISHLIST_OWN_PRODUCT (
	AccountID	INT,
	ProductID	INT,
	PRIMARY KEY (AccountID, ProductID),
	FOREIGN KEY (AccountID) REFERENCES CUSTOMER(AccountID) ON DELETE CASCADE,
	FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);
