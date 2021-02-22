import psycopg2
from faker import Faker
import random

con = psycopg2.connect(database="lab5", user="postgres",
                       password="20011968hasann", host="127.0.0.1", port="5432")

cur = con.cursor()

# the table that we will apply the btree index
cur.execute('''CREATE TABLE IF NOT EXISTS patient
      (ID SERIAL PRIMARY KEY NOT NULL,
      NAME CHAR(30) NOT NULL,
      ADDRESS TEXT NOT NULL,
      AGE INT NOT NULL,
      REVIEW TEXT);''')
print("Table created successfully")

fake = Faker()

for i in range(100000):
    cur.execute(f"INSERT INTO patient (NAME, ADDRESS, AGE, "
                 f"REVIEW) VALUES ('{fake.name()}', '{fake.address()}', {random.randint(12, 70)}, '{fake.text()}')")

print("Added 100000 rows to patient table")

# to print the btree index before/after cost
cur.execute("EXPLAIN ANALYZE SELECT * FROM patient WHERE AGE > 20 AND AGE < 40")
cost = cur.fetchall()
print(cost)


# The table that we will apply the hash index on
cur.execute('''CREATE TABLE IF NOT EXISTS person
      (ID SERIAL PRIMARY KEY NOT NULL,
      NAME CHAR(30) NOT NULL,
      ADDRESS TEXT NOT NULL,
      AGE INT NOT NULL);''')
print("Table created successfully")

for i in range(100000):
    cur.execute(f"INSERT INTO person (NAME, ADDRESS, AGE) "
                 f"VALUES ('{fake.name()}', '{fake.address()}', {random.randint(12, 70)})")


# to print the hash before/after cost
cur.execute("EXPLAIN ANALYZE SELECT * FROM person WHERE AGE = 30")
cost = cur.fetchall()
print(cost)


con.commit()
con.close()
