#import "common.typ": *

== #Co60 Peak shift discussion

This section need to be expanded using other literature we have about the peak reconstruction.
- Discuss surface events vs bulk.
- Describe the plots specific for M2 if needed
- Discuss other fits that were done to test if possible (Ex. remove 511 keV)

- Discuss the double peaks and their possible contribution to fit, and the Co shift (double peaks due to instability related to working points.). Possibly look at dataset level differences to the fit, due to the working point differences.

*Extra plots showing the peak shift in Co*

#figure(
  grid(
    rows: 3,
    column-gutter: 1em,
    align: auto,
  image("../images/co_shift_check_full.png", width: 80%),
  image("../images/co_shift_check_g10v150.png", width: 80%),
  image("../images/co_shift_check_g10v150_inv.png", width: 80%),
  ),

  caption: "Co60 peak modeling"
)
