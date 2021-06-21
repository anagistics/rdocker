#* @apiTitle R Demo Service

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

