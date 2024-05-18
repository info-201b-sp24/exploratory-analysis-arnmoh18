# Code for Table of aggregated data
Table_Data_2018 <- table(Data %>%
  group_by(country, year, commodity) %>%
  summarize(loss_per_avg = mean(loss_percentage, na.rm = T)) %>%
  filter(year == "2018")
)
            
# code for minimum data point
  Data %>%
  group_by(country) %>%
  summarize(loss_per_min = min(loss_percentage, na.rm = T)) %>%
  arrange(loss_per_min) %>%
  head(1) 
#code for maximum data point
  Data %>%
  group_by(country) %>%
  summarize(loss_per_max = max(loss_percentage, na.rm = T)) %>%
  arrange(desc(loss_per_max)) %>%
  head(1) 
#code for averages per year
year_avg <-  Data %>%
    group_by(year) %>%
    summarize(loss_per_avg = mean(loss_percentage, na.rm = T)) 
#code for commodity with the highest food waste
Data %>%
  group_by(commodity) %>%
  summarize(com_max = max(loss_percentage, na.rm = T)) %>%
  arrange(desc(com_max))
  
#code for commodity with the lowest food waste
Data %>%
  group_by(commodity) %>%
  summarize(com_min = min(loss_percentage, na.rm = T)) %>%
  arrange(desc(com_min))
#code for line plot
g1= ggplot(data = year_avg, aes(x=year, y=loss_per_avg)) +
  geom_line() +
  geom_point()
g1 + labs(title="Year vs Food Loss", y="Percent Loss (%)", x="Year", caption="Demo")