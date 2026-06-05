a = 10
b = 0
result = a / b
print(result)
print("Program Completed")

# Generic exceptions
try:
    a = 10
    b = 0
    result = a / b
    print(result)
    print("Program Completed")
except:
    print("Error occurred")
print("Program Completed")

# Specific exceptions
try:
    a = 10
    b = 0
    print(a/b)
except ZeroDivisionError:
    print("Cannot divide by zero")

try:
    age = int(input("Enter age: "))
    print(age)
except ValueError:
    print("Please enter numeric value")

# Multiple exceptions
try:
    age = int(input("Enter age: "))
    print(100/age)
except ValueError:
    print("Please enter numeric value")
except ZeroDivisionError:
    print("Age cannot be zero")

# Exception object
try:
    num = int("abc")
except Exception as e:
    print(e)

# Else block
try:
    num = 10
    print(num)
except:
    print("Error")
else:
    print("Success")

# Finally block
try:
    print(10 / 0)
except:
    print("Error")
finally:
    print("Connection closed")

# Raise error
salary = -1000
if salary < 0:
    raise ValueError("Salary cannot be negative")

