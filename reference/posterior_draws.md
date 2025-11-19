# Generate posterior draws for each AE-drug combination

This function generates posterior draws from the posterior distribution
of \\\lambda\_{ij}\\ for each AE-drug combination, based on a fitted
empirical Bayes model. The posterior draws can be used to compute
credible intervals, visualize posterior distributions, or support
downstream inference.

## Usage

``` r
posterior_draws(obj, n_posterior_draws = 1000)
```

## Arguments

- obj:

  a `pvEBayes` object, which is the output of the function
  [pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes.md)
  or
  [pvEBayes_tune](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md).

- n_posterior_draws:

  number of posterior draws for each AE-drug combination.

## Value

The function returns an S3 object of class `pvEBayes` with posterior
draws.

## Examples

``` r
fit <- pvEBayes(
  contin_table = statin2025_44, model = "general-gamma",
  alpha = 0.3, n_posterior_draws = NULL
)

fit_with_draws <- posterior_draws(fit, n_posterior_draws = 1000)
```
