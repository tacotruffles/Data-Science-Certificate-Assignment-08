library('tidyverse')
library('DBI')
library('RSQLite')

# Beer data!
beers = read_csv('https://foco-ds-portal-files.s3.amazonaws.com/beers.csv')[,1:12] #only 12 good columns
breweries = read_csv('https://foco-ds-portal-files.s3.amazonaws.com/breweries.csv')
breweries_geocode = read_csv('https://foco-ds-portal-files.s3.amazonaws.com/breweries_geocode.csv')
styles = read_csv('https://foco-ds-portal-files.s3.amazonaws.com/styles.csv')
categories = read_csv('https://foco-ds-portal-files.s3.amazonaws.com/categories.csv')

con <- DBI::dbConnect(RSQLite::SQLite(), "beers.db")

dbWriteTable(con, 'beers', beers)
dbWriteTable(con, 'breweries', breweries)
dbWriteTable(con, 'breweries_geocode', breweries_geocode)
dbWriteTable(con, 'styles', styles)
dbWriteTable(con, 'categories', categories)

DBI::dbDisconnect(con)
