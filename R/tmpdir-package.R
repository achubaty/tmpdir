#' Set the location of the R session's temporary directory
#'
#' This can be useful under a few circumstances:
#' 1. when performing large file operations using `tempdir()` or `tempfile()`,
#'    which may fill up the system's temporary storage (e.g., `/tmp`), which could hang the system;
#' 2. immediately after forking the R process, to ensure multiple processes do not conflict.
#'
#' @note Use at the start of a new R session (or immediately after forking) to switch
#' the temporary directory location used for the session (or forked process).
#'
#' @rdname tmpdir-package
"_PACKAGE"
