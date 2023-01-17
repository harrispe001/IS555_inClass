library(tidyverse)

df <- starwars

#filtering


#AGGREGATE FUNCTIONS AND GROUP BY
df %>% 
  group_by(species) %>% 
  summarize(mean_species_height = mean(height, na.rm = TRUE),
            max_height = max(height, na.rm = TRUE),
            count = n())

#SEE DROIDS IN DATA SET
df %>% 
  filter(species == "Droid")


#TOP 5 PEOPLE BY HEIGHT
df %>% 
  select(height) %>%
  arrange(desc(height)) %>% 
  slice_head(n = 5)

df %>% 
  slice_max(height, n = 5)

df %>% 
  group_by(species) %>% 
  slice_max(height, n = 1) %>% 
  arrange(species) %>% 
  select(name, height, species)


#What is relative height for each species
df %>% 
  group_by(height) %>% 
  mutate(mean_species_height = mean(height, na.rm = TRUE)) %>% 
  mutate(taller_than_average =
