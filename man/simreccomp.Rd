% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/simreccomp.r
\name{simreccomp}
\alias{simreccomp}
\title{simreccomp}
\usage{
simreccomp(N, fu.min, fu.max, cens.prob = 0, dist.x = "binomial",
  par.x = 0, beta.xr = 0, beta.xc = 0, dist.zr = "gamma", par.zr = 0,
  a = NULL, dist.zc = NULL, par.zc = NULL, dist.rec, par.rec, dist.comp,
  par.comp, pfree = 0, dfree = 0)
}
\arguments{
\item{N}{Number of individuals}

\item{fu.min}{Minimum length of follow-up.}

\item{fu.max}{Maximum length of follow-up. Individuals length of follow-up is
generated from a uniform distribution on
 \code{[fu.min, fu.max]}. If \code{fu.min=fu.max}, then all individuals have a common
 follow-up.}

\item{cens.prob}{Gives the probability of being censored due to loss to follow-up before
\code{fu.max}. For a random set of individuals defined by a B(N,\code{cens.prob})-distribution,
the time to censoring is generated from a uniform
distribution on \code{[0, fu.max]}. Default is \code{cens.prob=0}, i.e. no censoring
due to loss to follow-up.}

\item{dist.x}{Distribution of the covariate(s) \eqn{X}. If there is more than one covariate,
\code{dist.x} must be a vector of distributions with one entry for each covariate. Possible
values are \code{"binomial"} and \code{"normal"}, default is \code{dist.x="binomial"}.}

\item{par.x}{Parameters of the covariate distribution(s). For \code{"binomial", par.x} is
the probability for \eqn{x=1}. For \code{"normal"}, \code{par.x=c(}\eqn{\mu, \sigma}\code{)}
where \eqn{\mu} is the mean and \eqn{\sigma} is the standard deviation of a normal distribution.
If one of the covariates is defined to be normally distributed, \code{par.x} must be a list,
e.g. \code{ dist.x <- c("binomial", "normal")} and \code{par.x  <- list(0.5, c(1,2))}.
Default is \code{par.x=0}, i.e. \eqn{x=0} for all individuals.}

\item{beta.xr}{Regression coefficient(s) for the covariate(s) \eqn{x} corresponding to the
 recurrent events. If there is more than one covariate,
\code{beta.xr} must be a vector of coefficients with one entry for each covariate.
\code{simreccomp} generates as many covariates as there are entries in \code{beta.xr}. Default is
\code{beta.xr=0}, corresponding to no effect of the covariate \eqn{x} on the recurrent events.}

\item{beta.xc}{Regression coefficient(s) for the covariate(s) \eqn{x} corresponding to the
competing event. If there is more than one    covariate, \code{beta.xc}
must be a vector of coefficients with one entry for each covariate. Default is
\code{beta.xc=0}, corresponding to no effect of the covariate \eqn{x} on the competing event.}

\item{dist.zr}{Distribution of the frailty variable \eqn{Z_r} for the recurent events with \eqn{E(Z_r)=1} and
\eqn{Var(Z_r)=\theta_r}. Possible values are \code{"gamma"} for a Gamma distributed frailty
 and \code{"lognormal"} for a lognormal distributed frailty.
 Default is \code{dist.zr="gamma"}.}

\item{par.zr}{Parameter \eqn{\theta_r} for the frailty distribution: this parameter gives
the variance of the frailty variable \eqn{Z_r}.
Default is \code{par.zr=0}, which causes \eqn{Z_r=1}, i.e. no frailty effect for the recurrent events.}

\item{a}{Alternatively, the frailty distribution for the competing event can be computed through the distribution
of the frailty variable \eqn{Z_r} by \eqn{Z_c=Z_r**a}.
   Default is \code{a=NULL}.}

\item{dist.zc}{Distribution of the frailty variable \eqn{Z_c} for the competing event with \eqn{E(Z_c)=1} and
\eqn{Var(Z_c)=\theta_c}. Possible values are \code{"gamma"} for a Gamma distributed frailty
 and \code{"lognormal"} for a lognormal distributed frailty.
 Default is \code{dist.zc=NULL}.}

\item{par.zc}{Parameter \eqn{\theta_c} for the frailty distribution: this parameter gives
the variance of the frailty variable \eqn{Z_c}.
   Default is \code{par.zc=NULL}.}

\item{dist.rec}{Form of the baseline hazard function for the recurrent events. Possible values are \code{"weibull"} or
\code{"gompertz"} or \code{"lognormal"} or \code{"step"}.}

\item{par.rec}{Parameters for the distribution of the recurrent event data.
If \code{dist.rec="weibull"} the  hazard function is \deqn{\lambda_0(t)=\lambda*\nu* t^{\nu - 1},}
where \eqn{\lambda>0} is the scale and \eqn{\nu>0} is the shape parameter. Then
\code{par.rec=c(}\eqn{\lambda, \nu}\code{)}. A special case
of this is the exponential distribution for \eqn{\nu=1}.
If \code{dist.rec="gompertz"}, the hazard function is \deqn{\lambda_0(t)=\lambda*exp(\alpha t),}
where \eqn{\lambda>0} is the scale and \eqn{\alpha\in(-\infty,+\infty)} is the shape parameter.
Then \code{par.rec=c(}\eqn{\lambda, \alpha}\code{)}.
If \code{dist.rec="lognormal"}, the hazard function is
\deqn{\lambda_0(t)=[(1/(\sigma t))*\phi((ln(t)-\mu)/\sigma)]/[\Phi((-ln(t)-\mu)/\sigma)],}
where \eqn{\phi} is the probability density function and \eqn{\Phi} is the cumulative
distribution function of the standard normal distribution, \eqn{\mu\in(-\infty,+\infty)} is a
location parameter and \eqn{\sigma>0} is a shape parameter. Then \code{par.rec=c(}\eqn{\mu,\sigma}\code{)}.
Please note, that specifying \code{dist.rec="lognormal"} together with some covariates does not
specify the usual lognormal model (with covariates specified as effects on the parameters of the
lognormal distribution resulting in non-proportional hazards), but only defines the baseline
hazard and incorporates covariate effects using the proportional hazard assumtion.
If \code{dist.rec="step"} the hazard function is \deqn{\lambda_0(t)=a, t<=t_1, and \lambda_0(t)=b, t>t_1}.
Then \code{par.rec=c(}\eqn{a,b,t_1}\code{)}.}

\item{dist.comp}{Form of the baseline hazard function for the competing event. Possible values are \code{"weibull"} or
\code{"gompertz"} or \code{"lognormal"} or \code{"step"}       .}

\item{par.comp}{Parameters for the distribution of the competing event data. For more details see \code{par.rec}.}

\item{pfree}{Probability that after experiencing an event the individual is not at risk
for experiencing further events for a length of \code{dfree} time units.
Default is \code{pfree=0}.}

\item{dfree}{Length of the risk-free interval. Must be in the same time unit as \code{fu.max}.
Default is \code{dfree=0}, i.e. the individual is continously at risk for experiencing
events until end of follow-up.}
}
\value{
The output is a data.frame consisting of the columns:
   \item{id}{An integer number for identification of each individual}
   \item{x}{or \code{x.V1, x.V2, ...} - depending on the covariate matrix. Contains the
      randomly generated value of the covariate(s) \eqn{X} for each individual.}
   \item{zr}{Contains the randomly generated value of the frailty variable \eqn{Z_r} for each individual.}
   \item{zc}{Contains the randomly generated value of the frailty variable \eqn{Z_c} for each individual.}
   \item{start}{The start of interval \code{[start, stop]}, when the individual
      starts to be at risk for a next event.}
   \item{stop}{The time of an event or censoring, i.e. the end of interval
   \code{[start, stop]}.}
   \item{status}{An indicator of whether an event occured at time \code{stop} (\code{status=1}),
       the individual is censored at time \code{stop} (\code{status=0}) or the competing event occured at time
       \code{stop} (\code{status=2}).}
   \item{fu}{Length of follow-up period \code{[0,fu]} for each individual.}
   For each individual there are as many lines as it experiences events,
   plus one line if being censored.
   The data format corresponds to the counting process format.
}
\description{
This function allows simulation of time-to-event-data that follow a multistate-model
with recurrent events of one type and a competing event. The baseline hazard for the
cause-specific hazards are here functions of the total/calendar time.
To induce between-subject-heterogeneity a random
effect covariate (frailty term) can be incorporated for the recurrent and the competing event.
Data for the recurrent events of the individual \eqn{i} are generated
according to the cause-specific hazards \deqn{\lambda_{0r}(t)* Z_{ri} *exp(\beta_r^t X_i),}
where \eqn{X_i} defines the covariate vector and \eqn{\beta_r} the regression coefficient vector.
\eqn{\lambda_{0r}(t)} denotes the baseline hazard, being a function of the total/calendar
time \eqn{t} and
\eqn{Z_{ri}} denotes the frailty variables with \eqn{(Z_{ri})_i} iid with \eqn{E(Z_{ri})=1} and
\eqn{Var(Z_{ri})=\theta_r}. The parameter \eqn{\theta_r} describes the degree of
between-subject-heterogeneity for the recurrent event.
Analougously the competing event is generated according to the cause-specific hazard conditionally
on the frailty variable and covariates: \deqn{\lambda_{0c}(t)* Z_{ci} *exp(\beta_c^t X_i)}
Data output is in the counting process format.
}
\examples{
### Example:
### A sample of 10 individuals

N <- 10

### with a binomially distributed covariate and a standard normally distributed covariate
### with regression coefficients of beta.xr=0.3 and beta.xr=0.2, respectively,
### for the recurrent events,
### as well as regression coefficients of beta.xc=0.5 and beta.xc=0.25, respectively,
### for the competing event.

dist.x  <- c("binomial", "normal")
par.x   <- list(0.5, c(0,1))
beta.xr <- c(0.3, 0.2)
beta.xc <- c(0.5,0.25)

### a gamma distributed frailty variable for the recurrent event with variance 0.25
### and for the competing event with variance 0.3,

dist.zr <- "gamma"
par.zr  <- 0.25

dist.zc <- "gamma"
par.zc  <- 0.3

### alternatively the frailty variable for the competing event can be computed via a:
a <- 0.5

### Furthermore a Weibull-shaped baseline hazard for the recurrent event with shape parameter
### lambda=1 and scale parameter nu=2,

dist.rec <- "weibull"
par.rec  <- c(1,2)

### and a Weibull-shaped baseline hazard for the competing event with shape parameter lambda=1
### and scale parameter nu=2

dist.comp	<- "weibull"
par.comp 	<-c(1,2)

### Subjects are to be followed for two years with 20\% of the subjects
### being censored according to a uniformly distributed censoring time
### within [0,2] (in years).

fu.min    <- 2
fu.max    <- 2
cens.prob <- 0.2

### After each event a subject is not at risk for experiencing further events
### for a period of 30 days with a probability of 50\%.

dfree <- 30/365
pfree <- 0.5

simdata1 <- simreccomp(N=N, fu.min=fu.min, fu.max=fu.max, cens.prob=cens.prob,
                      dist.x=dist.x, par.x=par.x, beta.xr=beta.xr, beta.xc=beta.xc,
                      dist.zr=dist.zr, par.zr=par.zr, a=a,
                      dist.rec=dist.rec, par.rec=par.rec, dist.comp=dist.comp, par.comp=par.comp,
                      pfree= pfree, dfree=dfree)

simdata2 <- simreccomp(N=N, fu.min=fu.min, fu.max=fu.max, cens.prob=cens.prob,
                      dist.x=dist.x, par.x=par.x, beta.xr=beta.xr, beta.xc=beta.xc,
                      dist.zr=dist.zr, par.zr=par.zr,dist.zc=dist.zc, par.zc=par.zc,
                      dist.rec=dist.rec, par.rec=par.rec, dist.comp=dist.comp, par.comp=par.comp,
                      pfree= pfree, dfree=dfree)

simdata1
simdata2
}
\author{
Katharina Ingel, Stella Preussler, Antje Jahn-Eimermacher.
Institute of Medical Biostatistics, Epidemiology and Informatics (IMBEI),
University Medical Center of the Johannes Gutenberg-University Mainz, Germany
}
\seealso{
simrec
}

