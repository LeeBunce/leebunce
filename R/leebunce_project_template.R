# Project template function

leebunce_project_template <- function(path, data, scripts, output){
  dir.create(path, recursive = TRUE)

  if(data == TRUE) dir.create(paste0(path, '/Data'))

  if(scripts == TRUE) {
    dir.create(paste0(path, '/Scripts'))

    file.copy(from = system.file('misc', 'Main.R', package = 'leebunce'),
              to = paste0(path, '/Scripts/Main.R'))

    }

  if(output == TRUE) dir.create(paste0(path, '/Output'))

}
