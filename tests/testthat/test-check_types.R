test_that("assert - key", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain=NULL,
      county=NULL,
      key = 69,
      program = 'CENSUS',
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )

})

test_that("assert - program", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain=NULL,
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 69,
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - dataitem", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain=NULL,
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 69,
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - sector", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=69,
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
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - group", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=69,
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
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - commodity", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=69,
      category=NULL,
      domain=NULL,
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - category", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=69,
      domain=NULL,
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - domain", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain=69,
      county=NULL,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - geographic_level", {
  
  testthat::expect_error(
    
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
      geographic_level = 69,
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - state", {
  
  testthat::expect_error(
    
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
      state = 69,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - county", {
  
  testthat::expect_error(
    
    getQuickstat(
      sector=NULL,
      group=NULL,
      commodity=NULL,
      category=NULL,
      domain=NULL,
      county=69,
      key = '7CE0AFAD-EF7B-3761-8B8C-6AF474D6EF71',
      program = 'CENSUS',
      data_item = 'CROP TOTALS - OPERATIONS WITH SALES',
      geographic_level = 'STATE',
      year = '2017',
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - year", {
  
  testthat::expect_error(
    
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
      year = 2017,
      state = NULL,
      geometry = F,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - geometry", {
  
  testthat::expect_error(
    
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
      geometry = 69,
      lower48 = T),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - lower48", {
  
  testthat::expect_error(
    
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
      geometry = F,
      lower48 = 69),
    
    regexp = "Assertion on"
    
  )
  
})

test_that("assert - weighted_by_area", {
  
  testthat::expect_error(
    
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
      geometry = F,
      lower48 = T,
      weighted_by_area = 69),
    
    regexp = "Assertion on"
    
  )
  
})

