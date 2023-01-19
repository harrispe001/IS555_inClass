library(tidyverse)
library(nycflights13)

df_flights <- flights
df_airlines <-  airlines
df_planes <-  planes

flights2 <- df_flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)

flights_joined <- df_flights %>% 
  left_join(df_airlines, by = c('carrier' = 'carrier')) %>% 
  left_join(df_planes, by = c('tailnum' = 'tailnum'))

#find distinct keys compare with rowcount
df_airlines %>% distinct(carrier) %>% count()
df_airlines %>% distinct(carrier, .keep_all = TRUE)
df_airlines %>%  count()

?left_join


#What is the average birth year of planes associated with delayed departures flights to atlanta
flights_joined <- df_flights %>% 
  left_join(df_airlines, by = c('carrier' = 'carrier')) %>% 
  left_join(df_planes, by = c('tailnum' = 'tailnum'))

flights_joined %>% 
  filter(dep_delay > 0) %>% 
  filter(dest == 'ATL') %>% View()
  summarise(mean_delay = mean(year.y, na.rm = TRUE))


  
  #Professor O
  df_flights %>% 
    #left_join(df_planes %>%  select(tailnum, year) %>%  rename(manufacture_year = year)) %>% 
    left_join(df_planes, by = c('tailnum' = 'tailnum'), suffix = c('_flight', '_plane')) %>% 
    # glimpse

