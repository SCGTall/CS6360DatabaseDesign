--init all
DROP TABLE WISHLIST_OWN_PRODUCT;
DROP TABLE WISHLIST;
DROP TABLE CART_OWN_PRODUCT;
DROP TABLE CART;
DROP TABLE ORDER_DETAIL;
DROP TABLE ORDER_OWN_PRODUCT;
DROP TABLE FOOD_ORDER;
DROP TABLE BATCH;
DROP TABLE PRODUCT;
DROP TABLE CUSTOMER;
DROP TABLE ADMIN;
--clear data
DELETE FROM CART_OWN_PRODUCT;
DELETE FROM BATCH;
DELETE FROM PRODUCT;
DELETE FROM CUSTOMER;
DELETE FROM ADMIN;
--output switch
SET SERVEROUTPUT ON;