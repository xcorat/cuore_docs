#import "../common.typ": *

== Detector Assembly

The CUORE detector array consists of 988 #teo2 crystals arranged into 19 vertical towers. Following the structural blueprint validated by CUORE-0, each tower comprises 13 floors, with four crystals securely housed on each floor.

=== Crystals
The fundamental building block of the detector is a single #teo2 crystal, instrumented with a dedicated NTD thermistor for signal readout and a silicon heater for thermal stabilization. Each cubic crystal measures $5 times 5 times 5 "cm"^3$ with an exceptionally strict machining tolerance of $± 0.05$ mm per side. Composed of tellurium with a natural isotopic abundance of $~34.2%$ #te130, each unit weighs approximately 750 g, yielding a total active #te130 mass of roughly 206 kg for the entire array.

The crystals were manufactured by the Shanghai Institute of Ceramics (SICCAS) using synthesized ultra-high-purity #teo2 powder. High-precision radio-assay techniques, such as Inductively Coupled Plasma Mass Spectrometry (ICP-MS), were employed throughout the production line to monitor and strictly mitigate both bulk and surface contamination. To prevent cosmogenic activation, the finalized crystals were shipped to Italy exclusively by sea and stored in an underground cleanroom facility upon arrival.

Following the initial crystal growth and acid etching, the boules underwent optical polishing to maintain a strict average surface flatness of $< 0.01$ mm. This tolerance is critical for guaranteeing highly reproducible mechanical and thermal coupling with the surrounding support structures and readout chips. The crystal faces were cut parallel to the $chevron.l 0 "0" 1 chevron.r$, $chevron.l 1 "1" 0 chevron.r$, and $chevron.l 1 "-1" 0 chevron.r$ crystallographic planes. Because the two faces parallel to the $chevron.l 0 "0" 1chevron.r$ plane are structurally harder, they naturally retain a rougher optical finish post-processing, whereas the remaining four softer faces achieve a distinctively shiny finish. Prior to full array integration, samples from each production batch were cryogenically tested in the CUORE Crystal Validation Runs (CCVR) to verify their radiopurity and bolometric performance.

=== NTD Thermistors
Neutron Transmutation Doped (NTD) Germanium thermistors serve as the primary temperature sensors, converting subtle thermal fluctuations into measurable electrical signals. Capable of detecting a temperature change of $~0.1$ $mu$K, these sensors dictate the detector's Signal-to-Noise Ratio (SNR), ultimate energy resolution, and trigger threshold.

The NTDs are fabricated from single-crystal Germanium doped via exposure to a thermal neutron flux. Their resistance follows the Variable Range Hopping relationship $ R(T) = R_0 e^((T_0"/"T)^gamma) $. The parameters $T_0$ and $R_0$ are defined by the neutron fluence and sensor geometry, respectively.

During fabrication, the irradiated germanium wafers were cut to $3 times 2.9 times 0.9 "mm"^3$, polished, and etched. To establish reliable electrical connections at cryogenic temperatures, the contact surfaces were heavily Boron-implanted. This creates a degenerate, metallic layer that ensures a true Ohmic contact—preventing the formation of a nonlinear Schottky barrier—before the surfaces were metallized with layers of palladium and gold. The final chips feature $0.2 times 3.0 "mm"^2$ wrap-around gold pads to optimize the wire bonding process.

To affix the NTDs to the crystals reliably, a custom robotic system was used to deposit a highly uniform matrix of Araldite Standard epoxy dots. This precise matrix ensures a reproducible thermal conductance ($G$) between the crystal absorber and the sensor across all 988 channels. Finally, high-purity gold wires ($25 mu$m diameter) bond the thermistor pads to the readout tracks. For electrical redundancy, each chip is secured with about half a dozen wire bonds on two pads. Under operational conditions at 10 mK, the measured static resistance of these thermistors centers around $~370$ M$Omega$#footnote[Add reference].

=== Heaters
Following the methodology established in prior bolometric arrays, silicon heaters are deployed to dynamically stabilize and calibrate the detectors. By periodically injecting precise quantities of Joule heat, these devices mimic the thermal profile of an actual particle interaction. The resulting thermal pulse shape is nearly identical to a true physics event, allowing the data acquisition system to track and correct for temperature drifts over month-long physics runs.

The heaters are heavily doped silicon chips ($2.33 times 2.41 times 0.52 "mm"^3$) featuring a meander-like resistive structure fabricated via standard planar semiconductor processing. Each heater is equipped with four aluminum contact pads, allowing the bonding configuration to tune the operational resistance to 100 k$Omega$, 200 k$Omega$, or 300 k$Omega$. Glued to the crystal using the same robotic epoxy matrix as the NTDs, they exhibit exceptional radiopurity, with contamination levels strictly below $8 times 10^(-11)$ g/g for #th232 and $1.7 times 10^(-10)$ g/g for #u238#footnote[Add reference].

=== Cu Support Structure and Towers
High-purity NOSV copper was exclusively selected for the mechanical framework because it acts efficiently as both a cryogenic heat bath and a radiopure shield against external background radiation.

The crystals are securely attached within these copper frames using custom polytetrafluoroethylene (PTFE) spacers. These spacers serve a dual purpose: they clamp the absorbers to prevent vibrational noise and establish a precisely calibrated, weak thermal link to the copper heat sink.

Electrical routing for the NTDs and heaters is handled by flexible printed circuit board (PCB) strips made of polyethylene naphthalate (PEN) with high-density copper tracks, commonly referred to as PEN-Cu cables. Each PEN-Cu cable instruments 3 to 4 sensors, with a total of 9 cables routed down each tower. These ribbons handle both the bolometer signal lines and auxiliary diagnostic sensors (such as top and bottom copper frame thermistors) before plugging into dedicated transition cables above the towers, which route the signals outward through the cryostat stages to the room-temperature electronics.

=== Tower Assembly

Maintaining the pristine radiopurity of the components required exceptionally strict environmental controls. The mechanical assembly of the towers—including the gluing of the NTDs and the bonding of the readout wires—was performed inside dedicated glove boxes constantly flushed with nitrogen gas to prevent any contact with the ambient atmosphere.
