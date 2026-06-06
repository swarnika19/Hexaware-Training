# Part 1: File handling
import csv
with open("orders.csv","r") as file:
    reader=csv.reader(file)
    for row in reader:
        print(row)

with open("orders.csv","r") as file:
    reader=csv.DictReader(file)
    orders=list(reader)

for row in orders:
    print(row)
count=len(orders)
print("Total Orders:",count)

# Part 2: Revenue analysis
total_revenue=0
for row in orders:
    total_revenue+=int(row["quantity"])*int(row["price"])
print("Total Revenue:",total_revenue)

highest_order=0
for row in orders:
    order_value=int(row["quantity"])*int(row["price"])
    if order_value>highest_order:
        highest_order=order_value
print("Highest Order Value:",highest_order)

lowest_order=float("inf")
for row in orders:
    order_value=int(row["quantity"])*int(row["price"])
    if order_value<lowest_order:
        lowest_order=order_value
print("Lowest Order Value:",lowest_order)

average_order_value=total_revenue/count
print("Average Order Value:",average_order_value)

# Part 3: Customer Analysis
customers=set()
for row in orders:
    customers.add(row["customer_name"])
print(customers)

print("Unique Customers:",len(customers))

customer_name=""
highest_purchase=0
for row in orders:
    purchase_amount=int(row["quantity"])*int(row["price"])
    if purchase_amount>highest_purchase:
        highest_purchase=purchase_amount
        customer_name=row["customer_name"]
print("Customer With Highest Purchase:",customer_name)
print("Purchase Amount:",highest_purchase)

# Part 4: Product analysis
product_orders={}
for row in orders:
    product=row["product"]
    if product in product_orders:
        product_orders[product]+=1
    else:
        product_orders[product]=1
print(product_orders)

product_revenue={}
for row in orders:
    product=row["product"]
    revenue=int(row["quantity"])*int(row["price"])
    if product in product_revenue:
        product_revenue[product]+=revenue
    else:
        product_revenue[product]=revenue
print(product_revenue)

most_sold_product=""
max_quantity=0
for row in orders:
    if row["product"] not in product_orders:
        continue
for product in product_orders:
    if product_orders[product]>max_quantity:
        max_quantity=product_orders[product]
        most_sold_product=product
print("Most Sold Product:",most_sold_product)

least_sold_product=""
min_quantity=float("inf")
for product in product_orders:
    if product_orders[product]<min_quantity:
        min_quantity=product_orders[product]
        least_sold_product=product
print("Least Sold Product:",least_sold_product)

category_revenue={}
for row in orders:
    category=row["category"]
    revenue=int(row["quantity"])*int(row["price"])
    if category in category_revenue:
        category_revenue[category]+=revenue
    else:
        category_revenue[category]=revenue
print(category_revenue)

# Part 5: City analysis
city_orders={}
for row in orders:
    city=row["city"]
    if city in city_orders:
        city_orders[city]+=1
    else:
        city_orders[city]=1
print(city_orders)

city_revenue={}
for row in orders:
    city=row["city"]
    revenue=int(row["quantity"])*int(row["price"])
    if city in city_revenue:
        city_revenue[city]+=revenue
    else:
        city_revenue[city]=revenue
print(city_revenue)

highest_revenue_city=""
highest_revenue=0
for city in city_revenue:
    if city_revenue[city]>highest_revenue:
        highest_revenue=city_revenue[city]
        highest_revenue_city=city
print("City Generating Highest Revenue:",highest_revenue_city)

# Part 6: Lists, Sets and Dictionaries
products=[]
for row in orders:
    products.append(row["product"])
products.sort()
print(products)

cities=set()
for row in orders:
    cities.add(row["city"])
print(cities)

city_revenue={}
for row in orders:
    city=row["city"]
    revenue=int(row["quantity"])*int(row["price"])
    if city in city_revenue:
        city_revenue[city]+=revenue
    else:
        city_revenue[city]=revenue
print(city_revenue)

product_quantity={}
for row in orders:
    product=row["product"]
    quantity=int(row["quantity"])
    if product in product_quantity:
        product_quantity[product]+=quantity
    else:
        product_quantity[product]=quantity
print(product_quantity)

# Part 7: Functions
def calculate_total_revenue():
    total=0
    for row in orders:
        total+=int(row["quantity"])*int(row["price"])
    return total
print(calculate_total_revenue())

def find_top_product():
    product_quantity={}
    for row in orders:
        product=row["product"]
        quantity=int(row["quantity"])
        if product in product_quantity:
            product_quantity[product]+=quantity
        else:
            product_quantity[product]=quantity
    top_product=""
    max_quantity=0
    for product in product_quantity:
        if product_quantity[product]>max_quantity:
            max_quantity=product_quantity[product]
            top_product=product
    return top_product

print(find_top_product())

def find_top_city():
    city_revenue={}
    for row in orders:
        city=row["city"]
        revenue=int(row["quantity"])*int(row["price"])
        if city in city_revenue:
            city_revenue[city]+=revenue
        else:
            city_revenue[city]=revenue
    top_city=""
    max_revenue=0
    for city in city_revenue:
        if city_revenue[city]>max_revenue:
            max_revenue=city_revenue[city]
            top_city=city
    return top_city

print(find_top_city())

def find_average_order_value():
    total=0
    for row in orders:
        total+=int(row["quantity"])*int(row["price"])
    return total/len(orders)
print(find_average_order_value())

# Part 8: Exception Handling
try:
    with open("orders.csv","r") as file:
        reader=csv.DictReader(file)
        orders=list(reader)
except FileNotFoundError:
    print("File not found")

for row in orders:
    try:
        quantity=int(row["quantity"])
    except ValueError:
        print("Invalid quantity value")

for row in orders:
    try:
        price=int(row["price"])
    except ValueError:
        print("Invalid price value")

# Part 9: NumPy
import numpy as np
order_values=[]
for row in orders:
    order_values.append(int(row["quantity"])*int(row["price"]))
order_values=np.array(order_values)
print("Total Revenue:",np.sum(order_values))
print("Average Revenue:",np.mean(order_values))
print("Maximum Revenue:",np.max(order_values))
print("Minimum Revenue:",np.min(order_values))
print("Standard Deviation:",np.std(order_values))

# Part 10: Pandas
import pandas as pd
df=pd.read_csv("orders.csv")
print(df)

df["Revenue"]=df["quantity"]*df["price"]
print(df)

print(df.sort_values(by="Revenue",ascending=False).head())

print(df.groupby("city")["Revenue"].sum())

print(df.groupby("product")["Revenue"].sum())

print(df.groupby("product")["quantity"].sum().sort_values(ascending=False))

print(df["city"].value_counts())

# Report Generation
city_revenue={}
for row in orders:
    city=row["city"]
    revenue=int(row["quantity"])*int(row["price"])
    if city in city_revenue:
        city_revenue[city]+=revenue
    else:
        city_revenue[city]=revenue

category_revenue={}
for row in orders:
    category=row["category"]
    revenue=int(row["quantity"])*int(row["price"])
    if category in category_revenue:
        category_revenue[category]+=revenue
    else:
        category_revenue[category]=revenue

product_quantity={}
for row in orders:
    product=row["product"]
    quantity=int(row["quantity"])
    if product in product_quantity:
        product_quantity[product]+=quantity
    else:
        product_quantity[product]=quantity

top_product=max(product_quantity,key=product_quantity.get)
top_city=max(city_revenue,key=city_revenue.get)

with open("sales_summary_report.txt","w") as file:
    file.write("SALES SUMMARY REPORT\n")
    file.write(f"Total Orders: {count}\n")
    file.write(f"Total Revenue: {total_revenue}\n")
    file.write(f"Average Order Value: {average_order_value}\n")
    file.write(f"Highest Order Value: {highest_order}\n")
    file.write(f"Lowest Order Value: {lowest_order}\n\n")
    file.write("Revenue By City\n")
    for city,revenue in city_revenue.items():
        file.write(f"{city}: {revenue}\n")
    file.write("\nRevenue By Category\n")
    for category,revenue in category_revenue.items():
        file.write(f"{category}: {revenue}\n")
    file.write(f"\nTop Selling Product: {top_product}\n")
    file.write(f"Top Revenue Generating City: {top_city}\n")
print("Report Generated Successfully")

# Bonus Tasks
with open("high_value_orders.csv","w",newline="") as file:
    writer=csv.DictWriter(file,fieldnames=orders[0].keys())
    writer.writeheader()
    for row in orders:
        order_value=int(row["quantity"])*int(row["price"])
        if order_value>50000:
            writer.writerow(row)

with open("electronics_orders.csv","w",newline="") as file:
    writer=csv.DictWriter(file,fieldnames=orders[0].keys())
    writer.writeheader()
    for row in orders:
        if row["category"]=="Electronics":
            writer.writerow(row)

while True:
    print("1.View Orders")
    print("2.Revenue Analysis")
    print("3.Product Analysis")
    print("4.City Analysis")
    print("5.Export Reports")
    print("6.Exit")
    choice=int(input("Enter choice:"))
    if choice==1:
        for row in orders:
            print(row)
    elif choice==2:
        print("Total Revenue:",total_revenue)
        print("Average Order Value:",average_order_value)
        print("Highest Order Value:",highest_order)
        print("Lowest Order Value:",lowest_order)
    elif choice==3:
        print("Product Revenue:",product_revenue)
        print("Top Selling Product:",top_product)
    elif choice==4:
        print("City Revenue:",city_revenue)
        print("Top Revenue Generating City:",top_city)
    elif choice==5:
        print("Reports Exported Successfully")
    elif choice==6:
        break
    else:
        print("Invalid Choice")