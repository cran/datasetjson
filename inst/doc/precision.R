## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example------------------------------------------------------------------
library(datasetjson)
library(dplyr)

test_df <- head(iris, 5)
test_df['float_col'] <- c(
  143.66666666666699825,
  2/3,
  1/3,
  165/37,
  6/7
)

test_items <- iris_items |> bind_rows(
  data.frame(
    itemOID = "IT.IR.float_col",
    name = "float_col",
    label = "Test column long decimal",
    dataType = "float"
  )
)

dsjson <- dataset_json(
  test_df, 
  item_oid = "test_df",
  name = "test_df",
  dataset_label = "test_df",
  columns = test_items
)

json_out <-write_dataset_json(dsjson)

out <- read_dataset_json(json_out)

test_df$float_col - out$float_col

## ----conversion---------------------------------------------------------------
json_out <-write_dataset_json(dsjson, float_as_decimals = TRUE)

out <- read_dataset_json(json_out, decimals_as_floats = TRUE)

test_df$float_col - out$float_col

## ----digits-------------------------------------------------------------------
print(format(.2, digits=16))
print(format(.2, digits=17))

