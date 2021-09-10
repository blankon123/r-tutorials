# File:    Script 2.R
# Course:  UNJ Pesta Day 2
# Session: 2 - Packages & Data Loading in R
# Author:  Thosan Girisona S, bps.go.id, @blankon123
# Date:    2021-09-08

# 1. Packages ################################################

#Old Style
install.packages(c("dplyr", "plotly"))
library(c("dplyr", "plotly")) #Error, can only be loaded 1 by 1

#Better way
install.packages("pacman")

require(pacman)  # Gives a confirmation message.
library(pacman)  # No message.
read.
pacman::p_load(
  pacman,
  dplyr,
  GGally,
  ggplot2,
  ggthemes,
  ggvis,
  httr,
  lubridate,
  plotly,
  rio,
  rmarkdown,
  shiny,
  stringr,
  tidyr
)

# 2. Load Dataset ################################################
library(datasets)

if (!require("pacman"))
  install.packages("pacman")

pacman::p_load(pacman, rio)

workdir <- "https://raw.githubusercontent.com/blankon123/r-tutorials/main/data-import-example"
# CSV
rio_csv <- import(paste0(workdir,"/mbb.csv"))
head(rio_csv)

# TXT
rio_txt <- import(paste0(workdir,"/mbb.txt"))
head(rio_txt)

# Excel XLSX
rio_xlsx <- import(paste0(workdir,"/mbb.xlsx"))
head(rio_xlsx)
