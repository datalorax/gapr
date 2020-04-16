## code to prepare `DATASET` dataset goes here
download_file <- function(year) {
  link <- glue::glue("https://www.oregon.gov/ode/educator-resources/assessment/TestResults20{year}/pagr_schools_ela_raceethnicity_{year-1}{year}.xlsx")
  rio::import(link, setclass = "tibble", na = c("-", "--", "*"))
}

set.seed(123)
oregon_schools <- map_df(15, download_file) %>%
  janitor::clean_names() %>%
  drop_na(number_level_1) %>%
  filter(student_group == "White" |
         student_group == "Hispanic/Latino") %>%
  group_by(student_group) %>%
  select(academic_year, district, school, student_group, grade_level,
         number_level_1, number_level_2, number_level_3, number_level_4) %>%
  pivot_longer(starts_with("number"),
               names_to = "level",
               values_to = "n") %>%
  mutate(level = parse_number(level)) %>%
  arrange(academic_year, district, school, student_group, grade_level, level) %>%
  pivot_wider(names_from = student_group,
              values_from = n) %>%
  janitor::clean_names() %>%
  drop_na(hispanic_latino, white)

samp <- sample(unique(oregon_schools$school),
               length(unique(oregon_schools$school))*.25)
oregon_schools <- oregon_schools[oregon_schools$school %in% samp, ]

usethis::use_data(oregon_schools, overwrite = TRUE)
