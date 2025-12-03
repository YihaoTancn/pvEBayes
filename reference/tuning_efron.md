# Select hyperparameter (p, c0) and obtain the optimal efron model based on AIC and BIC

Select hyperparameter (p, c0) and obtain the optimal efron model based
on AIC and BIC

## Usage

``` r
tuning_efron(
  contin_table,
  p_vec = NULL,
  c0_vec = NULL,
  return_all_fit = FALSE,
  return_all_AIC = TRUE,
  return_all_BIC = TRUE,
  rtol_efron = 1e-10
)
```

## Arguments

- contin_table:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns).

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

- rtol_efron:

  a tolerance parameter used when 'efron' model is fitted. Default to
  1e-10. See 'stats::nlminb' for detail.

## Value

a list of fitted models with hyperparameter alpha selected by AIC or
BIC.

## References

Akaike H. A new look at the statistical model identification. *IEEE
Transactions on Automatic Control.* 2003; 19(6):716-23.  

Schwarz G. Estimating the dimension of a model. *The Annals of
Statistics.* 1978; 1:461-4.
