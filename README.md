<!-- README.md is generated from README.Rmd. Please edit that file -->

# ReIns

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/ReIns)](https://cran.r-project.org/package=ReIns)

The *ReIns* package contains functions from the book “Reinsurance:
Actuarial and Statistical Aspects” (Wiley, 2017) by Hansjörg Albrecher,
Jan Beirlant and Jef Teugels. It contains implementations of

  - Basic extreme value theory (EVT) estimators and graphical methods as
    described in “Statistics of Extremes: Theory and Applications”
    (2004) of Jan Beirlant, Yuri Goegebeur, Johan Segers and Jef
    Teugels.

  - EVT estimators and graphical methods adapted for censored and/or
    truncated data.

  - Splicing of mixed Erlang (ME) distribution with EVT distributions
    (Pareto, GPD).

  - Value-at-Risk (VaR), Conditional Tail Expectation (CTE) and
    excess-loss premium estimates.

You can install the latest development version of *ReIns* from GitHub.
If you work on Windows, make sure first that
[Rtools](https://cran.r-project.org/bin/windows/Rtools/) is installed.
Then, install the latest development version of *ReIns* using

    install.packages("remotes")
    
    remotes::install_github("TReynkens/ReIns")
