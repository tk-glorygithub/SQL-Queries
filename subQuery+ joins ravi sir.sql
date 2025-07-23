--1 Retrieve the OrderID, CustomerName, ProductName, and OrderDate for all orders.
SELECT OrderID ,CUSTOMERNAME, ProdName ,OrderDate
on order O  inner join customer C
on O.customerId = C.customerId
 inner join product P
 on O.prodId = P.prodId

--2 Find the total quantity of products ordered by each customer. Display the CustomerName and the total quantity.
SELECT CNAME , SUM(ProductName)
from