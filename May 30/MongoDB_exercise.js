db.restaurants.find()

db.restaurants.find({}, {_id:0, name:1, city:1, cuisine:1})

db.restaurants.find({city:"Hyderabad"})

db.restaurants.find({cuisine:"Indian"})

db.restaurants.find({delivery_available:true})

db.restaurants.find({rating:{$gt:4.5}})

db.restaurants.find({avg_order_value:{$lt:400}})

db.restaurants.find({rating:{$gte:4.0,$lte:4.7}})

db.restaurants.find({avg_order_value:{$gte:600}})

db.restaurants.find({city:"Hyderabad",delivery_available:true})

db.restaurants.find({$or:[{city:"Chennai"},{cuisine:"Indian"}]})

db.restaurants.find({delivery_available:false})

db.restaurants.find({city:{$in:["Hyderabad","Delhi","Mumbai"]}})

db.restaurants.find({cuisine:{$in:["Indian","Italian","Cafe"]}})

db.restaurants.find({city:{$nin:["Hyderabad","Bangalore"]}})

db.restaurants.find({name:/^P/})

db.restaurants.find({name:/Point/})

db.restaurants.find({cuisine:/Food/})

db.restaurants.find({"contact.phone":null})

db.restaurants.find({"contact.email":null})

db.restaurants.find({$or:[{"contact.phone":null},{"contact.email":null}]})

db.restaurants.find({tags:"premium"})

db.restaurants.find({tags:"fast food"})

db.restaurants.find({tags:{$all:["north indian","premium"]}})

db.restaurants.find().sort({rating:-1})

db.restaurants.find().sort({rating:-1}).limit(3)

db.restaurants.find().sort({avg_order_value:1})

db.restaurants.find().sort({avg_order_value:-1}).limit(2)

db.restaurants.updateOne({name:"Burger Street"},{$set:{rating:4.0}})

db.restaurants.updateOne({name:"Tea Tales"},{$set:{delivery_available:true}})

db.restaurants.updateMany({},{$set:{active:true}})

db.restaurants.updateOne({name:"Spice Hub"},{$push:{tags:"popular"}})

db.restaurants.updateMany({},{$unset:{active:""}})

db.restaurants.deleteOne({restaurant_id:6})

db.restaurants.deleteMany({rating:{$lt:4.0}})

db.restaurants.countDocuments()

db.restaurants.countDocuments({delivery_available:true})

db.restaurants.distinct("city")

db.restaurants.distinct("cuisine")

db.restaurants.aggregate([{$group:{_id:"$city",count:{$sum:1}}}])

db.restaurants.aggregate([{$group:{_id:"$cuisine",count:{$sum:1}}}])

db.restaurants.aggregate([{$group:{_id:"$cuisine",avgRating:{$avg:"$rating"}}}])

db.restaurants.aggregate([{$group:{_id:"$city",avgOrderValue:{$avg:"$avg_order_value"}}}])

db.restaurants.aggregate([{$group:{_id:"$cuisine",avgOrderValue:{$avg:"$avg_order_value"}}},{$sort:{avgOrderValue:-1}},{$limit:1}])

db.restaurants.aggregate([{$group:{_id:"$cuisine",count:{$sum:1}}},{$match:{count:{$gt:1}}}])