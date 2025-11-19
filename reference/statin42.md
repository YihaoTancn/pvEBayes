# FDA statin dataset with 42 adverse events

An adverse event-drug count dataset (contingency table) obtained from
the FDA FAERS database for the quarters 2014Q3 - 2020Q4.

## Usage

``` r
statin42
```

## Format

An object of class `matrix` (inherits from `array`) with 43 rows and 7
columns.

## Source

<https://fis.fda.gov/extensions/FPD-QDE-FAERS/FPD-QDE-FAERS.html>

## Details

Data are stored in the form of a contingency table, with drugs listed
across the columns and the 42 AEs presented across the rows. Each cell
in the contingency table represents the total report counts associated
with that (AE, drug) pair and detected in the FDA FAERS database during
2014Q3 - 2020Q4.

The dataset catalogs 6 statin drugs (across columns):

Atorvastatin, Fluvastatin, Lovastatin, Pravastatin, Rosuvastatin and
Simvastatin.

This dataset is derived from the `statin46` dataset in the pvLRT
package, with four AEs removed.

The excluded AEs are: "Blood Creatine Phosphokinase Mm Increased",
"Myoglobin Blood Present", "Myoglobin Urine Present", and
"Myoglobinaemia".
