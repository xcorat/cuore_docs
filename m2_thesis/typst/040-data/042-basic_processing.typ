#import "../common.typ": *

== Low-Level Processing & Event Reconstruction

Once stable operating conditions are established, the CUORE detector functions as an exceptionally quiet measurement apparatus. Extracting physical event properties from the continuous data stream, however, requires a multi-stage software reconstruction pipeline. This process transitions from basic pulse triggering to the extraction of pulse shape parameters, and ultimately, to the precise estimation of the deposited energy. CUORE employs a two-tiered data processing strategy. First, a real-time data production pipeline is executed online as the continuous waveforms are acquired. This fast online framework utilizes a standard derivative trigger to monitor detector stability and assess the accumulation of statistics during calibration runs.

Conversely, the final physics analysis relies on a much more sophisticated offline processing pipeline. The offline analysis processes data in discrete temporal units called *datasets*—each consisting of a central physics run bracketed by initial and final calibration runs—to leverage similar thermodynamic conditions and maximize statistics. During this offline phase, the raw continuous data is re-evaluated using advanced algorithms. These comprehensive steps include the implementation of an optimal filter-based trigger to lower energy thresholds, precise thermal gain stabilization to correct for minute temperature drifts over the dataset's duration, rigorous energy estimation based on optimally filtered pulse amplitudes, and an artificial data blinding procedure (often data "salting") applied to the region of interest to prevent analyst bias during model tuning.

=== Triggering

Triggering is the fundamental first step in data processing, responsible for identifying discrete energy depositions within the continuous data stream. Upon detection, events are classified as signal, noise, or reference pulser events, with each triggered event being saved as an independent 10-second waveform window. The extremely low background environment of CUORE is reflected in the trigger rates: during standard physics runs, the background event rate is roughly 1 mHz per channel. During calibration campaigns, this rate increases significantly to 30–40 mHz (typically ranging from 10–20 mHz for inner tower bolometers to 40–50 mHz for those on the outer edges facing the calibration strings).

The primary online trigger utilized by the Apollo data acquisition framework is the Derivative Trigger (DT). The DT is a fast, computationally efficient algorithm that evaluates the slope of the waveform averaged over a defined number of samples. It operates using channel-specific parameters—such as the derivative threshold, debounce time, and dead-time—which are empirically determined during the initial Working Point optimization. While the DT serves as an excellent tool for real-time monitoring, rare low-energy phenomena demand significantly higher sensitivity. To achieve this, the continuous data files are re-processed entirely offline using the Optimum Trigger (OT) algorithm.

The OT relies on an Optimum Filter (OF), a mathematical technique theoretically designed to maximize the Signal-to-Noise Ratio (SNR) of a specific signal profile against a known background noise profile. By applying this filter, the OT suppresses specific noise frequencies, enabling a dramatically lower trigger threshold. This not only increases the detection efficiency for low-energy pulses but also improves the accuracy of the energy reconstruction and the subsequent coincidence analysis, which is critical for identifying single-site (Multiplicity 1) events for the main $0\nu\beta\beta$ analysis, as well as multi-site events for the Background Model.

Constructing the Optimum Filter requires two channel-specific components: an Average Pulse (AP) to model the expected signal response, and an Average Noise Power Spectrum (ANPS) to model the baseline noise. Both components are generated per dataset using the data initially flagged by the online DT. The AP is constructed by aligning and averaging the scaled waveforms from hundreds of high-quality calibration pulses, while the ANPS is computed by calculating the spectral density histogram in Fourier space from randomly triggered baseline noise windows. Using the AP signal $S(omega)$ and the noise spectrum $N(omega)$, the optimal transfer function $H(omega_k)$ for a given bolometer is defined in the frequency domain as:

$H(omega_k) = (S^*(omega_k)) / N(omega_k)  e^(-i omega_k t_"max")$

// $ H(omega_k) eq e^(-i omega_k t"max") S^*(omega_k) / N(omega_k) $

Here, $S^*(omega_k)$ is the complex conjugate of the signal's Fourier transform. The exponential phase factor, $e^(-i omega_k t_"max")$, acts as a time-translation operator. It is introduced to explicitly shift the peak of the filtered pulse to a designated time index, $t_"max"$, within the sampling window. This phase shift critically compensates for inherent trigger time jitters, ensuring that all filtered pulses are perfectly aligned in the time domain, allowing the maximum amplitude of the pulse—which serves as the basis for the final energy estimator—to be evaluated reliably.

// == Low-Level Processing & Event Reconstruction

// - With stable detector working conditions achieved, CUORE becomes one of the quietest measurement apparatus for it's scale.
// - Yet event reconstruction from the acquired continuous waveform require a few steps, from basic pulse triggering to calculating pulse parameters and finally the energy estimator.
// - CUORE runs a basic version of data production pipeline in realtime as the data is being collected, which is important for monitoring detector conditions and statistics level in calibration runs.
// - The online data production used a basic derivative trigger while the data used for final analysis comes from offline processing with more advanced/sophisticated production steps starting from optimal triggering algorithm which is constructed using average pulses and noise spectra created using the data flagged at the online stage.
// - Data from calibration runs at the start and end is used for the offline analysis, and each dataset is processed as a unit in most cases "in many ways" to leverage the similar working conditions and higher statistics.
// - (Add a sentence or two on stab? energy estimator? blinding?)


// === Triggering

// - Online processing uses a basic derivative trigger with parameters set using the WP (Working Point) measurements.
// - Optimal trigger is the main triggering algorithm used in offline data processing, which leverages pulses passed through "optimal filter".
// - Optimal filter, theoretically aims to maximize the SNR, thus making it possible to put much better thresholds and detect more pulses as well as to construct their energies more accurately.
// - Optimal filter is constructed using an average pulse for model and the average noise power spectrum constructed for each bolometer.
// - *AP*, *ANPS* constructed using the DT (Derivative Trigger) triggered pulses; *AP* (Average Pulse), by averaging the scaled waveforms from all "quality" pulses, and the *ANPS* (Average Noise Power Spectrum), from all filtered noise pulses, as a spectral density histogram in Fourier space.
// - Using the AP & ANPS, the optimal transfer function for the given bolometer is constructed (for each run? each ds?) which gives the filtered pulse from the original pulse $h(omega_k)$:

// $ H(omega_k) eq e^(-i omega_k t"max") S^*(omega_k) / N(omega_k) $

// - Here $t_"max"$ is the position of the maximum point in the time window being filtered. *(Margin note:  why/how is this used exactly?)*
// - Optimal Filter uses this filtered pulse for triggering, making us sensitive to lower energies, thus improving not only the energy estimation but also the coincidence analysis for both the M1 (main) analyses and other analyses like the BM (Background Model).


// - Triggering is the first data processing step required to identify discrete pulses in the continuous data stream.
// - Events are classified as signal, noise, or pulser events, with each event saved as an independent 10-second waveform window.
// - During physics runs without calibration sources, the background event rate is roughly 1 mHz. During calibration runs, this rate increases to 30–40 mHz (typically ranging from 10–20 mHz for inner towers to 40–50 mHz for outer towers).
// - The primary online trigger used in the Apollo framework is the Derivative Trigger (DT). It evaluates the waveform derivative averaged over a defined number of samples and utilizes independent debounce and dead-time settings.
// - While the DT is a fast and computationally efficient algorithm for real-time monitoring, low-energy events demand higher sensitivity.
// - To achieve this, the continuous data is re-processed offline using the Optimum Trigger (OT).
// - The OT algorithm relies on the Optimum Filter (OF), which is constructed using an Average Pulse (AP) and an Average Noise Power Spectrum (ANPS) derived from the initially DT-flagged events. By applying a low-pass filter and signal down-sampling, the OT significantly suppresses noise and achieves a lower trigger threshold.


// === Data Collection

// - Data is organized into datasets, which are a collection of runs when operating conditions are fairly similar. Each run is $~ 24 "hrs"$,
// - and mostly either a physics run (which is what the analyzed data is based on, due to natural radioactivity) or calibration runs where external radioactive sources are used to calibrate the detector.
// - Each dataset generally lasts for 1–2 months, with a few calibration runs at the beginning and at the end of each dataset.
// - Other optimization runs to measure the load curves and set pulse tube phases are also run in between physics data collection campaigns.

// === Pulse Amplitude

// - The reconstructed pulse amplitude is the primary metric used to calculate the final deposited energy.
// - Because the bolometer thermal response varies with baseline temperature, the raw pulse amplitude is modeled as $A(E,T) = a(E) dot G(T)$, separating the energy-dependent amplitude $a(E)$ from the temperature-dependent gain $G(T)$.
// - Before evaluating the final amplitude, basic pulse parameters are extracted. These include the pre-trigger baseline (evaluated over the initial 0 to 2.25 seconds of the window), baseline slope, baseline RMS, and the number of triggered pulses within the window.
// - Strict data quality cuts are applied to these parameters to select clean, isolated pulses for constructing the OF.
// - The OF maximizes the signal-to-noise ratio by optimally weighting the frequency components of the signal. In the frequency domain, the filtered waveform is proportional to $S(omega) / |N(omega)|^2 e^(-i omega t_"max")$, where $S(omega)$ is the ideal signal template and $N(omega)$ is the noise power spectrum.
// - The final pulse amplitude is evaluated by measuring the maximum of this filtered waveform using a localized polynomial interpolation (typically a 3-point or 5-point evaluation).

=== Data Collection

The acquisition of continuous data in CUORE is systematically organized into discrete periods called datasets. A dataset comprises a collection of daily runs—each lasting $~ 24 "hrs"$—during which the detector's cryogenic and electronic operating conditions remain highly stable and consistent. These runs are primarily categorized as either physics runs or calibration runs. Physics runs record the natural background radioactivity and provide the actual data used for the final rare-event analysis. In contrast, calibration runs involve the insertion of external radioactive sources into the cryostat to accurately characterize the detector's energy response. A single dataset generally spans a continuous duration of one to two months and is strictly bracketed by calibration campaigns at both its beginning and end to monitor any long-term drifts. In addition to these primary data-taking modes, dedicated optimization runs—such as those required to measure bolometer load curves and adjust pulse tube phases—are periodically executed between physics data collection campaigns to guarantee optimal detector performance.

=== Pulse Amplitude

Following event triggering, the precise reconstruction of the pulse amplitude serves as the primary metric for calculating the final deposited energy. Because the bolometric thermal response exhibits a measurable dependence on the instantaneous baseline temperature, the raw pulse amplitude is phenomenologically modeled as $A(E,T) = a(E) dot G(T)$. This parameterization explicitly separates the intrinsic energy-dependent amplitude, $a(E)$, from the temperature-dependent thermal gain, $G(T)$. Before this final amplitude can be accurately evaluated, the raw waveform undergoes a pre-processing stage to extract basic pulse characteristics. These parameters include the pre-trigger baseline (evaluated over the initial 0 to 2.25 seconds of the acquired window), the baseline slope, the baseline RMS noise, and the total number of distinct triggered pulses within the window. Strict data quality cuts are then applied based on these parameters to isolate clean, single-pulse events, which are essential for constructing the Optimum Filter (OF).

The Optimum Filter is a mathematical technique designed to maximize the signal-to-noise ratio by optimally weighting the frequency components of the signal against the intrinsic background noise. In the frequency domain, the resulting filtered waveform is proportional to $S(omega) / |N(omega)|^2 e^(-i omega t_"max")$, where $S(omega)$ represents the ideal signal template and $N(omega)$ represents the measured noise power spectrum. To extract the final pulse amplitude, the algorithm identifies the maximum of this optimally filtered waveform in the time domain. To avoid limitations imposed by the discrete sampling rate, this maximum is evaluated using a localized polynomial interpolation—typically a 3-point or 5-point parabolic fit around the peak sample—yielding a highly precise, sub-sample amplitude estimator.

// === Stabilization

// - Thermal Gain Stabilization (TGS) corrects the extracted amplitudes for long-term baseline temperature drifts.
// - The stabilization parameters are calculated over discrete time steps to account for operational breaks or sharp temperature variations within a single dataset.
// - Two independent TGS algorithms are utilized: Heater TGS and Calibration TGS.
// - *Heater TGS:* Tracks the amplitude variations of periodic pulser events that inject a constant reference energy. The response is modeled as $A_h (t) = a_h(E) dot (p_1 + p_2 dot T + ...)$, where $T$ acts as a proxy for the baseline temperature.
// - *Calibration TGS:* Tracks the position of a prominent reference background peak, typically the 2615 keV line from $208$Tl. This method uses a dataset-dependent offset voltage derived from the working point to account for nonlinearities in the gain-temperature dependence.

// === Energy Calibration

// - Energy calibration converts the stabilized pulse amplitudes into physical energy values using known gamma-ray emission lines.
// - This procedure relies on dedicated calibration runs where the detector array is exposed to $232$Th and $60$Co sources. The Detector Calibration System (DCS) deploys internal strings for the inner towers, supplemented by external sources for the outermost towers.
// - For each channel, a stabilized amplitude histogram is generated. A peak-finding algorithm identifies prominent reference peaks with high signal-to-noise ratios.
// - Each identified peak is fitted using an empirical line shape model—typically a combination of a Gaussian and a Crystal Ball function. The underlying background continuum is modeled simultaneously using a first-order polynomial combined with a smoothed step function to account for the Compton edge.
// - The calibration function is derived by fitting the true physical energies of these peaks against their reconstructed stabilized amplitudes using a second-order polynomial with a zero intercept.
// - If automatic fits fail due to low statistics or poor resolution, the calibration parameters for those specific calorimeters are corrected manually.

// === Energy Estimator

// - Because two distinct stabilization methods (Heater and Calibration) are processed in parallel, an automated selection algorithm identifies the superior energy estimator for each channel.
// - The selection evaluates a Figure of Merit (FOM) based on the peak resolution and position stability. The algorithm calculates the ratio $W = alpha (C_h^2 / sigma_h^2) / (C_c^2 / sigma_c^2)$, comparing the heater ($h$) and calibration ($c$) variables.
// - A Fisher test statistic, $F(W)$, is evaluated. If $W < 1$ and the sample size passes the statistical threshold for $alpha = 0.2$, the Calibration TGS is chosen; otherwise, the Heater TGS is applied by default. (In typical runs, this threshold selects Calibration TGS for roughly 100 channels).

=== Stabilization

Thermal Gain Stabilization (TGS) is an essential post-processing step designed to correct the extracted pulse amplitudes for long-term baseline temperature drifts. To account for sudden operational breaks or sharp temperature variations that can occur within a single dataset, the stabilization parameters are calculated over discrete, dynamically defined time steps. The CUORE analysis pipeline utilizes two independent TGS algorithms processed in parallel: Heater TGS and Calibration TGS. The Heater TGS method continuously tracks the amplitude variations of periodic pulser events, which inject a highly stable, constant reference energy directly into the crystals. The thermal response of these pulser events is modeled as $A_h (t) = a_h(E) dot (p_1 + p_2 dot T + ...)$, where the variable $T$ acts as a proxy for the instantaneous baseline temperature. Alternatively, the Calibration TGS method tracks the position of a prominent, naturally occurring background peak—typically the 2615 keV line from #tl208—across the physics data. To accurately account for nonlinearities in the gain-temperature dependence, this calibration-based method incorporates a dataset-dependent offset voltage derived directly from the empirical working point.

=== Energy Calibration

Following stabilization, the energy calibration procedure converts the stabilized pulse amplitudes into actual physical energy values by anchoring them to known gamma-ray emission lines. This critical mapping relies on dedicated calibration runs performed at the boundaries of the dataset, during which the detector array is exposed to $232$Th and $60$Co sources. The internal strings of the Detector Calibration System (DCS) deploy these sources directly among the inner towers, while supplementary external sources are utilized to ensure uniform radiation coverage for the outermost towers.

For each bolometer channel, a stabilized amplitude histogram is generated, and an automated peak-finding algorithm identifies prominent reference peaks characterized by high signal-to-noise ratios. Each identified peak is then carefully fitted using an empirical line shape model, typically comprising a combination of a Gaussian and a Crystal Ball function (or an asymmetric Gaussian core). Concurrently, the underlying background continuum is modeled using a first-order polynomial combined with a smoothed step function to accurately replicate the Compton edge. The final calibration function is derived by fitting the true physical energies of these reference peaks against their reconstructed stabilized amplitudes using a second-order polynomial with a zero intercept. In instances where automatic fits fail—usually due to low statistics or poor baseline resolution—the calibration parameters for those specific calorimeters are corrected manually to ensure maximum data retention.

=== Energy Estimator

Because the Heater and Calibration stabilization methods are processed simultaneously, the resulting dataset yields two distinct energy estimates for every triggered event. To resolve this redundancy and maximize resolution, an automated selection algorithm is employed to identify the superior energy estimator for each individual channel. The selection process evaluates a Figure of Merit (FOM) based on the peak resolution and overall position stability. Specifically, the algorithm calculates a comparison ratio, $W = alpha (C_h^2 / sigma_h^2) / (C_c^2 / sigma_c^2)$, which evaluates the stability constants ($C$) and resolutions ($sigma$) between the heater ($h$) and calibration ($c$) variables.

A Fisher test statistic, $F(W)$, is then evaluated against this ratio. If $W < 1$ and the sample size satisfies the statistical threshold for $alpha = 0.2$, the Calibration TGS is deemed superior and is chosen for that specific channel. If these conditions are not met, the Heater TGS is applied by default. Historically, across typical CUORE physics runs, this strict statistical threshold leads to the Calibration TGS being selected for approximately 100 channels, ensuring that the most stable and precise energy estimator is universally applied across the array.
