# Fit an Efron model for a contingency table.

Fit an Efron model for a contingency table.

## Usage

``` r
.E_fit(N, E, c0 = 1, pDegree = 5, aStart = 1, rel.tol)
```

## Arguments

- N:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- E:

  A matrix of expected counts under the null model for the SRS frequency
  table.

- c0:

  numeric and greater than 0. It is a hyperparameter in "efron" model.

- pDegree:

  integer greater than or equal to 2. It is a hyperparameter in Efron
  model.

- aStart:

  initial value for parameter alpha in Efron model.

## Value

a list of optimizer outputs

## Details

The implementation of the "efron" model is adapted from the deconvolveR
package, developed by Bradley Efron and Balasubramanian Narasimhan. The
original implementation in deconvolveR does not support an exposure or
offset parameter in the Poisson model, which corresponds to the expected
null value (\\E\_{ij}\\) for each AE-drug combination. To address this,
we modified the relevant code to allow for the inclusion of \\E\_{ij}\\
in the Poisson likelihood. In addition, we implemented a method for
estimating the degrees of freedom, enabling AIC- or BIC-based
hyperparameter selection for the "efron" model (Tan et al. 2025). See
[`pvEBayes_tune`](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md)
for details.

## References

Narasimhan B, Efron B. deconvolveR: A G-modeling program for
deconvolution and empirical Bayes estimation. *Journal of Statistical
Software*. 2020; 2;94:1-20.

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.
