# Plotting method for a pvEBayes object

This function defines the S3 `plot` method for objects of class
`pvEBayes`.

## Usage

``` r
# S3 method for class 'pvEBayes'
plot(x, type = "eyeplot", ...)
```

## Arguments

- x:

  a `pvEBayes` object, which is the output of the function
  [pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes.md)
  or
  [pvEBayes_tune](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md).

- type:

  character string determining the type of plot to show. Available
  choices are `"eyeplot"` which calls
  [eyeplot_pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/eyeplot_pvEBayes.md)
  and `"heatmap"` which calls
  [heatmap_pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/heatmap_pvEBayes.md),
  with the additional arguments supplied in ...

- ...:

  additional arguments passed to heatmap_pvEBayes or eyeplot_pvEBayes.

## Value

A [ggplot](https://ggplot2.tidyverse.org/reference/ggplot.html) object.

## Examples

``` r
obj <- pvEBayes(statin2025_44, model = "general-gamma", alpha = 0.5)
plot(obj, type = "eyeplot")
```
