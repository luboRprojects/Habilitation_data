library(pdfetch)

ECZK_VIX <- pdfetch_YAHOO(
  identifiers = c("EURCZK=X","^VIX"),
  fields = c("close"),
  from = as.Date("2020-01-01"),
  to = Sys.Date(),
  interval = c("monthly")
)

