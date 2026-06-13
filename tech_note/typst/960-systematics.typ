#import "common.typ": *
#import "results.typ": *
#import "@preview/akatable:0.1.0": academic-table

#let sr90 = [#super[90]Sr]
#let btable(..args) = block(stroke: (bottom: 1.5pt))[
  #set table(
    stroke: (x, y) => (
      left: none,
      right: none,
      top: if y == 0 { 1.5pt } else if y == 1 { 0.75pt } else { none },
      bottom: none,
    ),
    inset: (x: 8pt, y: 5pt),
    align: left,
  )
  #table(..args)
]

// ── syst_table helper ─────────────────────────────────────────────────────
// Two-row (non-corrected / bias-corr) table.
// Columns: Fit | Mode | Δ Mode | 68% HDI | Δ HDI
// d_mode:  shift in mode vs. nominal (shown on non-corrected row)
// d_hdi_l/r: shift in 68% HDI edges vs. nominal (shown on bias-corr row)
#let syst_table(
  raw_mode: "?",
  raw_hdi_l: "?",
  raw_hdi_r: "?",
  d_mode: "?",
  raw_d_hdi: [—],
  d_bc_mode: "?",
  bc_mode: "?",
  bc_hdi_l: "?",
  bc_hdi_r: "?",
  d_hdi_l: "?",
  d_hdi_r: "?",
) = btable(
  columns: (auto, 1fr, 1fr, 2fr, 1.5fr),
  inset: 6pt,
  align: (left, center, center, center, center),
  table.header([*Fit*], [*Mode*], [*$Delta$ Mode*], [*68% HDI*], [*$Delta$ HDI*]),
  [non-corrected],
  [#raw_mode],
  [#d_mode],
  [#raw_hdi_l, #raw_hdi_r],
  raw_d_hdi,
  [bias-corr],
  [#bc_mode],
  [#d_bc_mode],
  [#bc_hdi_l, #bc_hdi_r],
  [#d_hdi_l, #d_hdi_r],
)
// ─────────────────────────────────────────────────────────────────────────

= Systematic Uncertainties <systematics>

This section evaluates the impact of systematic uncertainties on the extracted #ndbd event count. The evaluation metric, HDI-edge shift method, and marginalization procedure are described in @methods. The following sources are considered:

1. BM fit statistical errors.
2. Lineshape modeling (LSS).
3. Signal energy shift.
4. Bias correction parameters.
5. Cobalt shift selection.
6. PSA efficiency.

The reference model uses the fit from @results with cobalt shift $Delta = 1.0$ keV/MeV, `gamma10_v150` cobalt cut, and `u1740` signal cutoff.

== BM fit errors <sec:bm_fit_errors>

#figure(
  placement: auto,
  image("../images/06-bmmc_trace_combined_posterior_biascorr_cs1p0.png", width: 100%),
  caption: [Bias-corrected combined posterior vs. nominal.\ Dashed lines: mode; dotted: 68% HDI],
)<fig-bmmc>

We assess the impact of BM statistical fluctuations by repeating the M2 fit with 500 background spectra, each drawn from a random sample of the BM posterior (JAGS output). The per-sample posteriors are combined via likelihood-weighted mixture method (@methods), yielding the combined posterior in @fig-bmmc. The combined posterior shifts left by approximately 1 event relative to the reference.


#align(center)[
  #syst_table(
    raw_mode: bmmc_raw_mode,
    raw_hdi_l: bmmc_raw_hdi_l,
    raw_hdi_r: bmmc_raw_hdi_r,
    d_mode: bmmc_raw_dmode,
    raw_d_hdi: [#bmmc_raw_dhdi_l, #bmmc_raw_dhdi_r],
    d_bc_mode: bmmc_bc_dmode,
    bc_mode: bmmc_bc_mode,
    bc_hdi_l: bmmc_bc_hdi_l,
    bc_hdi_r: bmmc_bc_hdi_r,
    d_hdi_l: bmmc_bc_dhdi_l,
    d_hdi_r: bmmc_bc_dhdi_r,
  )
]

== BM Systematic variations <sec:bm_syst>

#figure(
  placement: auto,
  grid(
    columns: 2,
    column-gutter: 0.5em,
    image("../images/06-bmsyst_thresh_post_bc.png", width: 100%),
    image("../images/06-bmssyt_binning_post_bc.png", width: 100%),
  ),
  caption: [
    BM systematic posteriors vs. nominal (bias-corrected).\
    Left: threshold set to 250 keV. Right: Comparing binning variation.\
  ],
) <fig-bmsyst>

The background model introduces systematic uncertainties through the choice of analysis threshold and energy binning. Efficiency-related selection cuts and the incorporation of #sr90 are excluded from this study: data-selection efficiencies are ignored here, and the #sr90 spectral component does not influence the ROI, nor does its inclusion meaningfully alter the BM spectral shape within it.#footnote[Actually check and validate this claim]

For each variation the BM input spectra are regenerated using the BM fit-mode parameters of the corresponding systematic model. The M2 fit is then repeated with the same procedure as the nominal analysis and bias-corrected using the nominal correction parameters.

*Threshold.* The nominal analysis threshold is 200 keV. Using 250 keV instead extends the fit range toward higher energies, modifying the spectral shape entering the M2 fit. The resulting posterior shift relative to the nominal is shown in @fig-bmsyst (left) and the table below.

*Binning.* Multiple energy-binning choices were surveyed; the variation that produces the maximum HDI expansion — in each direction — is adopted as the conservative systematic estimate. The M2 fit uses the same binning as its BM input spectrum in each test. The extremal posterior is shown in @fig-bmsyst (right).

#align(center)[
  #btable(
    columns: (auto, auto, 1fr, 1fr, 2fr, 1.5fr),
    inset: 6pt,
    align: (left, left, center, center, center, center),
    table.header(
      [*Systematic*], [*Fit*], [*Mode*], [*$Delta$ Mode*], [*68% HDI*], [*$Delta$ HDI*],
    ),
    table.cell(rowspan: 2)[Threshold 250 keV],
      [non-corrected],
      [#bmsyst_th_raw_mode],
      [#fmt_signed(bmsyst_th_raw_dmode, "")],
      [#bmsyst_th_raw_hdi_l, #bmsyst_th_raw_hdi_r],
      [#fmt_signed(bmsyst_th_raw_dhdi_l, "l"), #fmt_signed(bmsyst_th_raw_dhdi_r, "r")],
    [bias-corr],
      [#bmsyst_th_bc_mode],
      [#fmt_signed(bmsyst_th_bc_dmode, "")],
      [#bmsyst_th_bc_hdi_l, #bmsyst_th_bc_hdi_r],
      [#fmt_signed(bmsyst_th_bc_dhdi_l, "l"), #fmt_signed(bmsyst_th_bc_dhdi_r, "r")],

    table.cell(rowspan: 2)[Binning (max)],
      [non-corrected],
      [#bmsyst_bin_raw_mode],
      [#fmt_signed(bmsyst_bin_raw_dmode, "")],
      [#bmsyst_bin_raw_hdi_l, #bmsyst_bin_raw_hdi_r],
      [#fmt_signed(bmsyst_bin_raw_dhdi_l, "l"), #fmt_signed(bmsyst_bin_raw_dhdi_r, "r")],
    [bias-corr],
      [#bmsyst_bin_bc_mode],
      [#fmt_signed(bmsyst_bin_bc_dmode, "")],
      [#bmsyst_bin_bc_hdi_l, #bmsyst_bin_bc_hdi_r],
      [#fmt_signed(bmsyst_bin_bc_dhdi_l, "l"), #fmt_signed(bmsyst_bin_bc_dhdi_r, "r")],
  )
]

== Lineshape Systematics <sec:lineshape_systematics>

The data and BM MC spectra are processed with lineshape scaling (LSS) corrections, which adjust the energy scale ($Delta Q$) and resolution ($sigma(E)$) per dataset. Miscalibration near the ROI can bias signal extraction and we evaluate this systematic by generating spectra with the LSS parameters perturbed by their $plus.minus 1 sigma$ uncertainties and refitting.

=== Lineshape functions and parameters <sec:lineshape_functions>
The lineshape model uses an asymmetric Gaussian core:

$ E_a = 1/(1 + A_L + A_R) ( G(E; mu, sigma) + A_L G(E; mu, a_L, sigma) + A_R G(E; mu, a_R, sigma)) $

with per-dataset energy scale and resolution corrections:

$ Delta Q = mu' - mu = p_0 + p_1 E + p_2 E^2, quad sigma(E) = q_0 + q_1 E $

The asymmetry parameters ($A_L$, $A_R$, $a_L$, $a_R$) are fixed from the peakshape fit to the $""^(208)"Tl"$ 2615 keV peak; the scaling parameters ($arrow(p)$, $arrow(q)$) are derived from fits to other calibration peaks#footnote[TODO: add reference to the 1-tonne analysis for LSS parameter derivation]. Applying full-MC variations on $arrow(p)$, $arrow(q)$ require recreating spectra for each sampled LSS point per input source #footnote[recreating spectral histograms is the most time consuming part of the fit, and done only once per fit in current setup]. Instead, the systematic is evaluated by applying only the $plus.minus 1 sigma$ ($+1 sigma$) shifts to LSS parameters $arrow(p)$ ($arrow(q)$), and re-calculating the staged event energies by applying a corrective $Delta Q$ ($sigma$ scaling) #footnote[When creating staging files, a 10 keV padding is added to account for these LSS variations] before creating the input spectra.

=== Systematic estimation <sec:lss_estimation>

For $Delta Q$, a $plus.minus 1 sigma$ shifts in covariant $p_0$ and $p_1$ (from the residual fit uncertainties; $p_2 = 0$) are applied to events in one dataset at a time, leaving other datasets unchanged. For $sigma$-scaling, each event is smeared by $delta sigma(E) = delta q_1 E dot sigma("ds", "ch")$ at only $+1 sigma$ (since we cannot sample a narrower gaussian).

Each perturbed fit is compared directly to the nominal; the 68% HDI edge shifts are measured and extremum shifts $Delta_plus.minus$ for 45 independent pertubations (15 datasets $times$ 3 perturbations: $sigma$-scaling, $2 times "dQ" "at" plus.minus 1sigma$) are recorded.
//where the sum runs over datasets and perturbation samples ($plus.minus sigma$ for $Delta Q$; $+1 sigma$ for $sigma$-scaling

// We also evaluated two alternative interval estimators — M1 (Only mode shift) and M3 (mode-anchored half-interval) — and found that while M1 gives the most conservative (largest) error estimates, it oversamples the statistical uncertainties; results for M1 and M3 are reported in the appendix.

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 0.5em,
    image("../images/lss_dq_perds_barplot.png", width: 90%),
    image("../images/lss_sscl_perds_barplot.png", width: 90%),
  ),
  caption: [LSS systematic per dataset (HDI interval shift, $Delta = 1.0 times 10^(-3)$). Each bar shows $Delta n_i$ for the $Delta Q$ (left/right) and $sigma$-scaling perturbations.],
)

=== Final LSS-marginalized posterior <sec:lss_marginalized>

The combined effect of left-right broadening of the HDI interval due to LSS ($n_plus.minus$ per dQ and $sigma$) is calculated by combining the above $Delta_plus.minus$ values in quadrature per side per dataset as described in @methods.


$ n_+ = sqrt(sum_("ds", plus.minus) (Delta^+_i)^2), quad n_- = sqrt(sum_("ds", plus.minus) (Delta^-_i)^2) $

@fig-lss-perds-posteriors shows the ensamble of per dataset posteirors for each parameter $Delta Q$ and $sigma$-scaling, and marks the maximum broadedning we observe compared to the reference fit.

#figure(
  image("../images/lss_syst_posteriors.png", width: 100%),
  caption: [LSS split-Gaussian marginalized posterior vs. bias-corrected reference \
    with marked extremum of all posteriors.],
) <fig-lss-perds-posteriors>
#align(center)[
  #box(width: 70%, [
    #academic-table(
      "",
      header: ([*Parameter*], [*$Delta$ HDI left*], [*$Delta$ HDI right*]),
      (
        [$Delta Q thin (plus.minus 1 sigma)$],
        [#lss_dq_bc_dhdi_l],
        [#lss_dq_bc_dhdi_r],
        [$sigma$-scaling ($+1 sigma$)],
        [#lss_sscl_bc_dhdi_l],
        [#lss_sscl_bc_dhdi_r],
      ),
      columns: (auto, 1fr, 1fr),
      label: <tbl-hyperparams>,
    )
  ])
]

== Bias Correction Systematics <sec:bias_correction_syst>

Low-statistics posteriors carry a reconstruction bias that is corrected before quoting results #footnote[TODO: add cross-reference to bias correction derivation]. The correction parameters carry statistical uncertainties from bias fits; we propagate these by sampling them from their covariance matrix and reapplying the correction.
Bias fits are run seperately for each studied model, and the fit plots for different #Co60 shift models is reproduced in @fig-bias-plots-all
#figure(
  image("../images/05-bias_focus_gamma10_v150_u1740.png", width: 90%),
  caption: [Signal extraction bias and scaling calibration for the reference configuration.],
)<fig-bias-plots-all>

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 1em,
    align(center)[
      #academic-table(
        "",
        header: ([*Fit*], [*Mode*], [*68% HDI*], [*$Delta$ HDI*]),
        (
          [bias-correction],
          [#biascorr_bc_mode],
          [#biascorr_bc_hdi_l, #biascorr_bc_hdi_r],
          [#biascorr_bc_dhdi_l, #biascorr_bc_dhdi_r]
        ),
        columns: (auto, 1fr, 1fr, 1fr),
        label: <tbl-hyperparams>,
      )
    ],
    image("../images/06-bias_corr_comparison.png", width: 70%),
  ),
  caption: [Reference (central bias-correction parameters) vs. \
    systematic (bias-correction parameters sampled from their covariance) bias-corrected posterior.],
) <fig-biascorrsyst>

The varied posterior shifts by #biascorr_bc_dmode events in mode, with 68% HDI edges moving by $#biascorr_bc_dhdi_l$ (lower) and $#biascorr_bc_dhdi_r$ (upper). (@fig-biascorrsyst).


== Cobalt shift selection <sec:systematics_co60>

The cobalt shift $Delta$ is fixed to $1.0$ keV/MeV in the reference model, but its optimal value is uncertain. We treat this choice as a systematic by forming a likelihood-weighted mixture posterior over all seven tested shift values (weights shown in @fig-comarg), following the procedure in @methods, and comparing it to the reference.

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 1em,
    align(center)[
      #btable(
        columns: (auto, auto, auto, auto, auto, auto, auto, auto),
        inset: 6pt,
        align: center,
        table.header(
          [*$Delta$ 0.0*],
          [*0.3*],
          [*0.5*],
          [*0.8*],
          [*1.0*],
          [*1.2*],
          [*1.5*],
          [*(keV/MeV)*],
        ),
        [0.000],
        [0.003],
        [0.024],
        [0.530],
        [0.309],
        [0.044],
        [0.090],
        [*weight*],
      )
    ],
    grid(
      columns: (1fr, 1fr),
      column-gutter: 0.5em,
      image("../images/06-comarg_ref_vs_comarg_bc.png", width: 100%),
      image("../images/06-comarg_per_shift_bc_posteriors.png", width: 100%),
    ),
  ),
  caption: [Cobalt shift systematic. Left: likelihood-weighted combined bc posterior vs.\ nominal ($Delta = 1.0$ keV/MeV). Right: bc posteriors for each tested shift value.],
) <fig-comarg>

We take the 68% HDI displacements $[Delta sigma_+, Delta sigma_-] = [#cobalt_bc_dhdi_l, #cobalt_bc_dhdi_r]$ as the systematic bias from cobalt shift selection.

// No raw posterior available for cobalt shift (likelihood-weighted marginalisation only).
// bc: mode=#cobalt_bc_mode, HDI=[#cobalt_bc_hdi_l, #cobalt_bc_hdi_r], Δ=[#cobalt_bc_dhdi_l, #cobalt_bc_dhdi_r]


== Signal energy shift systematic <sec:signal_shift_syst>

A mismatch between the true $0 nu beta beta$ peak position and the signal template similar to the cobalt shift could bias the extracted event count. To account for the possibility that the signal might also be shifted due to the same mechanism as the #Co60 peaks, we refit with a signal spectrum shifted by $Delta = 1.0$ keV/MeV and record the 68% HDI edge displacement (@fig-ndbd-shift).
#figure(
  image("../images/06-ndbd_shift_raw_vs_bc.png", width: 100%),
  caption: [Bias-corrected posterior with shifted $0 nu beta beta$ signal (blue) vs.\ nominal (red).],
) <fig-ndbd-shift>

#align(center)[
  #syst_table(
    raw_mode: ndbdshift_raw_mode,
    raw_hdi_l: ndbdshift_raw_hdi_l,
    raw_hdi_r: ndbdshift_raw_hdi_r,
    d_mode: ndbdshift_raw_dmode,
    raw_d_hdi: [#ndbdshift_raw_dhdi_l, #ndbdshift_raw_dhdi_r],
    d_bc_mode: ndbdshift_bc_dmode,
    bc_mode: ndbdshift_bc_mode,
    bc_hdi_l: ndbdshift_bc_hdi_l,
    bc_hdi_r: ndbdshift_bc_hdi_r,
    d_hdi_l: ndbdshift_bc_dhdi_l,
    d_hdi_r: ndbdshift_bc_dhdi_r,
  )
] <tbl-ndbd-shift-stats>

// NOTE: we only need this if we are using ndbd uncorrected counts for systematics. using bias-corrected
// errors standardize all the errors prior to PSA.
// == Marginalized Posterior for $n_(0 nu beta beta)$

// Studying the systematic effets from the Bias correction and PSA efficiency is done using the posterior distribution marginalized across the three studies above. We combine the posteriors from these three studies assuming our posteriors are close to a split-gaussian distribution, and shift in mode for each study are combined in quadrature (seperately for left and right shifts) to obtain the left and right widths of the gaussian broadening of the reference posterior.

== PSA Systematics <sec:psa_systematics>

Uncertainties in PSA efficiency curves can affect the fit. Ares simulations account for efficiency by discarding events probabilistically. The exposure-averaged signal efficiency is 98.83%. The error on efficiency is 0.06%, and this is propagated directly to the rate calculation from the marginalized bias corrected posterior that include all the other systematics.

#align(center)[
  #box(width: 70%, [
    #academic-table(
      [Exposure and PCA efficiency by dataset.],
      header: ([*Dataset*], [*Exposure (kg·yr)*], [*$epsilon_"PSA" thin %$*], [*Error % $thin epsilon_"PSA"$*]),
      (
        [ds3601],
        [37.42],
        [98.41],
        [$plus.minus 0.19$],
        [ds3602],
        [48.77],
        [98.80],
        [$plus.minus 0.10$],
        [ds3603],
        [73.11],
        [98.85],
        [$plus.minus 0.06$],
        [ds3604],
        [68.86],
        [98.81],
        [$plus.minus 0.05$],
        [ds3605],
        [19.12],
        [98.87],
        [$plus.minus 0.19$],
        [ds3606],
        [57.21],
        [98.61],
        [$plus.minus 0.06$],
        [ds3607],
        [70.30],
        [98.75],
        [$plus.minus 0.05$],
        [ds3608],
        [77.96],
        [98.64],
        [$plus.minus 0.05$],
        [ds3609],
        [75.50],
        [98.57],
        [$plus.minus 0.05$],
        [ds3610],
        [82.64],
        [98.91],
        [$plus.minus 0.04$],
        [ds3611],
        [83.64],
        [99.01],
        [$plus.minus 0.05$],
        [ds3612],
        [83.95],
        [99.12],
        [$plus.minus 0.04$],
        [ds3613],
        [89.61],
        [98.76],
        [$plus.minus 0.05$],
        [ds3614],
        [74.53],
        [99.11],
        [$plus.minus 0.07$],
        [ds3615],
        [96.09],
        [98.93],
        [$plus.minus 0.05$],
        table.hline(),
        [*Total*], [*1038.4*], [*98.83*], [*$plus.minus 0.06$*],
      ),
      columns: (auto, 1fr, 1fr, 1fr),
      label: <tbl-pca-exposures>,
    )
  ])
]


== Summary of Results <sec:systematics_summary>

@tbl-syst-summary lists all systematic contributions to the $0 nu beta beta$ event count, evaluated as signed 68% HDI edge shifts relative to the reference fit ($Delta = 1.0$ keV/MeV, `gamma10_v150` cut, `u1740` signal cutoff). All values are in bias-corrected event counts; right ($+$) and left ($-$) contributions are combined in quadrature independently.

#academic-table(
  [Summary of systematic uncertainties on the $0 nu beta beta$ event count (bias-corrected). All values in events. The TOTAL row gives the quadrature sum of each side independently.],
  header: ([*Source*], [*$+sigma$ (right)*], [*$-sigma$ (left)*]),
  (
    [LSS — $Delta Q$ ($plus.minus 1 sigma$)],
    [#lss_dq_bc_dhdi_r],
    [#lss_dq_bc_dhdi_l],
    [LSS — $sigma$-scaling ($+1 sigma$)],
    [#lss_sscl_bc_dhdi_l],
    [#lss_sscl_bc_dhdi_r],
    [BM MC statistical],
    [$+0.00$],
    [#bmmc_bc_dhdi_l],
    [BM threshold (250 keV)],
    [$+0.00$],
    [#bmsyst_th_bc_dhdi_l],
    [BM binning (max)],
    [$+0.00$],
    [#bmsyst_bin_raw_dhdi_l],
    [$0 nu beta beta$ spectrum shift ($1.0$ keV/MeV)],
    [$+0.00$],
    [$-0.42$],
    [Cobalt shift selection],
    [$+0.00$],
    [$-0.35$],
    [Bias correction],
    [$+0.20$],
    [$-0.16$],
    table.hline(),
    [*TOTAL (quad-sum)*],
    [*$+4.89$*],
    [*$-4.35$*],
  ),
  columns: (1fr, 1fr, 1fr),
  align: (left, center, center),
  label: <tbl-syst-summary>,
)

The total uncertainty is dominated by lineshape modeling: LSS $Delta Q$ alone contributes $+4.7$ and $-3.6$ events. All other contributions are subdominant; and no single systematic variation qualitatively reshapes the posterior.

The bias-corrected reference posterior has mode $= #nom_bc_mode$ events. After marginalising over all sources via split-Gaussian smearing (widths $sigma^+ = #marg_sigma_p$, $sigma^- = #marg_sigma_m$ events), the marginalised posterior has mode $= #marg_mode$ and 90% upper bound is = $#marg_p90$ events with the highest density interval containing the mode is $[8.0, 25.7]$. Rate conversion and the final result are presented in @conclusion. The PSA efficiency uncertainty is propagated at the rate-conversion stage.
