# Estimate expected null baseline count based on reference row and column

This function estimates the expected null baseline count (\\E\_{ij}\\)
for each AE-drug combination under the assumption of independence
between rows and columns. The expected count is calculated using a
reference row (other AEs) and reference column (other drugs). This null
baseline is typically used in empirical Bayes modeling of pvEBayes
package for signal detection and estimation in spontaneous reporting
system (SRS) data.

## Usage

``` r
estimate_null_expected_count(contin_table)
```

## Arguments

- contin_table:

  an IxJ contingency table showing pairwise counts of adverse events for
  I AEs (along the rows) and J drugs (along the columns). The reference
  row "Other AEs" and the reference column "Other drugs" need to be the
  I-th row and J-th column respectively.

## Value

an `nrow(contin_table)` by `ncol(contin_table)` matrix.

## Details

This null value estimator is proposed by Tan et al. (2025).

## References

Tan Y, Markatou M and Chakraborty S. Flexible Empirical Bayesian
Approaches to Pharmacovigilance for Simultaneous Signal Detection and
Signal Strength Estimation in Spontaneous Reporting Systems Data.
*Statistics in Medicine.* 2025; 44: 18-19,
https://doi.org/10.1002/sim.70195.

## Examples

``` r

estimate_null_expected_count(statin2025_44)
#>                                        Atorvastatin  Fluvastatin   Lovastatin
#> ACUTE KIDNEY INJURY                    5.327398e+02 5.091431e+01 4.967068e+00
#> ANURIA                                 1.963035e+01 1.876086e+00 1.830261e-01
#> BLOOD CALCIUM DECREASED                9.199560e+01 8.792083e+00 8.577328e-01
#> BLOOD CREATINE PHOSPHOKINASE ABNORMAL  3.688143e-01 3.524784e-02 3.438688e-03
#> BLOOD CREATINE PHOSPHOKINASE INCREASED 4.770460e+01 4.559162e+00 4.447800e-01
#> BLOOD CREATININE ABNORMAL              7.334690e+00 7.009814e-01 6.838593e-02
#> BLOOD CREATININE INCREASED             2.159727e+02 2.064066e+01 2.013649e+00
#> CHROMATURIA                            3.210903e+01 3.068682e+00 2.993727e-01
#> CHRONIC KIDNEY DISEASE                 3.771611e+02 3.604555e+01 3.516511e+00
#> COMPARTMENT SYNDROME                   1.777519e+00 1.698787e-01 1.657292e-02
#> CREATININE RENAL CLEARANCE DECREASED   7.597297e+01 7.260790e+00 7.083438e-01
#> DIAPHRAGM MUSCLE WEAKNESS              4.991472e-02 4.770384e-03 4.653863e-04
#> ELECTROMYOGRAM ABNORMAL                2.773040e-03 2.650213e-04 2.585480e-05
#> END STAGE RENAL DISEASE                9.278869e+01 8.867879e+00 8.651273e-01
#> GLOMERULAR FILTRATION RATE ABNORMAL    4.034773e+00 3.856061e-01 3.761873e-02
#> GLOMERULAR FILTRATION RATE DECREASED   3.599406e+01 3.439977e+00 3.355952e-01
#> HYPERCREATININAEMIA                    3.521761e-01 3.365771e-02 3.283559e-03
#> HYPOCALCAEMIA                          6.801989e+01 6.500709e+00 6.341923e-01
#> MUSCLE DISORDER                        1.646076e+01 1.573167e+00 1.534741e-01
#> MUSCLE ENZYME INCREASED                2.135241e-01 2.040664e-02 1.990819e-03
#> MUSCLE FATIGUE                         6.927054e+00 6.620233e-01 6.458528e-02
#> MUSCLE HAEMORRHAGE                     2.484644e+00 2.374591e-01 2.316590e-02
#> MUSCLE NECROSIS                        1.006613e+00 9.620275e-02 9.385291e-03
#> MUSCLE RUPTURE                         6.652523e+00 6.357862e-01 6.202565e-02
#> MUSCULAR WEAKNESS                      4.858116e+02 4.642935e+01 4.529527e+00
#> MUSCULOSKELETAL DISCOMFORT             5.032235e+01 4.809342e+00 4.691870e-01
#> MUSCULOSKELETAL DISORDER               5.558004e+01 5.311823e+00 5.182077e-01
#> MUSCULOSKELETAL PAIN                   3.456289e+02 3.303200e+01 3.222516e+00
#> MYALGIA                                3.841797e+02 3.671632e+01 3.581949e+00
#> MYASTHENIC SYNDROME                    1.885667e+00 1.802145e-01 1.758126e-02
#> MYOGLOBIN BLOOD INCREASED              2.384814e+01 2.279184e+00 2.223512e-01
#> MYOGLOBIN URINE PRESENT                3.302690e+00 3.156404e-01 3.079306e-02
#> MYOGLOBINAEMIA                         5.823384e-02 5.565448e-03 5.429507e-04
#> MYOGLOBINURIA                          1.139719e+00 1.089238e-01 1.062632e-02
#> MYOPATHY                               2.034579e+01 1.944462e+00 1.896966e-01
#> MYOPATHY TOXIC                         1.272825e+00 1.216448e-01 1.186735e-02
#> MYOSITIS                               4.247742e+01 4.059597e+00 3.960438e-01
#> NECROTISING MYOSITIS                   1.131400e+00 1.081287e-01 1.054876e-02
#> OLIGURIA                               1.044881e+01 9.986004e-01 9.742087e-02
#> RENAL FAILURE                          3.342983e+02 3.194912e+01 3.116873e+00
#> RENAL IMPAIRMENT                       2.485282e+02 2.375201e+01 2.317184e+00
#> RENAL TUBULAR NECROSIS                 2.384537e+01 2.278919e+00 2.223254e-01
#> RHABDOMYOLYSIS                         6.474493e+01 6.187718e+00 6.036578e-01
#> TENDON DISCOMFORT                      5.684732e-01 5.432938e-02 5.300233e-03
#> Other AEs                              2.146160e+05 2.051100e+04 2.001000e+03
#>                                         Pravastatin Rosuvastatin  Simvastatin
#> ACUTE KIDNEY INJURY                    7.439432e+01 4.249537e+02 2.922031e+02
#> ANURIA                                 2.741275e+00 1.565866e+01 1.076707e+01
#> BLOOD CALCIUM DECREASED                1.284670e+01 7.338267e+01 5.045878e+01
#> BLOOD CREATINE PHOSPHOKINASE ABNORMAL  5.150298e-02 2.941943e-01 2.022914e-01
#> BLOOD CREATINE PHOSPHOKINASE INCREASED 6.661698e+00 3.805281e+01 2.616556e+01
#> BLOOD CREATININE ABNORMAL              1.024251e+00 5.850705e+00 4.023014e+00
#> BLOOD CREATININE INCREASED             3.015945e+01 1.722762e+02 1.184591e+02
#> CHROMATURIA                            4.483858e+00 2.561260e+01 1.761152e+01
#> CHRONIC KIDNEY DISEASE                 5.266858e+01 3.008523e+02 2.068696e+02
#> COMPARTMENT SYNDROME                   2.482212e-01 1.417884e+00 9.749534e-01
#> CREATININE RENAL CLEARANCE DECREASED   1.060923e+01 6.060181e+01 4.167051e+01
#> DIAPHRAGM MUSCLE WEAKNESS              6.970329e-03 3.981576e-02 2.737779e-02
#> ELECTROMYOGRAM ABNORMAL                3.872405e-04 2.211987e-03 1.520988e-03
#> END STAGE RENAL DISEASE                1.295745e+01 7.401529e+01 5.089378e+01
#> GLOMERULAR FILTRATION RATE ABNORMAL    5.634349e-01 3.218441e+00 2.213038e+00
#> GLOMERULAR FILTRATION RATE DECREASED   5.026382e+00 2.871159e+01 1.974243e+01
#> HYPERCREATININAEMIA                    4.917954e-02 2.809223e-01 1.931655e-01
#> HYPOCALCAEMIA                          9.498622e+00 5.425783e+01 3.730832e+01
#> MUSCLE DISORDER                        2.298660e+00 1.313035e+01 9.028585e+00
#> MUSCLE ENZYME INCREASED                2.981752e-02 1.703230e-01 1.171161e-01
#> MUSCLE FATIGUE                         9.673267e-01 5.525543e+00 3.799428e+00
#> MUSCLE HAEMORRHAGE                     3.469675e-01 1.981940e+00 1.362805e+00
#> MUSCLE NECROSIS                        1.405683e-01 8.029513e-01 5.521187e-01
#> MUSCLE RUPTURE                         9.289899e-01 5.306557e+00 3.648850e+00
#> MUSCULAR WEAKNESS                      6.784105e+01 3.875202e+02 2.664634e+02
#> MUSCULOSKELETAL DISCOMFORT             7.027253e+00 4.014093e+01 2.760137e+01
#> MUSCULOSKELETAL DISORDER               7.761461e+00 4.433485e+01 3.048516e+01
#> MUSCULOSKELETAL PAIN                   4.826527e+01 2.756998e+02 1.895744e+02
#> MYALGIA                                5.364868e+01 3.064509e+02 2.107192e+02
#> MYASTHENIC SYNDROME                    2.633235e-01 1.504151e+00 1.034272e+00
#> MYOGLOBIN BLOOD INCREASED              3.330268e+00 1.902309e+01 1.308050e+01
#> MYOGLOBIN URINE PRESENT                4.612034e-01 2.634476e+00 1.811497e+00
#> MYOGLOBINAEMIA                         8.132050e-03 4.645173e-02 3.194075e-02
#> MYOGLOBINURIA                          1.591558e-01 9.091266e-01 6.251261e-01
#> MYOPATHY                               2.841183e+00 1.622935e+01 1.115949e+01
#> MYOPATHY TOXIC                         1.777434e-01 1.015302e+00 6.981335e-01
#> MYOSITIS                               5.931750e+00 3.388322e+01 2.329850e+01
#> NECROTISING MYOSITIS                   1.579941e-01 9.024907e-01 6.205632e-01
#> OLIGURIA                               1.459122e+00 8.334767e+00 5.731083e+00
#> RENAL FAILURE                          4.668300e+01 2.666617e+02 1.833597e+02
#> RENAL IMPAIRMENT                       3.470565e+01 1.982449e+02 1.363155e+02
#> RENAL TUBULAR NECROSIS                 3.329881e+00 1.902088e+01 1.307898e+01
#> RHABDOMYOLYSIS                         9.041291e+00 5.164547e+01 3.551203e+01
#> TENDON DISCOMFORT                      7.938430e-02 4.534573e-01 3.118026e-01
#> Other AEs                              2.997000e+04 1.711940e+05 1.177150e+05
#>                                        Other_drugs
#> ACUTE KIDNEY INJURY                         192114
#> ANURIA                                        7079
#> BLOOD CALCIUM DECREASED                      33175
#> BLOOD CREATINE PHOSPHOKINASE ABNORMAL          133
#> BLOOD CREATINE PHOSPHOKINASE INCREASED       17203
#> BLOOD CREATININE ABNORMAL                     2645
#> BLOOD CREATININE INCREASED                   77883
#> CHROMATURIA                                  11579
#> CHRONIC KIDNEY DISEASE                      136010
#> COMPARTMENT SYNDROME                           641
#> CREATININE RENAL CLEARANCE DECREASED         27397
#> DIAPHRAGM MUSCLE WEAKNESS                       18
#> ELECTROMYOGRAM ABNORMAL                          1
#> END STAGE RENAL DISEASE                      33461
#> GLOMERULAR FILTRATION RATE ABNORMAL           1455
#> GLOMERULAR FILTRATION RATE DECREASED         12980
#> HYPERCREATININAEMIA                            127
#> HYPOCALCAEMIA                                24529
#> MUSCLE DISORDER                               5936
#> MUSCLE ENZYME INCREASED                         77
#> MUSCLE FATIGUE                                2498
#> MUSCLE HAEMORRHAGE                             896
#> MUSCLE NECROSIS                                363
#> MUSCLE RUPTURE                                2399
#> MUSCULAR WEAKNESS                           175191
#> MUSCULOSKELETAL DISCOMFORT                   18147
#> MUSCULOSKELETAL DISORDER                     20043
#> MUSCULOSKELETAL PAIN                        124639
#> MYALGIA                                     138541
#> MYASTHENIC SYNDROME                            680
#> MYOGLOBIN BLOOD INCREASED                     8600
#> MYOGLOBIN URINE PRESENT                       1191
#> MYOGLOBINAEMIA                                  21
#> MYOGLOBINURIA                                  411
#> MYOPATHY                                      7337
#> MYOPATHY TOXIC                                 459
#> MYOSITIS                                     15318
#> NECROTISING MYOSITIS                           408
#> OLIGURIA                                      3768
#> RENAL FAILURE                               120553
#> RENAL IMPAIRMENT                             89623
#> RENAL TUBULAR NECROSIS                        8599
#> RHABDOMYOLYSIS                               23348
#> TENDON DISCOMFORT                              205
#> Other AEs                                 77393767
```
