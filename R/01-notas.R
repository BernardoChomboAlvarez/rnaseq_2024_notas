# First class
# Creation of notes repo
usethis::create_project("~/rnaseq_2024_notas")

# Creation of first file tests
## Creemos el archivo R/02-visualizar-mtcars.R
usethis::use_r("02-visualizar-mtcars.R")

# GITHUB
## Init git
usethis::use_git()

## Load for the FIRST time a repo into Github.com
usethis::use_github()

## Push changes into Github repo
## Change to 'Terminal' window pane
$ git push origin master


# WEBPAGE
## load 'postcards' library
## choose template
## compile to .html file
## upload repo and write 'USERNAME.github.io'
## Webpage generated!

