#import "../common.typ": *

== Detector Assembly

- The CUORE detector array consists of 988 #teo2 crystals arranged into 19 vertical towers. Following the blueprint established by CUORE-0, each tower comprises 13 floors, with four crystals housed on each floor.

=== Crystals
- The fundamental building block of the detector is a single #teo2 crystal instrumented with a dedicated NTD thermistor for signal readout and a silicon heater for thermal stabilization and calibration.
- Each cubic crystal measures $5 times 5 times 5 "cm"^3$ with an exceptionally strict machining tolerance of $± 0.05$ mm per side. The crystals are composed of tellurium with a natural isotopic abundance of $~34.2%$ #te130. Each unit weighs approximately 750 g, bringing the total active #te130 mass to roughly 206 kg.
- The crystals were manufactured between 2009 and 2013 by the Shanghai Institute of Ceramics (SICCAS) under rigorous quality and radiopurity protocols.
  - High-sensitivity#footnote[sensitivity? purity?] techniques, such as Inductively Coupled Plasma Mass Spectrometry (ICP-MS), were employed along the entire production line to monitor and mitigate both bulk and surface contamination.
- To prevent cosmogenic activation, the finalized crystals were shipped to Italy exclusively by sea.
- The growth process utilized ultra-high-purity #teo2 powder(*validate??*). Following the crystal growth and subsequent acid etching, the boules were subjected to preliminary cutting and rough shaping before undergoing final optical polishing and packaging, all of which were performed within dedicated cleanrooms.
- A strict average surface flatness of $< 0.01$ mm was maintained to guarantee highly reproducible mechanical and thermal coupling with the surrounding tower support structures and readout chips.
- The faces of the crystals were cut parallel to the $(0 0 1)$, $(1 1 0)$, and $(1 -1 0)$ crystallographic planes. The two faces parallel to the $(0 0 1)$ plane are structurally harder, while the remaining four faces are comparatively softer #footnote[add: The two faces parallel to the (0 0 1) plane are structurally harder, which results in a rougher optical finish after processing, while the remaining four softer faces achieve a comparatively shiny finish]
- Upon arrival, the crystals were triple-vacuum-packed and stored underground in the parts storage hut to isolate them from environmental and cosmogenic backgrounds.
- Ten crystals from each production batch were cryogenically tested in the CUORE Crystal Validation Runs (CCVR) to verify their radiopurity and bolometric performance prior to integration.

=== NTD Thermistors
- Neutron Transmutation Doped (NTD) Germanium thermistors serve as the primary temperature sensors (as described in Section *XXX*), converting subtle thermal fluctuations into electrical signals read by room-temperature electronics.
- These sensors possess extraordinary sensitivity, capable of detecting a typical temperature change of $~0.1$ $mu$K, which is critical for maximizing the Signal-to-Noise Ratio (SNR) and defining the detector's energy resolution and threshold.
- The NTDs are fabricated from single-crystal Germanium doped via exposure to a thermal neutron flux. As established previously, the resistance follows $R(T) = R_0 e^((T_0"/"T)^gamma)$, where $T_0$ is defined by the neutron fluence (doping level), and $R_0$ is dictated by a combination of the doping level and the sensor geometry. The target parameters were $T_0 = 4$ K and $R_0 = 1$ k$Omega$, yielding an operational resistance of $~0.5$ $Omega$ at 10 mK.
- During fabrication, the irradiated germanium wafers were cut, optically polished, and etched with a mixture of nitric and hydrofluoric acids. To ensure reliable electrical contact, they were Boron-implanted #footnote[boron implantation is done to ensure reliable electrical contact? ohmic barrier vs schottky barrier?] and metallized with layers of palladium and gold at Lawrence Berkeley National Laboratory (LBNL).
- The final chip dimensions are $3 times 2.9 times 0.9 "mm"^3$. They feature $0.2 times 3.0 "mm"^2$ gold pads that wrap around the parallel sides of the sensor. This wrap-around geometry was selected after rigorous testing to ensure optimal compatibility with the wire bonding process.
- High-purity gold wires with a 25 $mu$m diameter (certified to $< 1.0 times 10^(-9)$ g/g of $232$Th) bond the thermistor pads to the readout copper pads. For electrical redundancy and mechanical stability, each chip is secured with approximately 5 to 10 wire bonds.
- Sample thermistors were cryogenically tested down to 12 mK and registered remarkable radiopurity ($< 1 times 10^(-9)$ g/g of $238$U). In practice, at the 10 mK base temperature, their measured operating resistance reaches $~370$ M$Omega$ (with operational parameters $R_0 = 3.84$ $Omega$ and $T_0 = 1.13$ K).
- *[Note to be expanded]*: The NTDs are precisely affixed to the crystals using a specialized gluing matrix consisting of highly reproducible automated glue spots.#footnote[need gluing related info here a bit more...]

=== Heaters
- Following the methodology established in CUORECINO and CUORE-0, silicon heaters are used to dynamically stabilize and calibrate the detector array by periodically injecting known energy pulses into each crystal.
- These heat injections are meant to emulate "the thermal profile of a particle decay" (*?*) energy deposition (with preset calibration energies spanning from $~300$ keV to 3 MeV).
- The heaters are heavily doped silicon chips measuring $2.33 times 2.41 times 0.52 "mm"^3$, featuring a meander-like resistive structure fabricated via standard planar semiconductor processing.
- Each heater is equipped with four aluminum contact pads, allowing it to be bonded in different configurations to provide a tunable resistance of 100 k$Omega$, 200 k$Omega$, or 300 k$Omega$. They exhibit exceptional radiopurity, with contamination levels strictly below $8 times 10^(-11)$ g/g for $232$Th and $1.7 times 10^(-10)$ g/g for $238$U.

=== Cu Support Structure and Towers
- Copper was exclusively selected for the mechanical framework because it acts both as an efficient thermal sink and as a radiopure shield for the largest inactive surfaces immediately facing the crystals.
- These structural elements are used to assemble the 19 towers, each holding 52 crystals in a $2 times 2 times 13$ configuration.
- The tower frames are machined from high-purity NOSV copper. The crystals are securely suspended within these frames using custom polytetrafluoroethylene (PTFE) spacers, which simultaneously clamp the absorbers and establish a precisely calibrated, weak thermal link to the copper heat bath.
- The NTDs and heaters are electrically connected via flexible printed circuit board (PCB) strips made of polyethylene naphthalate (PEN) with high-density copper tracks, commonly referred to as PEN-Cu cables.
- Each PEN-Cu cable instruments 3 to 4 sensors, with a total of 9 cables routed down each tower. These handle both the bolometer signal lines and auxiliary diagnostic sensors, such as the top and bottom thermistors attached directly to the copper frame to monitor thermal gradients.
- Above the top floor of the tower, these flexible ribbons are plugged into dedicated transition ribbon cables that route the signals continuously outward through the cryostat stages.
