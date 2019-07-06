/* count the rows in the employees table  */
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

/* selectin all cars starting with A */
	SELECT cars_model 
	FROM cars
	WHERE cars_model LIKE 'A%'

/* selecting the cars with more than 100 horsepower and also the firstname of the employee and customer */
	SELECT rental_car.rental_price_perDay, customer.cust_firstName, employees.emp_firstName 
	FROM rental_car
	INNER JOIN customer ON customer.cust_id = rental_car.cust_id
	INNER JOIN employees ON employees.emp_id = rental_car.emp_id
	WHERE rental_car.rental_horsepower > 100

/* selecting the car which is in the garage at the moment and already repaired plus the costs */

	SELECT garage.garage_status, garage.garage_cost, rental_car.rental_model
	FROM garage 
	INNER JOIN rental_car ON rental_car.rental_id = garage.rental_id
	WHERE garage.garage_status = 'Repaired'

/* listing the insurance type the customers full name, if they have a license and also the time where they want to rent the car*/
	SELECT insurance.ins_type, customer.cust_firstName, customer.cust_lastName, customer.license, rental_car.from_date, rental_car.to_date
	FROM insurance
	INNER JOIN customer ON customer.cust_id = insurance.cust_id
	INNER JOIN rental_car ON rental_car.rental_id = insurance.rental_id
	WHERE insurance.ins_type = 'Liability coverage'

/* showing the delivery date, the car model and the address */
	SELECT manufacturer.delivery_time, location.address, cars.cars_model
	FROM manufacturer
	INNER JOIN location ON location.man_nr = manufacturer.man_nr
	INNER JOIN cars ON cars.cars_id = manufacturer.cars_id
	LEFT JOIN shop ON shop.shop_nr =  location.shop_nr