CREATE OR REPLACE FUNCTION get_addresses()
RETURNS TABLE(address_id integer, address VARCHAR(50), address2 VARCHAR(50),
		district VARCHAR(20), city)id smallint, postal_code VARCHAR(10),
		phone VARCHAR(20)) AS
$$
BEGIN
RETURN QUERY
SELECT address.address_id, address.address, address.address2, address.district,
	address.city_id, address.postal_code, address.phone FROM address
WHERE address.city_id > 400 AND address.city_id < 600 AND address.address LIKE '%11%';
END; $$
LANGUAGE plpgsql;
