# Obtain a summary table for a pvEBayes object

Obtain a summary table for a pvEBayes object

## Usage

``` r
summary_table_pvEBayes(x, cutoff_signal = 1.001)
```

## Arguments

- x:

  a `pvEBayes` object, which is the output of the function
  [pvEBayes](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes.md)
  or
  [pvEBayes_tune](https://yihaotancn.github.io/pvEBayes/reference/pvEBayes_tune.md).

- cutoff_signal:

  numeric. Threshold for signal detection. An AE-drug combination is
  classified as a detected signal if its 5th posterior percentile
  exceeds this threshold.

## Value

a data.table that summarizes reporting count (N), expected null value
(E), posterior probability of being a signal (post_prob), posterior
signal strength median (q50), 5-th and 95-th posterior signal strength
percentile (q05 and q95) for each AE-drug combination.

## Examples

``` r
fit <- pvEBayes(
  contin_table = statin2025_44, model = "general-gamma",
  alpha = 0.5, n_posterior_draws = 100
)
#> ℹ Fitting general-gamma model...
#> ✔ Fitting general-gamma model... [322ms]
#> 
#> ℹ Generating 100 posterior draws...
#> ✔ Generating 100 posterior draws... [12ms]
#> 
#> Object of class 'pvEBayes'
#> 
#> General-gamma model with hyperparameter alpha = 0.5.
#> Estimated prior is a mixture of 18 gamma distributions.
#> 
#> Running time of the general-gamma model fitting: 0.33 seconds.
#> Optimizer convergence: successful.
#> Running time for posterior draws 
#> (100 signal strength posterior draws per AE-drug pair):0.019 seconds.
#> 
#> Extract estimated prior parameters, discovered signals
#> and signal strength posterior draws using `summary()`.

summary_table_pvEBayes(fit)
#>                       AE         drug     N      E post_prob         q05
#>                   <char>       <char> <int>  <num>     <num>       <num>
#>   1: Acute Kidney Injury Atorvastatin  1132 532.74      1.00  2.09508991
#>   2: Acute Kidney Injury  Fluvastatin    23  50.91      0.00  0.43487123
#>   3: Acute Kidney Injury   Lovastatin    23   4.97      1.00  2.77243471
#>   4: Acute Kidney Injury  Pravastatin   153  74.39      1.00  2.09783837
#>   5: Acute Kidney Injury Rosuvastatin  1141 424.95      1.00  2.72986104
#>  ---                                                                    
#> 311:   Tendon Discomfort   Lovastatin     0   0.01      0.60  0.10019963
#> 312:   Tendon Discomfort  Pravastatin     0   0.08      0.46  0.01778714
#> 313:   Tendon Discomfort Rosuvastatin    10   0.45      1.00 12.26302820
#> 314:   Tendon Discomfort  Simvastatin     0   0.31      0.36  0.10689953
#> 315:   Tendon Discomfort  Other_drugs   205 205.00      0.49  0.98644212
#>             q50        q95
#>           <num>      <num>
#>   1:  2.1201806  2.1370559
#>   2:  0.4442899  0.4590935
#>   3:  3.8886843  6.2792590
#>   4:  2.1165735  2.1428359
#>   5:  2.7533147  2.7704806
#>  ---                      
#> 311:  1.0087695 23.2033040
#> 312:  0.9990468  6.2683075
#> 313: 23.2029461 23.2070231
#> 314:  0.9951408  2.7501795
#> 315:  1.0009295  1.0141068
```
