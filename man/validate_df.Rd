% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate.R
\name{validate_df}
\alias{validate_df}
\title{Validate input data frame}
\usage{
validate_df(df = NULL, min_rows = 30)
}
\arguments{
\item{df}{(required; data frame or matrix) Input data frame. Default: NULL}

\item{min_rows}{(required; integer) Minimum number of rows required for a pairwise correlation or a variance inflation factor analysis. Default: 30}
}
\value{
The input data frame modified to comply with the requirements of the functions in this package
}
\description{
Internal function to validate and prepare the input data frame for a multicollinearity analysis.

Validates a data frame to ensure it complies with the requirements of the package functions. The function performs the following actions:
\itemize{
\item Stops if 'df' is NULL.
\item Stops if 'df' cannot be coerced to data frame.
\item Stops if 'df' has zero rows.
\item Removes geometry column if the input data frame is an "sf" object.
\item Removes non-numeric columns with as many unique values as rows df has.
\item Raise warning if number of rows of 'df' is lower than 'min_rows'.
\item Converts logical columns to numeric.
\item Converts factor and ordered columns to character.
\item Tags the data frame with the attribute \code{validated = TRUE} to let the package functions skip the data validation.
}
}
\examples{

data(vi)

#validating example data frame
vi <- validate_df(
  df = vi
)

#tagged as validated
attributes(vi)$validated

}
\author{
Blas M. Benito
}
