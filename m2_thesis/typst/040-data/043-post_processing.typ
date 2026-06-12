#import "../common.typ": *

=== Multiplicity

- Identifying coincident events across the detector array is crucial for background characterization and enhancing the 0#nbb search.
- Approximately 88% of 0#nbb decays register as single-crystal (Multiplicity 1, or M1) events. Consequently, applying an anti-coincidence cut strongly suppresses background contributions from multi-site gamma interactions and degraded surface alphas.
- The coincidence window must be strictly narrow to minimize accidental random coincidences.
- To properly define this coincidence window ($Delta t^*$), the characteristic time response of each detector must be calibrated. Because individual bolometers operate at slightly different temperatures, their signal rise times vary, introducing a channel-dependent time delay ($t_"delay"$).
- The absolute delay for each channel is evaluated relative to a reference channel. This is achieved by calculating the relative time delays between adjacent crystal pairs using coincident background events (such as the 2615 keV peak) or high-statistics pulser events. Summing these relative delays across the network minimizes the absolute error and normalizes the array's timing response.
- After applying the timing correction ($Delta t^* - Delta t$), multiplets are evaluated and stored with their corresponding multiplicity, channel-dataset identifiers, synchronized timestamps, individual energies, total energy, and time-ordering indices.
- For the standard 1 ton-yr 0#nbb analysis, a dynamic "running window" of 10 ms is utilized to maximize signal efficiency, alongside a spatial distance cut of 150 mm. A universal 40 keV energy threshold is applied.
- Conversely, the Background Model (BM) employs a wider 60 ms coincidence window to ensure accurate spectral grouping of higher-energy coincident events. For specific low-energy analyses (such as Dark Matter or axion searches below 100 keV), channel-dependent thresholds established by the Optimum Trigger are used instead.

=== Pulse Shape Discrimination (PSA)

- Pulse Shape Analysis (PSA) is utilized to identify and remove atypical waveforms, such as pile-up events or unphysical electronic noise.
- Each digitized pulse vector $arrow(v)$ is compared against a channel-specific Average Pulse $arrow(v)_"AP"$. The deviation is quantified by the Reconstruction Error (RE):
  $ "RE" = sqrt(sum_(d=1)^D (v_i - (arrow(v) dot arrow(v)_"AP") / (v_"AP,i") )^2 ) $
- For physical events ranging from 100 keV to 2615 keV, the energy dependence of the RE is modeled by fitting a second-order polynomial to the primary signal band.
- To standardize this metric across the detector, a Normalized Reconstruction Error (NRE) is computed as $"NRE" = ("RE" - f(E)) / "MAD"(E)$, where $"MAD"(E)$ is the median absolute deviation of the fit.
- The final acceptance threshold on the NRE is established by maximizing the Figure of Merit $"FOM" = epsilon / sqrt(epsilon_"bkg")$, where $epsilon$ and $epsilon_"bkg"$ are the signal and background acceptance efficiencies, respectively. To prevent statistical bias, this optimization is performed using only a randomly selected half of the dataset.

=== Blinding

- To eliminate unconscious bias during the analysis procedure, the CUORE data is blinded using a data-salting technique.
- An artificial peak is synthesized in the 0#nbb Region of Interest (ROI) by randomly selecting a specified fraction (typically 10% to 12.5%) of events from the 2615 keV $208$Tl calibration peak and computationally shifting them into the $Q_(beta beta) plus.minus 50$ keV energy range.
- A random time shift ($Delta t$) is also applied to these salted events. The exact salted fraction and time shift remain unknown to the analysts until all data selection and fitting protocols are frozen.

=== Detector Response

- The detector response within the 0#nbb ROI is evaluated by fitting the prominent 2615 keV calibration peak and scaling the extracted parameters to $Q_(beta beta)$.
- The empirical lineshape is modeled as a sum of three Gaussian distributions. Within the fitting window of [2530, 2720] keV, the complete model incorporates six spectral components, accounting for the primary photopeak, Compton continuum, X-ray escape peaks, and a flat continuum background.
- To maintain stability despite low statistics in individual channels, a simultaneous multi-iteration fit is performed. The primary photopeak parameters are evaluated strictly at the channel-dataset level, while sub-dominant components are constrained at the broader tower-dataset level.
- The energy resolution ($sigma$) and energy bias ($mu$) are then scaled to $Q_(beta beta)$. The resolution scaling is modeled as $sigma(E) = sqrt(sigma_E^2 + sigma_0^2)$, where $sigma_0$ is the energy-independent baseline noise resolution measured from strictly noise events. The energy-dependent component is parameterized by a function $R_sigma(E)$ that transitions from a sigmoid to a quadratic form at higher energies.
- The energy bias $Delta(E) = mu_P(E) - E$ is fitted using a second-order polynomial.
- The final expected position of the 0#nbb peak is computed as $Q_"fit" = (mu_c)/2615 dot Q_(beta beta) + Delta(Q_(beta beta))$.

=== Exposure and Efficiencies

- The total experimental exposure ($M dot T$) is the product of the active #teo2 mass and the strictly evaluated live time.
- The live time excludes designated "Bad Intervals," such as the initial and final seconds of a data run or periods of acute operational disturbance. This reduces the gross exposure by approximately 9%.
- An additional exposure correction accounts for pulser-induced crosstalk. The probability of a false signal trigger occurring within a $\pm 1$ s window surrounding a pulser event ($P_"x,cal"$) is evaluated by comparing event rates against a preceding 1 s control window. Channels exhibiting a high crosstalk probability ($f_p > 10%$) are explicitly vetoed during pulser firings, introducing a roughly 1% penalty to the live time.
- Cumulatively, these temporal exclusions yield a final analysis exposure of 567 kg$\cdot$yr for the #teo2 array.
- Event-based cut efficiencies are measured directly using the injected reference heater pulses. The total "Base Cuts" efficiency is the product of the basic detection efficiency, the pile-up rejection efficiency, and the energy reconstruction efficiency.
- The pile-up rejection efficiency is derived statistically by comparing the number of clean, non-piled-up triggered pulses to the total expected pulses, adjusting for the pulser firing period ($T_P$) and the integration window ($w$): $epsilon_"PU" = (N_p^"trig,no-pileup" / N_p^"trig") times (T_P - w) / T_P$.
- The energy reconstruction efficiency ($epsilon_"FinRecon"$) measures the fraction of accepted pulses successfully reconstructed within $3sigma$ of the expected nominal pulser energy.
- Finally, the efficiency of the anti-coincidence cut is independently verified using the 1460 keV decay of naturally occurring $40$K. Accidental coincidences are evaluated by counting multiplicity $M>1$ events surrounding this peak using a sideband Poisson likelihood model:
  $ L_"eff" = product_(i) (e^(-lambda_i) lambda_i^(n_i)) / n_i! $
