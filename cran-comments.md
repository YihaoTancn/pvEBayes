# pvEBayes 0.1.2

## Resubmission

This is a re-submission correcting issue possibly caused the error reported from
MKL test.

## Changelog

- fixed one bug that was causing eyeplot testing example to fail 

## Test environment:

- local Windows 10 install, R version 4.5.0 (2025-04-11 ucrt)

- local Ubuntu release 24.04, R version 4.2.0 (2022-04-22)

- online win-builder (devel, release, and old release)

- online mac-builder

## R CMD check results

There were no ERRORs or WARNINGs in any platforms, and no NOTES on local Windows,
online mac-builder and online win-builder (release, old-release, devel).

There was a NOTE on Ubuntu 24.04 on the compilation flags:

```
❯ checking compilation flags used ... NOTE
  Compilation used the following non-portable flag(s):
    ‘-march=skylake-avx512’
```
