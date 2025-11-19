# Fit a general-gamma, GPS, K-gamma, KM or efron model for a contingency table.

This function fits a non-parametric empirical Bayes model to an AE-drug
contingency table using one of several empirical Bayes approaches with
specified hyperparameter, if is required. Supported models include the
"general-gamma", "GPS", "K-gamma", "KM", and "efron".

## Usage

``` r
pvEBayes(
  contin_table,
  model = "general-gamma",
  alpha = NULL,
  K = NULL,
  p = NULL,
  c0 = NULL,
  maxi = NULL,
  eps = 1e-04,
  n_posterior_draws = 1000,
  E = NULL
)
```

## Arguments

- contin_table:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- model:

  the model to fit. Available models are "general-gamma", "K-gamma",
  "GPS", "KM" and "efron". Default to "general-gamma".

- alpha:

  numeric between 0 and 1. The hyperparameter of "general-gamma" model.
  It is needed if "general-gamma" model is used.

- K:

  integer greater than or equal to 2. It is needed if "K-gamma" model is
  used.

- p:

  integer greater than or equal to 2. It is needed if "efron" mode is
  used.

- c0:

  numeric and greater than 0. It is needed if "efron" mode is used.

- maxi:

  upper limit of iteration for the ECM algorithm.

- eps:

  a tolerance parameter used in the stopping rule of the ECM algorithm.
  If the difference in marginal likelihood between two consecutive
  iterations is less than eps, the ECM algorithm stops. Default to be
  1e-4.

- n_posterior_draws:

  number of posterior draws for each AE-drug combination.

- E:

  A matrix of expected counts under the null model for the SRS frequency
  table. If `NULL` (default), the expected counts are estimated from the
  SRS data using 'estimate_null_expected_count()'.

## Value

The function returns an S3 object of class `pvEBayes` containing the
estimated model parameters as well as posterior draws for each AE-drug
combination if the number of posterior draws is specified.

## Details

This function implements the ECM algorithm proposed by Tan et al.
(2025), providing a stable and efficient implementation of Gamma-Poisson
Shrinker(GPS), K-gamma and "general-gamma" methods for signal estimation
and signal detection in Spontaneous Reporting System (SRS) data table.

Method "GPS" is proposed by DuMouchel (1999) and it is a parametric
empirical Bayes model with a two gamma mixture prior distribution.

Methods "K-gamma" and "general-gamma" are non-parametric empirical Bayes
models, introduced by Tan et al. (2025). The number of mixture
components "K" needs to be prespecified when fitting a "K-gamma" model.
For "general-gamma", the mixture weights are regularized by a Dirichlet
hyper prior with hyperparameter \\0 \leq \alpha \< 1\\ that controls the
shrinkage strength. As "alpha" approaches 0, less non-empty mixture
components exist in the fitted model. When \\\alpha = 0\\, the Dirichlet
distribution is an improper prior still offering a reasonable posterior
inference that represents the strongest shrinkage of the "general-gamma"
model.

Parameter estimation for the "KM" model is formulated as a convex
optimization problem. The objective function and constraints follow the
same construction as in REBayes. Parameter estimation is performed using
the open-source convex optimization package CVXR.

The implementation of the "efron" model in this package is adapted from
the deconvolveR package, developed by Bradley Efron and Balasubramanian
Narasimhan. The original implementation in deconvolveR does not support
an exposure or offset parameter in the Poisson model, which corresponds
to the expected null value (\\E\_{ij}\\) for each AE-drug combination.
To address this, we modified the relevant code to allow for the
inclusion of \\E\_{ij}\\ in the Poisson likelihood. In addition, we
implemented a method for estimating the degrees of freedom, enabling
AIC- or BIC-based hyperparameter selection for the "efron" model (Tan et
al. 2025). See
[`pvEBayes_tune`](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md)
for details.

## References

DuMouchel W. Bayesian data mining in large frequency tables, with an
application to the FDA spontaneous reporting system. *The American
Statistician.* 1999; 1;53(3):177-90.  

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

Narasimhan B, Efron B. deconvolveR: A G-modeling program for
deconvolution and empirical Bayes estimation. *Journal of Statistical
Software*. 2020; 2;94:1-20.

Koenker R, Gu J. REBayes: an R package for empirical Bayes mixture
methods. *Journal of Statistical Software*. 2017; 4;82:1-26.

Fu, A, Narasimhan, B, Boyd, S. CVXR: An R Package for Disciplined Convex
Optimization. *Journal of Statistical Software*. 2020; 94;14:1-34.

## Examples

``` r
set.seed(1)
ref_table <- statin2025_44

# set up signal matrix with one signal at entry (1,1)
sig_mat <- matrix(1, nrow(ref_table), ncol(ref_table))
sig_mat[1, 1] <- 2

# set up structural zero matrix
Z <- matrix(0, nrow(ref_table), ncol(ref_table))
Z[5, 1] <- 1

simu_table <- generate_contin_table(
  ref_table = ref_table,
  signal_mat = sig_mat,
  n_table = 1,
  Variation = TRUE,
  zi_indic_mat = Z
)[[1]][[1]]


# fit general-gamma model with a specified alpha
fit <- pvEBayes(
  contin_table = simu_table, model = "general-gamma",
  alpha = 0.3, n_posterior_draws = 1000
)
```
