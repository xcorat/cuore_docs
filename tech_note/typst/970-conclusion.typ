#import "common.typ": *
#import "settings.typ": btable

= Conclusion <conclusion>

Combining the bias-corrected reference fit with the systematic marginalization described in @systematics, the final #ndbd decay rate and half-life from the mode of the posterior are //summarized in @fig-final-results.

#rect(
  stroke: black,
  // inset: 10pt,
  // radius: 4pt,
  fill: gray.lighten(90%),
  width: 100%,
)[
  $ Gamma^(#ndbd) = 3.21 ""_(-1.40)^(+1.80) "stat" ""_(-0.85)^(+1.04) "syst" times 10^(-25) thin thin "yr"^(-1) $
]

And we set a 90% confidence level Bayesian lower bounds for the #ndbd half life in the M2 analysis as:

#rect(
  stroke: black,
  // inset: 10pt,
  // radius: 4pt,
  fill: gray.lighten(90%),
  width: 100%,
)[
  $ T^(#ndbd)_(1/2) > 1.09 times 10^(24) thin "yr" $
]

The median exclusion sensitivity (90% C.I) obtained by running 200 toy fits with background only sampled data is $1.77 times 10^(24) thin "yr"$. This result is consistant with the expected sensitivity and we see a slight positive fluctuation of the signal given the higher bias correction for the specific Cobalt shift. The probability of setting a weeker limit than one obtained is 6.5%.

#figure(
  grid(
    columns: (1.05fr, 1fr),
    // column-gutter: 1.5em,
    align: bottom,
    image("../images/06-rate_cs10_marg.png"), image("../images/07_excl_sens.png"),
  ),
  caption: [Left: Systematic-marginalized #ndbd rate posterior. \ Right: M2 sensitivity fits, #ndbd modes.],
) <tbl-final-results>

#figure(
  grid(
    align: horizon,
    btable(
      columns: 2,
      align: (left, right),
      table.header([*Quantity*], [*Value*]),
      [$Gamma$ (mode)],
      [$3.54 times 10^(-25) thin "yr"^(-1)$],
      [$Gamma plus.minus$ stat],
      [$""^(+1.80)_(-1.40) times 10^(-25) thin "yr"^(-1)$],
      [$Gamma plus.minus$ syst],
      [$""^(+1.28)_(-0.63) times 10^(-25) thin "yr"^(-1)$],
      [$Gamma$ (90% C.L.)],
      [$< 6.36 times 10^(-25) thin "yr"^(-1)$],
      [$T^(0 nu)_(1\/2)$ (mode)],
      [$1.97 times 10^(24) thin "yr"$],
      [$T^(0 nu)_(1\/2) plus.minus$ stat],
      [$""^(+1.67)_(-0.78) times 10^(24) thin "yr"$],
      [$T^(0 nu)_(1\/2) plus.minus$ syst],
      [$""^(+1.06)_(-0.41) times 10^(24) thin "yr"$],
      [$T^(0 nu)_(1\/2)$ (90% C.L.)],
      [$> 1.09 times 10^(24) thin "yr"$],
    ),
  ),
  caption: [Table of results],
) <tbl-final-results>
