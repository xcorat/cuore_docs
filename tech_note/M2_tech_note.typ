#import "@preview/texst:0.1.2": paper
#import "@preview/akatable:0.1.0": academic-table
#import "typst/settings.typ": apply-styles, btable
#import "typst/common.typ": ndbd, Te130

#show: doc => paper(
  title: [CUORE Dual-site #ndbd Analysis],
  subtitle: [Internel Note 157],
  authors: ((name: [Sachi Wagaarachchi]),),
  date: [#datetime.today().display("[month repr:long] [day], [year]")],
  abstract: [
    We present a Bayesian MCMC analysis of multiplicity-2 coincident events in CUORE using the 1 ton·yr dataset and the CUORE Background Model, deriving a  posterior for the #ndbd decay rate. We set a systematic-marginalized 90% C.L. lower limit on the #ndbd half-life of > $1.09 × 10^24$ yr on #Te130.
  ],
  style: (
    body_font: "New Computer Modern",
    font_size: 11pt,
    page_margin: (x: 2.5cm, y: 2.5cm),
    heading_numbering: "1.1",
  ),
  doc,
)

#outline(title: [Table of Contents], indent: auto)

#pagebreak()
#outline(title: [List of Figures], target: figure.where(kind: image))

#pagebreak()
#outline(title: [List of Tables], target: figure.where(kind: table))

#show: apply-styles

#pagebreak()

#include "typst/901-prelim-notes.typ"
#pagebreak()
#include "typst/910-introduction.typ"
#pagebreak()
#include "typst/920-data.typ"
#pagebreak()
#include "typst/930-fit_model.typ"
#pagebreak()
#include "typst/940-methods.typ"
#pagebreak()
#include "typst/950-results.typ"
#pagebreak()
#include "typst/960-systematics.typ"
#pagebreak()
#include "typst/970-conclusion.typ"
#pagebreak()
#include "typst/990-appendix.typ"
