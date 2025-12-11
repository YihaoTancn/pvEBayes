# Print method for a pvEBayes object

This function defines the S3 `print` method for objects of class
`pvEBayes`. It displays a concise description of the fitted model.

## Usage

``` r
# S3 method for class 'pvEBayes'
print(x, ...)
```

## Arguments

- x:

  a `pvEBayes` object, which is the output of the function
  [pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes.md)
  or
  [pvEBayes_tune](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md).

- ...:

  other input parameters. Currently unused.

## Value

Invisibly returns the input `pvEBayes` object.

## Examples

``` r
obj <- pvEBayes(
  contin_table = statin2025_44, model = "general-gamma",
  alpha = 0.5, n_posterior_draws = 10000
)

print(obj)
#> 
```
