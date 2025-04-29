library(comtradr) # install.packages("comtradr")
library(dplyr)
Sys.setenv('COMTRADE_PRIMARY' = '8fb28c48405841d293b5576fb90ba564')

#------- Countries --------
str(country_codes)

#------- Trade-groups --------
country_codes[which(country_codes$group==TRUE), ]

#------- Exports from Czechia --------
totalTrade <- ct_get_data(
  reporter = 'CZE',
  partner = c('DEU', 'ESP','POL'),
  commodity_code = 'TOTAL',
  start_date = "2023-01",
  end_date = "2023-12",
  freq = "M",
  flow_direction = 'export'
)

totalTradeASEAN <- ct_get_data(
  reporter = 'R4',
  partner = c('CHN'),
  commodity_code = 'TOTAL',
  start_date = "2023-01",
  end_date = "2023-12",
  freq = "M",
  flow_direction = 'export'
)



dateDummy <- paste0(totalTrade$ref_year,"-",totalTrade$ref_month,"-",1)
totalTrade$Date <- as.Date(dateDummy, format = "%Y-%m-%d")
totalTrade$Date


totalTrade

library(ggplot2)

ggplot(totalTrade, aes(Date, primary_value/1e+09, color = partner_desc, 
 group = partner_desc)) +
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_discrete(name = "Destination\nCountry") +
  scale_x_date("Rok")+
  ylab('Export Value in billions') +
  xlab('Year') +
  labs(title = "Total Value (USD) of Czech", subtitle = 'by year') +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
  theme_minimal()


