with open("employees_exercise.txt", "r") as f:
    data = f.read()
print(data)

with open("employees_exercise.txt", "r") as f:
    for line in f:
        print(line.strip())

employees=[]
with open("employees_exercise.txt", "r") as f:
    for line in f:
        emp_id, name, dept, salary, city = line.strip().split(",")
        employees.append([emp_id, name, dept, int(salary), city])
length_of_employees = len(employees)
print("Total Employees: ", length_of_employees)

for e in employees:
    print(e[1])

for e in employees:
    if e[4] == "Hyderabad":
        print(e)

for e in employees:
    if e[4] == "Bangalore":
        print(e)

for e in employees:
    if e[3] > 80000:
        print(e)

print(max(e[3] for e in employees))

print(min(e[3] for e in employees))

print(sum(e[3] for e in employees) / len(employees))

print(sum(e[3] for e in employees))

count = 0
for e in employees:
    if e[2] == "AI Engineering":
        count+=1
print(count)

count = 0
for e in employees:
    if e[2] == "Data Engineering":
        count += 1
print(count)

for e in employees:
    if e[2] == "AI Engineering":
        print(e)

with open("high_salary_employees.txt", "w") as f:
    for e in employees:
        if e[3] > 80000:
            f.write(",".join(map(str, e)) + "\n")

with open("hyderabad_employees.txt", "w") as f:
    for e in employees:
        if e[4] == "Hyderabad":
            f.write(",".join(map(str, e)) + "\n")

cities = set()
for e in employees:
    cities.add(e[4])
for city in cities:
    print(city)

departments = {}
for e in employees:
    if e[2] in departments:
        departments[e[2]] += 1
    else:
        departments[e[2]] = 1
for dept in departments:
    print(dept, "=", departments[dept])

highest = employees[0]
for e in employees:
    if e[3] > highest[3]:
        highest = e
print(highest[1])
print(highest[3])

total = len(employees)
highest = max(e[3] for e in employees)
lowest = min(e[3] for e in employees)
average = sum(e[3] for e in employees) / len(employees)
with open("employee_report.txt", "w") as f:
    f.write(str(total) + "\n")
    f.write(str(highest) + "\n")
    f.write(str(lowest) + "\n")
    f.write(str(average))