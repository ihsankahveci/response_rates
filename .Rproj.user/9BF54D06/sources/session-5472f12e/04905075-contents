
library(paletteer)
library(tidyverse)


# Load data
response_rates = read_csv('data/response_rates.csv')

# Plot data
plot1 = response_rates |> 
  mutate(Survey = str_to_upper(survey)) |> 
  filter(year > 1995) |> 
  ggplot(aes(x = year, y = value, color = Survey)) +
  geom_line() + 
  geom_point() +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(title = 'Response Rates Over Time',
       x = 'Year',
       y = 'Response Rate') +
  theme_bw(base_family = 'Arial') +
  theme(title = element_text(size = 10),
        plot.title = element_text(size = 10),
        axis.title = element_text(size = 10),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 8),
        axis.text = element_text(size = 8))

ggsave(
  plot1 + paletteer::scale_color_paletteer_d("colorBlindness::paletteMartin"),
  filename = 'plots/response_rates1.png',
  width = 6,
  dpi = 300,
  height = 4
)


# Plot data
plot2 = response_rates |> 
  mutate(Survey = str_to_upper(survey)) |> 
  filter(year > 1995, year < 2020) |> 
  ggplot(aes(x = year, y = value, color = Survey)) +
  geom_line() + 
  geom_point() +
  scale_y_continuous(labels = scales::percent_format(scale = 1)) +
  labs(title = 'Response Rates Over Time',
       x = 'Year',
       y = 'Response Rate') +
  theme_bw(base_family = 'Arial') +
  theme(title = element_text(size = 10),
        plot.title = element_text(size = 10),
        axis.title = element_text(size = 10),
        legend.title = element_text(size = 10),
        legend.text = element_text(size = 8),
        axis.text = element_text(size = 8))


ggsave(
  plot2 + paletteer::scale_color_paletteer_d("colorBlindness::paletteMartin"),
  filename = 'plots/response_rates2a.png',
  width = 6,
  dpi = 300,
  height = 4
  )

ggsave(
  plot2 + paletteer::scale_color_paletteer_d("nationalparkcolors::GeneralGrant"),
  filename = 'plots/response_rates2b.png',
  width = 6,
  dpi = 300,
  height = 4
)

ggsave(
  plot2 + paletteer::scale_color_paletteer_d("ggsci::default_nejm"),
  filename = 'plots/response_rates2c.png',
  width = 6,
  dpi = 300,
  height = 4
)

