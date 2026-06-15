== Detector Optimization

- Achieving stable operating conditions conducive to precise data collection required a comprehensive, multi-month optimization campaign following the initial CUORE cooldown.
- Tuning the detector's working conditions proved as complex as the physical assembly of the experiment. Initial priority was the reduction of external noise and the stabilization of the cryogenic temperatures, followed by defining the optimal bolometer Working Points (WPs), and ultimately concluding with the configuration of the electronic and trigger parameters.
- Only after the environmental noise was mitigated and the detector parameters tuned to maximize the Signal-to-Noise Ratio (SNR) could the final triggering algorithms be reliably set.

=== NOISE REDUCTION
- The extreme thermal sensitivity of the CUORE bolometers inherently renders them highly susceptible to external perturbations, including mechanical vibrations, electrical noise and even micro-seismic events like storms in the Adriatic.
- The immediate priority was the elimination of ground loops and mechanical vibrations. Significant effort was dedicated to electrically isolating the detector systems and associated room-temperature electronics from the external environment.
- Concurrently, all cryogenics-related sources of mechanical vibration—predominantly originating from the Pulse Tube (PT) cryocoolers, electronics rack fans, and the cryostat support structure itself—were systematically mapped. These were mitigated through a combination of physical isolation (e.g., suspending PT gas hoses directly from the ceiling) and structural dampening.
- Specific noise sources were diagnosed by analyzing the Average Noise Power Spectrum (ANPS), which is constructed from randomly triggered noise events.

==== Pulse Tube Active Noise Cancellation
- Despite physical decoupling, PT-induced pressure waves remained a dominant source of mechanical noise reaching the inner cryostat.
- To suppress this, an active noise cancellation technique was implemented to destructively interfere the pressure waves. This required adjusting the relative operational phases and frequencies (* frequencies?*) of the five PT motors.
- The standard Cryomech motor drives were replaced with low-noise, high-precision linear drives (Precision Motor Control LNX drives), which provided 25,600 discrete positions for exact phase control.
- An automated routine systematically scanned various relative phase configurations. The resulting vibrational noise—characterized by the PT fundamental frequency of 1.4 Hz and its first 10 harmonics—was measured via its impact on the ANPS and the overall SNR.
- This optimization targeted a specific subset of channels whose ANPS indicated the highest susceptibility to PT-induced vibrations.
- Upon identifying the configuration that maximally minimized the noise, the relative phases were locked and saved as a specific parameter (`phaseID`s) for the duration of that data-taking dataset.


==== Mechanical Vibrations
- The detector array is suspended from the Tower Support Plate (TSP), which in turn hangs from an external Y-beam. This beam is mechanically decoupled from the primary support structure by a Minus-K negative-stiffness isolation system.
- The Minus-K system functions as a tunable mechanical low-pass filter, significantly attenuating the transmission of seismic and structural vibrations (*in the verticle direction*?).
-Refer to sections in chapter 3 about how machanical vibrations are isolated, just say this was a result of long campaign alongside with the rest of the optimizations.

*Denoising*
- Denoising is a mechnism to reduce seismic and other very low level noise still visible in the detector, which uses software algorythm to remove correlations coming from the detector with noise measured using auxilliary devices.
- Auxiliary devices includes accelerometers, seismometers and microphones which are sensitive to external vibrations and accoustic noise sources in the rang 0.1 Hz to 1 kHz.
- create vector cross-spectral densities with each aux. device for each bolometer, where the bolometer noise spectra are similar to ANPS (? where have we introduced this before?), while the aux device terms include both linear and quadratic terms in time domain, this capture; capacitive pickup from vibration in cabling and unipolar heat response due to vibration in the calorimeters.
- using these noise spectral densities we construct the transfer function from aux. device output to bolometer noise, which is then used to subtract the predicted noise in time-domain from bolometer raw waveforms.
- This denoising algorithm is applied to each crystal independently for every run, which reduces steady state noise as well as transient noise, including the PT noise (1.4 Hz and harmonics), and anthropogenic activity near the detector.

=== PID Controller

- For optimal detector operation with data taking, we need stable detector operations, and reducing thermal fluctuations in the detector is important.
- While the bolometers perform best at the lowest temperature in theory, the different kinds of noise change the calculus in terms of the optimal signal-to-noise ratio point. For ex. at the lowest temperatures, the NTD resistances reached $~6 G Omega$, thus making $R_"bol" / R_L$ significant enough to induce instability.
- Furthermore, the noise (Johnson, impedances) and fluctuation also amplify, making the SNR worse at lowest operating temperatures.
- In addition, having space to account for thermal drifts upwards needs us *not* operating at the lowest possible temperature.
- Thus, we optimize the detector operating temperature taking all these factors, and chose $11 " mK"$ as the [base] for most of the data taking ($15 " mK"$ initially, and a few datasets with multiple operating temperatures.)
- To keep the temperature stable we use an NTD (40D? That had higher/lower resistance than usual) and two standard heaters (pulsers) that can supply constant power and can be controlled like other CUORE electronics. These heaters are connected in parallel, all installed on the $10 " mK"}$ plate.
- A PID loop was used to inject heat as necessary to these heaters using the input from the NTD thermometer. We use NTDs as the other available thermometers are not adequate (SQUID noise thermometer is too slow, and $"RuO"_2$ on the $50 "mK"}$ does not go below $~ 20"mK"$) for this task.

// === Working Point Measurements and Load curves
// - The NTD thermistors are biased via low-noise, room-temperature load resistors ($R_"load"$). The resulting voltage signals are amplified by approximately 5000 V/V before being digitized by the DAQ.
// - The primary objective of detector optimization is to maximize the SNR, which is achieved by determining the precise, optimal bias current ($I_"bol"$) for each individual NTD.
// - Because of electro-thermal feedback, the current-voltage (I-V) relationship of the bolometers can be non-linear.
//   - The NTD resistance drops steeply as a function of temperature:
//   $ R = R_0 e^((T_0/T)^gamma) $
//   - Simultaneously, the Joule power dissipated across the NTD by the bias current is given by:
//   $ P = I_"bol"^2 R_"bol" = (V_"bias" - V_"bol") / R_"load" dot V_"bol" = (V_"bias" - V_"bol")^2 / R_"load"^2 dot R_"bol" $
//   - At high bias voltages, this dissipated power causes the thermistor's temperature ($T = T_b + P/G$, where $T_b$ is the thermal bath temperature and $G$ is the thermal conductance) to rise measurably above $T_b$.
// - This feedback generates an inversion point on the I-V curve. Pushing the bias past this point heats the thermistor sufficiently to plummet its resistance, triggering a thermal run-away regime where $I_"bol" $ increases continuously without any further increase in $V_"bol"$.
// - While a higher $V_"bias"$ generally yields a larger signal amplitude ($V_"bol" / V_"bias"$), the WP must remain strictly outside this run-away regime.
// - Operating near this non-ohmic inversion point severely compromises detector stability. Because the NTDs are located inside the cryostat while the preamplifiers operate at room temperature, the long cabling introduces parasitic capacitance. This capacitance acts in parallel with the sensor and dominates the load impedance.
// - At high $V_"bias"$, the thermistor's dynamic resistance becomes negative, introducing an inductive component. When this inductance is sufficiently high, it forms an LC-oscillator with the parasitic capacitance. The resulting oscillations are not thermally damped and can cause voltage swings on the order of a few volts, rendering the channel unusable and inducing severe crosstalk in neighboring detectors.
// - Therefore, the optimal WP is chosen to maximize the SNR (the ratio of a reference pulse amplitude to the baseline noise) while guaranteeing strict electro-thermal stability. Heaters and known background peaks are utilized to provide these stable reference pulses.

// ==== Load Curve Measurements
// - The optimal bias parameters are derived empirically through load curve measurements. At a stable base temperature, the bias voltage is systematically swept while multiple reference heater pulses of varying amplitudes are injected.
// - For each channel, a standard set of diagnostic curves is constructed as a function of $I_"bol"$:
//   - Pulse Amplitude ($A$) vs. $I_"bol"$
//   - Baseline Noise RMS vs. $I_"bol"$
//   - SNR vs. $I_"bol"$ (evaluated on both standard and optimally filtered waveforms)
//   - $V_"bol"$ vs. $I_"bol"$ (the traditional static load curve)
// - The optimal $V_"bias"$ is assigned by locating the maximum of the SNR curve, cross-referencing it with the maximum of the Amplitude curve to ensure the detector operates safely below the inversion threshold.


=== Load Curves and Working Point Optimization
- The primary objective of detector optimization is to maximize the Signal-to-Noise Ratio (SNR) by determining the precise, optimal bias current ($I_"bol"$) for each individual NTD.
- The NTD thermistors are biased via low-noise, room-temperature load resistors ($R_"load"$). The resulting voltage signals are amplified by approximately 5000 V/V before being digitized by the DAQ.
- Because of electro-thermal feedback, the current-voltage (I-V) relationship of the bolometers is highly non-linear.
  - The NTD resistance drops steeply as a function of temperature: $ R = R_0 e^((T_0/T)^gamma) $
  - Simultaneously, the Joule power dissipated across the NTD by the bias current is given by:
  $ P = I_"bol"^2 R_"bol" = (V_"bias" - V_"bol") / R_"load" dot V_"bol" = (V_"bias" - V_"bol")^2 / R_"load"^2 dot R_"bol" $
  - At high bias voltages, this dissipated power causes the thermistor's temperature ($T = T_b + P/G$, where $T_b$ is the thermal bath temperature and $G$ is the thermal conductance) to rise measurably above $T_b$.
- This feedback generates an inversion point on the I-V curve. Pushing the bias past this point triggers a thermal run-away regime where $I_"bol"$ increases continuously without any further increase in $V_"bol"$.
- Operating near this non-ohmic inversion point severely compromises detector stability. The long cables connecting the cryogenic NTDs to the room-temperature preamplifiers introduce parasitic capacitance.
- At high $V_"bias"$, the thermistor's dynamic resistance becomes negative, introducing an inductive component. This forms an LC-oscillator with the parasitic capacitance, causing undamped voltage swings of several volts that render the channel unusable and induce severe crosstalk in neighboring detectors.
- Therefore, the optimal Working Point (WP) must be carefully chosen to maximize the SNR while guaranteeing strict electro-thermal stability safely below the inversion point.

==== Load Curve Measurements
- The optimal bias parameters are derived empirically through load curve measurements. At a stable base temperature, the bias voltage is systematically swept from zero to a few volts.
- To accurately measure the voltage drop across the bolometer ($V_"bol"$) without being biased by unknown preamplifier offsets, the measurement is taken at both negative and positive polarities for each voltage step. The true bolometer voltage is extracted as $V_"bol" = (V^+_"out" - V^-_"out") / (2G)$.
- During each step, multiple reference heater pulses are injected. The choice of pulser amplitude is critical: optimizing the detector using high-energy pulses (e.g., 7 MeV) was found to mask pulse-shape deformations that severely affect lower energies. Therefore, reference pulses corresponding to ~800 keV or 1 MeV are utilized to ensure uniform stability across the Region of Interest (ROI).
- For each channel, a standard set of diagnostic curves is constructed as a function of $I_"bol"$:
  - Pulse Amplitude ($A$) vs. $I_"bol"$ (evaluated using an Average Pulse to cancel out random noise).
  - Baseline Noise RMS vs. $I_"bol"$ (evaluated using optimally filtered waveforms).
  - SNR vs. $I_"bol"$
  - $V_"bol"$ vs. $I_"bol"$ (the static load curve, used to identify the inversion point).

==== Automated Working Point Selection
- Due to the massive scale of CUORE (988 channels), identifying the optimal WP is performed by a dedicated automated algorithm rather than manual inspection.
- Because raw RMS curves (and consequently SNR curves) can be jagged due to statistical noise fluctuations, the algorithm first smoothes the RMS curve by performing a robust linear fit of the RMS against the bolometer resistance ($R_"bol"$), operating under the assumption that thermal Johnson noise dominates.
- The algorithm automatically filters out outlier points (fake maxima) caused by coincident particle events or amplitude reconstruction failures.
- The optimal $V_"bias"$ is provisionally identified at the maximum of the smoothed SNR curve.
- *Pulse Shape Validation:* To guarantee the channel is not dangerously close to the inversion point, the algorithm explicitly checks the shape of the average pulse at the selected WP. Deformations are identified by counting the number of flexes in the discrete second derivative of the pulse (or by fitting the pulse to a transfer function and evaluating the ratio of real to imaginary poles). If the pulse exhibits ringing or deformation, the algorithm iteratively steps back to lower bias voltages until a stable pulse shape is recovered.
- For the approximately 30 channels with non-functioning heaters where SNR cannot be evaluated, the algorithm defaults to a conservative bias voltage (typically ~3 V) to prevent any risk of oscillation and subsequent crosstalk.

==== Auxiliary Resistance Measurements
- Once the optimal WP is established, dedicated "Resistance Measurement" runs are periodically acquired to monitor long-term detector stability.
- These runs utilize the same DAQ sequence as load curves but with critical modifications: no heater pulses are fired, the bias voltage is kept constant at the designated WP, and only polarity inversions are performed.
- Crucially, the sleep time after a polarity inversion is extended significantly (e.g., ~1200 seconds) to allow the bolometer to fully re-thermalize to its base temperature, ensuring an accurate measurement of the static WP resistance ($R_"bol, wp"$).
- *Base Resistance:* This same procedure is executed at extremely low bias voltage
