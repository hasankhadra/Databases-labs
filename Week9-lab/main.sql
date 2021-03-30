1. db.collection0.find({})
2. db.collection0.find({}, {restaurant_id: true, borough: true, cuisine: true})
3. db.collection0.find({borough: "Bronx"}).limit(5)
4. db.collection0.find({$or: [{cuisine: {$nin: ["American ", "Chinese"]}}, {name: {$regex: RegExp('^Wil.*')}}]}, {restaurant_id: true, name: true, borough: true, cuisine: true})
5. db.collection0.find({name: {$regex: RegExp('mon')}}, {name: true, borough: true, coord: true, cuisine: true})
6. db.collection0.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {restaurant_id: true, name: true, borough: true, cuisine: true})