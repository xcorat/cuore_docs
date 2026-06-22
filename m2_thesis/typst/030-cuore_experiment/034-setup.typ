#import "../common.typ": *

== Experimental Setup

=== LNGS
Since the pioneering operation of a 22 g #teo2 crystal in 1989, the Laboratori Nazionali del Gran Sasso (LNGS) has been the permanent home of this bolometric research program. Situated in the Apennine Mountains beneath Corno Grande, the granite mountain provides an average rock overburden of 3600 meters of water equivalent. This immense shielding suppresses the cosmic muon flux by six orders of magnitude relative to the surface, a strict necessity for ton-scale rare-event searches. The underground complex features three vast experimental halls, with CUORE operating inside Hall A. Supporting infrastructure, including computing centers and mechanical workshops, is conveniently located at the above-ground campus at the mountain's foothills.

=== CUORE Hut
The primary infrastructure within Hall A is the CUORE hut, a dedicated three-story structure designed to operate the experiment while isolating it from environmental and seismic noise. The ground floor acts as the main foundational support, featuring a $4.5 times 4.5 "m"^2$ footprint with 0.6 m thick walls resting on high-damping rubber bumpers. At its corners, sand-filled columns hold the Main Support Plate (MSP), a massive platform from which the room-temperature top flange of the cryostat is suspended.

The first floor serves as the primary Class 1000 cleanroom environment, housing the main cryostat area and dedicated spaces for tower assembly and thermistor gluing. The top floor functions as a massive Faraday cage, encapsulating the sensitive readout electronics to shield them from electromagnetic interference. To drastically reduce vibration transmission from these operational areas to the detector, the cryogenic plumbing is routed through sand-filled pipes, and all wiring and connectors are suspended directly from the ceiling to avoid contact with the support plates. Furthermore, the walls are padded with acoustic foam to dampen airborne noise from electronics cooling fans. To minimize human-induced vibrations, the cleanroom and electronics floors remain strictly unaccessed during ideal physics data-taking.

=== Cryostat
The CUORE cryostat is a custom-designed, multistage, cryogen-free dilution refrigerator enclosing an experimental volume of approximately one cubic meter. Designed to provide uninterrupted temperature stability over timescales of several years, it represents a monumental leap in low-temperature physics. Specifically, the system achieves a 20-fold improvement in experimental volume and target mass compared to the previous state of the art at this temperature scale; prior to CUORE, comparable target masses had only been successfully cooled down to 65 mK by the resonant-mass gravitational antenna community#footnote[Add reference 2021 Nature]. Cooling an unprecedented detector mass in a practical timeframe requires a massive three-phase system: a Fast Cooling System (FCS), five Pulse Tube (PT) cryocoolers, and a high-power #super[3]He/#super[4]He Dilution Unit (DU).

==== Vessels
The system consists of six nested, coaxial vessels corresponding to distinct thermal stages: 300 K (room temperature), 40 K, 4 K, 600 mK (Still), 50 mK (Heat Exchanger), and 10 mK (Mixing Chamber). The 300 K and 4 K vessels are entirely vacuum-tight, partitioning the system into two distinct vacuum regions. The Outer Vacuum Chamber (OVC) boasts a volume of 5.9 $m^3$ with a minimum pressure lower than $10^(-6)$ mbar, while the Inner Vacuum Chamber (IVC) encompasses 3.4 $m^3$ with a minimum pressure strictly below $10^(-8)$ mbar#footnote[Add references].

To meet the experiment's strict radiopurity targets, the 40 K, 4 K, and 600 mK vessels were fabricated from high-purity OFE copper. The innermost components—including the 10 mK Mixing Chamber flanges, thermal plates, and detector frames—were machined from ultra-pure NOSV copper, selected for its exceptional thermal conductivity and low radioactive background.

==== TSP and Detector Suspension (DS)
To isolate the bolometers from mechanical vibrations, the detector array is suspended from the Tower Support Plate (TSP), which is structurally decoupled from the cryostat vessels. The TSP hangs from an external Y-shaped beam situated above the cryostat. Crucially, this Y-beam rests on the MSP via three Minus-K negative-stiffness mechanical isolators. This suspension system acts as a mechanical low-pass filter with a cutoff frequency of approximately 0.5 Hz, providing roughly 30 dB of vertical vibration attenuation for the detector array.

While mechanically isolated via low-thermal-conductivity materials, the TSP must still be cooled to base temperature. It is thermally anchored to the 10 mK Mixing Chamber plate using four flexible copper connectors—each composed of dozens of ultra-thin NOSV copper leaves—which provide the necessary thermalization while preventing the transmission of rigid mechanical vibrations#footnote[Add radio assay and other radio-purity measurement results of the copper parts here?].

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 0.5em,
    image("../../images/03-Hut_ShieldingDown_02.png", width: 90%),
  ),
  caption: [CUORE hut setup and Cryostat support structure.],
)<sec3.4-cuore-structure>

==== Shields
Heavy lead shielding is integrated directly into the cryogenic volumes to suppress environmental $gamma$ rays originating from the natural #u238 and #th232 decay chains. A 6 cm thick lateral and bottom shield, weighing approximately 5 tonnes, surrounds the detector array. It is constructed from ancient Roman lead recovered from a 1st-century AD shipwreck, prized because its #super[210]Pb radioactive isotope inventory has completely decayed over the millennia. This Roman lead shield is suspended inside the IVC from the 600 mK plate but is thermally anchored to the 4 K stage; this intercepts the radiative heat load, preventing it from overwhelming the ultra-cold 10 mK stage. Additionally, a 30 cm thick top shield of modern lead (roughly 2 tonnes) sits directly above the TSP, thermally anchored at 50 mK stage. Finally, environmental neutrons are heavily suppressed by a 20 cm layer of polyethylene and a thin layer of boric acid ($"H"_3"BO"_3$) situated just outside the external room-temperature lead shield.

==== Cryo Stages
The multistage cooling process manages an immense thermal mass: $~7.4$ tonnes at 40 K, $~1$ tonne at 4 K, and roughly 1.5 tonnes at 10 mK. Cooldown initiates with the Fast Cooling System (FCS), which circulates filtered #super[4]He gas through the IVC. This convective heat exchange cools the system to $~50$ K in roughly two weeks—drastically accelerating a process that would otherwise take months relying purely on conduction across weak thermal links in a vacuum#footnote[Maybe add a parahraph on the dil-fridge operational mechanics and what the still, MC, HEX etc means?].

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 0.5em,
    image("../../images/03-cryostat_3q.png", width: 90%),
  ),
  caption: [CUORE Cryostat],
)<sec3.4-cryostat>

Next, five Cryomech PT coolers drive the temperature down to 4 K. To prevent the PT motors from introducing vibrations, mechanical decouplers are employed, and their flexible lines are suspended to avoid contacting the MSP. Finally, a custom Leiden Cryogenics #super[3]He/#super[4]He Dilution Unit takes over, driving the inner mass from 4 K down to the operational base temperature of roughly 10 mK.

// ==== Mechanical Vibrations
// To further mitigate environmental noise, the detector array is suspended from the Tower Support Plate (TSP), which hangs from an external Y-beam [13]. This structure is mechanically decoupled from the primary cryostat support by a Minus-K negative-stiffness isolation system [3]. Acting as a tunable mechanical low-pass filter with a cutoff frequency of approximately 0.5 Hz, the Minus-K system provides approximately 30 dB of attenuation against seismic and structural vibrations specifically along the vertical axis [3]. A comprehensive detailing of the physical dampening structures and the mechanical isolation campaign is provided in Chapter 3.

=== Calibration System<sec3.4-calib>
Accurate energy calibration is essential for converting measured thermal pulse amplitudes into physical deposited energies. This requires periodically illuminating the detectors with known radioactive sources to map the detector response and correct for thermal non-linearities.

Initially, CUORE utilized the internal Detector Calibration System (DCS). This system mechanically lowered thoriated tungsten (#th232) strings directly into the 10 mK cryogenic volume, providing uniform illumination and high statistics without excessive pileup. The #th232 chain introduces a sharp #tl208 decay peak at 2615 keV, which serves as the primary calibration reference due to its proximity to the #te130 $Q_(beta beta)$ value.

However, deploying strings into the innermost cryostat layers posed risks of mechanical friction and potential cryogenic leaks from the guiding tubes. Consequently, the internal DCS was retired after the first three datasets. It was replaced by an External Detector Calibration System (EDCS), which safely deploys strings just outside the cryostat's lead shielding. While the EDCS results in a lower event rate for the innermost channels ($tilde 10 - 20$ mHz compared to $tilde 40 - 50$ mHz for outer channels), it eliminates the risk to the cryostat's vacuum integrity. Furthermore, the EDCS utilizes #co60 sources in addition to #th232, successfully introducing two additional distinct $gamma$ peaks to refine the calibration spectrum.
