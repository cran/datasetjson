% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_dataset_json.R
\name{read_dataset_json}
\alias{read_dataset_json}
\title{Read a Dataset JSON to datasetjson object}
\usage{
read_dataset_json(file)
}
\arguments{
\item{file}{File path or URL of a Dataset JSON file}
}
\value{
datasetjson object
}
\description{
This function validates a dataset JSON file against the Dataset JSON schema,
and if valid returns a datasetjson object. The Dataset JSON file can be
either a file path on disk of a URL which contains the Dataset JSON file.
}
\examples{
# Read from disk
\dontrun{
  dat <- read_dataset_json("path/to/file.json")
  dat <- dataset_json('https://www.somesite.com/file.json')
}

# Read from an already imported character vector
ds_json <- dataset_json(iris, "IG.IRIS", "IRIS", "Iris", iris_items)
js <- write_dataset_json(ds_json)
dat <- read_dataset_json(js)
}
