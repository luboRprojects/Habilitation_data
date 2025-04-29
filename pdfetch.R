library(pdfetch) # install.packages("pdfetch")
# pdfetch_EUROSTAT()
# pdfetch_WB()
# pdfetch_ECB()
# pdfetch_YAHOO()

#-------------------
# GDP
descGDP <- pdfetch_EUROSTAT_DSD("namq_10_gdp")

gdpData <- pdfetch_EUROSTAT(flowRef="namq_10_gdp", from="2023-01-01", to="2025-05-31")
gdpData2 <- pdfetch_EUROSTAT(flowRef="namq_10_gdp", from="2010-01-01", to="2025-05-31",
 S_ADJ="CA", UNIT="CP_MNAC", GEO="CZ", NA_ITEM="P3_S13")

GEO=c("CZK", "DE", "ES"))


2023-01-01



#-------------------
# Economic sentiment analysis
sentDataIn <- pdfetch_EUROSTAT("ei_bssi_m_r2")



# For this query, geo is not allowed



)
"namq_gdp_c", FREQ="Q", S_ADJ="NSA", UNIT="MIO_EUR", 
                          INDIC_NA="B1GM", GEO=c("DE","UK")