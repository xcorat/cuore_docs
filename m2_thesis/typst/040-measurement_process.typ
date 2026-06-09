= Data Taking and Processing <chap:4>

_ Datasets, optimization campaigns, how to start data taking _
_ Data taking/Analysis pipeline. include online, offline processing _

== DAQ

// * The CUORE data acquisition system collects the data coming from the Bessel filter as well as control all the electronics.
// * QDAQ is fairly similar to that was used in CUORE-0, but with some updates to be able to handle a much larger array of bolometric readouts.
// * The hardware sits outside the faraday cage on the same floor as the electronics inside the CUORE control room. Two cabinets host Digitizer modules & the other all the computers, all running SL (6? 5?).
// * There are 6 computers role is reading & triggering the data stream from the digitizers, called 'data readers'.
// * One handles all the DAQ subsystems, building the events and writing the files in final format - Event builder & this is the only one accessible from outside.
// * All readers are connected to the Event Builder through (switch/router?) which is connected to the external network, and is what is used to control, including start-stop runs and WP wearouts, etc.

// **Software - Apollo**

// * Apollo is the data acquisition framework developed for CUORE which handles both the control and data acquisition.
// * Apollo connects the NI driver, and uses ROOT package & is written in C++.
// * Data Reads is the main process running in the reader computers which writes data onto the shared memory that accessible by the Event builder and other processes such as online oscilloscope for visualization of data.
// * Reader process also handles triggering data.
// * The shared memory is a circular buffer which all processes access concurrently while making sure the pointers for each process is ordered properly to make sure there are no possibility of accessing data that has not been passed through the required processes.
// * Trigger process triggers event stream in real-time, and with each channel having its own trigger which can be set independently at, and can run multiple trigger algos at once.
// * There are two triggers, noise & signal, running independently. 'noise' is a random trigger that fires with a given probability per unit of time, and is flagged as such, and are called noise events used to measure mean noise psd.
// * Signal trigger is a derivative trigger designed to activate when the derivative of the waveform exceed the threshold.
// * The parameters of derivative trigger, debounce, average, threshold can be set independently for each bolometer.


// * The reader process also writes data, as continuous waveforms (called continuous files) to files (.RQCF).
== Data taking campaign, and detector optimization
=== dataset
=== Noise reduction
_ PT scans, noise thermometers, seismometers, de-noising _

== Data Processing
=== Triggering
=== Pulse Amplitude
=== Stabilization
=== Energy Calibration
=== Energy Estimator
=== Coincidence and Multiplicity

== Data Analysis
=== Pulse Shape Analysis
=== Blinding
=== Detector Response
=== Exposure and Efficiencies
=== M1 analysis and results
