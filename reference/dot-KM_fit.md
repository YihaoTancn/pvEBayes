# Fit a Koenker-Mizera (KM) model for a contingency table.

Fit a Koenker-Mizera (KM) model for a contingency table.

## Usage

``` r
.KM_fit(
  N,
  E,
  rtol_KM = 1e-04,
  km_optimizer = c("ECOS", "CLARABEL", "SCS"),
  ...
)
```

## Arguments

- N:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- E:

  A matrix of expected counts under the null model for the SRS frequency
  table.

- rtol_KM:

  The relative tolerance on the duality gap.

- km_optimizer:

  Character vector specifying the optimizer(s) used to fit the KM model.
  Supported values are `"ECOS"`, `"CLARABEL"`, and `"SCS"`. If multiple
  optimizers are supplied, they are tried sequentially and the first
  successfully fitted result is returned. Defaults to c("ECOS",
  "CLARABEL", "SCS")\`.

- ...:

  additional parameters to be passed to optimizer for 'KM' model. See
  'CVXR::solve' for detail.

## Value

a list of CVXR optimizer outputs

## Details

Parameter estimation for the "KM" model is formulated as a convex
optimization problem. The objective function and constraints used in
pvEBayes follow the same construction as in REBayes. Parameter
estimation is performed using the open-source convex optimization
package CVXR. The grid value generation follows the recommendation of
Tan et al. (2025).

## References

Koenker R, Gu J. REBayes: an R package for empirical Bayes mixture
methods. *Journal of Statistical Software*. 2017; 4;82:1-26.

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

Fu, A, Narasimhan, B, Boyd, S. CVXR: An R Package for Disciplined Convex
Optimization. *Journal of Statistical Software*. 2020; 94;14:1-34.
