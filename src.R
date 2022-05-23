library(tidyverse)

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
    
    tax_total <- sum(takings, ISR$fixed_fee[income_level])
    
    mean_tax_rate <- tax_total / income
    
    return(c(tax_total, mean_tax_rate, marginal_tax_rate))
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

tax <- c()
marginal_tax_rate <- c()
mean_tax_rate <- c()
subsidy <- c()

for (i in 1:length(income)) {
    temp <- taxed_amount(income[i])
    tax <- append(tax, temp[1])
    marginal_tax_rate <- append(marginal_tax_rate, temp[3])
    mean_tax_rate <- append(mean_tax_rate, temp[2])
    subsidy <- append(subsidy, subsidy_amount(income[i]))
}

sims <- data.frame(
    'Y' = income,
    'T' = tax,
    'Tmean' = mean_tax_rate,
    'Tmg' = marginal_tax_rate,
    'S' = subsidy,
    'T - S' = tax - subsidy,
    'Y - T' = income - tax,
    'Y - T + S' = income - tax + subsidy
)

is.nan.data.frame <- function(x)
    do.call(cbind, lapply(x, is.nan))

sims[is.nan(sims)] <- 0
