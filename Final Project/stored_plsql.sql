--Trigger1 Update TotalPrice in CART after update CART_OWN_PRODUCT
CREATE or REPLACE TRIGGER UpdateCartPriceForInsert
after INSERT on CART_OWN_PRODUCT
FOR EACH ROW
DECLARE
price           PRODUCT.Price%TYPE;
old_total_price CART.TotalPrice%TYPE;
total_price     CART.TotalPrice%TYPE;
BEGIN
	SELECT Price INTO price FROM PRODUCT WHERE :NEW.ProductID = PRODUCT.ProductID;
    SELECT TotalPrice INTO old_total_price FROM CART WHERE :NEW.AccountID = CART.AccountID;
    total_price := old_total_price + price * :NEW.Num;
    UPDATE CART SET TotalPrice = total_price WHERE :NEW.AccountID = CART.AccountID;
    DBMS_OUTPUT.put_line('Updated customer ' || :NEW.AccountID || '''s cart total price from $' || old_total_price || ' to $' || total_price);
END;

CREATE or REPLACE TRIGGER UpdateCartPriceForUpdate
after UPDATE on CART_OWN_PRODUCT
FOR EACH ROW
DECLARE
price           PRODUCT.Price%TYPE;
old_total_price CART.TotalPrice%TYPE;
total_price     CART.TotalPrice%TYPE;
BEGIN
	SELECT Price INTO price FROM PRODUCT WHERE :NEW.ProductID = PRODUCT.ProductID;
    SELECT TotalPrice INTO old_total_price FROM CART WHERE :NEW.AccountID = CART.AccountID;
    total_price := old_total_price + price * (:NEW.Num - :OLD.Num);
    UPDATE CART SET TotalPrice = total_price WHERE :NEW.AccountID = CART.AccountID;
    DBMS_OUTPUT.put_line('Updated customer ' || :NEW.AccountID || '''s cart total price from $' || old_total_price || ' to $' || total_price);
END;

CREATE or REPLACE TRIGGER UpdateCartPriceForDelete
after DELETE on CART_OWN_PRODUCT
FOR EACH ROW
DECLARE
price           PRODUCT.Price%TYPE;
old_total_price CART.TotalPrice%TYPE;
total_price     CART.TotalPrice%TYPE;
BEGIN
	SELECT Price INTO price FROM PRODUCT WHERE :OLD.ProductID = PRODUCT.ProductID;
    SELECT TotalPrice INTO old_total_price FROM CART WHERE :OLD.AccountID = CART.AccountID;
    total_price := old_total_price - price * :OLD.Num;
    UPDATE CART SET TotalPrice = total_price WHERE :OLD.AccountID = CART.AccountID;
    DBMS_OUTPUT.put_line('Updated customer ' || :OLD.AccountID || '''s cart total price from $' || old_total_price || ' to $' || total_price);
END;


INSERT INTO CART_OWN_PRODUCT (AccountID, ProductID, Num) VALUES (106, 2, 3);
UPDATE CART_OWN_PRODUCT SET Num = 5 WHERE (AccountID = 106 AND ProductID = 2);
DELETE FROM CART_OWN_PRODUCT WHERE (AccountID = 106 AND ProductID = 2);

--Trigger2 Update Num in PRODUCT after update BATCH
CREATE or REPLACE TRIGGER UpdateProductNumForInsert
after INSERT on BATCH
FOR EACH ROW
DECLARE
old_num         PRODUCT.Num%TYPE;
new_num         PRODUCT.Num%TYPE;
BEGIN
	SELECT Num INTO old_num FROM PRODUCT WHERE :NEW.ProductID = PRODUCT.ProductID;
    new_num := old_num + :NEW.StoreNum;
    UPDATE PRODUCT SET Num = new_num WHERE :NEW.ProductID = PRODUCT.ProductID;
    DBMS_OUTPUT.put_line('Updated product ' || :NEW.ProductID || '''s number from ' || old_num || ' to ' || new_num);
END;

CREATE or REPLACE TRIGGER UpdateProductNumForUpdate
after Update on BATCH
FOR EACH ROW
DECLARE
old_num         PRODUCT.Num%TYPE;
new_num         PRODUCT.Num%TYPE;
BEGIN
	SELECT Num INTO old_num FROM PRODUCT WHERE :NEW.ProductID = PRODUCT.ProductID;
    new_num := old_num + (:NEW.StoreNum - :OLD.StoreNum);
    UPDATE PRODUCT SET Num = new_num WHERE :NEW.ProductID = PRODUCT.ProductID;
    DBMS_OUTPUT.put_line('Updated product ' || :NEW.ProductID || '''s number from ' || old_num || ' to ' || new_num);
END;

CREATE or REPLACE TRIGGER UpdateProductNumForDelete
after DELETE on BATCH
FOR EACH ROW
DECLARE
old_num         PRODUCT.Num%TYPE;
new_num         PRODUCT.Num%TYPE;
BEGIN
	SELECT Num INTO old_num FROM PRODUCT WHERE :OLD.ProductID = PRODUCT.ProductID;
    new_num := old_num - :OLD.StoreNum;
    UPDATE PRODUCT SET Num = new_num WHERE :OLD.ProductID = PRODUCT.ProductID;
    DBMS_OUTPUT.put_line('Updated product ' || :OLD.ProductID || '''s number from ' || old_num || ' to ' || new_num);
END;

DELETE FROM BATCH WHERE BatchID = 100;

INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate) VALUES (100, 3, 10, 10, to_date('04/25/2020','mm/dd/yyyy'));
UPDATE BATCH SET StoreNum = 5 WHERE BatchID = 100;
DELETE FROM BATCH WHERE BatchID = 100;

--Procedure1 Daily summary
CREATE OR REPLACE PROCEDURE DailySummary (daily_sum OUT FOOD_ORDER.TotalPrice%TYPE, inp_date IN FOOD_ORDER.PurchaseDate%TYPE DEFAULT SYSDATE) AS
    CURSOR order_cur IS SELECT * FROM FOOD_ORDER;
    order_row           FOOD_ORDER%ROWTYPE;
BEGIN
    daily_sum := 0;
    OPEN order_cur;
	LOOP
        FETCH order_cur INTO order_row;
		EXIT WHEN (order_cur%NOTFOUND);
        IF (inp_date = order_row.PurchaseDate) THEN
            daily_sum := daily_sum + order_row.TotalPrice;
            DBMS_OUTPUT.put_line('An order earns $' || order_row.TotalPrice);
        END IF;
    END LOOP;
    CLOSE order_cur;
    DBMS_OUTPUT.put_line('In ' || to_char(inp_date, 'mm/dd/yyyy') || ', we earned $' || daily_sum);
END;

DECLARE
daily_sum FOOD_ORDER.TotalPrice%TYPE;
BEGIN
DBMS_OUTPUT.put_line('DailySummary：');
DailySummary (daily_sum, to_date('04/25/2020', 'mm/dd/yyyy'));
END;

--Procedure2 Remove Explired Food Batch
CREATE OR REPLACE PROCEDURE RemoveExpiredFood(inpDate IN FOOD_ORDER.PurchaseDate%TYPE DEFAULT SYSDATE) AS
	product_row         PRODUCT%ROWTYPE;
	difference          INTEGER;
    batch_row           BATCH%ROWTYPE;
    CURSOR batch_cur IS SELECT * FROM BATCH;
BEGIN
	OPEN batch_cur;
    LOOP
        FETCH batch_cur INTO batch_row;
		EXIT WHEN (batch_cur%NOTFOUND);
        SELECT * INTO product_row FROM PRODUCT WHERE PRODUCT.ProductID = batch_row.ProductID;
		difference := ROUND(to_number(inpDate - batch_row.StockDate), 0);
		IF (difference > product_row.ExpirationDate) THEN
            IF (batch_row.StoreNum > 0) THEN
                DBMS_OUTPUT.put_line('Remove ' || batch_row.StoreNum || ' expirted ' || product_row.Name || '(s)');
            END IF;
			DELETE FROM BATCH WHERE BATCH.BatchID = batch_row.BatchID;
		END IF;
    END LOOP;
	CLOSE batch_cur;
    DBMS_OUTPUT.put_line('Removed all expired food.');
END;

INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (0, 0, 0, 5, to_date('04/24/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (1, 0, 0, 5, to_date('04/25/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (2, 1, 5, 20, to_date('04/25/2020','mm/dd/yyyy'));
INSERT INTO BATCH (BatchID, ProductID, StoreNum, StockNum, StockDate)
	VALUES (3, 2, 0, 5, to_date('04/24/2020','mm/dd/yyyy'));

BEGIN
RemoveExpiredFood (to_date('04/28/2020', 'mm/dd/yyyy'));
END;