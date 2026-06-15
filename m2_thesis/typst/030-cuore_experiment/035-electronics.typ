#import "../common.typ": *

== Electronics and Read-out Chain

The signal readout chain bridges the ultra-cryogenic environment with the room-temperature data acquisition systems. Inside the cryostat, the PEN-Cu cables route the analog signals from the 10 mK Mixing Chamber up through successive thermal stages, terminating at the room-temperature (300 K) top flange. From here, external multi-wire cables carry the signals into the adjacent Faraday cage to the preamplifiers, where they are actively filtered and digitized.

The digitized data stream is collected by an array of dedicated reader computers. These systems save the raw waveforms to disk while simultaneously streaming the data through an online analysis pipeline for immediate triggering, real-time visualization, and event monitoring.

=== Front-End Boards
The Front-End (FE) boards, housing the preamplifiers and bias circuits, are securely mounted within the Faraday cage on the top floor of the CUORE hut. Resting directly on the Main Support Plate (MSP) to minimize differential mechanical vibrations, this system comprises seven racks, each holding two electronic crates to service the 988 detector channels.

Each FE crate contains a Power Supply Unit (PSU) alongside 13 FE boards. Each board accommodates 6 amplifier channels. Six external multi-wire cables from the 300 K flange feed into each crate; custom backplane routing distributes the signals such that 12 boards process the standard array channels, while the 13th handles the remaining diagnostic lines.

Each thermistor is biased and read out using two dedicated wires that connect directly to the back of the FE preamplifier. The analog signal is acquired in differential mode, which effectively suppresses common-mode noise, such as electromagnetic interference and inter-channel crosstalk.

The preamplifier applies a primary gain factor of 210 V/V and an adjustable baseline offset. Integrated digital trimmers—programmable variable resistors embedded in the circuit—allow operators to dynamically adjust this offset and gain to correct for long-term thermal drifts in the bolometers. These compensation parameters are calibrated during dedicated runs and stored in onboard EEPROM, enabling automatic adjustments based on ambient environmental temperature variations. Following the preamplifier stage, a Programmable Gain Amplifier (PGA) applies a secondary, channel-specific gain ranging from 1 V/V to 50 V/V. This ensures the signal amplitude maps optimally into the dynamic range of the downstream analog-to-digital converters. All FE boards are digitally managed by a microcontroller communicating via a robust CAN-bus network.

=== Bessel Filter Boards
The amplified analog output is routed via D-Sub connectors to the Bessel filter boards, with two FE boards feeding into a single 12-channel Bessel board. These boards employ active 6-pole Bessel-Thomson low-pass filters to prevent high-frequency signal aliasing prior to digitization. They provide a steep, linear phase attenuation of approximately 120 dB/decade.

The cutoff frequency can be dynamically configured remotely to 15, 35, 100, or 120 Hz via the CAN-bus network. For standard CUORE physics data-taking, this cutoff frequency is typically optimized at 120 Hz.

=== Pulser Boards
The pulser boards, also located within the Faraday cage, are responsible for injecting highly stable reference heat pulses into the detector array. Instead of theoretical Dirac-delta spikes, they generate precise rectangular voltage pulses that dissipate a known amount of Joule heating across the silicon heaters attached to the crystals. The resulting thermal profile mimics a true particle interaction.

These artificial events are explicitly flagged by the DAQ, allowing offline analysis to isolate them for dynamic thermal stabilization and precise energy calibration. Each pulser board features four channels, with a single channel wired to pulse an entire column of 13 detectors simultaneously. Consequently, one board can service an entire tower. Through the CAN-bus link, operators tune the pulse amplitude, duration, and frequency. The injected energy is typically set to roughly 3 MeV to monitor the detector response near the $0nu beta beta$ Region of Interest (ROI). Additional pulses at $~1$ MeV and $~5$ MeV are routinely injected to map detector linearity across a broader energy spectrum.

=== Power Supplies
Highly stable, low-noise power supplies provide $plus.minus 5$ V to the electronics, designed to filter out ambient power grid noise while maintaining tight stability across varying environmental temperatures.

Crucially, the bias current for the NTD thermistors is supplied completely independently by a remote-controlled DC power supply (Keithley 2231A-30-3). This configuration galvanically isolates the sensitive NTD sensors—meaning there is no direct electrical conduction path between the sensor bias lines and the main electronics power ground. This isolation prevents the formation of ground loops and blocks external electrical noise from propagating into the cryostat.

=== NI-DAQ
The final digitization stage utilizes an array of National Instruments (NI) PXI-6284 digitizers, which receive the analog output from the Bessel filter boards. The routing between the systems is handled by a series of custom patch boards that remap the channel geometries into $3 times 8$ connector arrays to fit the NI inputs.

The PXI-6284 modules feature an 18-bit Analog-to-Digital Converter (ADC). In total, 64 digitizer boards are distributed across six 14-slot NI chassis, providing the capacity to acquire up to 1024 differential channels simultaneously. Each chassis is equipped with a controller that gathers the digitized data from the ADC modules via the PXI bus. This data is transmitted to the data reader computers via an optical link, ensuring the noisy computing environment remains electrically isolated from the quiet front-end electronics.

A 10 MHz internal clock is shared among the boards within a chassis. To maintain global synchronization, one chassis is designated as the "master" and actively distributes its clock to the other chassis via coaxial BNC cables. This master chassis automatically triggers and monitors the synchronicity of all digitizers at the beginning of, and periodically throughout, each data-taking run. Rigid synchronization is critical for minimizing timing jitter, which is essential for the accurate characterization of inter-channel coincidence events.

The ADC operates with a maximum dynamic range of 21 V ($plus.minus 10.5$ V). Coupled with the 18-bit resolution, this yields a quantization step of roughly $80$ $mu$V. This quantization noise is inherently negligible compared to the typical intrinsic signal noise emerging from the Bessel filters, which is on the order of $cal(O)(1)$ mV.

Finally, due to the exceptionally slow thermal decay times of the large-mass bolometers, the physical signal bandwidth extends only up to $~10$ Hz. While the precursor CUORE-0 operated with a sampling rate of 125 Hz, CUORE exploits the maximum available sampling frequency of 1000 Hz. This aggressive oversampling vastly improves signal fidelity and facilitates the implementation of advanced, purely digital noise-rejection algorithms in the offline analysis pipeline.
