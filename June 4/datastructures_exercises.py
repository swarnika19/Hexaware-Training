#Dataset 1: Employee Salaries (List):

salaries = [45000, 55000, 65000, 75000, 85000]

print(salaries)
print(max(salaries))
print(min(salaries))
print(sum(salaries))
print(sum(salaries) / len(salaries))

salaries.extend([95000, 105000])
print(salaries)

salaries.remove(55000)
print(salaries)

salaries.sort()
print(salaries)

salaries.sort(reverse=True)
print(salaries)

print(sorted(salaries, reverse=True)[1])

print([salary for salary in salaries if salary > 70000])

#-------------------------------------------------------------------------------------

#Dataset 2: Employee Record (Tuple):

employee = (
    101,
    "Rahul Sharma",
    "Data Engineering",
    75000
)

print(employee)
print(employee[1])
print(employee[2])

employee_id, name, department, salary = employee
print(employee_id)
print(name)
print(department)
print(salary)

print(len(employee))
print(employee[0])
print(employee[-1])

#-----------------------------------------------------------------------------------

#Dataset 3: Batch Students (Set):

batch_a = {"Rahul", "Priya", "Amit", "Sneha", "Farhan"}
batch_b = {"Priya", "Sneha", "Neha", "Arjun", "Farhan"}

print(batch_a & batch_b)
print(batch_a - batch_b)
print(batch_b - batch_a)
print(batch_a | batch_b)
print(batch_a ^ batch_b)

#------------------------------------------------------------------------------------

#Dataset 4: Employee Dictionary:

employee_info = {
    "employee_id": 101,
    "name": "Rahul Sharma",
    "department": "Data Engineering",
    "salary": 75000,
    "city": "Hyderabad"
}

print(employee_info["name"])
print(employee_info["department"])
print(employee_info["city"])

employee_info["experience"] = 5
print(employee_info)

employee_info["salary"] = 85000
print(employee_info)

employee_info.pop("city")
print(employee_info)

print(employee_info.keys())
print(employee_info.values())
print(employee_info.items())

#--------------------------------------------------------------------------------

#Dataset 5: List of Dictionaries:

employees = [
    {"id": 101, "name": "Rahul", "department": "IT", "salary": 50000},
    {"id": 102, "name": "Priya", "department": "HR", "salary": 70000},
    {"id": 103, "name": "Amit", "department": "IT", "salary": 60000},
    {"id": 104, "name": "Sneha", "department": "Finance", "salary": 80000},
    {"id": 105, "name": "Farhan", "department": "IT", "salary": 90000}
]

for employee in employees:
    print(employee["name"])

for employee in employees:
    if employee["department"] == "IT":
        print(employee)

highest = employees[0]

for employee in employees:
    if employee["salary"] > highest["salary"]:
        highest = employee

print(highest)

lowest = employees[0]

for employee in employees:
    if employee["salary"] < lowest["salary"]:
        lowest = employee

print(lowest)

total = 0

for employee in employees:
    total += employee["salary"]

print(total / len(employees))

total = 0

for employee in employees:
    total += employee["salary"]

print(total)

for employee in employees:
    if employee["salary"] > 70000:
        print(employee)

count = 0

for employee in employees:
    if employee["department"] == "IT":
        count += 1

print(count)

sorted_employees = sorted(employees, key=lambda employee: employee["salary"], reverse=True)

for employee in sorted_employees:
    print(employee["name"])

sorted_employees = sorted(employees, key=lambda employee: employee["salary"], reverse=True)

print(sorted_employees[1])

departments = set()

for employee in employees:
    departments.add(employee["department"])

print(departments)
