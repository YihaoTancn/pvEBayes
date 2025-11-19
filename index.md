# R package ‘pvEBayes’

‘pvEBayes’ is an R package that implements a suite of nonparametric
empirical Bayes methods for pharmacovigilance including Gamma-Poisson
Shrinker (GPS), K-gamma, general-gamma, Koenker-Mizera (KM), and Efron
models. It provides tools for fitting these models to spontaneous
reporting system (SRS) frequency tables, extracting summaries,
performing hyperparameter tuning, and generating graphical summaries
(eye plots and heatmaps) for signal detection and estimation.

For methodological details, see:

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
<https://doi.org/10.1002/sim.70195>.

## Installation

The stable version of `pvEBayes` can be installed from CRAN:

    install.packages("pvEBayes")

The development version is available from GitHub:

    # if (!requireNamespace("devtools")) install.packages("devtools")
    devtools::install_github("YihaoTancn/pvEBayes")

## Quick Example

Here is a minimal example analyzing the built-in FDA statin44 dataset
with general-gamma model:

    library(pvEBayes)

    # Load the statin44 contingency table of 44 AEs for 6 statins
    data("statin2025_44")

    # Fit a general-gamma model with a specified alpha
    fit <- pvEBayes(
      contin_table      = statin2025_44,
      model             = "general-gamma",
      alpha             = 0.3,
      n_posterior_draws = 1000
    )

    # Print out a concise description of the fitted model
    fit

    # Obtain a logical matrix for the detected signal
    summary(fit, return = "detected signal")

    # Visualize posterior distributions for top AE-drug pairs
    plot(fit, type = "eyeplot")

For a more detailed illustration, please see ‘Vignette’.

## License

‘pvEBayes’ is released under the GPL-3 license. See ‘LICENSE.md’ for
details.
