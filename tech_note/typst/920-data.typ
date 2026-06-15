#import "common.typ": *
#import "@preview/akatable:0.1.0": academic-table

= Data <data>

This analysis utilizes our observed data and the corresponding Monte Carlo simulations for the expected background and #ndbd signal equivelant to the CUORE 1 ton-yr Background Model (BM) data release. This includes 15 datasets and 84 background source simulations in addition to the simulated signal.

To optimize computationally heavy procedures within the Bayesian framework, intermediate staging files are generated containing only the relevant M2 events within the region of interest, and actual fit inputs are all converted to numpy compatible formats.

== Experimental Data <sec:experimental_data>

The analysis incorporates 15 datasets (ds3601-ds3615), constituting an exposure of $1038.4 "kg" dot "yr"$ of $"TeO"_2$ from the first four years of CUORE operations (out of $1122.9 "kg" dot "yr"$ exposure) #footnote[Summing exposures from PeakShape files gives 1038.7 but I am using the value in our literature - 1038.4 here!]. Data production mostly parallels the standard single-site #ndbd analysis framework. The raw data is pre-processed to extract pulse parameters, followed by filtering, thermal gain stabilization, and energy calibration.

Consistent with the 1 ton-yr BM and low-energy analyses, a 30 ms temporal coincidence window is applied (as opposed to the 5 ms window used in the M1 analysis which focuses on reducing coincident backgrounds). Events are classified as Multiplicity 2 (M2) if they trigger exactly two crystals with a center-to-center distance of less than 150 mm. Please refer to the Internal Note 137D for a detailed review of the Background Model and the data processing steps #footnote[Add the technote/doc that details the data processing steps for 1ton-yr].

Standard data quality criteria are enforced, including basic pulse quality validation, pileup rejection, Principal Component Analysis (PCA) profiling and lineshape quality. Both events in an M2 pair must independently pass all selection criteria; otherwise, the entire multiplet is rejected.

#align(center)[
#box(width: 90%, [
#academic-table(
  [Analysis cuts applied to the M2 dataset.],
  header: ([*Cut*], [*Variable*], [*Description*]),
  (
    [Signal Events],        [`IsSignal`],                                       [Removes noise and pulser triggers],
    [Pileup rejection],     [`NumberOfPulses==1`, `NoHeaterInWindow`],          [Rejects closely spaced pulses],
    [Reject bad intervals], [`RejectBadIntervals`],                             [Excludes periods of known detector instability],
    [Bad for Analysis],     [`BadForAnalysis`],                                 [Removes poorly performing channels],
    [PCA],                  [`PCA`],                                            [Pulse shape discrimination],
    [Included],             [`Included`],                                       [Standard analysis inclusion flag (lineshape)],
    [Multiplet validation], [`FullMultiplet && Validation`],                    [Rejects coincident pairs if either event fails a preceding cut],
  ),
  columns: (auto, 1fr, 1.5fr),
  label: <tbl-analysis-cuts>,
)
])
]

After these cuts, the overall selection efficiency is 3.80% (M2 selection 3.85%, PCA 98.8%). All these cuts (including the PCA efficiency) is applied by ares and the input simulation files already reflect them.

== Simulations <sec:simulations>

*Background*: The expected background spectra are derived from Monte Carlo simulations using the `geant4`-based `qshields` framework, which precisely reconstructs the experiment's geometry and material compositions. Simulated energy deposits are processed using the `Ares` software to match the detector response, including specific channel livetimes. These simulated spectra mirror the standard BM inputs and include contaminant sources primerily from the $"TeO"_2$ crystals, the copper cryostat inner components, the shields, the tower assembly, cosmic muons, and the metastable $""^(110m)$ Ag state, totalling 84 independent physical components.

*Signal*: The nominal #ndbd signal template is generated from $10^8$ simulated decays using `qshields`, with the detector response applied identically to the background components.

#figure(
  image("../images/02-expected_spectra.png", width: 80%),
  caption: [Expected Spectra (TODO: Add Z-axis units/label)]
)

== Data Pipeline <sec:data_pipeline>

Because this analysis utilizes only a small subset of the total CUORE exposure, we reduce the full experimental data into ROOT files containing a minimal set of branches. These *staging files* apply the aforementioned selection criteria for both data and simulations and serve as the foundational inputs, drastically reducing the computing load when loading many files in parallel.

Given that the Bayesian fit evaluates binned background spectra alongside event-level data, the framework generates optimized binned histograms from the staging files depending on the selected model configuration. These are saved in HDF5 format as *input files*, while the event lists are retained. Since the analytical framework (`qpym2`) is implemented in Python, saving these structures natively enables rapid memory loading as `numpy` arrays for iterative model testing and evaluations.
