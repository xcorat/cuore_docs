#import "../common.typ": *

== Experimental Structure

=== LNGS
- Since the pioneering operation of a 22 g #teo2 crystal in 1989, the Laboratori Nazionali del Gran Sasso (LNGS) has been the permanent home of this bolometric research program.
- Located roughly 100 km from Rome, LNGS is situated at the heart (pun intended) of the Apennine Mountains, roughly a kilometer below its largest peak, Corno Grande. This granite mountain provides an average rock overburden of 3800 meters of water equivalent (m.w.e.).
- Thanks to the persistent efforts of the scientific community, LNGS was constructed in tandem with a highway tunnel running through the mountain, making it one of the only deep underground facilities in the world with direct, drive-in access.
- Its three vast experimental halls host numerous rare-event searches, including CUORE and neighboring experiments such as LEGEND and XENON1T.
- The above-ground campus sits at the foothills below the Corno Grande cable car, housing the computing centers, engineering workshops, and administrative offices.#footnote[this is a bit off, do we need this? or how best to edit this?]
- Underground, CUORE is housed in the highway-side of Hall A (*?*).

=== CUORE Hut
- The primary underground infrastructure is the CUORE hut, a dedicated three-story structure containing all experimental systems, alongside a small adjacent hut that served as a parts storage area during the construction phase.
- The bottom section of this hut acts as the main cryostat support structure. Designed following a deep seismic response analysis, it fulfills the dual role of bearing the experiment's weight while mechanically isolating it from the host building and ambient seismic noise.
- This lower structure features 0.6 m thick walls, measures $4.5 times 4.5 "m"^2$ in footprint, and rests on rubber bumpers with a high damping coefficient.
- At the corners of the walls, sand-filled tubular columns support the Main Support Plate (MSP), the massive platform that holds the cryostat.
- The room-temperature top flange of the cryostat is suspended directly from this MSP using three heavy-duty steel ropes, each rated to support 6 tonnes. During operation, the MSP sits flush with the ceiling of the first floor.
- The first floor serves as the primary cleanroom environment. It contains the main cryostat area, a Class 10 (or Class 1000) cleanroom dedicated to tower assembly and wire bonding, and a separate room utilized for gluing the thermistor chips onto the crystals.
- The top floor was converted into a massive Faraday cage to house all the sensitive readout electronics in electromagnetically shielded darkness.
  - The detector itself is suspended from separate, isolated mounts located on this second floor.#footnote[probably should mention the Y beam and the TSP here? it is expanded on later though]
  - To drastically reduce vibration transmission, the cryogenic plumbing is routed through sand-filled pipes, and all wiring and connectors are suspended directly from the ceiling to avoid contact with the support plates.
  - Furthermore, the walls are padded with acoustic foam to dampen airborne noise, particularly from the electronics cooling fans. A dedicated ventilation and radon abatement system keeps this floor cool and radiopure.
- To minimize human-induced vibrations, neither the first nor the second floor is accessed during ideal data-taking conditions.

=== Cryostat
- The CUORE cryostat is a state-of-the-art, multistage, cryogen-free dilution refrigerator with an internal capacity of approximately one cubic meter—earning it the moniker of the "coldest cubic meter in the known universe."
- Due to the massive payload and the need for practical cooldown times, it employs a Fast Cooling System (FCS) that utilizes liquid Helium vapors to pre-cool the mass down to roughly 35 K.
- From there, five Pulse Tube (PT) cryocoolers drive the temperature down to ~4 K.
- The operational base temperature is achieved using a custom-designed #super[3]He/#super[4]He Dilution Unit (DU).

==== Vessels
- The cryostat is composed of six nested, coaxial vessels corresponding to the different thermal stages: 300 K (room temperature), 40 K, 4 K, 600 mK (Still), 50 mK (Heat Exchanger/HEX), and 10 mK (Mixing Chamber/MC).
- The 300 K and 4 K vessels are vacuum-tight, partitioning the system into two distinct vacuum regions:
  - *Outer Vacuum Chamber (OVC):* $5.9 "m"^3$ volume with a minimum pressure $< 10^(-6)$ mbar.
  - *Inner Vacuum Chamber (IVC):* $3.4 "m"^3$ volume with a minimum pressure $< 10^(-8)$ mbar.
- The design and fabrication process was enormously complex, integrating the Roman lead shielding casing, the Leiden dilution refrigerator, and numerous vessels equipped with specialized feedthroughs for cryogens and electronics.#footnote[too wordy and fluffy, remove unnecesasry and redundant stuff]
  - Strict radiopurity standards dictated material selection: the 40 K, 4 K, and 600 mK vessels were constructed from OFE copper (99.99% purity, the highest available commercial grade).
    - The most critical inner components (MC flanges, thermal plates, the TSP, and detector frames) were machined from NOSV copper, an ultra-pure alloy selected for its high thermal conductivity and low hydrogen content.

==== TSP and Detector Suspension (DS) #footnote[this section is a bit too detailed for our M2 related thesis I think]
- To shield it from vibrations, the detector array is suspended from the Tower Support Plate (TSP), which is mechanically isolated from the cryostat vessels.
- The TSP is located inside the IVC, below the top lead shield and within the 10 mK vessel. It is suspended from a dedicated Y-shaped beam situated above the room-temperature top flange of the cryostat via specialized detector suspension bars.
- Each detector suspension (DS) bar is a segmented structure that is carefully thermalized at each successive cryostat stage down to the Still (600 mK).
- From this final thermal contact at the Still stage, the TSP is hung using low-thermal-conductivity Kevlar (Kevlar-49) ropes, with the terminal segment fabricated from high-purity copper.
- While mechanically isolated, the TSP must still be cooled. It is thermally linked to the 10 mK Mixing Chamber plate by four flexible copper connectors, each made of dozens of ultra-thin NOSV copper leaves. This provides necessary thermalization while preventing the transmission of mechanical vibrations.
- The suspension rods share the OVC vacuum environment. They are housed inside tubes equipped with bellows at both ends, which are rigidly connected to the Y-beam and sealed to the 300 K plate with an O-ring, and they separate the OVC from the IVC at the 4 K plate with an indium seal.
- Crucially, the external Y-beam rests on top of the Main Support Plate (MSP) and is anchored to three Minus-K technology negative-stiffness mechanical isolators. This system acts as a low-pass mechanical filter with a cutoff frequency of approximately 0.5 Hz, providing roughly 30 dB of vertical vibration attenuation for the TSP relative to the MSP.

==== Shields
- Heavy lead shielding is utilized to suppress environmental $gamma$ rays originating from the natural $238$U and $232$Th decay chains. Uniquely, two enormous lead shields are integrated directly into the cryogenic volumes.
- The side and bottom shields are constructed from ancient Roman lead. Recovered from a 1st-century AD shipwreck, these 200 ingots have completely depleted their $210$Pb radioactive isotope inventory. The lead was melted and cast in a nitrogen atmosphere before being assembled in 2015. This 6 cm thick shield weighs approximately 5 tonnes. It is situated inside the IVC, mechanically suspended from the 600 mK plate, but thermally anchored to the 4 K stage "to save the coldest masses from the thermal load" (*?*).
- The top lead shield is also located inside the IVC, positioned directly above the TSP and below the 10 mK Mixing Chamber plate. It is a 30 cm thick block of modern lead, weighing roughly 2 tonnes.

==== Cryo Stages
- Cooling is provided by the massive multistage cryostat, which must chill unprecedented cold masses: $~7.4$ tonnes at 40 K, $~1$ tonne at 4 K, $~4.5$ tonnes below 50 mK, and roughly 1.5 tonnes at the $tilde 10$ mK stage.
- To limit radiative heat transfer to the lowest temperature stages, aluminized multi-layer silicon films (superinsulation) are wrapped around the 40 K and 4 K vessels.
- Ribbon cables route the signals, carrying approximately 2600 wires from the Mixing Chamber to the room-temperature exterior. These wires are progressively thermalized at each temperature stage using custom copper connectors.
- The multi-stage cooling process operates in three primary phases, delivering impressive cooling powers (> 96 W at 45 K, 3.6 W at 4.2 K, 3 mW at the Still, 125 $mu$W at the HEX, and 4 $mu$W at the MC):
  - *Fast Cooling System (FCS):* The FCS initiates the cooldown by circulating filtered #super[4]He gas through the IVC. The helium gas acts as a convective heat exchanger between the different stages, pre-cooling the mass down to $~50$ K. This takes about two weeks, drastically cutting down a process that would otherwise take months relying on "*conduction alone/traditional cryogenic methods?*"
  - *Pulse Tube (PT) Coolers:* Next, five two-stage Cryomech pulse tubes take over, each providing a nominal 12 W of cooling power at 4.2 K and 36 W at 45 K. To prevent the PTs from introducing vibrations, mechanical decouplers are employed just below the top of the cryostat. The cryogenic lines pass through quartz-powder sandboxes, and all flexible lines are suspended from the ceiling to avoid contacting the MSP. Inside, they are thermalized to the 40 K and 4 K vessels using soft copper braids.
  - *Dilution Unit (DU):* Finally, the custom Leiden Cryogenics #super[3]He/#super[4]He dilution refrigerator drives the inner mass from 4 K down to the operational base temperature. The DU boasts a nominal cooling power of 3 $mu$W at 12 mK (2 mW at 120 mK), and has empirically measured 4 $mu$W at 10 mK.

=== Calibration System

- Proper calibration of energy deposited from the pulse parameters to energy is vital for achieving target resolution / sensitivity.
- The detector response must be modeled accurately for this, and require a set of peaks with high enough statistics.
- Calibration is done by identifying the peaks in the spectrum of pulse amplitudes and fitting an analytical function that convert the amplitude spectrum into energy using the identified peaks.
- The CUORE deploy calibration sources and collect spectra specifically for this task (called calibration runs).
- First 2 datasets used DCS (Detector Calibration System) that deployed thoriated tungsten (#th232) within the cryogenic detector volume providing uniform illumination ($tilde 100"mBq"$) - high enough statistics w/o too much pileup.
- #th232 chain introduces #tl208 decay peak (main) at 2615 keV, and is (one of) the major calibration peaks used in CUORE due to given it is the closest to the $Q_(beta beta)$ value.
- After first 3 datasets, DCS was retired and replaced with an external calibration system (EDCS) which deployed calibration strings outside the cryostat's Pb shield and uses #co60 sources in addition to the #th232 and introduces the two $gamma$ peaks from #co60 to the calibration spectrum (the first dataset of EDCS used only #th232). #footnote[maybe briefly mention the leaks and reasons for retiring?]
- EDCS illuminates inner bolometers less, $tilde 40 - 50 "mHz"$ for outer channels or $tilde 10 - 20"mHz"}$ for inner.
