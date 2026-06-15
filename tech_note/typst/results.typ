
// Efficiencies

// 0νββ Efficiency for each cut variation:
// --------------------------------------------------
// No cuts                       :    3802365 events  |  efficiency: 0.038024
// Co-60 cuts only               :    3615321 events  |  efficiency: 0.036153
// Signal region cut only        :    3729900 events  |  efficiency: 0.037299
// Both cuts (final)             :    3546522 events  |  efficiency: 0.035465
#let eff_fullcuts_ROI = "3.80" //24
#let eff_PCA_only     = 98.83
#let eff_ndbdcuts     = 3.73 //299
#let eff_ndbdcuts_only= 98.09
#let eff_cocuts       = 3.62 //153
#let eff_cocuts_only= 95.08
#let eff_allcuts      = 3.55 //465
#let eff_allcuts_only = 93.27
// ── Systematic fit values ──────────────────────────────────────────────────
// Source of truth: output/syst_rate_results.md  (2026-05-31)
// Placeholder "?" marks values not yet extracted from fit output files.

// Nominal fit (reference: cs=1.0, gamma10_v150, u1740)
#let nom_raw_mode = "11.70" //y
#let nom_raw_hdi_l = "4.95" //y
#let nom_raw_hdi_r = "20.38" //y
#let nom_bc_mode = "15.26"//y
#let nom_bc_hdi_l = "8.59"//y
#let nom_bc_hdi_r = "23.81"//y

// BM MC statistical
#let bmmc_raw_mode = "10.90"//y
#let bmmc_raw_hdi_l = "3.89"//y
#let bmmc_raw_hdi_r = "18.91"//y
#let bmmc_raw_dmode = "0.80"//y
#let bmmc_raw_dhdi_l = "-1.06"//y
#let bmmc_raw_dhdi_r = "-1.47"//y0
#let bmmc_bc_mode = "14.47"//y
#let bmmc_bc_hdi_l = "7.55"//y
#let bmmc_bc_hdi_r = "22.36"//y
#let bmmc_bc_dmode = "0.79"//y
#let bmmc_bc_dhdi_l = "-1.04"//y
#let bmmc_bc_dhdi_r = text(fill: red)[-1.45]//y0

// Threshold250 (RAW)
#let bmsyst_th_raw_mode = 11.717
#let bmsyst_th_raw_hdi_l = 3.775
#let bmsyst_th_raw_hdi_r = 20.148
#let bmsyst_th_raw_dmode = +0.014
#let bmsyst_th_raw_dhdi_l = -1.172
#let bmsyst_th_raw_dhdi_r = -0.228

// # Threshold250 (BC)
#let bmsyst_th_bc_mode = 15.270
#let bmsyst_th_bc_hdi_l = 7.440
#let bmsyst_th_bc_hdi_r = 23.590
#let bmsyst_th_bc_dmode = +0.014
#let bmsyst_th_bc_dhdi_l = -1.152
#let bmsyst_th_bc_dhdi_r = -0.220



// Binning Extrema — Maximum (RAW)
#let bmsyst_bin_raw_mode = 13.11
#let bmsyst_bin_raw_hdi_l = 4.34
#let bmsyst_bin_raw_hdi_r = 20.29
#let bmsyst_bin_raw_dmode = +1.41
#let bmsyst_bin_raw_dhdi_l = -0.61
#let bmsyst_bin_raw_dhdi_r = -0.90


// Binning Extrema — Maximum (BC)
#let bmsyst_bin_bc_mode = 16.65
#let bmsyst_bin_bc_hdi_l = 7.99
#let bmsyst_bin_bc_hdi_r = 23.72
#let bmsyst_bin_bc_dmode = +1.90
#let bmsyst_bin_bc_dhdi_l = -0.60
#let bmsyst_bin_bc_dhdi_r = -0.89

// LSS ΔQ (±1σ)
// #let lss_dq_raw_mode = "12.13"
// #let lss_dq_raw_hdi_l = "3.08"
// #let lss_dq_raw_hdi_r = "23.37"
// #let lss_dq_raw_dhdi_l = "-1.86"
// #let lss_dq_raw_dhdi_r = "+3.00"
// #let lss_dq_bc_mode = "15.68"
// #let lss_dq_bc_hdi_l = "6.76"
// #let lss_dq_bc_hdi_r = "26.77"
#let lss_dq_bc_dhdi_l = "-3.59"
#let lss_dq_bc_dhdi_r = "+4.74"

// LSS σ-scaling (+1σ)
// #let lss_sscl_raw_mode = "12.41"
// #let lss_sscl_raw_hdi_l = "4.16"
// #let lss_sscl_raw_hdi_r = "21.09"
// #let lss_sscl_raw_dhdi_l = "-0.78"
// #let lss_sscl_raw_dhdi_r = "+0.71"
// #let lss_sscl_bc_mode = "15.96"
// #let lss_sscl_bc_hdi_l = "7.82"
// #let lss_sscl_bc_hdi_r = "24.51"
#let lss_sscl_bc_dhdi_l = "-1.24"
#let lss_sscl_bc_dhdi_r = "+1.17"

// Signal energy shift (Δ = 1.0 keV/MeV)
#let ndbdshift_raw_mode = "10.62"//y
#let ndbdshift_raw_hdi_l = "4.53"//y
#let ndbdshift_raw_hdi_r = "18.86"//y
#let ndbdshift_raw_dmode = "-1.09"//y
#let ndbdshift_raw_dhdi_l = "-0.42"//y
#let ndbdshift_raw_dhdi_r = "-1.51"//0
#let ndbdshift_bc_mode = "14.19"//y
#let ndbdshift_bc_hdi_l = "8.18"//y
#let ndbdshift_bc_hdi_r = "22.32"//y
#let ndbdshift_bc_dmode = "-1.07"//y
#let ndbdshift_bc_dhdi_l = "-0.42"//y
#let ndbdshift_bc_dhdi_r = text(fill: red)[-1.49]//0

// Cobalt shift selection (likelihood-weighted marginalisation) — bc only
#let cobalt_bc_mode = "15.83"//y
#let cobalt_bc_hdi_l = "8.24"//y
#let cobalt_bc_hdi_r = "23.54"//y
#let cobalt_bc_dhdi_l = "-0.35"//y
#let cobalt_bc_dhdi_r = text(fill: red)[-0.26]//y0

// Bias correction (central vs. covariance-sampled BC parameters)
// raw row = nominal raw (BC does not affect pre-correction posterior)
#let biascorr_raw_mode = nom_raw_mode
#let biascorr_raw_hdi_l = nom_raw_hdi_l
#let biascorr_raw_hdi_r = nom_raw_hdi_r
#let biascorr_bc_mode = "15.98"//y
#let biascorr_bc_dmode = "+0.73"//y
#let biascorr_bc_hdi_l = "8.43"//y
#let biascorr_bc_hdi_r = "24.01"//y
#let biascorr_bc_dhdi_l = "-0.16"//y
#let biascorr_bc_dhdi_r = "+0.20"//y

// Marginalised posterior and split-Gaussian smearing widths
#let marg_mode = "16.60"
#let marg_hdi_l = "8.04"
#let marg_hdi_r = "25.70"
#let marg_p90 = "29.81"
#let marg_sigma_p = "4.89"
#let marg_sigma_m = "4.18"

#let fmt_signed(x, side) = {
  let s = str(x)

  if side == "" {
    if x > 0 { "+" + s } else { s }
  } else if side == "l" and x > 0 {
    text(fill: red)[+ #s]
  } else if side == "r" and x < 0 {
    text(fill: red)[#s]
  } else {
    // Fallback if conditions above aren't met (e.g., side == "l" but x <= 0)
    if x > 0 { "+" + s } else { s }
  }
}
