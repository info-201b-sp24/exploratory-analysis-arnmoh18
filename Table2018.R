# Code for aggregated table data
Table_Data_2018 <- table(Data %>%
                           group_by(country, year, commodity) %>%
                           summarize(loss_per_avg = mean(loss_percentage, na.rm = T)) %>%
                           filter(year == "2019")
)
