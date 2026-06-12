== Data Processing

=== Triggering

- Triggering is the first data processing step required to identify discrete pulses in the continuous data stream.
- Events are classified as signal, noise, or pulser events, with each event saved as an independent 10-second waveform window.
- During physics runs without calibration sources, the background event rate is roughly 1 mHz. During calibration runs, this rate increases to 30–40 mHz (typically ranging from 10–20 mHz for inner towers to 40–50 mHz for outer towers).
- The primary online trigger used in the Apollo framework is the Derivative Trigger (DT). It evaluates the waveform derivative averaged over a defined number of samples and utilizes independent debounce and dead-time settings.
- While the DT is a fast and computationally efficient algorithm for real-time monitoring, low-energy events demand higher sensitivity.
- To achieve this, the continuous data is re-processed offline using the Optimum Trigger (OT).
- The OT algorithm relies on the Optimum Filter (OF), which is constructed using an Average Pulse (AP) and an Average Noise Power Spectrum (ANPS) derived from the initially DT-flagged events. By applying a low-pass filter and signal down-sampling, the OT significantly suppresses noise and achieves a lower trigger threshold.

=== Pulse Amplitude

- The reconstructed pulse amplitude is the primary metric used to calculate the final deposited energy.
- Because the bolometer thermal response varies with baseline temperature, the raw pulse amplitude is modeled as $A(E,T) = a(E) dot G(T)$, separating the energy-dependent amplitude $a(E)$ from the temperature-dependent gain $G(T)$.
- Before evaluating the final amplitude, basic pulse parameters are extracted. These include the pre-trigger baseline (evaluated over the initial 0 to 2.25 seconds of the window), baseline slope, baseline RMS, and the number of triggered pulses within the window.
- Strict data quality cuts are applied to these parameters to select clean, isolated pulses for constructing the OF.
- The OF maximizes the signal-to-noise ratio by optimally weighting the frequency components of the signal. In the frequency domain, the filtered waveform is proportional to $S(omega) / |N(omega)|^2 e^(-i omega t_"max")$, where $S(omega)$ is the ideal signal template and $N(omega)$ is the noise power spectrum.
- The final pulse amplitude is evaluated by measuring the maximum of this filtered waveform using a localized polynomial interpolation (typically a 3-point or 5-point evaluation).

=== Stabilization

- Thermal Gain Stabilization (TGS) corrects the extracted amplitudes for long-term baseline temperature drifts.
- The stabilization parameters are calculated over discrete time steps to account for operational breaks or sharp temperature variations within a single dataset.
- Two independent TGS algorithms are utilized: Heater TGS and Calibration TGS.
- **Heater TGS:** Tracks the amplitude variations of periodic pulser events that inject a constant reference energy. The response is modeled as $A_h (t) = a_h(E) dot (p_1 + p_2 dot T + ...)$, where $T$ acts as a proxy for the baseline temperature.
- **Calibration TGS:** Tracks the position of a prominent reference background peak, typically the 2615 keV line from $208$Tl. This method uses a dataset-dependent offset voltage derived from the working point to account for nonlinearities in the gain-temperature dependence.

=== Energy Calibration

- Energy calibration converts the stabilized pulse amplitudes into physical energy values using known gamma-ray emission lines.
- This procedure relies on dedicated calibration runs where the detector array is exposed to $232$Th and $60$Co sources. The Detector Calibration System (DCS) deploys internal strings for the inner towers, supplemented by external sources for the outermost towers.
- For each channel, a stabilized amplitude histogram is generated. A peak-finding algorithm identifies prominent reference peaks with high signal-to-noise ratios.
- Each identified peak is fitted using an empirical line shape model—typically a combination of a Gaussian and a Crystal Ball function. The underlying background continuum is modeled simultaneously using a first-order polynomial combined with a smoothed step function to account for the Compton edge.
- The calibration function is derived by fitting the true physical energies of these peaks against their reconstructed stabilized amplitudes using a second-order polynomial with a zero intercept.
- If automatic fits fail due to low statistics or poor resolution, the calibration parameters for those specific calorimeters are corrected manually.

=== Energy Estimator

- Because two distinct stabilization methods (Heater and Calibration) are processed in parallel, an automated selection algorithm identifies the superior energy estimator for each channel.
- The selection evaluates a Figure of Merit (FOM) based on the peak resolution and position stability. The algorithm calculates the ratio $W = alpha (C_h^2 / sigma_h^2) / (C_c^2 / sigma_c^2)$, comparing the heater ($h$) and calibration ($c$) variables.
- A Fisher test statistic, $F(W)$, is evaluated. If $W < 1$ and the sample size passes the statistical threshold for $alpha = 0.2$, the Calibration TGS is chosen; otherwise, the Heater TGS is applied by default. (In typical runs, this threshold selects Calibration TGS for roughly 100 channels).

**Energy Thresholds:**
- To evaluate trigger efficiencies and define the low-energy analysis thresholds, simulated pulses are injected into continuous noise data.
- A defined test energy is back-computed into a raw amplitude using the calibration function. The simulated pulse is then superimposed onto randomly sampled noise waveforms.
- The trigger efficiency is measured as the ratio of successfully triggered OT pulses to the total injected pulses. A trigger is considered successful if it occurs within the full width at half maximum of the injected peak's timing location.
- The resulting efficiency points are plotted against pulse energy and fitted with an error function (erf). The final detector threshold is defined as the energy at which this function reaches $90\%$ efficiency.

**Recovering Saturated Pulses:**
- High-energy events—such as cosmic muons, neutron captures, or potential tri-nucleon decays—deposit energies exceeding $~15$ MeV. These events saturate the ADC digitizers ($|V_"out"| > 9.2$ V) and truncate the peak amplitude.
- To reconstruct these energies, a "time above threshold" ($t_"above"$) metric is utilized.
- By analyzing a high-statistics sample of unsaturated pulses, an empirical relationship is established between the total pulse energy and the duration the waveform remains above a specific reference voltage ($V_"thres"$).
- The saturated pulse width ($t_"sat"$) is measured, and the underlying energy is extrapolated as $E_"sat" = (V_"sat" - "Baseline"_"sat") / (V_"thresh" - "Baseline")$ evaluated at $(t_"above" = t_"sat")$.
