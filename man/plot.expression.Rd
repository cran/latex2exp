% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plots.R
\name{plot.expression}
\alias{plot.expression}
\title{Previews a LaTeX equation}
\usage{
\method{plot}{expression}(x, ..., main = NULL)
}
\arguments{
\item{x}{A \code{\link{plotmath}} expression returned by \code{\link{TeX}}.}

\item{...}{Parameters to be passed to the \code{\link{text}} function.}

\item{main}{Title of the plot}
}
\description{
Plots the result of a call to [TeX]
on the current graphical device. This is useful to preview the
output before placing it on a plot.
}
\examples{
plot(TeX("Example equation: $a \\\\geq b$"))
}
