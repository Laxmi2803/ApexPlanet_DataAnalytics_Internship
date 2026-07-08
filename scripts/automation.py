import pandas as pd

print("Loading Dataset...")

# Read Dataset
df = pd.read_csv("data/Sample-Superstore.csv")

print("Dataset Loaded Successfully")

# Remove duplicate rows
df = df.drop_duplicates()

# Fill missing values
df = df.ffill()

# Save cleaned dataset
df.to_csv("data/cleaned_superstore.csv", index=False)

print("Cleaned Dataset Saved")

# Calculate KPIs
total_sales = df["Sales"].sum()
total_profit = df["Profit"].sum()
total_orders = len(df)
total_customers = df["Customer ID"].nunique()

print("KPIs Calculated")

# Create KPI Report
kpi = pd.DataFrame({
    "Metric": [
        "Total Sales",
        "Total Profit",
        "Total Orders",
        "Total Customers"
    ],
    "Value": [
        total_sales,
        total_profit,
        total_orders,
        total_customers
    ]
})

# Export KPI Report
kpi.to_excel("reports/KPI_Report.xlsx", index=False)

print("Excel Report Created")
print("Task 5 Automation Completed Successfully")