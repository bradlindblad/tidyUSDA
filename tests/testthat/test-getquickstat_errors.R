
test_that("null key", {
  
  testthat::expect_condition(
    
    getQuickstat(key = NULL,
                 program = 'SURVEY',
                 data_item = 'AUTOS - INDEX FOR PRICE PAID, 2011',
                 geographic_level = 'NATIONAL',
                 year = '2019',
                 geometry = T),
    
    regexp = "API key missing; enter an API key."
    
  )
})

test_that("no key", {
  
  testthat::expect_condition(
    
    getQuickstat(
      program = 'SURVEY',
      data_item = 'AUTOS - INDEX FOR PRICE PAID, 2011',
      geographic_level = 'NATIONAL',
      year = '2019',
      geometry = T),
    
    regexp = "API key missing; enter an API key."
    
  )
})


test_that("bad program", {
  
  testthat::expect_error(
    

  getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                      program = 'CENSUSS',
                      sector = 'CROPS',
                      group = 'CROP TOTALS',
                      commodity = 'CROP TOTALS',
                      category = 'SALES',
                      data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                      domain = 'TOTAL',
                      geographic_level = 'STATE'),
                      

    
    regexp = 'HTTP error 400.'
    
  )
})


test_that("bad sector", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPSS',
                 group = 'CROP TOTALS',
                 commodity = 'CROP TOTALS',
                 category = 'SALES',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTAL',
                 geographic_level = 'STATE'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})


test_that("bad group", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPS',
                 group = 'CROP TOTALSS',
                 commodity = 'CROP TOTALS',
                 category = 'SALES',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTAL',
                 geographic_level = 'STATE'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})


test_that("bad commodity", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPS',
                 group = 'CROP TOTALS',
                 commodity = 'CROP TOTALSS',
                 category = 'SALES',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTAL',
                 geographic_level = 'STATE'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})


test_that("bad category", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPS',
                 group = 'CROP TOTALS',
                 commodity = 'CROP TOTALS',
                 category = 'SALESS',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTAL',
                 geographic_level = 'STATE'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})



# test_that("bad data_item", {
#   
#   testthat::expect_error(
#     
#     
#     getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
#                  program = 'CENSUS',
#                  sector = 'CROPS',
#                  group = 'CROP TOTALS',
#                  commodity = 'CROP TOTALS',
#                  category = 'SALES',
#                  data_item = 'CROP TOTALSSS - SALES, MEASURED IN $',
#                  domain = 'TOTAL',
#                  geographic_level = 'STATE'),
#     
#     
#     
#     regexp = 'HTTP error 400.'
#     
#   )
# })


test_that("bad domain", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPS',
                 group = 'CROP TOTALS',
                 commodity = 'CROP TOTALS',
                 category = 'SALES',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTALS',
                 geographic_level = 'STATE'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})



test_that("bad geographic_level", {
  
  testthat::expect_error(
    
    
    getQuickstat(key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
                 program = 'CENSUS',
                 sector = 'CROPS',
                 group = 'CROP TOTALS',
                 commodity = 'CROP TOTALS',
                 category = 'SALES',
                 data_item = 'CROP TOTALS - SALES, MEASURED IN $',
                 domain = 'TOTAL',
                 geographic_level = 'STATES'),
    
    
    
    regexp = 'HTTP error 400.'
    
  )
})