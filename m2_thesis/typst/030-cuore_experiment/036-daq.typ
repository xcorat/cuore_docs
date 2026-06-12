#import "../common.typ": *


== DAQ

- The CUORE Data Acquisition (DAQ) system collects the digitized waveforms downstream from the Bessel filters and acts as the central control hub for all front-end electronics.
- Conceptually, the CUORE DAQ architecture is similar to the system deployed in CUORE-0, though it incorporates significant software and hardware updates necessary to handle the massively scaled array of bolometric readouts.
- The DAQ hardware is situated outside the Faraday cage on the second floor, inside the dedicated CUORE control room. The hardware is distributed across specialized cabinets: two cabinets house the digitizer modules, while another hosts the computing infrastructure. All computers operate on Scientific Linux (SL).
- The computing array consists of six dedicated "Data Reader" computers, whose primary role is to continuously read and trigger the incoming data streams from the digitizers.
- A separate, central machine called the "Event Builder" manages all DAQ subsystems. It is responsible for assembling the triggered events and writing the final formatted data files to disk. For system security and stability, the Event Builder is the only machine accessible from the external network.
- All Data Readers interface with the Event Builder via a local network switch (*router?*). Through this network infrastructure, operators can remotely control all the electronics, including starting or stopping data runs and executing Working Point (WP) measurements.

=== Software - Apollo
- *Apollo* is the custom data acquisition framework developed for CUORE to handle both system control and data collection. Written in C++, Apollo interfaces directly with the National Instruments (NI) hardware drivers and leverages the ROOT data analysis framework.
- The `DataReader` is the primary process running on the reader computers. It receives incoming data and writes it to shared memory, making it seamlessly accessible to the Event Builder and auxiliary processes, such as the online oscilloscope used for real-time visualization.
- The reader process is also responsible for executing the software triggering algorithms.
- The shared memory is structured as a circular buffer that all processes access concurrently. Strict pointer management ensures that data is accessed in the correct chronological sequence eliminating the risk of downstream processes reading incomplete or unverified data.
- The trigger process evaluates the continuous data stream in real time. Each detector channel features independent trigger configurations and the process has the capability to run multiple trigger algorithms simultaneously.
- Two primary triggers operate independently: the "signal" trigger and the "noise" trigger. The noise trigger is a forced, random trigger that fires at a predefined probability per unit of time. These randomly sampled events are explicitly flagged and utilized offline to measure the detector's noise by constructing the Average Noise Power Spectrum (ANPS).
- The signal trigger is a derivative algorithm designed to activate whenever the slope of a waveform exceeds a predefined threshold. The specific parameters governing this trigger—namely the threshold, average time, and debounce time—can be tuned independently for every bolometer to optimize sensitivity.
- In addition to saving triggered events, the reader process continuously streams the raw, unfiltered waveforms directly to disk, archiving them as continuous data files (`.RQCF`).
