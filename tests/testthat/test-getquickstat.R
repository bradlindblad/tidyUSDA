


test_that("getQuickstat1", {


    
    raw <- getQuickstat(
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
    lower48 = T)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
    
    
})

test_that("getQuickstat2", {
  

    
raw <-    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 data_item = 'CHICKENS - INVENTORY',
                 geometry = F)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
    
  
})

test_that("getQuickstat3", {
  
  
    
  raw <-  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'CROP TOTALS, (EXCL HORTICULTURE) - PRODUCTION, MEASURED IN $',
                 geographic_level = 'STATE',
                 state = 'NORTH DAKOTA',
                 year = '2017',
                 geometry = T)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
    
  
})

test_that("getQuickstat4", {
  

   raw <- getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'ALMONDS - ACRES BEARING',
                 geographic_level = 'NATIONAL',
                 year = '2018',
                 geometry = T)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
    
  
})

test_that("getQuickstat5", {
  
  
    
  raw <-  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'SURVEY',
                 data_item = 'AUTOS - INDEX FOR PRICE PAID, 2011',
                 geographic_level = 'NATIONAL',
                 year = '2019',
                 geometry = T)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
    
  
})


test_that("weighted by mile", {
  
    raw <- tidyUSDA::getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain='TOTAL',
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 'AG LAND, INCL BUILDINGS - ASSET VALUE, MEASURED IN $',
      geographic_level = 'STATE',
      year = 2017,
      state = NULL,
      geometry = T,
      lower48 = T, 
      weighted_by_area = T)
    
    testthat::expect_s3_class(object = raw, class = "data.frame")
    
  
})

