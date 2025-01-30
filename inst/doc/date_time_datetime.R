## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, echo=FALSE--------------------------------------------------------
library(datasetjson)
library(knitr)

## ----echo=FALSE---------------------------------------------------------------
tibble::tribble(
  ~itemOID,             ~name,          ~label,             ~dataType, ~length,      ~targetDataType, ~displayFormat, ~keySequence,
  'IT.DF.CHARDT',   'CHARDT',     'Character Date',     'date',   8L,          NA_character_,   NA_character_,  NA_integer_,
  'IT.DF.CHARTM',   'CHARTM',     'Character Time',     'time',   10L,          NA_character_,   NA_character_,  NA_integer_,
  'IT.DF.CHARDTM',   'CHARDTM',     'Character Datetime', 'datetime',   19L,         NA_character_,   NA_character_,  NA_integer_,
  'IT.DF.NUMDT',   'NUMDT',     'Numeric date',     'time',     NA_integer_, "integer",       "TIME8",        NA_integer_,
  'IT.DF.NUMTM',   'NUMTM',     'Numeric time',     'time',     NA_integer_, "integer",       "TIME8",        NA_integer_,
  'IT.DF.NUMDTM',   'NUMDTM',     'Numeric datetime', 'datetime', NA_integer_, "integer",      "E8601DT",       NA_integer_
) |>
  kable()

