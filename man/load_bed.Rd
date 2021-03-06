% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_bed.R
\name{load_bed}
\alias{load_bed}
\title{Load Bed File as GRanges}
\usage{
load_bed(file, genome = c("hg19", "hg38"))
}
\arguments{
\item{file}{Location of bed file}

\item{genome}{Reference genome to use, default is hg19}
}
\value{
This function returns a \code{GRanges} object including:
\itemize{
\item seqnames
	\item ranges
}
}
\description{
Loads in sequence ranges from bed file and presents it as a GRanges object. Can handle headers and different Chr naming conventions.
}
\examples{
\dontrun{
regions_of_interest <- load_bed(file = "AML_exons.bed", genome = "hg19")
}
}
