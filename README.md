# tmpdir

<!-- badges: start -->
<!-- badges: end -->

Set the location of the R session's temporary directory

This can be useful under a few circumstances:
1. when performing large file operations using `tempdir()` or `tempfile()`,
   which may fill up the system's temporary storage (e.g., `/tmp`), which could hang the system;
2. immediately after forking the R process, to ensure multiple processes do not conflict.

NOTE: use at the start of a new R session (or immediately after forking) to switch
the temporary directory location used for the session (or forked process).

## Installation

You can install the development version of tmpdir like so:

``` r
remotes::install_github("achubaty/tmpdir")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tmpdir)

tempdir() ## current temp dir
myScratchDir <- file.path(basename(tempdir(), "scratch")) ## new temp dir to use
setTmpDir(myScratchDir, rmOldTempDir = TRUE)
unlink(myScratchDir, recur sive = TRUE)
```
