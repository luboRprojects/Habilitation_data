library(readxl) # install.packages("readxl")
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)

setwd("C:/Users/homolka/Desktop/Habilitace/Data/WUI")

excelIn	<- read_excel("WUI_Data.xlsx", sheet="T2")
countries	<- read_excel("WUI_Data.xlsx", sheet="T7")

data <- excelIn %>%
 pivot_longer(!year, names_to="Country", values_to="WUI")

#
countries %>%
 filter(region == "EUR") %>%
 select(Country = iso_code) -> eu_countries

data %>% 
 filter(Country %in% eu_countries$Country)

data <- data %>% 
 mutate(
  year_temp  = as.numeric(substring(data$year, 1,4)),
  month_temp = as.numeric(substring(data$year, 6,6))*3,
  day_temp   = days_in_month(ymd(paste0("2000-",as.numeric(substring(data$year, 6,6))*3,"-1")))
 ) 

data <- data %>% 
 mutate(Date = ymd(paste0(year_temp,"-",month_temp,"-",day_temp)) ) %>%
 select(Date, Country, WUI)

data

data %>% 
 filter(Country %in% c("CZE", "ESP")) %>% 
 filter(Date > ymd("2020-01-01") ) %>%
 ggplot(., aes(x=Date, y=WUI, group=Country, color=Country)) + 
  geom_line() +
  geom_point() +  
  facet_grid(. ~ Country) + 
  theme_bw()

