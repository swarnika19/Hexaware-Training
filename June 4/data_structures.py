# LIST DATA STRUCTURE:

# Accessing list elements
cities = ["Mumbai", "Hyderabad", "Delhi"]
print(cities[0])
print(cities[1])
print(cities[2])

# Negative indexing
print(cities[-1])
print(cities[-2])

# Update list elements with index values
cities[1] = "Bangalore"
print(cities)

# Add new items to the last
cities.append("Chennai")
print(cities)

# Insert new items with index number
cities.insert(1, "Pune")
print(cities)

# Add multiple values to the list
cities.extend(["Kochi", "Pondicherry"])
print(cities)

# Remove the items in the list by value
cities.remove("Mumbai")
print(cities)

# Remove last element
cities.pop(1)
print(cities)

# Deleting elements by index
del cities[0]
print(cities)

# Delete all items
cities.clear()
print(cities)

# Length of list
print(len(cities))

# Check membership
print("Mumbai" in cities)
print("Pune" in cities)

# Get index by values
print(cities.index("Mumbai"))

# Sort the list
cities.sort()
# ----------------------------------------------------------

# TUPLE DATA STRUCTURE:

cities = ("Hyderabad", "Mumbai", "Delhi")
print(cities)

# Accessing tuple
print(cities[0])
print(cities[1])

# Negative indexing
print(cities[-1])
print(cities[-2])

# Length of tuple
print(len(cities))

# Subset of tuple access
print(cities[1:4])

# Cannot perform item update
# cities[1] = "Bangalore"

# Packing
employee = (101, "Rahul", 75000)
print(employee)

# Unpacking
emp_id, emp_name, salary = employee
print(emp_id)
print(emp_name)
print(salary)

# Return multiple values
def get_employee():
    return 101, "Rahul", 75000
result = get_employee()
print(result)

# Each row is represented as a tuple
record = (
    101,
    "Rahul",
    "Hyderabad",
    75000
)
print(record)

# ---------------------------------------------------
# SET DATA STRUCTURE

cities = {"Hyderabad", "Mumbai", "Delhi"}
print(cities)

cities = {"Hyderabad", "Mumbai", "Delhi", "Mumbai"}
print(cities)

# remove duplicates from list
cities = ["Hyderabad", "Mumbai", "Delhi", "Mumbai"]
unique_cities = set(cities)
print(unique_cities)

cities.add("Chennai")
print(cities)

cities.update(["Delhi", "Pune"])
print(cities)

cities.remove("Mumbai")
print(cities)

# no error while removing it
cities.discard("Pune")
print(cities)

# union in set
set1= {"python","sql"}
set2 = {"mongodb", "python"}
result = set1.union(set2)
print(result)

# intersection
result = set1.intersection(set2)
print(result)

# difference
result= set1.difference(set2)
print(result)

# symmetric difference(non-common values)
result = set1.symmetric_difference(set2)
print(result)

# -------------------------------------------
# DICTIONARY DATA STRUCTURE:

customer = {
    "customer_id" : 101,
    "name" : "Rahul",
    "city" : "Hyderabad"
}
print(customer)
print(customer["name"])
print(customer["city"])

# safe
print(customer.get("name"))
print(customer.get("salary"))

# add new key-value pair
customer["salary"] = 75000
print(customer)

# update existing values
customer["name"] = "Rahul Sharma"
print(customer)

# delete
customer.pop("salary")
print(customer)

del customer["salary"]

