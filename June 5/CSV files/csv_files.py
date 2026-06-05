import csv
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    # to display the header
    next(reader)
    for row in reader:
        print(row)

    # display employee names
    for row in reader:
        print(row[1])

# count employees
count = 0
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        count += 1
print(count)

# highest salary
highest_salary = 0
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        salary = int(row[3])
        if salary > highest_salary:
            highest_salary = salary
print("Highest Salary:", highest_salary)

# lowest salary
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    first_row = next(reader)
    lowest_salary = int(first_row[3])
    for row in reader:
        salary = int(row[3])
        if salary < lowest_salary:
            lowest_salary = salary
print("Lowest Salary:", lowest_salary)

# average salary
total_salary = 0
count = 0
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        total_salary += int(row[3])
        count += 1
print("Average Salary:", total_salary / count)

# Total Salary Payout
total_salary = 0
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        total_salary += int(row[3])
print("Total Salary Payout:", total_salary)

# Hyderabad Employees
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        if row[4] == "Hyderabad":
            print(row)

# AI Engineering Employees
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        if row[2] == "AI Engineering":
            print(row)

# Employees Earning Above ₹80,000
with open("employees.csv", "r") as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        if int(row[3]) > 80000:
            print(row)