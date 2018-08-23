# Project template function

leebunce_project_template <- function(path, data, scripts, output, word_report){
  dir.create(path, recursive = TRUE)

  if(data) dir.create(paste0(path, '/Data'))

  if(scripts) {
    dir.create(paste0(path, '/Scripts'))

    file.copy(from = system.file('misc', 'Main.R', package = 'leebunce'),
              to = paste0(path, '/Scripts/Main.R'))

    }

  if(output) dir.create(paste0(path, '/Output'))

  if(word_report) {
    rmarkdown::draft(file = 'Report',
                     template = 'leebunce_word_template',
                     package = 'leebunce',
                     create_dir = TRUE,
                     edit = FALSE)
  }

}
