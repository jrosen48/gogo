library(tidyverse)
library(googlesheets4)

start_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 1)
start_2 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 2)
start_3 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 3)

end_1 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 1)
end_2 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 2)
end_3 <- read_sheet("https://docs.google.com/spreadsheets/d/1olSCB0OeuG1Ysqbj-0SYkZnskJkTNhi0BWI8_sONWe0/edit#gid=1481701584", sheet = 3)
