library(plumber)

Sys.setenv(DBPASS="nomadrid")

plumb("rservice.R") %>%
  pr_run(host = "0.0.0.0", port = 3000)


