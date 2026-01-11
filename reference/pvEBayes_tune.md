# Select hyperparameter and obtain the optimal general-gamma or efron model based on AIC and BIC

This function performs hyperparameter tuning for the general-gamma or
Efron model using AIC or BIC. For a given AE-drug contingency table, the
function fits a series of models across a grid of candidate
hyperparameter values and computes their AIC and BIC. The models with
the lowest AIC or BIC values are selected as the optimal fits.

## Usage

``` r
pvEBayes_tune(
  contin_table,
  model = "general-gamma",
  alpha_vec = NULL,
  p_vec = NULL,
  c0_vec = NULL,
  use_AIC = TRUE,
  n_posterior_draws = 1000,
  return_all_fit = FALSE,
  return_all_AIC = TRUE,
  return_all_BIC = TRUE,
  tol_ecm = 1e-04,
  rtol_efron = 1e-10,
  E = NULL
)
```

## Arguments

- contin_table:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- model:

  the model to be tuned. Available models are "general-gamma" and
  "efron". Default to "general-gamma". Note that the input for model is
  case-sensitive.

- alpha_vec:

  vector of hyperparameter alpha values to be selected. Alpha is a
  hyperparameter in general-gamma model which is numeric and between 0
  and 1. If is NULL, a default set of alpha values (0, 0.1, 0.3, 0.5,
  0.7, 0.9) will be used.

- p_vec:

  vector of hyperparameter p values to be selected. p is a
  hyperparameter in "efron" model which should be a positive integer. If
  is NULL, a default set of p values (80, 100, 120, 150, 200) will be
  used.

- c0_vec:

  vector of hyperparameter c0 values to be selected. c0 is a
  hyperparameter in "efron" model which should be a positive number. If
  is NULL, a default set of c0 values (0.001, 0.01, 0.1, 0.2, 0.5) will
  be used.

- use_AIC:

  logical, indicating whether AIC or BIC is used. Default to be TRUE.

- n_posterior_draws:

  number of posterior draws for each AE-drug combination.

- return_all_fit:

  logical, indicating whether to return all the fitted model under the
  selection. Default to be FALSE.

- return_all_AIC:

  logical, indicating whether to return AIC values for each fitted model
  under the selection. Default to be TRUE.

- return_all_BIC:

  logical, indicating whether to return BIC values for each fitted model
  under the selection. Default to be TRUE.

- tol_ecm:

  a tolerance parameter used for the ECM stopping rule, defined as the
  absolute change in the joint marginal likelihood between two
  consecutive iterations. It is used when 'GPS', 'K-gamma' or
  'general-gamma' model is fitted. Default to be 1e-4.

- rtol_efron:

  a tolerance parameter used when 'efron' model is fitted. Default to
  1e-10. See 'stats::nlminb' for detail.

- E:

  A matrix of expected counts under the null model for the SRS frequency
  table. If `NULL` (default), the expected counts are estimated from the
  SRS data using 'estimate_null_expected_count()'.

## Value

The function returns an S3 object of class `pvEBayes` containing the
selected estimated model parameters as well as posterior draws for each
AE-drug combination if the number of posterior draws is specified.

## References

Akaike H. A new look at the statistical model identification. *IEEE
Transactions on Automatic Control.* 2003; 19(6):716-23.  

Schwarz G. Estimating the dimension of a model. *The Annals of
Statistics.* 1978; 1:461-4.

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

## Examples

``` r
fit <- pvEBayes_tune(statin2025_44,
  model = "general-gamma",
  alpha_vec = c(0, 0.1, 0.3, 0.5, 0.7, 0.9)
)
#> The alpha value selected under AIC is 0.5,
#> The alpha value selected under BIC is 0.
#>   alpha      AIC      BIC num_mixture
#> 1   0.0 3803.082 3960.690          14
#> 2   0.1 3799.012 3990.393          17
#> 3   0.3 3798.874 4001.513          18
#> 4   0.5 3796.813 3999.452          18
#> 5   0.7 3824.280 4083.208          23
#> 6   0.9 3912.529 4340.322          38
```
