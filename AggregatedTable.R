# Assuming your data frame is named 'Data'
library(dplyr)

# Create a new table that summarizes the maximum loss percentage by country and commodity
max_loss_by_country_commodity <- Data %>%
  group_by(country, commodity) %>%
  summarize(max_loss = max(as.numeric(gsub("%", "", loss_percentage)), na.rm = TRUE)) %>%
  arrange(desc(max_loss))

# View the resulting table
print(max_loss_by_country_commodity)
