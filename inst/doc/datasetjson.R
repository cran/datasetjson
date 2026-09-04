## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datasetjson)

## ----sample_call--------------------------------------------------------------
ds_json <- dataset_json(head(iris, 5), 
                        item_oid = "IG.IRIS", 
                        name = "IRIS", 
                        dataset_label = "Iris", 
                        columns = iris_items)

## ----iris_items---------------------------------------------------------------
iris_items

## ----write, eval=FALSE--------------------------------------------------------
# write_dataset_json(ds_json, file="iris.json")

## ----write_char---------------------------------------------------------------
js <- write_dataset_json(ds_json, pretty=TRUE)
cat(js)

## ----read, eval=FALSE---------------------------------------------------------
# read_dataset_json("path/to/file")

## ----read_char----------------------------------------------------------------
dat <- read_dataset_json(js)

## ----ndjson, eval=FALSE-------------------------------------------------------
# write_dataset_ndjson(ds_json, file = "iris.ndjson")
# 
# dat <- read_dataset_ndjson("iris.ndjson")

## ----ndjson_char--------------------------------------------------------------
nd <- write_dataset_ndjson(ds_json)
cat(nd)

## ----dsjc, eval=FALSE---------------------------------------------------------
# write_dataset_dsjc(ds_json, file = "iris.dsjc")
# 
# dat <- read_dataset_dsjc("iris.dsjc")

## ----dsjc_size----------------------------------------------------------------
sizes <- vapply(
  c("dm.json", "dm.ndjson", "dm.dsjc"),
  function(f) file.size(datasetjson_example(f)),
  numeric(1)
)

sizes

## ----dsjc_raw-----------------------------------------------------------------
bytes <- write_dataset_dsjc(ds_json)

head(bytes)

## ----column_metadata----------------------------------------------------------
get_column_metadata(dat)

## ----variable_attributes------------------------------------------------------
dat <- set_variable_attributes(dat)
attributes(dat$Species)

