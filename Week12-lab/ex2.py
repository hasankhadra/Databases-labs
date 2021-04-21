import redis


if __name__ == '__main__':
    r = redis.Redis(
        host='redis-18400.c251.east-us-mz.azure.cloud.redislabs.com',
        port='18400',
        password='AyQ8XHBVdQKXOKSo4I9syQkbeYdmNlUu'
    )

    # Create the skeleton of a simple profile for a social network
    # Define key-value pairs for hash 'profile'
    r.hset('profile', 'login', 'rizvansky')     # login / username
    r.hset('profile', 'Id', '0')                # id
    r.hset('profile', 'name', 'Rizvan')         # name
    r.hset('profile', 'Followers', 400)         # number of followers
    r.hset('profile', 'Following', 250)         # number of following
    r.hset('profile', 'Posts', 20)              # number of posts

    # Create the skeleton for the Posts
    # Define key-value pairs for hash 'post'
    r.hset('post', 'user', 'rizvansky')
    r.hset('post', 'time', '20/4/21, 10:03')