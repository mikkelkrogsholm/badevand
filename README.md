<!-- README.md is generated from README.Rmd. Please edit that file -->
badevand
========

The goal of badevand is to make it easy to retrieve data on danish beaches.

Examples
--------

### How to get the data:

``` r
beach_data <- badevand::beach_get_data()
```

``` r
dplyr::glimpse(beach_data) 
#> List of 3
#>  $ overview     :Classes 'tbl_df', 'tbl' and 'data.frame':   94 obs. of  9 variables:
#>   ..$ id              : int [1:94] 85 86 41 3 4 44 55 160 90 158 ...
#>   ..$ municipality    : chr [1:94] "Aarhus" "Aarhus" "Vejle" "København" ...
#>   ..$ municipality_url: chr [1:94] "" "" "" "<a href=\"http://www.kk.dk/badevand\">Badevand</a>" ...
#>   ..$ name            : chr [1:94] "150 Egå S" "Ajstrup Strand" "Albuen" "Amager Strandpark Nord" ...
#>   ..$ description     : chr [1:94] "" "" "" "Badevandsprofilet er en badestrand på Øst Amager. Amager Strand består af stranden langs Amager Strandvej, en l"| __truncated__ ...
#>   ..$ latitude        : num [1:94] 56.2 56 55.7 55.7 55.6 ...
#>   ..$ longitude       : num [1:94] 10.29 10.27 9.58 12.64 12.65 ...
#>   ..$ comments        : chr [1:94] "" "Der forekommer færgebølger" "" "" ...
#>   ..$ facilities      : chr [1:94] "" "" "" "Varslingssystemet med konstant overvågning af vandkvalitet, livredder." ...
#>  $ links        :Classes 'tbl_df', 'tbl' and 'data.frame':   38 obs. of  2 variables:
#>   ..$ id   : int [1:38] 3 4 160 158 33 52 39 39 35 150 ...
#>   ..$ links: chr [1:38] "http://teambade.kk.dk/indhold/strande-og-badeanstalt-0" "http://teambade.kk.dk/indhold/strande-og-badeanstalt-0" "http://www.kk.dk/badevand" "https://www.svendborg.dk/borger/natur-og-miljoe/strande" ...
#>  $ meassurements:Classes 'tbl_df', 'tbl' and 'data.frame':   376 obs. of  11 variables:
#>   ..$ id               : int [1:376] 85 85 85 85 86 86 86 86 41 41 ...
#>   ..$ date             : Date[1:376], format: "2018-06-16" ...
#>   ..$ water_quality    : num [1:376] 1 2 2 2 2 2 2 2 2 2 ...
#>   ..$ water_temperature: num [1:376] 17 16 15 14 16 14 14 14 16 16 ...
#>   ..$ current_speed    : num [1:376] 0 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 ...
#>   ..$ current_direction: num [1:376] 214 22 18 22 0 12 11 14 232 52 ...
#>   ..$ air_temperature  : num [1:376] 18 19 18 17 17 18 18 17 19 20 ...
#>   ..$ wind_speed       : num [1:376] 7 8 8 9 6 8 8 9 4 10 ...
#>   ..$ wind_direction   : num [1:376] 156 25 43 354 177 23 48 356 147 23 ...
#>   ..$ weather_type     : num [1:376] 9 5 3 2 9 5 3 2 9 5 ...
#>   ..$ precipitation    : num [1:376] 2 3 0 0 2 2 0 0 1 2 ...
```

### How to see the internal data:

``` r
dplyr::glimpse(badevand::weather_type) 
#> Observations: 15
#> Variables: 3
#> $ value       <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
#> $ description <chr> "Sun", "Lightly cloudy", "Partly cloudy", "Overcas...
#> $ icon        <chr> "http://api.vandudsigten.dk/doc/icons/Weather01.pn...
```

``` r
dplyr::glimpse(badevand::water_quality) 
#> Observations: 4
#> Variables: 3
#> $ value       <int> 1, 2, 3, 4
#> $ description <chr> "Bad bathing water quality", "Good bathing water q...
#> $ icon        <chr> "http://api.vandudsigten.dk/doc/icons/FlagRed.png"...
```
