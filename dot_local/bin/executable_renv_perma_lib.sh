#!/bin/sh
#
# Author: Adrien Le Guillou
#
# Link some R libraries from the main user library to a secondary one.
# `renv` projects can use them without installing them to the project by adding
# the following option to ~/.Renviron
#
# RENV_CONFIG_EXTERNAL_LIBRARIES=~/R/x86_64-pc-linux-gnu-library/renv_utils_lib

# update R packages
# R -e "update.packages(ask = FALSE)"


R -e 'install.packages("remotes", ask = FALSE)'
R -e 'if (!require(colorout, quiet = T)) remotes::install_github("jalvesaq/colorout")'

UTILS_PACKAGES="nvimcom
colorout"

CURRENT_R_LIB=$(Rscript -e ".libPaths()" | grep $HOME)
CURRENT_R_LIB=${CURRENT_R_LIB#* \"} # remove [1] "
CURRENT_R_LIB=${CURRENT_R_LIB%\"} # remove closing "

# renv_utils_lib is in the same folder as `4.0`
RENV_R_LIB="${CURRENT_R_LIB%/*}/renv_utils_lib"

rm -rf "$RENV_R_LIB"
mkdir "$RENV_R_LIB"

for PACKAGE in $(echo "$UTILS_PACKAGES")
do
    ln -s "$CURRENT_R_LIB/$PACKAGE" "$RENV_R_LIB/$PACKAGE"
done

