


test_that("getMultStates", {
  
  
  
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
    state = c("NORTH DAKOTA", "MINNESOTA"),
    geometry = F,
    lower48 = F)
  
  testthat::expect_s3_class(object = raw, class = "data.frame")
  
  
  
})

Sys.sleep(1)

test_that("getMultCounties", {
  
  
  
  raw <- getQuickstat(
    sector=NULL,
    group=NULL,
    commodity=NULL,
    category=NULL,
    domain=NULL,
    key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
    program = 'CENSUS',
    data_item = 'AG LAND - NUMBER OF OPERATIONS',
    geographic_level = 'COUNTY',
    year = '2017',
    county = c("CLAY", "CASS"),
    geometry = F,
    lower48 = F)
  
  testthat::expect_s3_class(object = raw, class = "data.frame")
  
  
  
})


Sys.sleep(1)

test_that("getMultStatesCounties", {
  
  
  
  raw <- getQuickstat(
    sector=NULL,
    group=NULL,
    commodity=NULL,
    category=NULL,
    domain=NULL,
    key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
    program = 'CENSUS',
    data_item = 'AG LAND - NUMBER OF OPERATIONS',
    geographic_level = 'COUNTY',
    year = '2017',
    county = c("CLAY", "CASS"),
    state = c("NORTH DAKOTA", "MINNESOTA"),
    geometry = F,
    lower48 = F)
  
  
  testthat::expect_s3_class(object = raw, class = "data.frame")
  
  
  
})
