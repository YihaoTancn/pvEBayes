# FDA opioid dataset with 243 mental-related adverse events

An adverse event-drug count dataset (contingency table) obtained from
the FDA FAERS database for the quarters 2014Q3 - 2020Q4.

## Usage

``` r
faers_opioid_mental
```

## Format

An object of class `matrix` (inherits from `array`) with 244 rows and 6
columns.

## Source

<https://fis.fda.gov/extensions/FPD-QDE-FAERS/FPD-QDE-FAERS.html>

## Details

Data are stored in the form of a contingency table, with drugs listed
across the columns and the 243 AEs presented across the rows. Each cell
in the contingency table represents the total report counts associated
with that (AE, drug) pair and detected in the FDA FAERS database during
2014Q3 - 2020Q4.

The dataset catalogs 5 opioid drugs (across columns):

Codeine, Fentanyl, Oxycodone, Pentazocine and Tramadol.

## References

Tan Y, Markatou M and Chakraborty S. A Review of Statistical Methods for
Spontaneous Reporting System Data Mining: Signal Detection and Beyond.
*arXiv*:2604.18898 (stat.AP). https://doi.org/10.48550/arXiv.2604.18898
