# Extract all fitted models from a tuned pvEBayes Object

This function retrieves the list of all fitted models from a
pvEBayes_tuned object, which is the output of the
[`pvEBayes_tune()`](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md)
function.

## Usage

``` r
extract_all_fitted_models(object)
```

## Arguments

- object:

  An object of class `pvEBayes_tuned`, usually returned by
  [`pvEBayes_tune`](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md).
  This function will throw an error if the input is not of the correct
  class.

## Value

A list containing the results of each model fitted during the tuning
process.

## Examples

``` r
valid_matrix <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8), nrow = 2)
rownames(valid_matrix) <- c("AE_1", "AE_2")
colnames(valid_matrix) <- c("drug_1", "drug_2", "drug_3", "drug_4")

tuned_object <- pvEBayes_tune(valid_matrix,
  model = "general-gamma",
  return_all_fit = TRUE
)
#> The alpha value selected under AIC is 0,
#> The alpha value selected under BIC is 0.
#>   alpha      AIC      BIC num_mixture
#> 1   0.0 1226.166 1273.831         200
#> 2   0.1 1226.166 1273.831         200
#> 3   0.3 1226.166 1273.831         200
#> 4   0.5 1226.166 1273.831         200
#> 5   0.7 1226.166 1273.831         200
#> 6   0.9 1226.166 1273.831         200
extract_all_fitted_models(tuned_object)
#> $best_model_AIC
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.031 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $best_model_BIC
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.031 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit
#> $all_fit[[1]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.031 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit[[2]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.1.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.0308 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit[[3]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.3.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.0307 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit[[4]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.5.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.0307 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit[[5]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.7.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.0307 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> $all_fit[[6]]
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.9.
#> Estimated prior is a mixture of 200 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.0309 seconds.
#> No posterior draws were generated.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.
#> 
#> 
#> $all_AIC
#> [1] 1226.166 1226.166 1226.166 1226.166 1226.166 1226.166
#> 
#> $all_BIC
#> [1] 1273.831 1273.831 1273.831 1273.831 1273.831 1273.831
#> 
```
