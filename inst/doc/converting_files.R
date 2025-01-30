## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datasetjson)

## ----XPT conversion-----------------------------------------------------------
adsl <- haven::read_xpt(file.path(system.file(package='datasetjson'), "adsl.xpt"))

#' Gather variable metadata in Dataset JSON compliant format
#'
#' @param n Variable name
#' @param .data Dataset to gather attributes
#'
#' @returns Columns compliant data frame
extract_xpt_meta <- function(n, .data) {
  
  attrs <- attributes(.data[[n]])
  
  out <- list()

  # Identify the variable type
  if (inherits(.data[[n]],"Date")) {
    out$dataType <- "date"
    out$targetDataType <- "integer"
  } else if (inherits(.data[[n]],"POSIXt")) {
    out$dataType <- "datetime"
    out$targetDataType <- "integer"
  } else if (inherits(.data[[n]],"numeric")) {
    if (any(is.double(.data[[n]]))) out$dataType <- "float"
    else out$dataType <- "integer"
  }  else if (inherits(.data[[n]],"hms")) {
    out$dataType <- "time"
    out$targetDataType <- "integer"
  } else {
    out$dataType <- "string"
    out$length <- max(purrr::map_int(.data[[n]], nchar))
  }
  
  out$itemOID <- n
  out$name <- n
  out$label <- attr(.data[[n]], 'label')
  out$displayFormat <- attr(.data[[n]], 'format.sas')
  tibble::as_tibble(out)
  
}

# Loop the ADSL columns
adsl_meta <- purrr::map_df(names(adsl), extract_xpt_meta, .data=adsl)
adsl_meta

## -----------------------------------------------------------------------------
# Create the datasetjson object
ds_json <- dataset_json(
  adsl, 
  item_oid = "ADSL",
  name = "ADSL",
  dataset_label = attr(adsl, 'label'),
  columns = adsl_meta
)

# Write the JSON
json_file_content <- write_dataset_json(ds_json)

## -----------------------------------------------------------------------------
# Check schema compliance
validate_dataset_json(json_file_content)

