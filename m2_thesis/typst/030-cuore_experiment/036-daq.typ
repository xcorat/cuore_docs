#import "../common.typ": *

== Data Acquisition (DAQ)

The CUORE Data Acquisition (DAQ) system collects the digitized waveforms downstream from the Bessel filters and acts as the central control hub for all front-end electronics. Conceptually, the architecture mirrors the system successfully deployed in CUORE-0, but incorporates significant software and hardware upgrades to manage the massively scaled array of bolometric readouts.

The DAQ hardware is situated outside the Faraday cage on the second floor, inside the dedicated CUORE control room. The infrastructure is distributed across specialized cabinets: two house the digitizer modules, while a third hosts the computing array, all operating on Scientific Linux. This computing array consists of six dedicated Data Reader computers, tasked with continuously reading and triggering the incoming data streams. A separate, central machine—the Event Builder—manages all DAQ subsystems. It is responsible for assembling the triggered events and writing the final formatted data files to disk. For stringent system security and stability, the Event Builder is the only machine accessible from the external laboratory network. All Data Readers interface with the Event Builder via a secure local network switch, creating an isolated Local Area Network (LAN) that allows operators to safely manage the electronics, initiate data runs, and execute Working Point measurements remotely.

=== Apollo Software Framework
Data collection and system control are governed by *Apollo*, a custom DAQ framework developed specifically for CUORE. Written in C++, Apollo interfaces directly with the National Instruments hardware drivers and leverages the ROOT framework for data structuring.

The `DataReader` is the primary process running on the reader computers. It receives the incoming data and writes it to a shared memory block structured as a circular buffer. Strict pointer management allows concurrent access by the Event Builder and auxiliary diagnostic processes—such as the online oscilloscope—ensuring data is read in a precise chronological sequence without the risk of accessing incomplete fragments. Furthermore, the reader process continuously streams the raw, unfiltered waveforms directly to disk, archiving them as continuous data files (`.RQCF`).

=== Triggering Algorithms
The software trigger evaluates the continuous data stream in real time directly from the shared memory. Because each bolometer possesses unique thermodynamic characteristics, the triggering process can execute multiple algorithms simultaneously with channel-independent configurations.

Two primary triggers operate concurrently: the noise trigger and the signal trigger. The noise trigger is an artificial, random trigger that fires at a predefined probability per unit of time. These randomly sampled events are explicitly flagged and utilized offline to construct the Average Noise Power Spectrum (ANPS), providing an unbiased measurement of the detector's baseline noise.

Conversely, the signal trigger utilizes a discrete derivative algorithm, designed to activate whenever the slope of a waveform exceeds a predefined threshold. To optimize individual channel sensitivity, the specific parameters governing this trigger—namely the derivative threshold, moving average window, and debounce time—are empirically tuned for each bolometer.
