#import "../common.typ": *

== Higher Level Analysis

=== Blinding

To eliminate unconscious analyst bias during the model tuning and analysis procedure, the CUORE data is blinded by a data-salting technique where an artificial signal peak is computationally added within the $0 nu beta beta$ Region of Interest. This is achieved by randomly selecting a specified, undisclosed fraction—typically between 10% and 12.5%—of the high-statistics events near the 2615 keV #tl208 calibration peak ($Q_("Tl"208) plus.minus 20$ keV) and computationally shifting their reconstructed energies down 87 keV into the $Q_(beta beta)$ window. To obscure the origin of these events and prevent identification via inter-channel coincidence checks, a random time shift ($Delta t$) is also applied to the timestamps of these salted events. The exact salted fraction and the applied temporal shift remain unknown to the analysts until all data selection criteria, fit models, and fitting protocols are finalized and frozen.#footnote[this doesn't necessarily completely hide event details frmo the analyst as some parameters can still have marginal differences between the shifted and real events. However, it prevents from any accidental and unconcious bias during analysis]

=== Detector Response

Once the data is blinded and Pulse Shape Discrimination cuts are applied, the empirical detector response within the $0 nu beta beta$ ROI must be accurately characterized. The detector response is evaluated by fitting the prominent 2615 keV #tl208 calibration peak and systematically scaling the extracted parameters down to the neutrinoless double-beta decay energy. The empirical lineshape $f(E)$ of the individual bolometers is phenomenologically modeled as a sum of three Gaussian distributions:

$ f(E) prop "Gaus"(E', sigma) + A_1"Gaus"(rho_1 E', sigma) + A_2"Gaus"(rho_2 E', sigma); quad E' = E+delta $

The relative strengths, $A_1$ and $A_2$ of the sub-peaks are restricted to be less than one and $rho_1 < 1$ and $rho_2 > 1$ places them on each side of the main gausian peak. These account for deviations in stabilization and calibration across the dataset, while the width of the guassian, $sigma$, is expected to remain the same. $delta$ represents any deviation of the reconstructed peak compared to the nominal #tl208 peak position at $2614.5$ keV.

Within the designated fitting window of [2530, 2720] keV, the complete spectral model incorporates six distinct components to fully describe the localized spectrum:
+ The primary photopeak as represented by $f(E)$ above with the 6 parameters,
+ The Compton continuum, modeled as a complementary error function with $mu = E'$, $sigma$ defined from the detector response function,
+ X-ray escape peak where a Te X-ray near 30 keV escape following the 2615 keV $gamma$ deposit, modeled identical to the detector response function with the energy shifted down.
+ X-ray coincidence peak where a Te X-ray escape from another crystal is absorbed in coincidence with the 2615 keV $gamma$, fitted with 3-gaus response function with energy shifted above.
+ A flat continuous background.

The fit function for the first two datasets with the internal DCS also included an additional Gaussian near 2687 keV ($= 2615 - 511 + 583$ keV) corrosponding to simultaneous escape of a 511 keV $gamma$ with an absorption of a 583 keV $gamma$ from the #tl208 decay. However the 583 keV $gamma$ peak strength is much lower with the EDCS, and consequently, we remove this peak in fits to the later datasets.

The primary photopeak parameters are evaluated at the individual channel-dataset level to capture the response of each bolometer. However, to maintain fitting stability despite the inherently low statistics of individual channels in the physics data, the sub-dominant components—such as the relative amplitudes of the escape peaks and the continuum shape—are globally constrained at the broader tower-dataset level. In addition, to increase the overall precision of the response function, we discard $0.5%$ of the worse performing channels from each dataset by their FWHM (as $0.5%$ sensitivity loss is less than the precision with which we can establish our final limit). Another ~$0.15%$ of channel-dataset pairs are discarded as they have $delta > |1 sigma|$, indicating unsatisfactory calibration. The harmonic mean FWHM of the channel-dataset pairs after these cuts is 7.78 keV#footnote[Harmonic mean is quoted because the $Delta E$ appears in the denominator of the sensitivity equation.]

With the lineshape precisely defined, the energy resolution ($sigma$) and the energy reconstruction bias ($mu$) are mathematically scaled to $Q_(beta beta)$. The energy resolution scaling is modeled in quadrature as $sigma(E) = sqrt(sigma_E^2 + sigma_0^2)$, where $sigma_0$ represents the energy-independent baseline noise resolution, which is directly evaluated from noise-triggered events. The energy-dependent variance component is parameterized by a scaling function, $R_sigma(E)$, which transitions from a sigmoid behavior at lower energies to a quadratic form at higher energies. Simultaneously, the energy reconstruction bias, defined as $Delta(E) = mu_P(E) - E$, is empirically fitted using a second-order polynomial to account for residual non-linearities. Combining these scaling models, the final expected reconstructed position of the $0 nu beta beta$ peak is precisely computed as $Q_"fit" = (mu_c)/2615 dot Q_(beta beta) + Delta(Q_(beta beta))$, guaranteeing an accurate and physically motivated signal definition for the final statistical fit.

=== Exposure and Efficiencies

The total experimental exposure of the dataset is fundamentally defined as the product of the active detector mass and the precisely evaluated live time ($M dot T$). However, the raw live time must be rigorously corrected to exclude "Bad Intervals," which encompass the unstable initial and final seconds of a data run, as well as any periods affected by acute environmental or operational disturbances. Removing these unstable periods reduces the gross exposure by approximately 9%. An additional exposure correction is required to account for pulser-induced crosstalk across the array. The probability of a false signal trigger occurring within a $plus.minus 1$ s window surrounding a reference pulser event ($P_"x,cal"$) is evaluated by comparing the local trigger rates against a preceding 1 s control window. Bolometer channels exhibiting a high crosstalk probability ($f_p > 10%$) are explicitly vetoed during pulser firings, which introduces an additional, roughly 1% penalty to the operational live time. Cumulatively, after applying these temporal exclusions, the final unblinded analysis exposure for this data release yields exactly $567 " kg" dot "yr"$ for the #teo2 array.

Within this strictly defined live time, the fraction of physical events successfully retained by our analysis framework is quantified through a series of efficiency metrics. The event-based "Base Cuts" efficiency is measured directly utilizing the injected reference heater pulses. This base efficiency is explicitly the product of the fundamental detection efficiency, the pile-up rejection efficiency, and the final energy reconstruction efficiency. The pile-up rejection efficiency ($epsilon_"PU"$) is derived statistically by comparing the number of clean, non-piled-up triggered pulses to the total expected pulses. This ratio is properly adjusted to account for the pulser firing period ($T_P$) and the integration window ($w$), expressed mathematically as $epsilon_"PU" = (N_p^"trig,no-pileup" / N_p^"trig") times (T_P - w) / T_P$. Subsequently, the energy reconstruction efficiency ($epsilon_"FinRecon"$) measures the fraction of these accepted pulses that are successfully reconstructed and accurately stabilized within $3sigma$ of their expected nominal pulser energy.

Beyond the base algorithmic cuts, the efficiency of the physical anti-coincidence (AC) cut must be independently verified. Because accidental coincidences can inadvertently remove a small fraction of true single-site (M1) events, this efficiency ($epsilon_"AC"$) evaluates the probability of correctly reconstructing a true M1 event as M1. Since this random accidental rate should be independent of the primary event's energy, it can be measured using a prominent, well-known background peak that lacks any associated gamma cascade, guaranteeing that the true physical events are strictly M1. The 1460 keV decay of naturally occurring $""^40 "K"$ serves as the ideal proxy. Accidental coincidences around this peak are evaluated using a sideband Bayesian counting analysis governed by a Poisson likelihood model:

$ cal(L)_"eff"(vec(theta), vec(D)) = product_(i) (e^(-lambda_i) lambda_i^(n_i)) / n_i! $

The energy spectrum surrounding the $""^40 "K"$ line is explicitly partitioned into three regions: a left-sideband, a central signal peak, and a right-sideband. By analyzing the observed counts that pass ($n_"pass"$) and fail ($n_"fail"$) the multiplicity cut across these three regions, the model parameters $vec(theta)$, which essentially represent the true signal counts $S_"pass"$ and $S_"fail"$, are constrained. Extracting the posterior probability distribution for these variables yields a highly precise anti-coincidence efficiency of $epsilon_"AC" = 99.3%$.

Finally, the Pulse Shape Analysis (PSA) efficiency ($epsilon_"PSA"$) is evaluated using a completely analogous Bayesian counting technique. After the base quality cuts and anti-coincidence cuts are applied, the dataset-level PSA efficiency is calculated by examining a selection of prominent background $gamma$ peaks with well-reconstructed empirical lineshape functions. By evaluating $n_"pass"$ and $n_"fail"$ with respect to a varying $epsilon_"PSA"$ across the peak and adjacent sidebands, the posterior probability distribution firmly establishes the PSA efficiency at $96.4%$. When combined numerically, the product of the base cuts, anti-coincidence, and PSA efficiencies yields a total overall analysis efficiency of exactly $92.4%$.

=== $0 nu beta beta$ Fit

==== $0 nu beta beta$ Fit Framework

The final $0 nu beta beta$ decay rate is extracted by performing an unbinned Bayesian extended likelihood fit over the defined Region of Interest (ROI) from 2490 keV to 2575 keV. To correctly handle temporal variations in detector performance, the fit is performed simultaneously across all individual datasets. The posterior probability distributions are computationally evaluated using Markov Chain Monte Carlo (MCMC) techniques implemented in the Bayesian Analysis Toolkit (BAT), which employs the Metropolis-Hastings algorithm to efficiently sample the multidimensional parameter space.

The physical model incorporates several key parameters. The primary parameter of interest is the $0 nu beta beta$ decay rate ($Gamma_(0 nu)$) of #te130, which is formulated as a single, common physics parameter across all datasets. The background continuum within the ROI is modeled with two distinct components. First, a dataset-dependent Background Index (BI) is utilized to account for specific run-by-run variations in electrical noise levels, analysis efficiencies, and active channel selection. Second, a linear background slope is applied across the ROI; this slope is constrained as a common parameter across all datasets because the underlying natural radioactive backgrounds generating this continuum are not expected to change their spectral shape over time. Additionally, the fit model explicitly accounts for a known localized background structure: the coincident summation of #co60 gamma rays at 2507.7 keV. This contribution is governed by a single free base rate parameter ($Gamma_"Co"$) that is appropriately scaled for each dataset based on the temporal distance between them, utilizing the known 5.3-year half-life of #co60.

==== Systematic Uncertainties

A comprehensive evaluation of systematic uncertainties is integrated directly into the fit model through the use of nuisance parameters. These encompass the statistical uncertainty on the overall analysis efficiency, as well as correlated uncertainties in the energy bias and resolution scaling functions. The Pulse Shape Discrimination (PSD) efficiency introduces an additional systematic component. While the actual PSD efficiencies are evaluated strictly at the detector level, their systematic uncertainties are evaluated at the broader dataset level. By calculating the efficiency estimate for prominent peaks using an exposure-weighted sum method and comparing it to a direct sum method, the root-mean-square (RMS) of these methodological differences dictates a universal $plus.minus 0.3%$ systematic uncertainty on the PSD efficiency, which is applied consistently across all datasets.

Other incorporated physical systematics include the containment efficiency of the $0 nu beta beta$ decay electrons, which is evaluated via detailed Monte Carlo simulations at $88.35 plus.minus 0.09%$. Furthermore, the fit incorporates the precise physical uncertainty on the $Q_(beta beta)$ value, set to $2527.515 plus.minus 0.013 " keV"$ based on an error-weighted average of recent high-precision Penning trap mass measurements, alongside the natural isotopic abundance of the #te130 isotope, established at $34.167 plus.minus 0.02%$.

==== Priors & Likelihood

Within the Bayesian framework, uniform prior distributions are assigned to all physical rate parameters, enforcing strictly positive boundaries ($> 0$), while the common BI slope is assigned a uniform prior allowing for both positive and negative gradients. All systematic nuisance parameters are constrained by Gaussian priors reflecting their independent empirical evaluations. Furthermore, the Line Shape Systematics (LSS) for energy bias and scaling utilize a dedicated multi-variate covariant prior to accurately model intrinsic parameter correlations. The overall unbinned extended likelihood function evaluated for the combined datasets is structured as:

$ cal(L)_("ext") = (e^(-lambda) lambda^n) / n! product_i [ s/lambda f(Q_(beta beta)) + c/lambda f(Q_c) + b/lambda dot 1 / (Delta E) [ 1 + "BI"_("slope") (E - E_("mid")) ] ] $

Within this likelihood model, the total expected number of signal events ($S_i$) for a given dataset $i$ is analytically related to the decay rate by:

$ S_i = Gamma_(0 nu) dot epsilon_("tot") dot eta_("iso") dot N_A / M_("at") dot ("MT")_i $

where $epsilon_("tot")$ is the total analysis efficiency, $eta_("iso")$ is the isotopic abundance, $N_A$ is Avogadro's number, $M_("at")$ is the molar mass of the compound, and $("MT")_i$ is the dataset exposure. Similarly, the expected number of #co60 sum-peak events ($C_i$) incorporates the necessary exponential decay scaling:

$ C_i = epsilon dot Gamma_( ""^(60)"Co" ) dot e^(-t/tau) dot ("MT")_i $

==== $0 nu beta beta$ Results

Applying this rigorous fit model to the full dataset yields a best-fit $0 nu beta beta$ decay rate of $Gamma_(0 nu) = (0.9 plus.minus 1.4) times 10^(-26) " yr"^(-1)$. Because this result is highly consistent with a background-only hypothesis and shows no statistically significant signal, a Bayesian lower limit is extracted. Marginalizing over all systematic uncertainties, the experiment establishes a 90% Confidence Level (C.L.) lower limit on the half-life of $T_(1/2)^(0 nu) > 2.2 times 10^(25) " yrs"$, corresponding to a decay rate limit of $3.2 times 10^(-26) " yr"^(-1)$.

This experimental performance closely matches the median expected exclusion sensitivity of $2.8 times 10^(25) " yr"$, which was evaluated using an ensemble of $10^4$ background-only toy Monte Carlo simulations. Finally, evaluating the background model strictly without the signal component yields a stable average Background Index in the ROI of $"BI" = 1.49 plus.minus 0.04 times 10^(-2) " ckky"$, alongside a phenomenological background slope of $"BI slope" = (-1.8 plus.minus 1.9) times 10^(-5) " ckky/keV"$.


  // *Energy Thresholds:*
  // - To evaluate trigger efficiencies and define the low-energy analysis thresholds, simulated pulses are injected into continuous noise data.
  // - A defined test energy is back-computed into a raw amplitude using the calibration function. The simulated pulse is then superimposed onto randomly sampled noise waveforms.
  // - The trigger efficiency is measured as the ratio of successfully triggered OT pulses to the total injected pulses. A trigger is considered successful if it occurs within the full width at half maximum of the injected peak's timing location.
  // - The resulting efficiency points are plotted against pulse energy and fitted with an error function (erf). The final detector threshold is defined as the energy at which this function reaches $90\%$ efficiency.

  // *Recovering Saturated Pulses:*
  // - High-energy events—such as cosmic muons, neutron captures, or potential tri-nucleon decays—deposit energies exceeding $~15$ MeV. These events saturate the ADC digitizers ($|V_"out"| > 9.2$ V) and truncate the peak amplitude.
  // - To reconstruct these energies, a "time above threshold" ($t_"above"$) metric is utilized.
  // - By analyzing a high-statistics sample of unsaturated pulses, an empirical relationship is established between the total pulse energy and the duration the waveform remains above a specific reference voltage ($V_"thres"$).
  // - The saturated pulse width ($t_"sat"$) is measured, and the underlying energy is extrapolated as $E_"sat" = (V_"sat" - "Baseline"_"sat") / (V_"thresh" - "Baseline")$ evaluated at $(t_"above" = t_"sat")$.
  //
