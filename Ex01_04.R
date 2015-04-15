# R Statistics Essential Training
# Ex01_04
# Installing and managing packages

# LIST OF PACKAGES
browseURL("http://cran.r-projects.org/web/views/")  # Task views in cran
library()  # Brings up editor list of installed packages
search()  # Shows packages that are currently loaded

# TO INSTALL AND USE PACKAGES
# Can use menus: Tools > Install Packages... (or use package window)
# Or can use scripts, which can be saved and incorporated in source
install.packages("ggplot2")  # Downloads package from CRAN and installs in R
?install.packages
library("ggplot2")  # Makes package available; often used for loading in scripts
require("ggplot2")  # Preferred for loading in functions; maybe better because less confusing?

#VIGNETTES
vignette(package = "grid")  # Brings up list of vignettes (examples) in editor window
?vignette
browseVignettes(package = "grid")  # open web page with hyperlinks for vignette PDFs, etc.
vignette()  # brings up list of all vignettes for currently installed libraries

# UPDATE PACKAGES
# in Rstudio, Tools > Check for package updates
update.packages()  # checks for updates; do periodically
?update.packages

# UNLOAD/REMOVE PACKAGES
# By default, all loaded packages are unloaded when R quits
# Can also open Packages window and manually uncheck
# Or use this code
# To unload packages
detach("package:ggplot2", unload = TRUE)
?detach
# To permanently remove (delete) package
install.packages("psytabs")  # Add psytabs
remove.packages("psytabs")  # Deletes it
?remove.packages