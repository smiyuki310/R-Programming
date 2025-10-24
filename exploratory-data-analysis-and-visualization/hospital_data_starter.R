# Ungraded Lab: First Steps in EDA: Hospital Patient Data Analysis

# Install necessary packages (if not already installed)
# install.packages("tidyverse")
# install.packages("ggplot2")

# Load the required libraries
library(tidyverse)
library(ggplot2)
library(lubridate)
library(stringr)
library(readr)


patient_data <- read_csv("healthcare_1.csv")
spec(patient_data)
# ================================================
# Activity 1: Summary Statistics of Key Health Metrics
# ================================================

# Compute summary statistics for the entire dataset. 
# Calculate the mean and standard deviation for 'Age' and 'BMI'.

# Example
# summary(patient_data)

# mean_age <- mean(patient_data$Age, na.rm = TRUE)
# sd_age <- sd(patient_data$Age, na.rm = TRUE)

# mean_bmi <- mean(patient_data$BMI, na.rm = TRUE)
# sd_bmi <- sd(patient_data$BMI, na.rm = TRUE)


# Try it Out #1: Calculate the mean and standard deviation for both BloodPressure_Systolic and BloodPressure_Diastolic.

# Steps:
# - Use mean() and sd() functions.
# - Handle missing values with na.rm = TRUE.

mean1 <- mean(patient_data$BloodPressure_Systolic, na.rm = TRUE)
sd1 <- sd(patient_data$BloodPressure_Systolic, na.rm = TRUE)

mean2 <- mean(patient_data$BloodPressure_Diastolic, na.rm = TRUE)
sd2 <- sd(patient_data$BloodPressure_Diastolic, na.rm = TRUE)


# ================================================
# Activity 2: Visualizing Demographic Trends
# ================================================

# Generate a histogram for the age distribution.
# Example:
# plot_a <- ggplot(patient_data, aes(x = Age)) +
#   geom_histogram(binwidth = 5, fill = "blue", color = "white") +
#   labs(title = "Age Distribution of Hospital Patients", x = "Patient Age", y = "Count")

# print(plot_a)

# Try it Out #1: Create a boxplot comparing BMI distributions across different gender categories.

# Steps:
# - Define x-axis as Gender and y-axis as BMI.
# - Use geom_boxplot() to display BMI distribution by gender.
# - Ensure clarity and readability with proper labeling.


# Store your boxplot in a variable plot_2 and print to send to the VSCode Viewer
plot_2 <- ggplot(patient_data, aes(x= Gender, y= BMI))+
          geom_boxplot() +
          labs(title= "BMI distribution across genders")
print(plot_2)


# ================================================
# Activity 3: Exploring Health Indicator Relationships
# ================================================

# Visualize the BMI and Blood Pressure relationship
# plot_b <- ggplot(patient_data, aes(x = BMI, y = BloodPressure_Systolic)) +
#   geom_point(alpha = 0.5) +
#   labs(title = "Correlation between BMI and Systolic Blood Pressure",
#        x = "BMI", y = "Systolic Blood Pressure")
# print(plot_b)

# Try it Out #1: To help the healthcare team address issues related to cholesterol management, visualize the relationship between BMI and Cholesterol.

# Steps:
# Create a scatter plot using geom_point to visualize the relationship between BMI and Cholesterol.
# Document and interpret any interesting findings from the plot.

plot_3 <- ggplot(patient_data, aes(x= BMI, y= Cholesterol))+
          geom_point(alpha = 0.5) +
          labs(title= "Correlation between BMI and Cholesterol", x= "BMI", y="Cholesterol")
print(plot_3)

# ================================================
# Activity 4: Analyzing Hospitalization Patterns
# ================================================

# Generate grouped boxplots to compare Insurance types in their hospital visit frequencies.
# plot_c <- ggplot(patient_data, aes(x = Insurance, y = HospitalVisits)) +
#   geom_boxplot(fill = "lightgreen", alpha = 0.7) +
#   labs(title = "Hospital Visits by Insurance Type", x = "Insurance Type", y = "Number of Visits")

# print(plot_c)

# Try it Out #1: Create a boxplot comparing HospitalVisits for patients with and without diabetes.

# Steps:
# - Create a boxplot comparing HospitalVisits for patients with and without diabetes.
# - Use the filter() function to distinguish the Diabetes status.

plot_4 <- ggplot(patient_data, aes(x= as.factor(Diabetes), y= HospitalVisits))+
          geom_boxplot() +
          labs(title= "Hopspital visits for patients with and without diabetes", x= "Diabetes", y="Hospital visits")
print(plot_4)
