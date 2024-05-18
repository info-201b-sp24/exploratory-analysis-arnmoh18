# Exploratory Analysis -- Food Waste Bar Plots
# Mohamed Aden, Arnav Mohan, Alex Hsu

# Loading in needed packages.
# install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# Loading in (CSV) data containing metadata on food waste worldwide.
file_path <- "https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-arnmoh18/main/Data.csv"
food_waste_data <- read.csv(file_path)

# Previewing file
head(food_waste_data)

# Grouping same commodities (by keyword) and averaging food loss %, and retrieving top
# three commodities in terms of highest loss percent.
commodities_grouped_df <- food_waste_data %>%
  group_by(commodity) %>%
  summarise(average_loss_percent = mean(loss_percentage)) %>%
  arrange(desc(average_loss_percent)) %>%
  head(3)

# Creating barplot with commodities on x-axis and loss percentages on y-axis.
# X-axis labels angled for readibility due to overcrowding of characters.
commodities_grouped_plot <- ggplot(commodities_grouped_df, aes(x = commodity, y = average_loss_percent)) +
  geom_col() +
  labs(title = "Food Loss Percentages by Commodity", x = "Commodiity (The Specified Food Wasted)", y = "Average Food Loss Percentage for this commoditity") +
  theme(axis.text.x = element_text(colour = "#2E216B", size = 7, angle = 12.5, vjust = 1))

# Displaying Barplot
print(commodities_grouped_plot)