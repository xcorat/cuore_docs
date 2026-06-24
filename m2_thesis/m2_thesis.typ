#import "@preview/texst:0.1.2": paper
#import "@preview/akatable:0.1.0": academic-table
#import "typst/settings.typ": apply-styles, btable

#import "typst/common.typ": *

#show: doc => paper(
  title: [0#nbb search using CUORE dual-site events],
  subtitle: [],
  authors: ((name: [Sachi Wagaarachchi]),),
  date: [#datetime.today().display("[month repr:long] [day], [year]")],
  abstract: [
    Extracting 0#nbb decay rate using dual-site events in CUORE one ton-year data release.
  ],
  style: (
    body_font: "New Computer Modern",
    font_size: 12pt,
    page_margin: (x: 2.5cm, y: 2.5cm),
    heading_numbering: "1.1",
  ),
  doc,
)

#outline(title: [Table of Contents], indent: auto,  depth: 3)

#show: apply-styles

#pagebreak()

#include "typst/010-intro.typ"
#pagebreak()
#include "typst/020-theory.typ"
#pagebreak()
#include "typst/030-cuore_experiment.typ"
#pagebreak()
#include "typst/040-measurement_process.typ"
#pagebreak()
#include "typst/050-bm.typ"
#pagebreak()
#include "typst/060-m2-setup.typ"
#pagebreak()
#include "typst/070-m2-results.typ"
#pagebreak()
#include "typst/080-conclusion.typ"
#pagebreak()
#include "typst/090-appendices.typ"

#pagebreak()
#outline(title: [List of Figures], target: figure.where(kind: image))

#pagebreak()
#outline(title: [List of Tables], target: figure.where(kind: table))
