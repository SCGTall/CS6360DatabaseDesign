CUSTOMER (**AccountID**, Fname, Lname, DateOfBirth, SSN, UserName, Password, Payment, MailAddr, BillAddr, Phone, Email)

ADMIN (**AccountID**, Fname, Lname, DateOfBirth, SSN, UserName, Password)

BATCH (**BatchID**, **ProductID**[FK -> PRODUCT.ProductID], StoreNum, StockNum, StockDate)

PRODUCT (**ProductID**, Name, Price, Description, Image, ExpirationDate)

ORDER (**OrderID**, **AccountID**[FK -> CUSTOMER.AccountID], PurchaseDate, Comment) 

ORDERDETAIL (**OrderID**[FK -> ORDER.OrderID], Name, ProductID, Number, Price)

ORDER_OWN_PRODUCT (**OrderID**[FK -> ORDER.OrderID], **ProductID**[FK -> PRODUCT.ProductID], Number)

CART (**AccountID**[FK -> CUSTOMER.AccountID])

CART_OWN_PRODUCT (**AccountID**[FK -> CUSTOMER.AccountID], **ProductID**[FK -> PRODUCT.ProductID], number)

WISHLIST (**AccountID**[FK -> CUSTOMER.AccountID])

WISHLIST_OWN_PRODUCT (**AccountID**[FK -> CUSTOMER.AccountID], **ProductID**[FK -> PRODUCT.ProductID])

 

 