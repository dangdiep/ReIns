\name{SpliceFitGPD}
\alias{SpliceFitGPD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Splicing of mixed Erlang and GPD using POT-MLE
}
\description{
Fit spliced distribution of a mixed Erlang distribution and a Generalised Pareto Distribution (GPD). The parameters of the GPD are determined using the POT-MLE approach. 
}
\usage{
SpliceFitGPD(X, const = NULL, tsplice = NULL, M = 3, s = 1:10, trunclower = 0, 
             ncores = NULL, criterium = c("BIC","AIC"), reduceM = TRUE,
             eps = 10^(-3), beta_tol = 10^(-5), maxiter = Inf)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
Data used for fitting the distribution.
}
  \item{const}{
The probability of the quantile where the ME distribution will be spliced with the GPD distribution. Default is \code{NULL} meaning the input from \code{tsplice} is used.
}
  \item{tsplice}{
The point where the ME distribution will be spliced with the GPD distribution. Default is \code{NULL} meaning the input from \code{const} is used.
}
  \item{M}{
Initial number of Erlang mixtures, default is 3. This number can change when determining
an optimal mixed Erlang fit using an information criterion.
}
  \item{s}{
Vector of spread factors for the EM algorithm, default is \code{1:10}. We loop over these factors when determining
an optimal mixed Erlang fit using an information criterion, see Verbelen et al. (2016).
}
  \item{trunclower}{
Lower truncation point. Default is 0.
}
  \item{ncores}{
Number of cores to use when determining an optimal mixed Erlang fit using an information criterion.
When \code{NULL} (default), \code{max(nc-1,1)} cores are used where \code{nc} is the number of cores as determined by \code{\link{detectCores}}.
}
\item{criterium}{
Information criterion used to select the number of components of the ME fit and \code{s}. One of \code{"AIC"} and \code{"BIC"} (default).
}
\item{reduceM}{
Logical indicating if M should be reduced based on the information criterion, default is \code{TRUE}.
}
\item{eps}{
Covergence threshold used in the EM algorithm (ME part). Default is \code{10^(-3)}.
}
\item{beta_tol}{
Threshold for the mixing weights below which the corresponding shape parameter vector is considered neglectable (ME part). Default is \code{10^(-5)}.
}
 \item{maxiter}{
Maximum number of iterations in a single EM algorithm  execution (ME part). Default is \code{Inf} meaning no maximum number of iterations.
}
}
\details{
See Reynkens et al. (2017), Section 4.3.1 of Albrecher et al. (2017) and Verbelen et al. (2015) for details. The code follows the notation of the latter. Initial values follow from Verbelen et al. (2016).
}
\value{
A \code{\link{SpliceFit}} object.
}
\references{
Albrecher, H., Beirlant, J. and Teugels, J. (2017). \emph{Reinsurance: Actuarial and Statistical Aspects}, Wiley, Chichester.

Reynkens, T., Verbelen, R., Beirlant, J. and Antonio, K. (2017). "Modelling Censored Losses Using Splicing:
a Global Fit Strategy With Mixed Erlang and Extreme Value Distributions". \emph{Insurance: Mathematics and Economics}, 77, 65--77.

Verbelen, R., Gong, L., Antonio, K., Badescu, A. and Lin, S. (2015). "Fitting Mixtures of
Erlangs to Censored and Truncated Data Using the EM Algorithm." \emph{Astin Bulletin}, 45, 729--758.

Verbelen, R., Antonio, K. and Claeskens, G. (2016). "Multivariate Mixtures
of Erlangs for Density Estimation Under Censoring." \emph{Lifetime Data Analysis}, 22, 429--455.
}
\author{
Tom Reynkens with \code{R} code from Roel Verbelen for fitting the mixed Erlang distribution.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{SpliceFitPareto}}, \code{\link{SpliceFiticPareto}}, \code{\link[=pSplice]{Splice}},
\code{\link{GPDfit}}
}
\examples{
\dontrun{

# GPD random sample
X <- rgpd(1000, gamma = 0.5, sigma = 2)

# Splice ME and GPD
splicefit <- SpliceFitGPD(X, 0.6)



x <- seq(0, 20, 0.01)

# Plot of spliced CDF
plot(x, pSplice(x, splicefit), type="l", xlab="x", ylab="F(x)")

# Plot of spliced PDF
plot(x, dSplice(x, splicefit), type="l", xlab="x", ylab="f(x)")



# Fitted survival function and empirical survival function 
SpliceECDF(x, X, splicefit)

# Log-log plot with empirical survival function and fitted survival function
SpliceLL(x, X, splicefit)

# PP-plot of empirical survival function and fitted survival function
SplicePP(X, splicefit)

# PP-plot of empirical survival function and 
# fitted survival function with log-scales
SplicePP(X, splicefit, log=TRUE)

# Splicing QQ-plot
SpliceQQ(X, splicefit)
}
}
