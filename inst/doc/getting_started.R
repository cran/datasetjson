## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datasetjson)

## ----sample_call--------------------------------------------------------------
ds_json <- dataset_json(iris[1:5, ], "IG.IRIS", "IRIS", "Iris", iris_items)

## ----iris_items---------------------------------------------------------------
iris_items

## ----setters------------------------------------------------------------------
ds_updated <- ds_json |>
  set_data_type("referenceData") |>
  set_file_oid("/some/path") |>
  set_metadata_ref("some/define.xml") |>
  set_metadata_version("MDV.MSGv2.0.SDTMIG.3.3.SDTM.1.7") |>
  set_originator("Some Org") |>
  set_source_system("source system", "1.0") |>
  set_study_oid("SOMESTUDY")

## ----prebuilds----------------------------------------------------------------
file_meta <- file_metadata(
  originator = "Some Org",
  sys = "source system",
  sys_version = "1.0"
)

data_meta <- data_metadata(
  study = "SOMESTUDY",
  metadata_version = "MDV.MSGv2.0.SDTMIG.3.3.SDTM.1.7",
  metadata_ref = "some/define.xml"
)

dataset_meta <- dataset_metadata(
  item_id = "IG.IRIS",
  name = "IRIS",
  label = "Iris",
  items = iris_items
)

ds_json_from_meta <- dataset_json(
  iris,
  dataset_meta = dataset_meta,
  file_meta = file_meta,
  data_meta = data_meta
)

## ----prebuilds_2--------------------------------------------------------------
file_meta <- file_metadata(
  originator = "Some Org",
  sys = "source system",
  sys_version = "1.0"
)

data_meta <- data_metadata(
  study = "SOMESTUDY",
  metadata_version = "MDV.MSGv2.0.SDTMIG.3.3.SDTM.1.7",
  metadata_ref = "some/define.xml"
)


ds_json_from_meta <- dataset_json(
  iris,
  item_id = "IG.IRIS",
  name = "IRIS",
  label = "Iris",
  items = iris_items,
  file_meta = file_meta,
  data_meta = data_meta
)

## ----write, eval=FALSE--------------------------------------------------------
#  write_dataset_json(ds_updated, file="iris.json")

## ----write_char---------------------------------------------------------------
js <- write_dataset_json(ds_updated, pretty=TRUE)
cat(js)

## ----read, eval=FALSE---------------------------------------------------------
#  read_dataset_json("path/to/file")

## ----read_char----------------------------------------------------------------
dat <- read_dataset_json(js)

## ----attributes---------------------------------------------------------------
attributes(dat)

## ----col_attributes-----------------------------------------------------------
attributes(dat$Species)

