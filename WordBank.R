library(pdfetch) 	# beware of dplyr::filter()
library(lubridate)

tableWB 	<- c("NY.GDP.MKTP.CD")	# https://wdi.worldbank.org/table
gdpDataIn 	<- pdfetch_WB(tableWB, c("CZE", "ES"))
gdpData 	<- gdpDataIn

# Clean column names -> inconsistent naming, not ISO
colnames(gdpData) <- sub(paste0(tableWB,"."), '', colnames(gdpData))
head(gdpData)

# Plot time-series
gdpData %>% 
 window(., start = "2010-01-01") %>%
 plot(.)