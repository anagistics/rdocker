#* @apiTitle R Demo Service
library(DBI)

#* Create a CSV fuke diagnosis
#* @parser csv
#* @serializer json
#* @post /diag
function(req, res) {
  data <- req$body
  col <- req$argsQuery[["column"]]
  
  ddiag <- as.vector(summary(data[[col]]), mode = "list")
  
  return(ddiag)
}

get_conn <- function() {
  return(dbConnect(RPostgres::Postgres(), dbname = "andreas_db",
		   host = "172.17.0.1", port = 6666, 
		   user = "postgres", password = Sys.getenv("DBPASS")))
}

#* Get some data from database
#* @serializer json
#* @param column the name of the column
#* @param species the name of the species of choice
#* @get /iris
function(column = "", species = "") {
  column <- toupper(gsub("\\.", "_", column))

  con <- get_conn() 

  stmt <- paste0("select ", column, " from iris where species = '",
		 species, "'")

  print(stmt)

  res <- dbSendQuery(con, stmt)
  data <- dbFetch(res)

  dbClearResult(res)
  dbDisconnect(con)
  return(data)
}

query <- function(sql) {
  con <- get_conn()
  res <- dbSendQuery(con, sql)
  data <- dbFetch(res)
  dbClearResult(res)
  dbDisconnect(con)
  return(data)
}

#* Get column names of table
#* @serializer json
#* @get /iris/columns
function() {
  "select column_name from information_schema.columns where table_name='iris' and lower(column_name) != 'species'" |> query()
}

#* Get list of species
#* @serializer json
#* @get /iris/species
function() {
  "select distinct species from iris" |> query()
}

