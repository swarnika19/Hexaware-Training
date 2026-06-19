use inventory_db

db.createCollection("audit_logs")
db.createCollection("stock_adjustments")

db.audit_logs.insertMany([
    {
        event_type: "STOCK_IN",
        product_id: 2,
        product_name: "Mechanical Keyboard",
        warehouse_id: 1,
        warehouse_name: "Warehouse Alpha",
        quantity: 50,
        performed_by: "Arjun Sharma",
        timestamp: new Date("2024-01-15T10:30:00"),
        details: "Restocked from TechParts PO#1021"
    },
    {
        event_type: "STOCK_OUT",
        product_id: 5,
        product_name: "HDMI Cable 2m",
        warehouse_id: 2,
        warehouse_name: "Warehouse Beta",
        quantity: 10,
        performed_by: "Priya Nair",
        timestamp: new Date("2024-01-15T11:45:00"),
        details: "Dispatched for order #4455"
    },
    {
        event_type: "ADJUSTMENT",
        product_id: 6,
        product_name: "Webcam 1080p",
        warehouse_id: 1,
        warehouse_name: "Warehouse Alpha",
        quantity: 20,
        performed_by: "Ramesh Kumar",
        timestamp: new Date("2024-01-16T09:00:00"),
        details: "Physical count found extra units"
    },
    {
        event_type: "TRANSFER",
        product_id: 1,
        product_name: "Wireless Mouse",
        from_warehouse: "Warehouse Alpha",
        to_warehouse: "Warehouse Beta",
        quantity: 30,
        performed_by: "Arjun Sharma",
        timestamp: new Date("2024-01-16T14:20:00"),
        details: "Stock transfer to meet Beta demand"
    },
    {
        event_type: "STOCK_OUT",
        product_id: 3,
        product_name: "USB-C Hub",
        warehouse_id: 3,
        warehouse_name: "Warehouse Gamma",
        quantity: 5,
        performed_by: "Priya Nair",
        timestamp: new Date("2024-01-17T08:15:00"),
        details: "Dispatched for order #4460"
    }
])

db.stock_adjustments.insertMany([
    {
        product_id: 6,
        product_name: "Webcam 1080p",
        warehouse_id: 1,
        adjustment_type: "POSITIVE",
        quantity_before: 4,
        quantity_after: 24,
        reason: "Physical count mismatch — found units in back storage",
        adjusted_by: "Ramesh Kumar",
        approved_by: "Arjun Sharma",
        timestamp: new Date("2024-01-16T09:00:00")
    },
    {
        product_id: 2,
        product_name: "Mechanical Keyboard",
        warehouse_id: 3,
        adjustment_type: "NEGATIVE",
        quantity_before: 5,
        quantity_after: 3,
        reason: "2 units found damaged during inspection",
        adjusted_by: "Priya Nair",
        approved_by: "Ramesh Kumar",
        timestamp: new Date("2024-01-17T10:30:00")
    },
    {
        product_id: 4,
        product_name: "Laptop Stand",
        warehouse_id: 2,
        adjustment_type: "NEGATIVE",
        quantity_before: 380,
        quantity_after: 370,
        reason: "10 units written off due to packaging damage",
        adjusted_by: "Arjun Sharma",
        approved_by: "Priya Nair",
        timestamp: new Date("2024-01-18T13:00:00")
    }
])

db.audit_logs.createIndex({ product_id: 1 })
db.audit_logs.createIndex({ warehouse_id: 1 })
db.audit_logs.createIndex({ event_type: 1 })
db.audit_logs.createIndex({ timestamp: -1 })

db.stock_adjustments.createIndex({ product_id: 1 })
db.stock_adjustments.createIndex({ warehouse_id: 1 })
db.stock_adjustments.createIndex({ timestamp: -1 })

db.audit_logs.find({ product_id: 2 })
db.audit_logs.find({ event_type: "ADJUSTMENT" })
db.audit_logs.find({ warehouse_id: 1 }).sort({ timestamp: -1 })
db.stock_adjustments.find({ adjustment_type: "NEGATIVE" })
db.stock_adjustments.find({ product_id: 6 })