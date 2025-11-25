# R package `pvEBayes`

`pvEBayes` is an R package that implements a suite of nonparametric
empirical Bayes methods for pharmacovigilance including Gamma-Poisson
Shrinker (GPS), K-gamma, general-gamma, Koenker-Mizera (KM), and Efron
models. It provides tools for fitting these models to spontaneous
reporting system (SRS) frequency tables, extracting summaries,
performing hyperparameter tuning, and generating graphical summaries
(eye plots and heatmaps) for signal detection and estimation.

**Spontaneous Reporting System (SRS) Table**: An SRS dataset catalogs AE
reports on *I* AE rows across *J* drug columns. Let $N_{ij}$ denote the
number of reported cases for the *i*-th AE and the *j*-th drug, where
$i = 1,...,I$ and $j = 1,...,J$.

**Empirical Bayes modeling**: We assume that for each AE-drug pair,
$N_{ij} \sim \text{Poisson}\left( \lambda_{ij}E_{ij} \right)$, where
$E_{ij}$ is expected baseline value meansuring the expected count of the
AE-drug pair when there is no association between*i*-th AE and *j*-th
drug. The parameter $\lambda_{ij} \geq 0$ represents the relative
reporting ratio, the signal strength, for the $(i,j)$-th pair measuring
the ratio of the actual expected count arising due to dependence to the
null baseline expected count. Let *g* be the prior density function for
signal strength: $\lambda_{ij} \sim g( \cdot )$. The methods included in
`pvEBayes` differ by their assumptions on the prior distribution.

Implemented methods include the Gamma-Poisson Shrinker (GPS),
Koenker-Mizera (KM) method, Efron’s nonparametric empirical Bayes
approach, the K-gamma model, and the general-gamma model. The selection
of prior distribution is critical in Bayesian analysis. The GPS model
uses two gamma mixture prior by assuming the signal/non-signal structure
in SRS data. However, in real-world setting, signal strengths
$\left( \lambda_{ij} \right)$ are often heterogeneous and thus follows a
multi-modal distribution, making it difficult to assume a parametric
prior. Non-parametric empirical Bayes models (KM, Efron, K-gamma and
general-gamma) address this challenge by utilizing a flexible prior with
general mixture form and estimating the prior distribution in a
data-driven way.

Unlike many existing pharmacovigilance packages that focus solely on
signal detection (e.g. looking for AE-drug pairs that
$p\left( \lambda_{ij} > 1 + \epsilon \right) > 0.95$ for some small
$\epsilon$), `pvEBayes` supports both signal detection and signal
estimation, enabling users not only to identify potential safety signals
but also to quantify the underlying AE-drug association.

**Implementations**: The KM method has an existing implementation in the
`REBayes` package, but it relies on Mosek, a commercial convex
optimization solver, which may limit accessibility due to licensing
issue. The `pvEBayes` package provides an alternative fully open-source
implementation of the KM method using `CVXR`. Efron’s method also has a
general nonparametric empirical Bayes implementation in the
`deconvolveR` package; however, that implementation does not support an
exposure or offset parameter in the Poisson model, which corresponds to
the expected null value $E_{ij}$. In `pvEBayes`, the implementation of
the Efron’s method is adapted and modified from `deconvolveR` to support
$E_{ij}$ in Poisson model.

In addition, this package implements the novel bi-level Expectation
Conditional Maximization (ECM) algorithm proposed by Tan et al. (2025)
for efficient parameter estimation in gamma mixture prior based models
mentioned above.

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

`pvEBayes` is released under the GPL-3 license. See ‘LICENSE.md’ for
details.

## References

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine*. 2025; 44: 18-19,
<https://doi.org/10.1002/sim.70195>.

Koenker R, Mizera I. Convex Optimization, Shape Constraints, Compound
Decisions, and Empirical Bayes Rules. *Journal of the American
Statistical Association* 2014; 109(506): 674–685,
<https://doi.org/10.1080/01621459.2013.869224>

Efron B. Empirical Bayes Deconvolution Estimates. *Biometrika* 2016;
103(1); 1-20, <https://doi.org/10.1093/biomet/asv068>

DuMouchel W. Bayesian data mining in large frequency tables, with an
application to the FDA spontaneous reporting system. *The American
Statistician*. 1999; 1;53(3):177-90.
