salary = 35000
if salary > 50000:
    print("High Income")
else:
    print("Normal Income")

# Multiple Conditions
salary = 75000
experience = 5
if salary > 50000 and experience >= 3:
    print("Eligible")
else:
    print("Not Eligible")

# If-else-elif statements
marks = 85
if marks>=90:
    print("Grade A")
elif marks>=75:
    print("Grade B")
elif marks>=60:
    print("Grade C")
else:
    print("Grade D")

# AND operator
experience = 5
salary = 80000
if experience>=3 and salary >= 50000:
    print("Eligible")
else:
    print("Not Eligible")

# OR operator
experience = 1
salary = 80000
if experience>=3 or salary >= 50000:
    print("Eligible")
else:
    print("Not Eligible")

# NOT operator
is_blocked = False
if not is_blocked:
    print("Login Allowed")

