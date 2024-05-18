# code for line plot/Chart 1
file_path <- "https://raw.githubusercontent.com/info-201b-sp24/exploratory-analysis-arnmoh18/main/Data.csv"

# Load the CSV file
Data <- read.csv(file_path)
year_avg <-  Data %>%
  group_by(year) %>%
  summarize(loss_per_avg = mean(loss_percentage, na.rm = T)) 

g1= ggplot(data = year_avg, aes(x=year, y=loss_per_avg)) +
  geom_line() +
  geom_point()
g1 + labs(title="Year vs Food Loss", y="Percent Loss (%)", x="Year", caption="Demo")
