library(tidyverse)
library(ggallin)

theme_set(theme_minimal())

income <- seq(0, 3500000, 1000)

lower_limit_income_tax <-
  c(
    0,
    0.01,
    5952.85,
    50524.93,
    88793.05,
    103218.01,
    123580.21,
    249243.49,
    392841.97,
    750000.01,
    1000000.01,
    3000000.01
  )

fixed_fee <-
  c(
    0,
    0,
    114.29,
    2966.91,
    7130.48,
    9438.47,
    13087.37,
    39929.05,
    73703.41,
    180850.82,
    260850.81,
    940850.81
  )

tax_rate <-
  c(0,
    1.92,
    6.40,
    10.88,
    16,
    17.92,
    21.36,
    23.52,
    30,
    32,
    34,
    35) / 100

lower_limit_employment_subsidy <-
  c(
    0,
    0.01,
    1768.97,
    1978.71,
    2653.39,
    3472.85,
    3537.88,
    4446.16,
    4717.19,
    5335.43,
    6224.68,
    7113.91,
    7382.34
  ) * 12

employment_subsidy_amount <-
  c(
    0,
    407.02,
    406.83,
    359.84,
    343.60,
    310.29,
    298.44,
    354.23,
    324.87,
    294.63,
    253.54,
    217.61,
    0
  ) * 12

ISR <- data.frame(lower_limit_income_tax,
                  fixed_fee,
                  tax_rate)

employment_subsidy <- data.frame(lower_limit_employment_subsidy,
                                 employment_subsidy_amount)

taxed_amount <- function(income) {
  income_level <- max(which(ISR$lower_limit_income_tax <= income))
  
  marginal_tax_rate <- ISR$tax_rate[income_level]
  
  takings <- c()
  
  temp_income <- income
  
  for (i in income_level:1) {
    diff <- temp_income - ISR$lower_limit_income_tax[i]
    taxed <- diff * ISR$tax_rate[i]
    temp_income <- ISR$lower_limit_income_tax[i] - 0.01
    takings <- append(takings, taxed)
  }
  
  tax_total <- sum(takings)
  
  fixed_tax <- ISR$fixed_fee[income_level]
  
  return(c(tax_total, marginal_tax_rate, fixed_tax))
}

subsidy_amount <- function(income) {
  income_level <-
    max(which(
      employment_subsidy$lower_limit_employment_subsidy <= income
    ))
  
  subsidy <-
    employment_subsidy$employment_subsidy_amount[income_level]
  
  return(subsidy)
}

subsidy <- c()

fixed_tax <- c()
tax <- c()
marginal_tax_rate <- c()
mean_tax_rate <- c()

for (i in 1:length(income)) {
  temp <- taxed_amount(income[i])
  tax <- append(tax, temp[1])
  marginal_tax_rate <- append(marginal_tax_rate, temp[2])
  fixed_tax <- append(fixed_tax, temp[3])
  subsidy <- append(subsidy, subsidy_amount(income[i]))
}

withoutSubsidy <- data.frame(
  'Ingreso' = income,
  'Impuestos' = tax,
  'Tasa Marginal' = marginal_tax_rate,
  'Tasa Promedio' = tax / income
)

withSubsidy <- data.frame(
  'Ingreso' = income,
  'Impuestos' = tax - subsidy,
  'Tasa Marginal' = marginal_tax_rate,
  'Tasa Promedio' = tax / (income + subsidy)
)

withSubsidy[withSubsidy <= 0] <- 0

withSubsidy <- withSubsidy[-1,]
withoutSubsidy <- withoutSubsidy[-1,]

plot(withSubsidy$Ingreso, withSubsidy$Impuestos, type = 'l')
lines(withoutSubsidy$Ingreso, withoutSubsidy$Impuestos)

colours <-
  c('Con subsidio' = 'red',
    'Sin subsidio' = 'black')

p.1 <- ggplot() +
  geom_line(aes(
    x = withSubsidy$Ingreso,
    y = withSubsidy$Impuestos,
    colour = 'Con subsidio'
  ),
  size = 0.2) +
  geom_line(
    aes(
      x = withoutSubsidy$Ingreso,
      y = withoutSubsidy$Impuestos,
      colour = 'Sin subsidio'
    ),
    size = 0.2
  ) +
  labs(x = 'Ingreso',
       y = 'ISR') +
  scale_colour_manual(name = NULL, values = colours)

p.2 <- p.1 +
  xlim(0, 1e5) +
  ylim(0, 1e4)

colours <-
  c(
    'Tasa marginal con subsidio' = 'green',
    'Tasa marginal sin subsidio' = 'black',
    'Tasa promedio con subsidio' = 'red',
    'Tasa promedio sin subsidio' = 'blue'
  )

p.3 <- ggplot() +
  geom_line(
    aes(
      x = withSubsidy$Ingreso,
      y = withSubsidy$Tasa.Marginal,
      colour = 'Tasa marginal con subsidio'
    ),
    size = 0.2
  ) +
  geom_line(
    aes(
      x = withoutSubsidy$Ingreso,
      y = withoutSubsidy$Tasa.Marginal,
      colour = 'Tasa marginal sin subsidio'
    ),
    size = 0.2
  ) +
  geom_line(
    aes(
      x = withoutSubsidy$Ingreso,
      y = withoutSubsidy$Tasa.Promedio,
      colour = 'Tasa promedio sin subsidio'
    ),
    size = 0.2
  ) +
  geom_line(
    aes(
      x = withSubsidy$Ingreso,
      y = withSubsidy$Tasa.Promedio,
      colour = 'Tasa promedio con subsidio'
    ),
    size = 0.2
  ) +
  labs(x = 'Ingreso',
       y = 'Tasa') +
  scale_colour_manual(name = NULL, values = colours) +
  scale_y_continuous(
    labels = function(x)
      paste0(x * 100, '%')
  )

p.4 <- p.3 +
  scale_x_log10() +
  scale_y_continuous(
    labels = function(x)
      paste0(x * 100, '%')
  ) +
  labs(
    caption = 'Ingreso en escala logarítmica'
  )

p.1
p.2
p.3
p.4
