


test_that("getQuickstat1", {

    testthat::expect_type(
    
    getQuickstat(
    sector=NULL,
    group=NULL,
    commodity=NULL,
    category=NULL,
    domain=NULL,
    county=NULL,
    key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
    program = 'CENSUS',
    data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
    geographic_level = 'STATE',
    year = '2017',
    state = NULL,
    geometry = T,
    lower48 = T),
    
    "list"
    
    )
})

test_that("getQuickstat2", {
  
  testthat::expect_type(
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 data_item = 'CHICKENS - INVENTORY',
                 geometry = F),
    
    "list"
    
  )
})

test_that("getQuickstat3", {
  
  testthat::expect_type(
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'CROP TOTALS, (EXCL HORTICULTURE) - PRODUCTION, MEASURED IN $',
                 geographic_level = 'STATE',
                 state = 'NORTH DAKOTA',
                 year = '2017',
                 geometry = T),
    
    "list"
    
  )
})

test_that("getQuickstat4", {
  
  testthat::expect_type(
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'ALMONDS - ACRES BEARING',
                 geographic_level = 'NATIONAL',
                 year = '2018',
                 geometry = T),
    
    "list"
    
  )
})

test_that("getQuickstat5", {
  
  testthat::expect_type(
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'AUTOS - INDEX FOR PRICE PAID, 2011',
                 geographic_level = 'NATIONAL',
                 year = '2019',
                 geometry = T),
    
    "list"
    
  )
})