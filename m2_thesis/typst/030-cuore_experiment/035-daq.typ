#import "../common.typ": *

== Electronics / DAQ / Read-out chain

- The data probes connecting the thermistors come out of the cryostat and connect directly to the preamplifier with the bias circuit, which is then filtered before being digitized.
- Data is collected by 6 computers which saves the raw waveforms while also moving through an online analysis chain for triggering & event monitoring.
- Cuore on line check is used to visualize the data.


=== Front-end board

preamplifiers and the bias cct.

- FE boards are mounted inside the faraday cage on the top floor of the CUORE hut.
- Resting on the MSP, 7 racks with two crates each connected to over 1000 channels.
- FE crate has 13 boards with 6 amplifiers each, and a PSU, 6 cables coming from cryostat, each with 13 bolometers connect to these crates.
- On each crate, the back panel routes connections between 12 FE boards, and the 13th connects to the last board of the crate.
(Diagram)
- Each thermistor is biased and read using two connections which directly connects to the back of the FE preamplifier, the signal is acquired in differential mode,
  - Common-mode noise is suppressed (like crosstalk between channels).
- Preamp multiply the signal by 210 V/V factor, added an offset - trimmers can be adjusted to change offset & gain to correct for thermal drift.
  - Thermal drift compensation param are calibrated in special runs and stored in EEPROM, so when offset is set, the correct coefficient is chosen depending on the env temp.
- After the preamp, a programmable gain amplifier amplifies the signal to move it to the optimal (dynamic) range within the ADC, and these params differ for each channel from 1V/V to 50V/V.
- The boards are managed through a microcontroller that communicates via CAN-bus.

=== Bessel Filter boards

- FE output is connected via D-Sub connectors to the Bessel filter boards, two FE's into one bessel board which has 12 channels.
- Anti-aliasing active low pass filters of Bessel-Thompson (6-pole filter) provides attenuation ~120 dB/decade with a cutoff frequency that can be set to 15, 35, 100, 120 Hz remotely (dynamically)
- For CUORE, the cutoff frequency is chosen to be *35Hz* ?
- These boards also communicate / are controlled through CAN-bus.

=== Pulser Boards

- Pulser boards are the other part of the electronics that also sit in the faraday cage.
- Sends short pulses that mimick particle interactions similar to a $delta$ pulse, which injects a given power to the Joule heaters attached to the crystals.
- Heater pulses are flagged by the DAQ so we know exactly which energy depositions are due to injected pulses, and can be used for dynamic calibration of the detector.
- Each board has 4 channels, and each channel pulses a whole column of detectors connecting each pulser board to one tower.
- Amplitude and duration can be set through the CAN-bus communication to adjust the power injected to the heater, and the frequency (time delay between pulses) can also be set.
- Usually ~3 MeV is chosen (for calibration near the ROI in 0#nbb analysis, ) but ~1 MeV and ~5 MeV is sent to check stabilization at multiple energies.

=== Power Supplies

- Multiple power supplies are used, to provide very low noise $plus.minus$ 5V with high stability across thermal range of the environment.
- These filter out the noise coming from the power grid.
- The current bias for the NTDs are supplied seperately by 2231A-30-3 Keithley triple channel DC PSU, this isolating the NTDs from the rest of the electronics, and can be controlled remotely.

=== NI-DAQ

- An array of NI PXI 6284 digitizers are connected to the output of the Bessel filter boards.
- They have 18-bit ADC, 2 connectors with 16 differential analog inputs & 48 digital I/O.
- These are connected through a series of custom patch boards remap channel connectors into 3x8 conns for NI boards.
- And are housed into 6 NI chassis with 14 slots each, with 64 boards in total which can accommodate 1024 diff channels in total.
- Each chassis houses a controller that collect digitized data from the ADC modules through the PXI bus and send it to data reader computers using an optical link, isolating the computing system from the rest of the electronics.
- Chassis have 10 MHz internal clock shared among boards, with one chassis acting as the 'master' chassis that connects to the others using a co-ax BNC cable to sync all of them together.
- Maximum ADC dynamic range is 21 V ($plus.minus$ 10.5 V) with 18-bit giving a ADC resultion (??) of $tilde 80 mu$V which is negligible to typical signal noise coming from the bessel which is $tilde cal(O)$(mV).
- The signal bandwidth extends up to ~10 Hz given the very slow decay. In CUORE-0 a sampling rate of 125 Hz was used, but in CUORE, we use the maximum available sampling frequancy, 1000 Hz digitization frequency to leverage more complicated noise rejection procedures in post DAQ through purely digital means.
- The digitizers are also monitored for synchronicity and triggered by the master-chassis at the beginning of each data taking and periodically.
- Proper synchronization is important for jitter calculations and thus proper characterization of coincident events.
