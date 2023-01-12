library(tidyverse)

#(starwars tibble is always present when the tidyverse is loaded)
starwars
see_it <- starwars
#filtering

starwars_new <- starwars %>%
  filter(height > 100,
         sex == 'female') %>% 
  select(name, height, mass, species, films) %>% 
  # print(n=50)
  # View()
  arrange(desc(mass) ) %>% 
  # arrange(mass)
  mutate(
    weight_lbs = mass * 2.204
  )
