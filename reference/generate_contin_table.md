# Generate random contingency tables based on a reference table embedded signals,and possibly with zero inflation

This function generates random contingency tables that resemble a given
reference table, with the option to embed signals and zero-inflation.

## Usage

``` r
generate_contin_table(
  n_table = 1,
  ref_table,
  signal_mat = NULL,
  Variation = FALSE,
  zi_indic_mat = NULL
)
```

## Arguments

- n_table:

  a number of random matrices to generate.

- ref_table:

  a reference table used as the basis for generating random tables.

- signal_mat:

  a numeric matrix of the same dimension as the reference table
  (ref_table). The entry at position (i, j) in signal_mat represents the
  signal strength between the i-th adverse event and the j-th drug. By
  default, each pair is assigned a value of 1, indicating no signal for
  that pair.

- Variation:

  logical. Include random noises to sig_mat while generating random
  tables. Default to FALSE. If set to TRUE, n_table of sig_mat
  incorporating the added noise will also be returned.

- zi_indic_mat:

  logical matrix of the same size as ref_table indicating the positions
  of structural zero.

## Value

A list of length `n_table`, with each entry being a `nrow(ref_table)` by
`ncol(ref_table)` matrix.

## References

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

## Examples

``` r
set.seed(1)
ref_table <- statin2025_44


# set up signal matrix with one signal at entry (1,1)
sig_mat <- matrix(1, nrow(ref_table), ncol(ref_table))
sig_mat[1, 1] <- 2

# set up structural zero matrix
Z <- matrix(0, nrow(ref_table), ncol(ref_table))
Z[5, 1] <- 1

simu_table <- generate_contin_table(ref_table,
  signal_mat = sig_mat,
  n_table = 1,
  Variation = TRUE,
  zi_indic_mat = Z
)[[1]][[1]]
```
