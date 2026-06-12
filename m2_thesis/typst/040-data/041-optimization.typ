== Detector Optimization

- Achieving stable operating conditions conducive to precise data collection required a comprehensive, multi-month optimization campaign following the initial CUORE cooldown.
- Tuning the detector's working conditions proved as complex as the physical assembly of the experiment. Initial priority was the reduction of external noise and the stabilization of the cryogenic temperatures, followed by defining the optimal bolometer Working Points (WPs), and ultimately concluding with the configuration of the electronic and trigger parameters.
- Only after the environmental noise was mitigated and the detector parameters tuned to maximize the Signal-to-Noise Ratio (SNR) could the final triggering algorithms be reliably set.

=== NOISE REDUCTION
- The extreme thermal sensitivity of the CUORE bolometers inherently renders them highly susceptible to external perturbations, including mechanical vibrations, electrical noise and even micro-seismic events like storms in the Adriatic.
- The immediate priority was the elimination of ground loops and mechanical vibrations. Significant effort was dedicated to electrically isolating the detector systems and associated room-temperature electronics from the external environment.
- Concurrently, all cryogenics-related sources of mechanical vibration—predominantly originating from the Pulse Tube (PT) cryocoolers, electronics rack fans, and the cryostat support structure itself—were systematically mapped. These were mitigated through a combination of physical isolation (e.g., suspending PT gas hoses directly from the ceiling) and structural dampening.
- Specific noise sources were diagnosed by analyzing the Average Noise Power Spectrum (ANPS), which is constructed from randomly triggered noise events.

==== Mechanical Vibrations
- The detector array is suspended from the Tower Support Plate (TSP), which in turn hangs from an external Y-beam. This beam is mechanically decoupled from the primary support structure by a Minus-K negative-stiffness isolation system.
- The Minus-K system functions as a tunable mechanical low-pass filter, significantly attenuating the transmission of seismic and structural vibrations (*in the verticle direction*?).
-
==== Pulse Tube Active Noise Cancellation
- Despite physical decoupling, PT-induced pressure waves remained a dominant source of mechanical noise reaching the inner cryostat.
- To suppress this, an active noise cancellation technique was implemented to destructively interfere the pressure waves. This required adjusting the relative operational phases and frequencies (* frequencies?*) of the five PT motors.
- The standard Cryomech motor drives were replaced with low-noise, high-precision linear drives (Precision Motor Control LNX drives), which provided 25,600 discrete positions for exact phase control.
- An automated routine systematically scanned various relative phase configurations. The resulting vibrational noise—characterized by the PT fundamental frequency of 1.4 Hz and its first 10 harmonics—was measured via its impact on the ANPS and the overall SNR.
- This optimization targeted a specific subset of channels whose ANPS indicated the highest susceptibility to PT-induced vibrations.
- Upon identifying the configuration that maximally minimized the noise, the relative phases were locked and saved as a specific parameter (`phaseID`s) for the duration of that data-taking dataset.

=== Working Point Measurements and Load curves
- The NTD thermistors are biased via low-noise, room-temperature load resistors ($R_"load"$). The resulting voltage signals are amplified by approximately 5000 V/V before being digitized by the DAQ.
- The primary objective of detector optimization is to maximize the SNR, which is achieved by determining the precise, optimal bias current ($I_"bol"$) for each individual NTD.
- Because of electro-thermal feedback, the current-voltage (I-V) relationship of the bolometers can be non-linear.
  - The NTD resistance drops steeply as a function of temperature:
  $ R = R_0 e^((T_0/T)^gamma) $
  - Simultaneously, the Joule power dissipated across the NTD by the bias current is given by:
  $ P = I_"bol"^2 R_"bol" = (V_"bias" - V_"bol") / R_"load" dot V_"bol" = (V_"bias" - V_"bol")^2 / R_"load"^2 dot R_"bol" $
  - At high bias voltages, this dissipated power causes the thermistor's temperature ($T = T_b + P/G$, where $T_b$ is the thermal bath temperature and $G$ is the thermal conductance) to rise measurably above $T_b$.
- This feedback generates an inversion point on the I-V curve. Pushing the bias past this point heats the thermistor sufficiently to plummet its resistance, triggering a thermal run-away regime where $I_"bol" $ increases continuously without any further increase in $V_"bol"$.
- While a higher $V_"bias"$ generally yields a larger signal amplitude ($V_"bol" / V_"bias"$), the WP must remain strictly outside this run-away regime.
- Operating near this non-ohmic inversion point severely compromises detector stability. Because the NTDs are located inside the cryostat while the preamplifiers operate at room temperature, the long cabling introduces parasitic capacitance. This capacitance acts in parallel with the sensor and dominates the load impedance.
- At high $V_"bias"$, the thermistor's dynamic resistance becomes negative, introducing an inductive component. When this inductance is sufficiently high, it forms an LC-oscillator with the parasitic capacitance. The resulting oscillations are not thermally damped and can cause voltage swings on the order of a few volts, rendering the channel unusable and inducing severe crosstalk in neighboring detectors.
- Therefore, the optimal WP is chosen to maximize the SNR (the ratio of a reference pulse amplitude to the baseline noise) while guaranteeing strict electro-thermal stability. Heaters and known background peaks are utilized to provide these stable reference pulses.

==== Load Curve Measurements
- The optimal bias parameters are derived empirically through load curve measurements. At a stable base temperature, the bias voltage is systematically swept while multiple reference heater pulses of varying amplitudes are injected.
- For each channel, a standard set of diagnostic curves is constructed as a function of $I_"bol"$:
  - Pulse Amplitude ($A$) vs. $I_"bol"$
  - Baseline Noise RMS vs. $I_"bol"$
  - SNR vs. $I_"bol"$ (evaluated on both standard and optimally filtered waveforms)
  - $V_"bol"$ vs. $I_"bol"$ (the traditional static load curve)
- The optimal $V_"bias"$ is assigned by locating the maximum of the SNR curve, cross-referencing it with the maximum of the Amplitude curve to ensure the detector operates safely below the inversion threshold.
