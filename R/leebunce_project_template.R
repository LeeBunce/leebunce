# Project template function

leebunce_project_template <- function(){
  dir.create('Data')
  dir.create('Scripts')
  dir.create('Output')

  fileConn<-file("Scripts/Main.R")
  writeLines(c("# Title",
               "",
               "# Packages ----------------------------------------------------------------",
               "library(tidyverse)",
               "library(leebunce)"), fileConn)
  close(fileConn)

}
