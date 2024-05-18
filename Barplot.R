# Exploratory Analysis -- Food Waste Bar Plots
# Mohamed Aden, Arnav Mohan, Alex Hsu


# Loading in ggplot2 exclusively as dplyr.
install.packages("ggplot2")
library(ggplot2)
library(dplyr)


# Loading in (CSV) data containing metadata on food waste worldwide.
food_waste_data <- read.csv("Data.csv")

# Previewing file
#head(food_waste_data)
# Group countries and loss % beforehand for simplicity
# Using loss_percentages (not loss_percentages_original) for more precise calculations when calculating averages.

# Grouping same commodities (by keyword) and averaging food loss %, and retrieving top
# four commodities with highest loss percent.
commodities_grouped_df <- food_waste_data %>%
  group_by(commodity) %>%
  summarise(average_loss_percent = mean(loss_percentage)) %>%
  arrange(desc(average_loss_percent)) %>%
  head(3)

 # Creating barplot with commodities on x-axis and loss percentages on y-axis.
commodities_grouped_plot <- ggplot(commodities_grouped_df, aes(x = commodity, y = average_loss_percent)) +
  geom_col() +
  labs(title = "Food Loss Percentages by Commodity", x = "Commodiity", y = "Average Food Loss Percentage for this commoditity")

# Displaying barplot
print(commodities_grouped_plot)


# Grouping same countries (by keyword) and averaging food loss %, and moving to new data frame.
countries_grouped_df <- food_waste_data %>%
  group_by(country) %>%
  summarize(avr_loss_percent = mean(loss_percentage))

# Checking country count in original df
# nrow(countries_grouped_df)
# 123 countries represented in original data

# Grouping same years (regardless of location) and averaging food loss into new DF
years_grouped_df <- food_waste_data %>%
  group_by(year) %>%
  summarise(average_loss_percent = mean(loss_percentage))

# Plotting Country vs loss cer
# ISSUE: Too many countries in plot
country_loss_plot <- ggplot(countries_grouped_df, aes(x = country, y = avr_loss_percent)) +
  geom_col() +
  labs(title = "Food Loss Percentages by Country", x = "Country(Grouped)", y = "Average Food Loss Percentage")

print(country_loss_plot)
