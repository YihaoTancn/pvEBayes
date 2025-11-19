# FDA statin dataset with 5119 adverse events

An adverse event-drug count dataset (contingency table) obtained from
the FDA FAERS database for the quarters 2021Q1 - 2024Q4.

## Usage

``` r
statin2025
```

## Format

An object of class `matrix` (inherits from `array`) with 5119 rows and 7
columns.

## Source

<https://fis.fda.gov/extensions/FPD-QDE-FAERS/FPD-QDE-FAERS.html>

## Details

The dataset catalogs 6 statin drugs (across columns): Atorvastatin,
Fluvastatin, Lovastatin, Pravastatin, Rosuvastatin and Simvastatin.

Data are stored in the form of a contingency table, with drugs listed
across the columns and the 5119 AEs presented across the rows. Each cell
in the contingency table represents the total report counts associated
with that (AE, drug) pair and detected in the FDA FAERS database during
2021Q1 - 2024Q4.

The dataset catalogs 6 statin drugs (across columns):

Atorvastatin, Fluvastatin, Lovastatin, Pravastatin, Rosuvastatin and
Simvastatin.

The 5119 adverse events presented across the rows are AEs that contain
at least one report for 6 statin drugs during 2021Q1 - 2024Q4.

This dataset is an updated version of statin from the pvLRT package
which collects the same scope of AEs for 6 statin drugs for quarters
2014Q3 - 2020Q4.
