CREATE OR REPLACE FUNCTION  retrievecustomers(index1 integer, index2 integer)
RETURNS TABLE(customer_id integer, store_id smallint, first_name VARCHAR(45), last_name VARCHAR(45), 
				email VARCHAR(50), address_id smallint, activebool boolean, create_date date, active integer) AS
$$
BEGIN
IF index1 < 0 OR index1 > 600 OR index2 < 0 OR index2 > 600 OR index1 > index2 THEN
raise notice 'Invalid index'; RETURN; END IF;

RETURN QUERY
SELECT customer.customer_id, customer.store_id, customer.first_name, customer.last_name, 
			  customer.email, customer.address_id, customer.activebool, customer.create_date, customer.active FROM customer
WHERE customer.address_id >= 10 AND customer.address_id <=40 ORDER BY customer.address_id;
END; $$
LANGUAGE plpgsql;

SELECT retrievecustomers(-10,40);
