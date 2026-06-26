#import "../common.typ": *

== Low-Level Processing & Event Reconstruction

Low-level data processing converts the continuous raw waveforms recorded by the data acquisition system into digitized, calibrated physical events. This reconstruction pipeline is executed offline utilizing the Diana software framework. The processing chain operates sequentially, executing signal triggering, thermal gain stabilization, and absolute energy calibration. Following individual event reconstruction, pulse shape discrimination filter the data to reject unphysical noise and coincidence event analysis identifies single-crystal and multi-site events.

=== Data Collection

The acquisition of continuous data in CUORE is systematically organized into discrete periods called *datasets*. A dataset comprises a collection of daily *runs*— each lasting $~ 24 "hrs"$ — during which the detector's cryogenic and electronic operating conditions remain highly stable and consistent. These runs are primarily categorized as either physics runs or calibration runs. Physics runs record the natural background radioactivity and provide the actual data used for the final rare-event analysis. In contrast, calibration runs involve the insertion of external radioactive sources into the cryostat to accurately characterize the detector's energy response. A single dataset generally spans a continuous duration of one to two months and is bracketed by calibration campaigns at both its beginning and end to monitor any long-term drifts. In addition to these primary data-taking modes, dedicated optimization runs—such as those required to measure bolometer load curves and adjust pulse tube phases—are periodically executed between physics data collection campaigns to guarantee optimal detector performance.

=== Triggering and Event Construction<sec4.2-triggering>
Triggering is the fundamental first step in data processing, tasked with identifying discrete energy depositions within the continuous data stream. While CUORE continuously records data, the physics analysis relies on discrete, independent events.

/ Event Structure: An individual CUORE event is defined as a 10-second waveform window anchored by a trigger timestamp, capturing 3 seconds of pre-trigger baseline data and 7 seconds of post-trigger data that encompasses the bolometer's slow thermal cooling tail.

As the data stream is parsed, the data acquisition framework categorizes the events into three primary types based on their origin:

/ Noise Events: To accurately model the detector's baseline thermal and electronic environment, the system forces artificial random triggers at a predefined probability. These random samples are used to capture pure noise profile of the detector.

/ Heater Events: Dedicated silicon heaters are pulsed periodically by the control system to inject known quantities of thermal energy. The DAQ explicitly tags these generated events as they occur.

/ Signal Events: All other triggered waveforms represent genuine physical energy depositions within the crystal volume. Reflecting CUORE's extremely low background environment, the standard physics signal trigger rate is roughly 1 mHz per channel, which increases to 30–50 mHz during active calibration campaigns.

==== Online vs. Offline Triggering
The Apollo data acquisition system utilizes a *Derivative Trigger (DT)* for real-time online monitoring. The DT is a fast, computationally efficient algorithm that evaluates the slope $ d V"/"d t$ of the final $40" ms"$ of the waveform against a channel-specific threshold determined during the initial Working Point optimization. While effective for basic operations, the DT is susceptible to low-frequency noise and lacks the sensitivity required for low-energy searches.

To overcome this, the continuous data is re-processed entirely offline using the *Optimum Trigger (OT)* algorithm. The OT utilizes an Optimum Filter (OF) to maximize the Signal-to-Noise Ratio (SNR). By selectively suppressing prominent background noise frequencies, the OT drastically lowers the triggering threshold, improving detection efficiency for low-energy pulses and enhancing the accuracy of coincidence timing.

==== Construction of the Average Pulse and Noise Templates
Constructing the Optimum Filter requires high-fidelity models of both the expected physical signal and the inherent noise for every individual channel. Because operating conditions can vary slightly over time, these templates are built natively for each bolometer during every discrete run.

/ Average Pulse (AP): The AP represents the standard, ideal thermal response of the detector. It is constructed by aligning, scaling, and averaging hundreds of clean, high-energy signal triggers (typically from the initial DT-flagged data).
/ Average Noise Power Spectrum (ANPS): The ANPS characterizes the frequency domain of the baseline environment. It is constructed by calculating the Fourier transform of the randomly sampled noise events.

==== The Optimum Filter
Using the constructed AP signal $S(omega)$ and the ANPS noise spectrum $N(omega)$, the optimal transfer function $H(omega_k)$ is defined in the frequency domain as:

$ H(omega_k) = (S^*(omega_k)) / N(omega_k) e^(-i omega_k t_"max") $

Here, $S^*(omega_k)$ is the complex conjugate of the signal's Fourier transform. The exponential phase factor acts as a time-translation operator, deliberately shifting the peak of the filtered pulse to a designated time index, $t_"max"$, within the sampling window. This phase shift compensates for inherent trigger time jitters, perfectly aligning all filtered pulses in the time domain so their maximum amplitudes can be reliably evaluated.

=== Data Processing Pipeline <sec4.2-pipeline>
After the calibration runs at the end of a dataset is completed we can proceed with the offline data processing pipeline. This pipeline relies on Diana, a custom software framework built upon CERN's ROOT C++ libraries and was utilized in and evolved through CUORECINO and CUORE-0. Diana operates using a flexible architecture of pluggable modules that act selectively on specific branches within a ROOT data tree.

These modules are sequentially arranged into configurations called sequences. During the initial preprocessing sequence, basic pulse parameters—such as the baseline voltage, baseline slope, and root-mean-square (RMS) noise—are calculated. This first sequence also applies essential data quality filters, rejecting manually flagged bad intervals and enforcing basic multi-trigger and dead-time cuts. Subsequent analysis sequences leverage the generated AP and ANPS templates to accurately extract pulse amplitudes, apply thermal gain stabilization, calibrate the energies, and ultimately execute coincidence detection and pulse shape analysis.

=== Pulse Amplitude
Following event triggering, precise reconstruction of the pulse amplitude serves as the primary metric for calculating the deposited energy. Because the bolometric thermal response depends on the instantaneous baseline temperature, the raw amplitude is modeled as $A(E,T) = a(E) dot G(T)$. This parameterization explicitly separates the intrinsic energy-dependent amplitude, $a(E)$, from the temperature-dependent thermal gain, $G(T)$.

To extract the final pulse amplitude, the algorithm applies the previously constructed Optimum Filter and identifies the maximum of the resulting waveform in the time domain. To overcome the resolution limits imposed by the discrete sampling rate, this maximum is calculated using localized polynomial interpolation—typically a 3-point or 5-point#footnote[which?] parabolic fit around the peak sample—yielding a highly precise, sub-sample amplitude estimator.

=== Stabilization

Thermal Gain Stabilization (TGS) is designed to correct the extracted pulse amplitudes for long-term baseline temperature drifts. The amplitude of an events at constant energy is modeled as a scaling of $a_E$,
$ A_E (t) = a_E (t) dot (p_1 + p_2 dot b(T)) $
where the baseline $b(T)$ acts as a proxy for the event's baseline temperature, and hence the temperature dependant detector response. The CUORE analysis pipeline utilizes two independent TGS algorithms processed in parallel: Heater TGS and Calibration TGS. The Heater TGS method continuously tracks the amplitude variations of periodic pulser events, which inject a highly stable, constant reference energy directly into the crystals. Alternatively, the Calibration TGS method tracks the position of a prominent, naturally occurring background peak—typically the 2615 keV line from #tl208—across the physics data as the constant energy proxy event. After fitting for $p_1, p_2$ from these events, we can correct arbitrary pulse amplitudes to stabilize them against the temperature fluctuations. To account for sudden operational breaks or sharp temperature variations that can occur within a single dataset, the stabilization parameters are calculated over discrete, dynamically defined time steps where necessary.

- Add more about calibration TGS,
- Is this correct? " To accurately account for nonlinearities in the gain-temperature dependence, this calibration-based method incorporates a dataset-dependent offset voltage derived directly from the empirical working point."

=== Energy Calibration

Following stabilization, the energy calibration procedure converts the stabilized pulse amplitudes into actual physical energy values by anchoring them to known gamma-ray emission lines. This critical mapping relies on dedicated calibration runs performed at the boundaries of the dataset, during which the detector array is exposed to externel sources. The internal strings of the Detector Calibration System (DCS) deployed #th232 and #ac228 sources directly among the inner towers initially, while later datasets utilized the external sources with #th232 and #co60 as described in @sec3.4-calib.

For each bolometer channel, a stabilized amplitude histogram is generated, and an automated peak-finding algorithm identifies prominent reference peaks and evaluate their exact positions by fitting a gaussian coupled with a first degree polynomial background#footnote[validate! the 1-ton-yr paper refers to Q0 paper which claims this.] . For the first datasets with internal calibration system, these peaks included a multitude of gamma lines coming from a cascade of decays (#super[212]Pb \@239, #super[228]Ac \@338, #tl208 \@239, #super[228]Ac \@911, #super[222]Ac \@969, #tl208 \@2615). However, with the EDSC the low energy gammas are highly attenuated, and only the peaks at 511 keV and 2615 keV were usable from the #th232 source. This made our calibration procedure 'blind' to a large part of the energy range that included the 0#nbb ROI around 2528 keV. Adding the #co60 from the 4th dataset onward partially mitigated this problem, providing us with additional peaks from the $gamma$s at 1173 keV and 1333 keV.

The final calibration function is derived by fitting the true physical energies of these reference peaks against their reconstructed stabilized amplitudes using a second-order polynomial with a zero intercept. In instances where automatic fits fail—usually due to low statistics or poor baseline resolution—the calibration parameters for those specific calorimeters are corrected manually.#footnote[add the fit functions for calibration curve as well as the peak functions]

=== Energy Estimator

// Because the Heater and Calibration stabilization methods are processed simultaneously, the resulting dataset yields two distinct energy estimates for every triggered event after the calibration modules. An automated selection algorithm is employed to identify the superior energy estimator for each individual channel based on their resolution. The selection process evaluates a Figure of Merit (FOM) based on the peak resolution and overall position stability. Specifically, the algorithm calculates a comparison ratio,
// $ W = alpha (C_h^2 / sigma_h^2) "/" (C_c^2 / sigma_c^2) $,

Because the heater and calibration stabilization methods are processed simultaneously, the dataset yields two distinct energy estimates for every triggered event: `Energy_OF` (which uses heater-based stabilization) and `Energy_WoH` (which uses calibration-based stabilization). An automated selection algorithm identifies the best energy estimator for each channel-dataset.

The selection process evaluates a Figure of Merit ($W$) and a significance ($Z$) using the energy variance ($sigma^2$) of the 2615 keV #tl208 line and the exposure ($epsilon$) for both estimators:
$ W equiv (sigma_"WoH"^2 epsilon_"OF"^2) / (sigma_"OF"^2 epsilon_"WoH"^2) $

$ Z equiv (1 - W) / sigma_W $

// which evaluates the stability constants ($C$) and resolutions ($sigma$) between the heater ($h$) and calibration ($c$) variables.#footnote[validate, and what are stability constants? and what are fisher, why alpha = 0.2?]

// A Fisher test statistic, $F(W)$, is then evaluated against this ratio. If $W < 1$ and the sample size satisfies the statistical threshold for $alpha = 0.2$, the Calibration TGS is deemed superior and is chosen for that specific channel. If these conditions are not met, the Heater TGS is applied by default. Historically, across typical CUORE physics runs, this statistical threshold leads to the Calibration TGS being selected for approximately 100 channels (which includes the 29 channels without a functioning heater) ensuring that the most stable and precise energy estimator is universally applied across the array.

where $sigma_W$ is the width of the $W$ distribution. `Energy_OF` is the default estimator for most channels. The alternative estimator, `Energy_WoH`, is selected if it demonstrates better performance, defined by the conditions $W < 1$ and $Z > 1$. Additionally, channels without a functioning heater or channels where `Energy_OF` is invalid default to `Energy_WoH`.

=== Multiplicity#footnote[change this para so we are not focusing on M1]

// Once the energy of each individual trigger is precisely determined, the final step in the event reconstruction pipeline is to evaluate the temporal correlations between these triggers across the entire detector array. Identifying coincident events is crucial for characterizing the background and significantly enhancing the sensitivity of the $0 nu beta beta$ search. Because approximately 88% of $0 nu beta beta$ decays are expected to deposit their full energy within a single crystal, they register as single-crystal (Multiplicity 1, or M1) events. Consequently, applying a strict anti-coincidence cut strongly suppresses background contributions from multi-site gamma interactions and degraded surface alphas.

Once the energy of each individual trigger is precisely determined, the final step in the event reconstruction pipeline is to evaluate the temporal correlations between these triggers across the entire detector array. Identifying coincident events is crucial for characterizing the background and significantly enhancing the sensitivity of the $0 nu beta beta$ search. While approximately 88% of $0 nu beta beta$ decays are expected to deposit their full energy within a single crystal (Multiplicity 1), multi-site events (Multiplicity > 1) provide crucial information. By tracking these higher multiplicities, the analysis can effectively identify and model background contributions from multi-site gamma interactions and degraded surface alphas.

// To successfully implement this cut, the coincidence window must be kept strictly narrow to minimize accidental random coincidences. To properly define this coincidence window, denoted as $Delta t^*$, the characteristic time response of each detector must be individually calibrated. Because individual bolometers operate at slightly different baseline temperatures, their signal rise times vary naturally, introducing a channel-dependent time delay ($t_"delay"$). The absolute delay for each channel is evaluated relative to a globally defined reference channel. This is achieved by first calculating the relative time delays between physically adjacent crystal pairs using known coincident background events#footnote[very small/negligible time delay]—such as the 2615 keV peak from the gamma cascade—or high-statistics pulser events. By iteratively summing these relative delays across the detector network, the absolute temporal error is minimized, and the array's timing response is fully normalized.

To successfully implement this cut, the coincidence window must be kept strictly narrow to minimize accidental random coincidences. To properly define this window, the characteristic time response of each detector must be individually calibrated to correct for timing "jitter" between the detectors. This is achieved primarily through two algorithms: one synchronizes different detectors by comparing the delays between their nominal trigger times and their pulse peaks, while the other synchronizes detectors within the same tower by analyzing coincidences in the calibration data, which provides much higher statistics than the physics data.

// After applying the precise timing correction ($Delta t^* - Delta t$), events are grouped into multiplets and stored alongside their corresponding multiplicity, channel-dataset identifiers, synchronized timestamps, individual component energies, total deposited energy, and time-ordering indices. For the standard 1 ton-yr $0 nu beta beta$ analysis, a dynamic "running window"#footnote[explain running window, and delta_t and t\*] of 10 ms is utilized to maximize signal efficiency, alongside a spatial distance cut of 150 mm and a universal array-wide energy threshold of 40 keV. Conversely, different physics searches require tailored coincidence parameters. The Background Model (BM), for instance, employs a wider 60 ms coincidence window to ensure the accurate spectral grouping of higher-energy coincident events. Meanwhile, specific low-energy analyses, such as Dark Matter or axion searches below 100 keV, rely on the channel-dependent thresholds established directly by the Optimum Trigger rather than a universal energy cut.

After applying these timing corrections, events are grouped into multiplets and stored alongside their corresponding multiplicity, channel-dataset identifiers, synchronized timestamps, individual component energies, total deposited energy, and time-ordering indices. For the standard 1 ton-yr $0 nu beta beta$ analysis, a time window of 5 ms is utilized, alongside a universal array-wide energy threshold of 40 keV and no spatial distance limit. Conversely, different physics searches require tailored coincidence parameters. The Background Model (BM), for instance, employs a wider $plus.minus 30$ ms time window (60 ms total) to ensure the accurate spectral grouping of coincident events. To compensate for this wider time window and reduce accidental coincidences to a negligible level, the BM analysis applies a spatial distance cut of 15 cm alongside the 40 keV energy threshold.

=== Pulse Shape Descrimination
Following the identification of higher multiplicity events through coincidence analysis, it is imperative to verify that the individual waveforms comprising these events are genuinely physical. Principle Component Analysis (PCA) is utilized as a critical discrimination tool to identify and remove atypical waveforms, such as pile-up events or spurious unphysical electronic noise. #footnote[add a sentense about what PCA is, reducing dimentions and that leading component is similar to the AP?]For each recorded event, the digitized pulse vector $arrow(v)$ is compared against its corresponding channel-specific Average Pulse template, $arrow(v)_"AP"$, which is similar to the leading component in the PCA. The morphological deviation between the measured pulse and the template is quantified by a metric known as the Reconstruction Error (RE), defined mathematically as:

$ "RE" = sqrt(sum_(d=1)^D \[v_d - (arrow(v) dot arrow(v)_"AP") med v_"AP,d") \]^2  $

Because the bolometer's thermal response inherently scales with the deposited energy, the RE exhibits a natural energy dependence. For valid physical events spanning the range of 100 keV to 2615 keV, this energy dependence is empirically modeled by fitting a second-order polynomial, $f(E)$, to the primary signal band. $f(E)$ is fitted for each detector while iteratively removing events whose RE has the highest deviation from the fitted function. To evaluate each event using a standard metric across the entire detector array and compensate for channel-to-channel variations, a Normalized Reconstruction Error (NRE) is computed as:

$ "NRE" = ("RE" - f(E)) / "MAD" $

where $"MAD"$ represents the median absolute deviation of points from the polynomial fit. The final acceptance threshold on the NRE is established by systematically maximizing a Figure of Merit, defined as $"FOM" = epsilon"/"sqrt(epsilon_"bkg")$ . The signal efficiency $epsilon$ is evaluated using the $2615$ keV $gamma$ peak events while the background efficiency $epsilon_"bkg"$ is the acceptance efficiency of the events in the 2700-3100 keV region which contains degraded alpha events as well as misreconstructed events. To prevent statistical bias or over-tuning during this tuning phase, the threshold optimization is performed using only a randomly selected half of the dataset. For main 0#nbb search discussed in the following sections, a cut on $|"NRE"| < 8$ was chosen after evaluating the FOM.

With the physical parameters fully evaluated and the low-level data quality cuts established, the surviving dataset is thoroughly calibrated and reconstructed#footnote[rephrase]. However, before any final spectral fits can be performed to extract the decay rate, a stringent data blinding procedure must be implemented to protect the region of interest, as detailed in Section 4.3.#footnote[wtf is this paragraph?]
