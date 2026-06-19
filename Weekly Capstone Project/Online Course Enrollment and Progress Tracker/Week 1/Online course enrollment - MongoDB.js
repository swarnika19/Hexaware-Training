// CAPSTONE PROJECT: ONLINE COURSE ENROLLMENT
// AND PROGRESS TRACKER
// MONGODB SCRIPT — COURSE FEEDBACK & REVIEWS


// STEP 1: USE DATABASE
use capstone_courses_enrollment

// STEP 2: INSERT SAMPLE FEEDBACK DOCUMENTS
db.feedback.insertMany([
  { student_id: 1, student_name: "Arun Kumar", course_id: 1, course_name: "MySQL for Beginners", rating: 5, review: "Excellent course! Dr. Ramesh explains concepts very clearly.", tags: ["beginner-friendly", "structured"], submitted_at: new Date("2024-01-25") },
  { student_id: 2, student_name: "Priya Sharma", course_id: 1, course_name: "MySQL for Beginners", rating: 4, review: "Very helpful for understanding SQL basics.", tags: ["informative"], submitted_at: new Date("2024-01-22") },
  { student_id: 2, student_name: "Priya Sharma", course_id: 2, course_name: "MongoDB Essentials", rating: 5, review: "Great introduction to NoSQL.", tags: ["hands-on", "recommended"], submitted_at: new Date("2024-02-01") },
  { student_id: 4, student_name: "Sneha Nair", course_id: 4, course_name: "Web Development Basics", rating: 3, review: "Good content but pace was fast.", tags: ["fast-paced"], submitted_at: new Date("2024-02-05") },
  { student_id: 5, student_name: "Karthik Raja", course_id: 5, course_name: "Data Science Fundamentals", rating: 5, review: "Dr. Pradeep is an amazing instructor!", tags: ["highly-recommended"], submitted_at: new Date("2024-02-10") }
])

// STEP 3: READ OPERATIONS

// VIEW ALL FEEDBACK
db.feedback.find()

// FIND FEEDBACK FOR COURSE 1
db.feedback.find({ course_id: 1 })

// FIND FEEDBACK WITH RATING 4 AND ABOVE
db.feedback.find({ rating: { $gte: 4 } })

// STEP 4: UPDATE — EDIT A REVIEW
db.feedback.updateOne(
  { student_id: 4, course_id: 4 },
  { $set: { review: "Good content but needed more examples.", rating: 4 } }
)

// STEP 5: DELETE — REMOVE A FEEDBACK ENTRY
db.feedback.deleteOne({ student_id: 1, course_id: 1 })

// STEP 6: INDEXES FOR FAST SEARCH

// INDEX ON STUDENT ID
db.feedback.createIndex({ student_id: 1 })

// INDEX ON COURSE ID
db.feedback.createIndex({ course_id: 1 })

// COMPOUND INDEX ON STUDENT AND COURSE
db.feedback.createIndex({ student_id: 1, course_id: 1 })

// STEP 7: REPORT QUERIES

// AVERAGE RATING PER COURSE
db.feedback.aggregate([
  { $group: { _id: "$course_name", average_rating: { $avg: "$rating" }, total_reviews: { $sum: 1 } } },
  { $sort: { average_rating: -1 } }
])

// TOP RATED FEEDBACK (RATING = 5)
db.feedback.find({ rating: 5 }, { student_name: 1, course_name: 1, review: 1 })