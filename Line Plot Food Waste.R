# code for line plot/Chart 1
year_avg <-  Data %>%
  group_by(year) %>%
  summarize(loss_per_avg = mean(loss_percentage, na.rm = T)) 

g1= ggplot(data = year_avg, aes(x=year, y=loss_per_avg)) +
  geom_line() +
  geom_point()
g1 + labs(title="Year vs Food Loss", y="Percent Loss (%)", x="Year", caption="Demo")