# Select hyperparameter alpha and obtain the optimal general-gamma model based on AIC and BIC

Select hyperparameter alpha and obtain the optimal general-gamma model
based on AIC and BIC

## Usage

``` r
tuning_general_gamma(
  contin_table,
  alpha_vec = NULL,
  return_all_fit = FALSE,
  return_all_AIC = TRUE,
  return_all_BIC = TRUE,
  tol_ecm = 1e-04
)
```

## Arguments

- contin_table:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

- alpha_vec:

  vector of hyperparameter alpha values to be selected. Alpha is
  hyperparameter in general-gamma model which is numeric and between 0
  and 1. If is NULL, a default set of alpha values (0, 0.1, 0.3, 0.5,
  0.7, 0.9) will be used.

- tol_ecm:

  a tolerance parameter used for the ECM stopping rule, defined as the
  absolute change in the joint marginal likelihood between two
  consecutive iterations. It is used when 'GPS', 'K-gamma' or
  'general-gamma' model is fitted. Default to be 1e-4.

## Value

a list of fitted models with hyperparameter alpha selected by AIC or
BIC.

## References

Akaike H. A new look at the statistical model identification. *IEEE
Transactions on Automatic Control.* 2003; 19(6):716-23.  

Schwarz G. Estimating the dimension of a model. *The Annals of
Statistics.* 1978; 1:461-4.
