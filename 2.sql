/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

select P.Name as ProductName, C.Name as CategoryName
From products as P
Inner Join categories as C
ON C.CategoryID = P.CategoryID
Where C.Name = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

select P.Name, p.price, r.rating from products as p
inner join reviews as r on r.ProductID = p.ProductID
Where r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

Select e.FirstName, e.LastName, Sum(s.Quantity) as total 
from sales as s
inner join employees as e on e.EmployeeID = s.EmployeeID
group by e.EmployeeID
order by total desc
limit 2;


/* joins: find the name of the department, and the name of the category for Appliances and Games */

Select d.Name as 'Department Name', c.Name as 'Catergory Name' FROM departments as d
inner join categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

SELECT p.Name, SUM(s.Quantity) as 'Total Sold', SUM(s.Quantity * s.PricePerUnit) as 'Total Price'
FROM Products as p
inner join sales as s on s.ProductID = p.ProductID
where p.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.Name, r.Reviewer, r.Rating, r.Comment
FROM products as p
INNER JOIN reviews as r ON r.ProductID = p.ProductID
WHERE p.ProductID = 857 AND r.Rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, SUM(s.Quantity) as TotalSold
FROM sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductId = s.ProductID
Group By e.EmployeeID, p.ProductID;

/*finished*/