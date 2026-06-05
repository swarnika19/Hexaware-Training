import json

from file_handling_exercises import employees

employees = [

    {
        "employee_id": 101,
        "name": "Rahul Sharma",
        "department": "Data Engineering",
        "salary": 75000,
        "city": "Hyderabad"
    },

    {
        "employee_id": 102,
        "name": "Priya Reddy",
        "department": "AI Engineering",
        "salary": 85000,
        "city": "Bangalore"
    },

    {
        "employee_id": 103,
        "name": "Amit Kumar",
        "department": "Data Engineering",
        "salary": 65000,
        "city": "Mumbai"
    },

    {
        "employee_id": 104,
        "name": "Sneha Patel",
        "department": "Data Science",
        "salary": 95000,
        "city": "Chennai"
    },

    {
        "employee_id": 105,
        "name": "Farhan Ali",
        "department": "Cloud Engineering",
        "salary": 80000,
        "city": "Delhi"
    }

]
with open('employees.json', 'w') as file:
    json.dump(employees, file, indent = 4)
print("JSON file created successfully")

# Load the json file
with open("employees.json", "r") as file:
    employees = json.load(file)
print(employees)

# Print all employees in json file
for employee in employees:
    print(employee)

# Print names
for employee in employees:
    print(employee["name"])

# Length
print(len(employees))

# Find highest salary
highest_salary = 0
for employee in employees:
    if employee["salary"] > highest_salary:
        highest_salary = employee["salary"]
print(highest_salary)


# Employee with highest salary
highest_salary_employee = employees[0]
for employee in employees:
    if employee["salary"] > highest_salary_employee["salary"]:
        highest_salary_employee = employee
print(highest_salary_employee)

#Find average salary
total_salary = 0
for employee in employees:
    total_salary += employee["salary"]
average_salary = total_salary / len(employees)
print(average_salary)

# Display data engineering employees
for employee in employees:
    if employee["department"] == "Data Engineering":
        print(employee)

# Salary more than 80000
for employee in employees:
    if employee["salary"] > 80000:
        print(employee)

# Update Salary of one employee
for employee in employees:
    if employee["employee_id"] == 103:
        employee["salary"] = 70000
print(employees)

# Add New Employee
new_employee = {
    "employee_id": 106,
    "name": "Ananya Singh",
    "department": "AI Engineering",
    "salary": 90000,
    "city": "Pune"
}
employees.append(new_employee)
print(employees)

# Delete an employee
for employee in employees:
    if employee["employee_id"] == 103:
        employees.remove(employee)
        break
print(employees)