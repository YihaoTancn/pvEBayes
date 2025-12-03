# Fit gamma mixture based empirical Bayes models using ECM algorithm.

Fit gamma mixture based empirical Bayes models using ECM algorithm.

## Usage

``` r
.NBmix_EM(
  N,
  E,
  dirichlet = TRUE,
  alpha = NULL,
  K = NULL,
  maxi = NULL,
  h = NULL,
  eps = 1e-04
)
```

## Arguments

- N:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- E:

  A matrix of expected counts under the null model for the SRS frequency
  table.

- dirichlet:

  logical. Used for "general-gamma" model. If is TRUE, a dirichlet
  hyperprior for weights of gamma mixture prior is applied.

- alpha:

  numeric between 0 and 1. The hyperparameter of "general-gamma" model.
  It is needed if "general-gamma" model is used.

- K:

  integer greater than or equal to 2. It is needed if "K-gamma" model is
  used.

- maxi:

  upper limit of iteration for the ECM algorithm.

- h:

  a vector of initialization of parameter h.

- eps:

  a tolerance parameter for ECM algorithm.

## Value

a list of optimizer outputs

## Details

This function implements the ECM algorithm proposed by Tan et al.
(2025), providing a stable and efficient implementation of Gamma-Poisson
Shrinker(GPS), K-gamma and "general-gamma" methods for signal estimation
and signal detection in Spontaneous Reporting System (SRS) data table.

## References

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

DuMouchel W. Bayesian data mining in large frequency tables, with an
application to the FDA spontaneous reporting system. *The American
Statistician.* 1999; 1;53(3):177-90.  
