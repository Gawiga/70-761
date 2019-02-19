USE AdventureWorks2016;

SELECT ProductID   
FROM Production.Product  
INTERSECT  
SELECT ProductID   
FROM Production.WorkOrder ;  
--Result: 238 Rows (products that have work orders)  


SELECT ProductID   
FROM Production.Product  
EXCEPT  
SELECT ProductID   
FROM Production.WorkOrder ;  
--Result: 266 Rows (products without work orders)  


/*--------------------------------------
--https://docs.microsoft.com/pt-br/sql/t-sql/language-elements/set-operators-except-and-intersect-transact-sql
--------------------------------------*/