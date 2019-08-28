

source("R/getQuickstat.R")
source('R/getParams.R')
source("R/plotting.R")


# getQuickstat. -----------------------------------------------------------------------

out <- tryCatch({
  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                             program = 'CENSUS',
                             data_item = 'CHICKENS - INVENTORY',
                             geometry = T)
  message("Success")
},
  error=function(cond) {
    message("Error: Function broken")
  }
)

out <- tryCatch({
  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
               program = 'CENSUS',
               data_item = 'CHICKENS - INVENTORY',
               geometry = F)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)


out <- tryCatch({
  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
               program = 'SURVEY',
               data_item = 'CROP TOTALS, (EXCL HORTICULTURE) - PRODUCTION, MEASURED IN $',
               geographic_level = 'STATE',
               state = 'NORTH DAKOTA',
               year = '2017',
               geometry = T)
  message("Success")
},
  error=function(cond) {
    message("Error: Function broken")
  }
)


out <- tryCatch({
  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
               program = 'SURVEY',
               data_item = 'ALMONDS - ACRES BEARING',
               geographic_level = 'NATIONAL',
               year = '2018',
               geometry = T)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)


out <- tryCatch({
  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
               program = 'CENSUS',
               data_item = 'INCOME, FARM-RELATED - RECEIPTS, MEASURED IN $',
               domain = "OPERATORS",
               geographic_level = 'STATE',
               year = '2012',
               geometry = T)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)



# GetParams.R -----------------------------------------------------------------------

key <- '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71'

out <- tryCatch({
  getAllProgram(key) 
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllSector(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllGroup(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllCommodity(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllCategory(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllDataItem(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllDomain(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllGeogLevel(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllState(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)

out <- tryCatch({
  getAllCounty(key)
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)



# Plotting.R --------------------------------------------------------------

out <- tryCatch({
  plotUSDA(df = test2, title = "This is working nicely")
  message("Success")
},
error=function(cond) {
  message("Error: Function broken")
}
)



