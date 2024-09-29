library(tidyverse)
options(scipen= 99)

# Load data
files = fs::dir_ls('data/')

# Read data
survey_names = str_extract(files, pattern = '_[a-z]*_') |> 
  str_remove_all('_') |> 
  str_c('_raw')
names(files) = survey_names

surveys = map(files, read_csv, show_col_types = FALSE)


# clean data
## Medical Expenditure Panel Survey (MEPS)
meps = surveys$meps_raw |> 
  select(year = `Survey Year`,
         value = `Conditional Point-in-Time Year 1`)

## SAMSHA - National Survey on Drug Use and Health (NSDUH)
nsduh = surveys$nsduh_raw |> 
  select(year = `Survey Year`,
         value = Screening)

## National Health Interview Survey (NHIS)
nhis = surveys$nhis_raw |> 
  select(year = `Survey year`,
         value = `Household module`)

## National Health and Nutrition Examination Survey (NHANES)
nhanes = surveys$nhanes_raw |> 
  select(year = `Survey year`,
         value = `Conditional Interview`) |> 
  mutate(year = as.numeric(str_extract(year, '(?<=-)\\d{4}')))

## NBER - Current Population Survey (CPS)
cps = surveys$cps_raw |> 
  filter(Period == 'M13') |> 
  select(year = `Year`,
         value = `Value`) 

## National Immunization Survey (NIS)
nis = surveys$nis_raw |> 
  select(year = `Survey Year`,
         value = `Screener Completion Rate`)
  

## American Community Survey (ACS)
acs = surveys$acs_raw |> 
  select(year = `Year`,
         value = `Response Rate`) 

## NORC - General Social Survey (GSS)
gss = surveys$gss_raw |> 
  select(year,
         value = `response rate`) |> 
  filter(!str_detect(year, 'B')) |> 
  mutate(year = as.numeric(year))

# combine data
response_rates = list(meps = meps,
     nsduh = nsduh,
     nhis = nhis,
     nhanes = nhanes,
     cps = cps,
     nis = nis,
     acs = acs,
     gss = gss) |> 
  bind_rows(.id = 'survey')


response_rates |> 
  write_csv('data/response_rates.csv')



