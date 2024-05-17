# Author: Arnav Mohan
# Load necessary library

library(treemap)
library(dplyr)

# Specify the path to your CSV file
#file_path <- "/Users/arnav/Desktop/INFO201/exploratory-analysis-arnmoh18/Data.csv"
file_path <- "https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-arnmoh18/main/Data.csv"

# Load the CSV file
df <- read.csv(file_path)
df$loss_quantity <- as.numeric(df$loss_quantity)

# Summarize total loss by country
df_country_sum <- df %>%
  group_by(country) %>%
  summarise(total_loss = sum(loss_quantity, na.rm = TRUE))

# Get the top 4 countries with the most waste
top_countries <- df_country_sum %>%
  arrange(desc(total_loss)) %>%
  head(4) %>%
  pull(country)

# Filter the original data for these top 4 countries
df_top_countries <- df %>%
  filter(country %in% top_countries) %>%
  group_by(country, commodity) %>%
  summarise(total_loss = sum(loss_quantity, na.rm = TRUE))

# Create treemap
treemap(df_top_countries,
        index = c("country", "commodity"),
        vSize = "total_loss",
        title = "Food Waste by Commodity in Top 4 Countries",
        palette = "Dark2")

# Print purpose and observations
cat("Purpose of the chart: This treemap visualizes the total food waste by commodity for the top 4 countries with the most waste. The size of each box represents the total loss of each commodity in each country.\n")
cat("Notable observations: From this map we can tell that from the 4 countries with the most waste in the dataset, we can tell how an environment can impact the type of commodities wasted. We can see Mexico has a lot of dairy and meat waste likely due to its hot weather. Pakistan seems to loose a lot of fruits and vegetables due to their heat. ")