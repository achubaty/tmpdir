#' Set the location of the temporary R session directory
#'
#' This can be useful under a few circumstances:
#' 1. when performing large file operations using `tempdir()` or `tempfile()`,
#'    which may fill up the system's temporary storage (e.g., `/tmp`), which could hang the system;
#' 2. immediately after forking the R process, to ensure multiple processes do not conflict.
#'
#' @note Use at the start of a new R session (or immediately after forking) to switch
#' the temporary directory location used for the session (or forked process).
#'
#' @param newTmpDir character, indicating the path to a new temporary directory.
#'                  If the directory does not exists, it will be created.
#' @param rmOldTempDir logical, indicating whether to delete the currently set temp directory.
#'
#' @return character, indicating the path of the new session temporary directory.
#'
#' @export
#' @importFrom tools file_path_as_absolute
#'
#' @examples
#' tempdir() ## current temp dir
#' myScratchDir <- file.path(dirname(tempdir()), "scratch") ## new temp dir to use
#' setTmpDir(myScratchDir, rmOldTempDir = TRUE)
#' tempdir() ## current tempdir has been updated
#' unlink(myScratchDir, recursive = TRUE)
setTmpDir <- function(newTmpDir, rmOldTempDir = FALSE) {
  oldTmpDir <- tempdir()

  if (oldTmpDir != newTmpDir) {
    if (!dir.exists(newTmpDir)) dir.create(newTmpDir, recursive = TRUE)
    newTmpDir <- tools::file_path_as_absolute(newTmpDir)
    Sys.setenv(TMPDIR = newTmpDir)

    if (isTRUE(rmOldTempDir))
      unlink(oldTmpDir, recursive = TRUE)

    tempdir(check = TRUE)
  }
}
