import psycopg2
from geopy.geocoders import Nominatim

geolocator = Nominatim(user_agent="app")

conn = psycopg2.connect("dbname=dvdrental user=postgres password=fylhtq9894 port=5433")
conn.autocommit = True
cur = conn.cursor()
cur.callproc('get_addresses')
records = cur.fetchall()
cur.execute('''
        DROP TABLE IF EXISTS newaddress;
        CREATE TABLE newaddress
       (address_id integer NOT NULL PRIMARY KEY,
        address VARCHAR(50) NOT NULL,
        address2 VARCHAR(50),
        district VARCHAR(20) NOT NULL,
        city_id smallint NOT NULL,
        postal_code VARCHAR(10),
        phone VARCHAR(20),
        longitude float NOT NULL,
        latitude float NOT NULL);''')

for rec in records:
    location = geolocator.geocode(rec[1])
    lat, lon = 0, 0
    try:
        lat, lon = location.latitude, location.longitude
    except Exception:
        lat, lon = 0, 0
    cur.execute('''
                INSERT INTO newaddress(address_id,address,city_id,longitude,latitude) 
                VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)''', (rec[0], rec[1], rec[2], rec[4], rec[5], rec[6], rec[7], lon, lat))


cur.close()
conn.close()
