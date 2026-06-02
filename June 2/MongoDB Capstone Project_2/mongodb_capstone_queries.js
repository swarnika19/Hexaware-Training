//MongoDB Capstone Project 2

//Database Name

use edtech_capstone_db

//Collection 1: learners

db.learners.insertMany([
{
learner_id: 1,
name: "Rahul Sharma",
city: "Hyderabad",
experience_years: 2,
goal: "Data Engineer",
phone: "9876543210"
},
{
learner_id: 2,
name: "Priya Reddy",
city: "Bangalore",
experience_years: 4,
goal: "AI Engineer",
phone: "9876543211"
},
{
learner_id: 3,
name: "Amit Kumar",
city: "Mumbai",
experience_years: 1,
goal: "Data Analyst",
phone: null
},
{
learner_id: 4,
name: "Sneha Patel",
city: "Chennai",
experience_years: 6,
goal: "ML Engineer",
phone: "9876543213"
},
{
learner_id: 5,
name: "Farhan Ali",

city: "Delhi",
experience_years: 3,
goal: "Cloud Engineer",
phone: "9876543214"
},
{
learner_id: 6,
name: "Meera Nair",
city: "Pune",
experience_years: 0,
goal: "AI Engineer",
phone: null
}
])

//Collection 2: instructors

db.instructors.insertMany([
{
instructor_id: 101,
instructor_name: "Abdullah Khan",
expertise: ["AI", "Data Engineering", "Cloud"],
rating: 4.9
},
{
instructor_id: 102,
instructor_name: "Neha Singh",
expertise: ["Power BI", "SQL", "Analytics"],
rating: 4.6
},
{
instructor_id: 103,
instructor_name: "Ravi Kumar",
expertise: ["Python", "Machine Learning"],
rating: 4.7
}
])

//Collection 3: courses

db.courses.insertMany([
{
course_id: 201,
course_name: "Data Engineering with Azure",
category: "Data Engineering",
instructor_id: 101,
price: 15000,
level: "Intermediate",
tools: ["SQL", "Python", "Azure Data Factory", "Databricks"]
},
{
course_id: 202,
course_name: "AI Engineer Roadmap",
category: "Artificial Intelligence",
instructor_id: 101,
price: 20000,
level: "Beginner",
tools: ["Python", "OpenAI", "Vector DB", "LangChain"]
},
{
course_id: 203,
course_name: "Power BI for Business",
category: "Analytics",
instructor_id: 102,
price: 8000,
level: "Beginner",
tools: ["Power BI", "Excel", "SQL"]
},
{
course_id: 204,
course_name: "Machine Learning Practical",
category: "Machine Learning",
instructor_id: 103,
price: 12000,
level: "Intermediate",
tools: ["Python", "Scikit-learn", "Pandas"]
},
{
course_id: 205,
course_name: "Cloud AI Engineer",

category: "Cloud",
instructor_id: 101,
price: 18000,
level: "Advanced",
tools: ["Azure", "AWS", "GCP", "AI Services"]
}
])

//Collection 4: enrollments

db.enrollments.insertMany([
{
enrollment_id: 1001,
learner_id: 1,
course_id: 201,
enrollment_date: ISODate("2026-01-10"),
payment: {
amount: 15000,
mode: "UPI",
status: "Success"
},
progress: {
completed_modules: 8,
total_modules: 10,
completion_percent: 80
},
quiz_scores: [75, 82, 88],
status: "Active"
},
{
enrollment_id: 1002,
learner_id: 2,
course_id: 202,
enrollment_date: ISODate("2026-01-15"),
payment: {
amount: 20000,
mode: "Card",
status: "Success"
},
progress: {
completed_modules: 10,

total_modules: 10,
completion_percent: 100
},
quiz_scores: [90, 92, 95],
status: "Completed"
},
{
enrollment_id: 1003,
learner_id: 3,
course_id: 203,
enrollment_date: ISODate("2026-02-01"),
payment: {
amount: 8000,
mode: "Cash",
status: "Pending"
},
progress: {
completed_modules: 3,
total_modules: 8,
completion_percent: 37.5
},
quiz_scores: [60, 65],
status: "Active"
},
{
enrollment_id: 1004,
learner_id: 4,
course_id: 204,
enrollment_date: ISODate("2026-02-10"),
payment: {
amount: 12000,
mode: "UPI",
status: "Success"
},
progress: {
completed_modules: 6,
total_modules: 12,
completion_percent: 50
},
quiz_scores: [78, 80, 85],
status: "Active"
},
{
enrollment_id: 1005,

learner_id: 5,
course_id: 205,
enrollment_date: ISODate("2026-03-05"),
payment: {
amount: 18000,
mode: "Card",
status: "Failed"
},
progress: {
completed_modules: 0,
total_modules: 12,
completion_percent: 0
},
quiz_scores: [],
status: "Payment Failed"
},
{
enrollment_id: 1006,
learner_id: 6,
course_id: 202,
enrollment_date: ISODate("2026-03-12"),
payment: {
amount: 20000,
mode: "UPI",
status: "Success"
},
progress: {
completed_modules: 2,
total_modules: 10,
completion_percent: 20
},
quiz_scores: [55],
status: "Active"
}
])

//Part 1: Basic Find Queries:

db.learners.find()

db.courses.find()

db.learners.find({}, {_id:0,name:1,city:1,goal:1})

db.learners.find({city:"Hyderabad"})

db.learners.find({goal:"AI Engineer"})

db.courses.find({category:"Data Engineering"})

db.courses.find({price:{$gt:10000}})

db.courses.find({level:"Beginner"})

db.enrollments.find({"payment.status":"Success"})

db.learners.find({phone:null})

//Part 2: Operators:

db.learners.find({experience_years:{$gt:2}})

db.courses.find({price:{$gte:8000,$lte:18000}})

db.courses.find({level:{$in:["Beginner","Intermediate"]}})

db.enrollments.find({"progress.completion_percent":{$gte:80}})

db.enrollments.find({"payment.status":{$ne:"Success"}})

db.learners.find({city:{$in:["Hyderabad","Bangalore","Pune"]}})

db.courses.find({category:{$ne:"Cloud"}})

//Part 3: Array Queries:

db.instructors.find({expertise:"AI"})

db.instructors.find({expertise:"SQL"})

db.courses.find({tools:"Python"})

db.courses.find({tools:"Databricks"})

db.enrollments.find({quiz_scores:95})

db.enrollments.find({quiz_scores:{$gt:85}})

//Part 4: Sorting and Limit:

db.courses.find().sort({price:-1})

db.courses.find().sort({price:-1}).limit(3)

db.learners.find().sort({experience_years:-1})

db.learners.find().sort({experience_years:-1}).limit(2)

db.instructors.find().sort({rating:-1})

//Part 5: Update Operations: 

db.learners.updateOne({learner_id:1},{$set:{city:"Secunderabad"}})

db.courses.updateOne({course_id:203},{$set:{price:9000}})

db.enrollments.updateOne({enrollment_id:1006},{$set:{"progress.completion_percent":30}})

db.enrollments.updateOne({enrollment_id:1005},{$set:{status:"Inactive"}})

db.learners.updateMany({},{$set:{active:true}})

db.learners.updateMany({},{$unset:{active:""}})

db.courses.updateOne({course_id:201},{$push:{tools:"MongoDB"}})

//Part 6: Delete Operations:

db.enrollments.deleteMany({"payment.status":"Failed"})

db.learners.deleteMany({experience_years:0})

//Part 7: Count and Distinct:

db.learners.countDocuments()

db.courses.countDocuments()

db.enrollments.countDocuments({"payment.status":"Success"})

db.learners.distinct("city")

db.courses.distinct("category")

db.enrollments.distinct("payment.mode")

//Part 8: Aggregation:

db.enrollments.aggregate([{$match:{"payment.status":"Success"}},{$group:{_id:"$payment.mode",totalRevenue:{$sum:"$payment.amount"}}}])

db.enrollments.aggregate([{$lookup:{from:"courses",localField:"course_id",foreignField:"course_id",as:"course"}},{$unwind:"$course"},{$group:{_id:"$course.course_name",totalRevenue:{$sum:"$payment.amount"}}}])

db.learners.aggregate([{$group:{_id:"$goal",totalLearners:{$sum:1}}}])

db.courses.aggregate([{$group:{_id:"$category",averageCoursePrice:{$avg:"$price"}}}])

db.enrollments.aggregate([{$group:{_id:"$course_id",averageCompletionPercent:{$avg:"$progress.completion_percent"}}}])

db.enrollments.aggregate([{$group:{_id:"$status",totalEnrollments:{$sum:1}}}])

db.enrollments.aggregate([{$group:{_id:"$course_id",totalRevenue:{$sum:"$payment.amount"}}},{$match:{totalRevenue:{$gt:15000}}}])

//Part 9: Lookup / Join Style Queries:

db.enrollments.aggregate([{$lookup:{from:"learners",localField:"learner_id",foreignField:"learner_id",as:"learner"}},{$unwind:"$learner"},{$project:{_id:0,enrollment_id:1,learnerName:"$learner.name",city:"$learner.city",course_id:1,status:1}}])

db.enrollments.aggregate([{$lookup:{from:"courses",localField:"course_id",foreignField:"course_id",as:"course"}},{$unwind:"$course"},{$project:{_id:0,enrollment_id:1,courseName:"$course.course_name",category:"$course.category",amount:"$payment.amount",paymentStatus:"$payment.status"}}])

db.courses.aggregate([{$lookup:{from:"instructors",localField:"instructor_id",foreignField:"instructor_id",as:"instructor"}},{$unwind:"$instructor"},{$project:{_id:0,courseName:"$course_name",category:1,instructorName:"$instructor.instructor_name",instructorRating:"$instructor.rating"}}])

db.enrollments.aggregate([{$lookup:{from:"learners",localField:"learner_id",foreignField:"learner_id",as:"learner"}},{$unwind:"$learner"},{$lookup:{from:"courses",localField:"course_id",foreignField:"course_id",as:"course"}},{$unwind:"$course"},{$lookup:{from:"instructors",localField:"course.instructor_id",foreignField:"instructor_id",as:"instructor"}},{$unwind:"$instructor"},{$project:{_id:0,enrollment_id:1,learnerName:"$learner.name",city:"$learner.city",goal:"$learner.goal",courseName:"$course.course_name",category:"$course.category",instructorName:"$instructor.instructor_name",paymentAmount:"$payment.amount",paymentStatus:"$payment.status",completionPercent:"$progress.completion_percent",enrollmentStatus:"$status"}}])