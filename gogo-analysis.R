library(tidyverse)
library(googlesheets4)

start_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 1, n_max = 21)
start_2 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 2, n_max = 17)
start_3 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 3, n_max = 18)

end_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1RIBfcVUh5B0wA_jzGHVbPlSezVJWcuCekqWa2zSgnqw/edit#gid=429607552", sheet = 1)
end_2 <- read_sheet("https://docs.google.com/spreadsheets/d/1RIBfcVUh5B0wA_jzGHVbPlSezVJWcuCekqWa2zSgnqw/edit#gid=429607552", sheet = 2)
end_3 <- read_sheet("https://docs.google.com/spreadsheets/d/1RIBfcVUh5B0wA_jzGHVbPlSezVJWcuCekqWa2zSgnqw/edit#gid=429607552", sheet = 3)

start_1 <- start_1 %>% janitor::clean_names()
start_2 <- start_2 %>% janitor::clean_names()
start_3 <- start_3 %>% janitor::clean_names()

end_1 <- end_1 %>% janitor::clean_names()
end_2 <- end_2 %>% janitor::clean_names()
end_3 <- end_3 %>% janitor::clean_names()

start_1 <- start_1 %>% rename(names = to_start_please_enter_your_first_and_last_name_below)
end_1 <- end_1 %>% rename(names = to_start_please_enter_your_first_and_last_name_below)

# Create a vector with the pseudonyms
pseudonyms <- c(
  "Jaime Olaya" = "Jordan",
  "Evan Chen" = "Liam",
  "Hazel Jamtsho" = "Grace",
  "Colin Chen" = "Aiden",
  "Amberamora Edwards" = "Sophia",
  "Jacqueline Dutan" = "Isabella",
  "Davien Martinez" = "Michael",
  "Ellianne Torivio" = "Olivia",
  "Andy Lu" = "Lucas",
  "Rex He" = "Jack",
  "Samantha Peralta" = "Emma",
  "Ariana Rojas" = "Mia",
  "Esteban Ortiz" = "Noah",
  "Sophie Zhang" = "Ava",
  "Dominic Del Rosario" = "Ethan",
  "Ryan Berrios" = "James",
  "America Cuevas" = "Charlotte",
  "Alan Chen" = "Benjamin",
  "Pablo" = "Henry"
)

pseudonyms["Pablo Cunache"] <- "Henry" # for a small difference

start_1 <- start_1 %>% mutate(names = tools::toTitleCase(names))
end_1 <- end_1 %>% mutate(names = tools::toTitleCase(names))

start_1 <- start_1 %>%
  mutate(names = recode(names,
                        !!!pseudonyms
  ))

end_1 <- end_1 %>%
  mutate(names = recode(names,
                        !!!pseudonyms
  ))

start_1 <- start_1 %>% 
  mutate(when_was_the_pokemon_game_first_created = recode(when_was_the_pokemon_game_first_created,
                                                          "I could use or collect a data set to answer this question." = -1,
                                                          "I could answer the question without data." = 1,
                                                          "I'm not sure." = 0,
                                                          .default = 0
  ))

start_1 <- start_1 %>% 
  mutate(what_do_kids_learn_by_playing_pokemon_games = recode(what_do_kids_learn_by_playing_pokemon_games,
                                                              "I could use or collect a data set to answer this question." = 1,
                                                              "I could answer the question without data." = -1,
                                                              "I'm not sure." = 1,
                                                              .default = 0
  ))

start_1 <- start_1 %>% 
  mutate(how_has_the_price_of_the_holographic_charizard_card_changed_since_it_first_came_out = recode(how_has_the_price_of_the_holographic_charizard_card_changed_since_it_first_came_out,
                                                                                                      "I could use or collect a data set to answer this question." = 1,
                                                                                                      "I could answer the question without data." = -1,
                                                                                                      "I'm not sure." = 1,
                                                                                                      .default = 0
  ))

start_1 <- start_1 %>% 
  mutate(is_pikachu_the_most_popular_pokemon = recode(is_pikachu_the_most_popular_pokemon,
                                                      "I could use or collect a data set to answer this question." = 1,
                                                      "I could answer the question without data." = -1,
                                                      "I'm not sure." = 1,
                                                      .default = 0
  ))

start_1 %>% select(when_was_the_pokemon_game_first_created:is_pikachu_the_most_popular_pokemon) %>% 
  gather(key, val) %>% 
  ggplot(aes(x = val)) + 
  geom_histogram() +
  facet_wrap(~key, nrow = 4) +
  theme_minimal()

start_2