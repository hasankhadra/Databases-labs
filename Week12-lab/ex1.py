import redis


if __name__ == '__main__':
    r = redis.Redis(
        host='redis-18400.c251.east-us-mz.azure.cloud.redislabs.com',
        port='18400',
        password='AyQ8XHBVdQKXOKSo4I9syQkbeYdmNlUu'
    )

    # Create the Customers table
    r.zadd('c1', {'001': 0, 'Jane': 1, 'Doe': 2})
    r.zadd('c2', {'002': 0, 'John': 1, 'Doe': 2})
    r.zadd('c3', {'003': 0, 'Jane': 1, 'Smith': 2})
    r.zadd('c4', {'004': 0, 'John': 1, 'Smith': 2})
    r.zadd('c5', {'005': 0, 'Jane': 1, 'Jones': 2})
    r.zadd('c6', {'006': 0, 'John': 1, 'Jones': 2})

    # Create the Orders table
    r.zadd('o1', {'1001': 0, '002': 1, '10/10/09': 2, 250.85: 3})
    r.zadd('o2', {'1002': 0, '002': 1, '2/21/10': 2, 125.89: 3})
    r.zadd('o3', {'1003': 0, '003': 1, '11/15/09': 2, 1567.99: 3})
    r.zadd('o4', {'1004': 0, '004': 1, '11/22/09': 2, 180.92: 3})
    r.zadd('o5', {'1005': 0, '004': 1, '12/15/09': 2, 565.00: 3})
    r.zadd('o6', {'1006': 0, '006': 1, '11/22/09': 2, 25.00: 3})
    r.zadd('o7', {'1007': 0, '006': 1, '10/8/09': 2, 85.00: 3})
    r.zadd('o8', {'1008': 0, '006': 1, '12/29/09': 2, 109.12: 3})