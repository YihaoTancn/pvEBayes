# VigiBase opioid dataset with 100 mental-related adverse events

An adverse event-drug count dataset (contingency table) obtained from
VigiBase.

## Usage

``` r
vigi_opioid_mental
```

## Format

An object of class `matrix` (inherits from `array`) with 101 rows and 6
columns.

## Source

<https://www.vigiaccess.org/>

## Details

Data are stored in the form of a contingency table, with drugs listed
across the columns and the 100 AEs presented across the rows. Each cell
in the contingency table represents the total report counts associated
with that (AE, drug) pair and detected in VigiBase.

The dataset catalogs 5 opioid drugs (across columns):

Codeine, Fentanyl, Oxycodone, Pentazocine and Tramadol.

## References

Tan Y, Markatou M and Chakraborty S. A Review of Statistical Methods for
Spontaneous Reporting System Data Mining: Signal Detection and Beyond.
*arXiv*:2604.18898 (stat.AP). https://doi.org/10.48550/arXiv.2604.18898
