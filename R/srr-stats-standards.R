#' NA_standards
#'
#' @srrstatsVerbose TRUE
#'
#'
#'
#'
#'
#'
#'
#'
#' @srrstatsNA {G1.6} *Software should include code necessary to compare performance claims with alternative implementations in other R packages.*
#'
#' @srrstatsNA {G2.4d} Factor input is not used.
#' @srrstatsNA {G2.4e} Factor input is not used.
#' @srrstatsNA {G2.5} Factor input is not used.
#' @srrstatsNA {G2.11} No data.frame-like input is used.
#' @srrstatsNA {G2.12} No data.frame-like input is used.
#' @srrstatsNA {G2.13, G2.14, G2.14a, G2.14b, G2.14c, G2.15, G2.16}
#' Missing value in the context of SRS data is underreporting
#' or zero observation for a A (SRS contingency entry), rather than
#' an \code{NA}, \code{Inf}, or other non-numeric placeholder.
#' Such observations are expected and fully supported by the methods implemented
#' in \pkg{pvEBayes}.
#'
#'
#' @srrstatsNA {G3.1} There is no covariance computation.
#' @srrstatsNA {G3.1a} There is no covariance computation.
#' @srrstatsNA {G4.0} There is not function that enables outputs to be written
#' to local files.
#' @srrstatsNA {G5.4} **Correctness tests** *to test that statistical algorithms produce expected results to some fixed test data sets (potentially through comparisons using binding frameworks such as [RStata](https://github.com/lbraglia/RStata)).*
#' @srrstatsNA {G5.4a} *For new methods, it can be difficult to separate out correctness of the method from the correctness of the implementation, as there may not be reference for comparison. In this case, testing may be implemented against simple, trivial cases or against multiple implementations such as an initial R implementation compared with results from a C/C++ implementation.*
#' @srrstatsNA {G5.4b} *For new implementations of existing methods, correctness tests should include tests against previous implementations. Such testing may explicitly call those implementations in testing, preferably from fixed-versions of other software, or use stored outputs from those where that is not possible.*
#' @srrstatsNA {G5.4c} *Where applicable, stored values may be drawn from published paper outputs when applicable and where code from original implementations is not available*
#' @srrstatsNA {G5.5} *Correctness tests should be run with a fixed random seed*
#' @srrstatsNA {G5.6} **Parameter recovery tests** *to test that the implementation produce expected results given data with known properties. For instance, a linear regression algorithm should return expected coefficient values for a simulated data set generated from a linear model.*
#' @srrstatsNA {G5.6a} *Parameter recovery tests should generally be expected to succeed within a defined tolerance rather than recovering exact values.*
#' @srrstatsNA {G5.6b} *Parameter recovery tests should be run with multiple random seeds when either data simulation or the algorithm contains a random component. (When long-running, such tests may be part of an extended, rather than regular, test suite; see G5.10-4.12, below).*
#' @srrstatsNA {G5.7} **Algorithm performance tests** *to test that implementation performs as expected as properties of data change. For instance, a test may show that parameters approach correct estimates within tolerance as data size increases, or that convergence times decrease for higher convergence thresholds.*
#' @srrstatsNA {G5.8} **Edge condition tests** *to test that these conditions produce expected behaviour such as clear warnings or errors when confronted with data with extreme properties including but not limited to:*
#' @srrstatsNA {G5.8a} *Zero-length data*
#' @srrstatsNA {G5.8b} *Data of unsupported types (e.g., character or complex numbers in for functions designed only for numeric data)*
#' @srrstatsNA {G5.8c} *Data with all-`NA` fields or columns or all identical fields or columns*
#' @srrstatsNA {G5.8d} *Data outside the scope of the algorithm (for example, data with more fields (columns) than observations (rows) for some regression algorithms)*
#' @srrstatsNA {G5.9} **Noise susceptibility tests** *Packages should test for expected stochastic behaviour, such as through the following conditions:*
#' @srrstatsNA {G5.9a} *Adding trivial noise (for example, at the scale of `.Machine$double.eps`) to data does not meaningfully change results*
#' @srrstatsNA {G5.9b} *Running under different random seeds or initial conditions does not meaningfully change results*
#' @srrstatsNA {G5.10} *Extended tests should included and run under a common framework with other tests but be switched on by flags such as as a `<MYPKG>_EXTENDED_TESTS="true"` environment variable.* - The extended tests can be then run automatically by GitHub Actions for example by adding the following to the `env` section of the workflow:
#' @srrstatsNA {G5.11} *Where extended tests require large data sets or other assets, these should be provided for downloading and fetched as part of the testing workflow.*
#' @srrstatsNA {G5.11a} *When any downloads of additional data necessary for extended tests fail, the tests themselves should not fail, rather be skipped and implicitly succeed with an appropriate diagnostic message.*
#' @srrstatsNA {G5.12} *Any conditions necessary to run extended tests such as platform requirements, memory, expected runtime, and artefacts produced that may need manual inspection, should be described in developer documentation such as a `CONTRIBUTING.md` or `tests/README.md` file.*
#'
#' @srrstatsNA {BS1.3, BS1.3a, BS1.3b}
#' The methods implemented in \pkg{pvEBayes} are empirical Bayes methods that
#' are fitted by estimating prior distributions through optimization with
#' respect to joint marginal likelihood rather than
#' through sampling procedures. As a result, the package does not involve
#' stochastic sampling processes and thinning parameters, burn-in lengths,
#' random seeds, or convergence diagnostics for full Bayesian computations
#' are not used. Parameters that control the empirical Bayes optimization are
#' appropriately documented.
#'
#' @srrstatsNA {BS1.5}
#' There is no multiple convergence criteria implemented for each optimizer.
#'
#' @srrstatsNA {BS2.2, BS2.3, BS2.4, BS2.5}
#' \pkg{pvEBayes} is based on parametric/nonparametric empirical Bayes methods
#' in which the prior distributions are estimated from data, not specified by
#' the user. Therefore, users do not provide prior distributional parameters in
#' the sense of full Bayesian modeling.
#'
#' @srrstatsNA {BS2.7, BS2.8, BS2.9, BS2.10, BS2.11}
#' \pkg{pvEBayes} is based on parametric/nonparametric empirical Bayes methods
#' that the methods are fitted by estimating prior distributions through
#' optimization rather than through sampling procedures. Tan et al.
#' (Stat. in Med., 2025) shows that the non-parametric empirical Bayes methods
#' included in \pkg{pvEBayes} are not as computational intensive as the
#' non-parametric full Baysian competitor. Parallel computation is not used.
#'
#' In \pkg{pvEBayes}, initialization of prior parameters follows the
#' recommendations of Tan et al. (*Statistics in Medicine*, 2025).
#' Users are not required to provide initial values for prior parameters,
#' as the package automatically performs this step internally.
#'
#'
#' @srrstatsNA {BS3.1, BS3.2}
#' The models implemented in \pkg{pvEBayes} are empirical Bayes models applied
#' to SRS contingency tables and do not involve regression predictors or
#' design matrices. As such, the notion of collinearity is not applicable in
#' this context.
#'
#' @srrstatsNA {BS4.0, BS4.1, BS4.2, BS4.3, BS4.4, BS4.5, BS4.6, BS4.7}
#' The methods implemented in \pkg{pvEBayes} are parametric/nonparametric
#' empirical Bayes approaches rely on optimizing the joint marginal likelihood
#' with optimizers. These models do not rely on Monte Carlo sampling in full
#' Bayesian modeling.
#'
#' @srrstatsNA {BS5.0, BS5.2}
#' The methods implemented in \pkg{pvEBayes} are parametric/nonparametric
#' empirical Bayes approaches rely on optimizing the joint marginal likelihood
#' with optimizers. Returning values with starting value(s) or seed(s) is not
#' meaningful.
#'
#' @srrstatsNA {BS6.2, BS6.5}
#' The empirical Bayes methods implemented in \pkg{pvEBayes} do not rely on
#' stochastic sampling. Therefore, plotting sequences of posterior samples, with
#' burn-in periods are not enabled.
#'
#' @srrstatsNA {BS7.0, BS7.1, BS7.2}
#' These requirements relate to Bayesian software in which a parametric prior
#' is specified by the user. The methods implemented in \code{pvEBayes} are
#' parametric/non-parametric empirical Bayes approaches in which the prior
#' distributions are estimated from the data.
#'
#' @srrstatsNA {BS7.0} *Software should demonstrate and confirm recovery of parametric estimates of a prior distribution*
#' @srrstatsNA {BS7.1} *Software should demonstrate and confirm recovery of a prior distribution in the absence of any additional data or information*
#' @srrstatsNA {BS7.2} *Software should demonstrate and confirm recovery of a expected posterior distribution given a specified prior and some input data*
#' @srrstatsNA {BS7.3} *Bayesian software should include tests which demonstrate and confirm the scaling of algorithmic efficiency with sizes of input data.*
#' @srrstatsNA {BS7.4} *Bayesian software should implement tests which confirm that predicted or fitted values are on (approximately) the same scale as input values.*
#' @srrstatsNA {BS7.4a} *The implications of any assumptions on scales on input objects should be explicitly tested in this context; for example that the scales of inputs which do not have means of zero will not be able to be recovered.*
#' @noRd
NULL

