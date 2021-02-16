# Install devtools from CRAN
#install.packages("devtools")

############################################################
# Turn off OneDrive before running (File locking issue)
###########################################################

# Install adobeanayticsr from github
#devtools::install_github('benrwoodard/adobeanalyticsr', force = TRUE) 
#usethis::edit_r_environ()

# Load the package
library(adobeanalyticsr)
#Test access to Sys.getenv is working correctly
#client_id = Sys.getenv("AW_CLIENT_ID")
#client_secret = Sys.getenv("AW_CLIENT_SECRET")

aw_token()
browser()

get_me()

aw_metrics <- aw_get_metrics()
aw_dims <- aw_get_dimensions()
aw_reportsuites <- aw_get_reportsuites()
aw_calculatedmetrics <- aw_get_calculatedmetrics()
aw_segments <- aw_get_segments()

aw_segments <- aw_get_segments(
  company_id = Sys.getenv("AW_COMPANY_ID"),
  rsids = NA,
  segmentFilter = NA,
  locale = "en_US",
  name = NA,
  tagNames = NA,
  filterByPublishedSegments = "all",
  limit = 1000,
  page = 0,
  sortDirection = "ASC",
  sortProperty = "id",
  expansion = "ownerFullName",
  includeType = "all",
  debug = FALSE
)

testdata <- aw_freeform_table(
  company_id = Sys.getenv("AW_COMPANY_ID"),
  rsid = Sys.getenv("AW_REPORTSUITE_ID"),
  date_range = c(Sys.Date() - 30, Sys.Date() - 1),
  dimensions = c("evar26"),
  metrics = c("visits", "visitors"),
  top = c(50),
  page = 0,
  filterType = "breakdown",
  segmentId = NA,
  metricSort = "desc",
  include_unspecified = TRUE,
  search = NA,
  prettynames = FALSE,
  debug = FALSE
)

testdata2_workspace <- aw_workspace_report(
  req_body = "test.json",
  company_id = Sys.getenv("AW_COMPANY_ID"),
  client_id = Sys.getenv("AW_CLIENT_ID"),
  client_secret = Sys.getenv("AW_CLIENT_SECRET")
)
