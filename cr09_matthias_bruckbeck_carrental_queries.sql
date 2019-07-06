/* count the rows in the emplyoees table  */
	SELECT COUNT(*) 
	FROM employees;

/* show only the cities in which there is a shop */
	SELECT city, location.shop_nr 
	FROM location
	INNER JOIN shop ON location.shop_nr = shop.shop_nr 

/* show countries of customers born in 1995 */
	SELECT location.country, customer.cust_firstName
	FROM location
	LEFT JOIN customer ON customer.cust_id = location.cust_id
	WHERE YEAR(customer.cust_birth) LIKE '1995%'

	
