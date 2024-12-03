
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Load the dataset
data = pd.read_csv("data.csv")

# Display the dataset
print("Dataset:")
print(data.head())

# Summary Statistics
print("\nSummary Statistics:")
print(data.describe())

# Check for Missing Values
print("\nMissing Values:")
print(data.isnull().sum())

# Filter: High Scorers
high_scorers = data[data["Score"] > 70]
print("\nHigh Scorers:")
print(high_scorers)

# Group: Average Score by Gender
avg_score_by_gender = data.groupby("Gender")["Score"].mean()
print("\nAverage Score by Gender:")
print(avg_score_by_gender)

# Visualization: Histogram
plt.hist(data["Age"], bins=5, color="blue", alpha=0.7)
plt.title("Age Distribution")
plt.xlabel("Age")
plt.ylabel("Frequency")
plt.show()

# Visualization: Bar Chart
avg_score_by_gender.plot(kind="bar", color=["pink", "skyblue"])
plt.title("Average Score by Gender")
plt.xlabel("Gender")
plt.ylabel("Average Score")
plt.show()

# Visualization: Scatter Plot
plt.scatter(data["Age"], data["Score"], color="green", alpha=0.7)
plt.title("Age vs Score")
plt.xlabel("Age")
plt.ylabel("Score")
plt.show()

# Visualization: Line Plot
data.plot(x="ID", y="Score", kind="line", color="red", marker="o")
plt.title("Score Trend by ID")
plt.xlabel("ID")
plt.ylabel("Score")
plt.show()


# dataset
# ID,Name,Age,Gender,Score
# 1,Alice,25,F,85
# 2,Bob,30,M,70
# 3,Charlie,35,M,90
# 4,Diana,40,F,75
# 5,Eve,45,F,60