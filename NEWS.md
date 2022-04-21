# tidyUSDA (development version)

# tidyUSDA 0.4.0
* Added more verbose error messages if your parameters are rejected by the API

# tidyUSDA 0.3.1
* Fixed issue where input parameters with an '&' weren't encoding correctly in API call to USDA
* Added some more unit tests

# tidyUSDA 0.3.0
* Fixed SSL issue from {jsonlite} dep

# tidyUSDA 0.2.9
* Updated to use {tigris} v1.0

# tidyUSDA 0.2.8
* Update for R 4.0.2

# tidyUSDA 0.2.7
* Minor bug fix

# tidyUSDA 0.2.6
* Added more test coverage
* Fixed error in getQuickstat where 'weighted_by_sq_mile' rounded the numbers too much to make sense

# tidyUSDA 0.2.5
* Fixed error caused by changes to underlying geospatial libs

# tidyUSDA 0.2.4
* Redid the geospatial joins in getQuickstat()
* Added more unit tests

# tidyUSDA 0.2.3
* Fixed interacting plotting issue with builds
* Added crayon highlighting to error trapping code

# tidyUSDA 0.2.2 
* Added messages for macOS users before they try plotUSDA (graphics issue with underlying geom_sf())
* Minor bug fixes
* Added code coverage

# tidyUSDA 0.2.1
* Fixed bug in vignette where domain was scoped incorrectly
* Added comments to vignette regarding slow plotting on Mac OsX


# tidyUSDA 0.2.0
* Added help features for entering field parameters. Now if you enter an incorrect value a few characters off, you will be presented with a recommendation for that value.
* Minor documentation updates
* Minor bug fixes
* Built vignette
* Created pkgdown website

# tidyUSDA 0.1.0
* Initial, not-ready-for-primetime release for development
