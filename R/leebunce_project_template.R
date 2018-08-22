# Project template function

leebunce_project_template <- function(path, data, scripts, output){
  dir.create(path, recursive = TRUE)

  if(data == TRUE) dir.create(paste0(path, '/Data'))

  if(scripts == TRUE) {
    dir.create(paste0(path, '/Scripts'))

    fileConn<-file(paste0(path, '/Scripts/Main.R'))
    writeLines(c("# Title",
                 "",
                 "# Packages ----------------------------------------------------------------",
                 "library(tidyverse)",
                 "library(leebunce)"), fileConn)
    close(fileConn)

    }

  if(output == TRUE) dir.create(paste0(path, '/Output'))

}
