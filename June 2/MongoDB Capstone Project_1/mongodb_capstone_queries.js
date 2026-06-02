//MongoDB Capstone Project

//Database Name
use food_delivery_capstone_db

//Collection 1: customers
db.customers.insertMany([
{
customer_id: 1,
name: "Rahul Sharma",
city: "Hyderabad",
membership: "Gold",
phone: "9876543210"
},
{
customer_id: 2,
name: "Priya Reddy",
city: "Bangalore",
membership: "Silver",
phone: "9876543211"
},
{
customer_id: 3,
name: "Amit Kumar",
city: "Mumbai",
membership: "Gold",
phone: null
},
{
customer_id: 4,
name: "Sneha Patel",
city: "Chennai",
membership: "Bronze",
phone: "9876543213"
},
{
customer_id: 5,
name: "Arjun Verma",
city: "Delhi",
membership: "Silver",
phone: "9876543214"

}
])
db.customers.find()

//Collection 2: restaurants

db.restaurants.insertMany([
{
restaurant_id: 101,
name: "Spice Hub",
city: "Hyderabad",
cuisine: "Indian",
rating: 4.5
},
{
restaurant_id: 102,
name: "Pizza Corner",
city: "Bangalore",
cuisine: "Italian",
rating: 4.2
},
{
restaurant_id: 103,
name: "Green Bowl",
city: "Chennai",
cuisine: "Healthy",
rating: 4.7
},
{
restaurant_id: 104,
name: "Burger Street",
city: "Mumbai",
cuisine: "Fast Food",
rating: 3.9
},
{
restaurant_id: 105,
name: "Royal Tandoor",
city: "Delhi",
cuisine: "Indian",
rating: 4.8

}
])

Collection 3: delivery_partners

db.delivery_partners.insertMany([
{
partner_id: 201,
partner_name: "FastMove Logistics",
city: "Hyderabad",
rating: 4.4
},
{
partner_id: 202,
partner_name: "QuickShip",
city: "Bangalore",
rating: 4.1
},
{
partner_id: 203,
partner_name: "SpeedKart",
city: "Mumbai",
rating: 4.6
},
{
partner_id: 204,
partner_name: "DoorDash India",
city: "Delhi",
rating: 4.0
}
])

//Collection 4: orders

db.orders.insertMany([
{
order_id: 1001,

customer_id: 1,
restaurant_id: 101,
partner_id: 201,
items: [
{ item_name: "Biryani", quantity: 2, price: 250 },
{ item_name: "Kebab", quantity: 1, price: 180 }
],
order_amount: 680,
payment: {
mode: "UPI",
status: "Success"
},
order_status: "Delivered",
delivery_time_minutes: 35,
order_rating: 5
},
{
order_id: 1002,
customer_id: 2,
restaurant_id: 102,
partner_id: 202,
items: [
{ item_name: "Pizza", quantity: 1, price: 500 },
{ item_name: "Garlic Bread", quantity: 1, price: 150 }
],
order_amount: 650,
payment: {
mode: "Card",
status: "Success"
},
order_status: "Delivered",
delivery_time_minutes: 42,
order_rating: 4
},
{
order_id: 1003,
customer_id: 3,
restaurant_id: 104,
partner_id: 203,
items: [
{ item_name: "Burger", quantity: 2, price: 180 },
{ item_name: "Fries", quantity: 1, price: 120 }
],
order_amount: 480,

payment: {
mode: "Cash",
status: "Pending"
},
order_status: "Pending",
delivery_time_minutes: null,
order_rating: null
},
{
order_id: 1004,
customer_id: 4,
restaurant_id: 103,
partner_id: null,
items: [
{ item_name: "Salad Bowl", quantity: 1, price: 350 }
],
order_amount: 350,
payment: {
mode: "UPI",
status: "Failed"
},
order_status: "Cancelled",
delivery_time_minutes: null,
order_rating: null
},
{
order_id: 1005,
customer_id: 5,
restaurant_id: 105,
partner_id: 204,
items: [
{ item_name: "Tandoori Chicken", quantity: 1, price: 600 },
{ item_name: "Naan", quantity: 2, price: 60 }
],
order_amount: 720,
payment: {
mode: "UPI",
status: "Success"
},
order_status: "Delivered",
delivery_time_minutes: 50,
order_rating: 5
},
{

order_id: 1006,
customer_id: 1,
restaurant_id: 101,
partner_id: 201,
items: [
{ item_name: "Paneer Curry", quantity: 1, price: 300 },
{ item_name: "Roti", quantity: 4, price: 25 }
],
order_amount: 400,
payment: {
mode: "Card",
status: "Success"
},
order_status: "Delivered",
delivery_time_minutes: 30,
order_rating: 4
}
])

//Part 1: Basic MongoDB Queries:

db.restaurants.find()

db.customers.find({}, {_id:0,name:1,city:1,membership:1})

db.customers.find({city:"Hyderabad"})

db.customers.find({membership:"Gold"})

db.restaurants.find({rating:{$gt:4.5}})

db.orders.find({order_amount:{$gt:500}})

db.orders.find({order_status:"Delivered"})

db.orders.find({order_status:"Cancelled"})

db.customers.find({phone:null})

//Part 2: Operators:

db.orders.find({order_amount:{$gte:400,$lte:700}})

db.customers.find({city:{$in:["Hyderabad","Delhi","Mumbai"]}})

db.restaurants.find({cuisine:{$in:["Indian","Fast Food"]}})

db.orders.find({"payment.status":{$ne:"Success"}})

db.orders.find({delivery_time_minutes:null})

db.orders.find({order_rating:{$gte:4}})

db.restaurants.find({city:{$nin:["Bangalore","Chennai"]}})

//Part 3: Array Queries:

db.orders.find({"items.item_name":"Biryani"})

db.orders.find({"items.item_name":"Pizza"})

db.orders.find({"items.quantity":{$gt:1}})

db.orders.find({"items.price":{$gt:300}})

db.orders.find({}, {_id:0, order_id:1, items:1})

//Part 4: Sorting and Limit:

db.restaurants.find().sort({rating:-1})

db.restaurants.find().sort({rating:-1}).limit(3)

db.orders.find().sort({order_amount:-1})

db.orders.find().sort({order_amount:-1}).limit(2)

db.delivery_partners.find().sort({rating:-1})

//Part 5: Update Operations:

db.customers.updateOne({customer_id:1},{$set:{membership:"Platinum"}})

db.restaurants.updateOne({restaurant_id:104},{$set:{rating:4.1}})

db.orders.updateOne({order_id:1003},{$set:{order_status:"Delivered"}})

db.orders.updateOne({order_id:1003},{$set:{delivery_time_minutes:45}})

db.customers.updateMany({},{$set:{active:true}})

db.customers.updateMany({},{$unset:{active:""}})

db.orders.updateOne({order_id:1006},{$push:{items:{item_name:"Curd Rice",quantity:1,price:120}}})

//Part 6: Delete Operations:

db.orders.deleteMany({order_status:"Cancelled"})

db.restaurants.deleteMany({rating:{$lt:4.0}})

//Part 7: Count and Distinct:

db.customers.countDocuments()

db.orders.countDocuments()

db.orders.countDocuments({order_status:"Delivered"})

db.orders.countDocuments({"payment.status":"Failed"})

db.customers.distinct("city")

db.restaurants.distinct("cuisine")

db.orders.distinct("payment.mode")

//Part 8: Aggregation:

db.orders.aggregate([{$match:{"payment.status":"Success"}},{$group:{_id:"$payment.mode",totalRevenue:{$sum:"$order_amount"}}}])

db.orders.aggregate([{$group:{_id:"$order_status",totalRevenue:{$sum:"$order_amount"}}}])

db.orders.aggregate([{$match:{order_status:"Delivered",delivery_time_minutes:{$ne:null}}},{$group:{_id:null,averageDeliveryTime:{$avg:"$delivery_time_minutes"}}}])

db.orders.aggregate([{$group:{_id:"$customer_id",totalOrders:{$sum:1},totalAmount:{$sum:"$order_amount"}}}])

db.orders.aggregate([{$group:{_id:"$restaurant_id",totalOrders:{$sum:1},totalRevenue:{$sum:"$order_amount"}}}])

db.orders.aggregate([{$match:{order_rating:{$ne:null}}},{$group:{_id:"$restaurant_id",averageOrderRating:{$avg:"$order_rating"}}}])

db.orders.aggregate([{$group:{_id:"$customer_id",totalSpending:{$sum:"$order_amount"}}},{$match:{totalSpending:{$gt:700}}}])

//Part 9: Lookup / Join Style Queries:

db.orders.aggregate([{$lookup:{from:"customers",localField:"customer_id",foreignField:"customer_id",as:"customer"}},{$unwind:"$customer"},{$project:{_id:0,order_id:1,customerName:"$customer.name",city:"$customer.city",order_amount:1,order_status:1}}])

db.orders.aggregate([{$lookup:{from:"restaurants",localField:"restaurant_id",foreignField:"restaurant_id",as:"restaurant"}},{$unwind:"$restaurant"},{$project:{_id:0,order_id:1,restaurantName:"$restaurant.name",cuisine:"$restaurant.cuisine",order_amount:1}}])

db.orders.aggregate([{$lookup:{from:"delivery_partners",localField:"partner_id",foreignField:"partner_id",as:"partner"}},{$unwind:{path:"$partner",preserveNullAndEmptyArrays:true}},{$project:{_id:0,order_id:1,partnerName:"$partner.partner_name",delivery_time_minutes:1,order_status:1}}])

db.orders.aggregate([{$lookup:{from:"customers",localField:"customer_id",foreignField:"customer_id",as:"customer"}},{$unwind:"$customer"},{$lookup:{from:"restaurants",localField:"restaurant_id",foreignField:"restaurant_id",as:"restaurant"}},{$unwind:"$restaurant"},{$lookup:{from:"delivery_partners",localField:"partner_id",foreignField:"partner_id",as:"partner"}},{$unwind:{path:"$partner",preserveNullAndEmptyArrays:true}},{$project:{_id:0,order_id:1,customerName:"$customer.name",restaurantName:"$restaurant.name",cuisine:"$restaurant.cuisine",partnerName:"$partner.partner_name",order_amount:1,paymentMode:"$payment.mode",paymentStatus:"$payment.status",order_status:1,delivery_time_minutes:1,rating:"$order_rating"}}])