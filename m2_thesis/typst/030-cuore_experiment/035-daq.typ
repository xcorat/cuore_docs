#import "../common.typ": *

== Electronics / DAQ / Read-out chain

- The signal readout chain begins with data probes connecting the internal thermistors to the external electronics. These signals exit the cryostat and connect directly to the preamplifiers and biasing circuits, after which they are actively filtered and digitized.
- The digitized data stream is collected by an array of six dedicated computers. These systems save the raw waveforms to disk while simultaneously streaming the data through an online analysis pipeline for immediate triggering and event monitoring. (*Computer related stuff are on the next chapter*)
- A dedicated "CUORE online check" interface is utilized to visualize and monitor the incoming data in real time.

=== Front-End Boards
- The Front-End (FE) boards, which house the preamplifiers and bias circuits, are securely mounted within the Faraday cage on the top floor of the CUORE hut.
- Resting directly on the Main Support Plate (MSP), this system comprises seven racks, each holding two electronic crates to service the more than 1000 detector channels.
- Each FE crate contains a Power Supply Unit (PSU) alongside 13 FE boards. Each board accommodates 6 amplifiers. Six multi-wire cables emerge from the cryostat per crate, with each cable instrumenting 13 bolometers.
- On the back panel of each crate, custom routing connects 12 of the FE boards, while the 13th board connects to the final set of channels. *(Insert Diagram here)*
- Each thermistor is biased and read out using two dedicated wires that connect directly to the back of the FE preamplifier. The signal is acquired in differential mode, which effectively suppresses common-mode noise, such as inter-channel crosstalk.
- The preamplifier applies a primary gain factor of 210 V/V and an adjustable baseline offset. Integrated trimmers allow for dynamic adjustment of this offset and gain to correct for long-term thermal drift. The parameters for thermal drift compensation are calibrated during special runs and stored in EEPROM; thus, when the offset is adjusted, the correct compensation coefficient is automatically applied based on the ambient environmental temperature. (*umm what does trimmers do exactly?*)
- Following the preamplifier stage, a Programmable Gain Amplifier (PGA) applies a secondary, channel-specific gain ranging from 1 V/V to 50 V/V. This ensures the signal is mapped perfectly into the optimal dynamic range of the downstream analog-to-digital converters.
- All FE boards are digitally managed by a microcontroller communicating via a robust CAN-bus network.

=== Bessel Filter Boards
- The FE analog output is routed via D-Sub connectors to the Bessel filter boards, with two FE boards feeding into a single 12-channel Bessel board.
- These boards employ active 6-pole Bessel-Thomson low-pass filters to prevent high-frequency signal aliasing. They provide a steep attenuation of approximately 120 dB/decade.
- The cutoff frequency can be dynamically configured remotely to 15, 35, 100, or 120 Hz. For standard CUORE data-taking, this cutoff frequency is typically optimized at 35 Hz(*? validate*).
- Like the front-end electronics, these filter boards are controlled and monitored via the CAN-bus.

=== Pulser Boards
- The pulser boards, also located within the Faraday cage, are responsible for injecting highly stable reference heat pulses into the detector array.
- They generate short electrical pulses—approximating a Dirac $delta$ function—that dissipate a precise amount of power into the Joule heaters attached to the crystals, mimicking true particle interactions.
- These artificial events are explicitly flagged by the DAQ, allowing analysts to isolate them for dynamic thermal stabilization and precise energy calibration.
- Each pulser board features four channels, with a single channel wired to pulse an entire column of 13 detectors simultaneously. Consequently, one pulser board can service an entire tower.
- Through the CAN-bus communication link, operators can tune the pulse amplitude, duration, and frequency (the time delay between pulses). The injected energy is typically set to $~3$ MeV to monitor the detector response near the 0#nbb Region of Interest (ROI). Additionally, pulses of $~1$ MeV and $~5$ MeV are routinely injected to verify detector linearity and stabilization across a broader energy spectrum.

=== Power Supplies
- Highly stable, low-noise power supplies provide $plus.minus 5$ V to the electronics, designed to filter out ambient power grid noise while maintaining tight stability across varying environmental temperatures.
- Crucially, the bias current for the NTD thermistors is supplied entirely separately by a remote-controlled Keithley 2231A-30-3 triple-channel DC power supply. This setup completely galvanically (*?what?*) isolates the sensitive NTD sensors from the rest of the standard electronics chain.

=== NI-DAQ
- The digitization stage utilizes an array of National Instruments (NI) PXI-6284 digitizers, which receive the analog output from the Bessel filter boards.
- The routing between the systems is handled by a series of custom patch boards that remap the channel geometries into $3 times 8$ connector arrays to fit the NI inputs.
- The PXI-6284 modules feature an 18-bit Analog-to-Digital Converter (ADC) and possess two main connectors handling 16 differential analog inputs and 48 digital I/O lines.
- In total, 64 digitizer boards are distributed across six 14-slot NI chassis, providing the capacity to acquire up to 1024 differential channels simultaneously.
- Each chassis is equipped with a controller that gathers the digitized data from the ADC modules via the PXI bus. This data is transmitted to the data reader computers via an optical link, ensuring the noisy computing environment remains electrically isolated from the quiet front-end electronics.
- A 10 MHz internal clock is shared among the boards within a chassis. To maintain global synchronization, one chassis is designated as the 'master' and actively distributes its clock to the other chassis via coaxial BNC cables.
- The ADC operates with a maximum dynamic range of 21 V ($plus.minus 10.5$ V). Coupled with the 18-bit resolution, this yields a quantization step (ADC resolution) of roughly $80$ $mu$V. This quantization noise is comfortably negligible compared to the typical intrinsic signal noise emerging from the Bessel filters, which is on the order of $cal(O)(1)$ mV.
- Due to the exceptionally slow thermal decay times of the macroscopic(*?*) bolometers, the physical signal bandwidth extends only up to $~10$ Hz. While CUORE-0 operated with a sampling rate of 125 Hz, CUORE exploits the maximum available sampling frequency of 1000 Hz. This aggressive oversampling facilitates the implementation of advanced, purely digital noise-rejection algorithms in the offline analysis pipeline.
- Finally, the master chassis automatically triggers and monitors the synchronicity of all digitizers at the beginning of, and periodically throughout, each data-taking run. Rigid synchronization is critical for minimizing timing jitter, which is essential for the accurate characterization of inter-channel coincident events.
