# Assuming your data frame is named 'Data'
library(dplyr)
file_path <- "https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-arnmoh18/main/Data.csv"

# Load the CSV file
Data <- read.csv(file_path)
# Create a new table that summarizes the maximum loss percentage by country and commodity
max_loss_by_country_commodity <- Data %>%
  group_by(country, commodity) %>%
  summarize(max_loss = round(max(as.numeric(gsub("%", "", loss_percentage)), na.rm = TRUE), 2)) %>%
  arrange(desc(max_loss))

# View the resulting table
print(max_loss_by_country_commodity)
