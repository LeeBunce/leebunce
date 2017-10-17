# Project template function

leebunce_project_template <- function(path){
  dir.create(path)

  dir.create(paste0(path, '/Data'))
  dir.create(paste0(path, '/Scripts'))
  dir.create(paste0(path, '/Output'))

  fileConn<-file(paste0(path, '/Scripts/Main.R'))
  writeLines(c("# Title",
               "",
               "# Packages ----------------------------------------------------------------",
               "library(tidyverse)",
               "library(leebunce)"), fileConn)
  close(fileConn)

}
