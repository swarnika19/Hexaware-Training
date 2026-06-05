# Read file text
file = open("employees.txt", "r")
data = file.read()
print(data)
file.close()

# Read only one line
file = open("employees.txt", "r")
print(file.readline())
file.close()

# Multiple lines
lines = file.readlines()
print(lines)

# # Automatically close the file object using with statement
with open(
    "employees.txt",
    "w"
) as file:
    data = file.read()
    print(data)

# Writing two names in the file(overrides text)
with open("employees1.txt", "w") as file:
    file.write("Rahul\n")
    file.write("Priya\n")

# Append
with open("employees1.txt", "a") as file:
    file.write("Amit\n")