#import "../common.typ": *

== Experimental Setup

=== LNGS

- Since the very first days of #teo2 detectors, LNGS has been the home (1989 22g crystal).
- 100km away from Rome, located at the heart (pun intended) of the Apennines, about a kilometer below its largest peak, Corno Grande, CUORE is hosted at LNGS. - With an average 3800 m.w.e rock overburden from the granite peak,
- With the persistant effort of the science community LNGS became a reality with a highway running through the mountain making it one of the only deep underground facilities with that level of access.
- In it's three experimental halls, houses many experiments, including neighbors LEGEND, Xenon 1T etc.
- Above ground complex sits on the foothills below the lift to the corno grande where computing, engineering and offices lie.
- three floor tructure that hosts all CUORE systems and a small adgacent hut used for parts storage in the construction phase (parts DB, and first visit?)

=== CUORE Hut

- Hut: bottom main structure is the cryostat support structue, has the double task of being the mechanical support and also isolating the experiment from seismic noise, isolating it from the host building, and is constructed after deep seismic analysis (?) that measured the responses to seismic events.
- Lower strucure  has .6m thick walls, 4.5x4.5 tall-wide, and rests on rubber bampners with high damping coefficient.
- Top walls: (??) sandfilled (tubular) columns on the corners of the walls support the main support platform which hosts the cryostat.
- Room temperature plat of the cryostat is suspended from the Main support platform (MSP) which, while operating sits at level with the 2nd (1st?) floor ceiling.
- The first floow is the clean room, used for construction with main room holding the cryostat and a level 8(? 10?) clean room used for tower assembly and bonding, and a seperate room used for gluing the chips on to the cryostat also on the same floor.
- Main section of the top floor is converted to a faraday cage where all the electronics sits in the dark,
  - The detector is suspended from seperate mounts in the 3rd floor,
  - The cryogenic systems plumbing is run through sand-filled pipes, wiring and all other connectors are suspended from the ceiling so as not to touch the support plates.
  - walls padded with foams to reduce noise, including that which comes from the cooling fans of the electronics, which can get hot. Seperate (radon abatement and?) ventilation system is installed to keep the floor cool (?)
- The MSP supports the cryostat with 3 steel ropes, each can support 6t of weight.
- neither first or second floor is accessed in ideal data-taking conditions to reduce vibrations.


=== Cryostat

- CUORE cryostat is a state-of-the-art multistage cryogen free cryostat with a capacity of about one cubic meter
  - hence the name, "coldest cubic meter in the known universe"
- Due to the large mass, and need for fast cooldown times, it employs a "fast cooling system" that brings the cryostat to about 35K using liquid He vapors.
- Then it is cooled to 4K using 5 pulse tube coolers.
- Base temperature is reached using a custom designed 3He/4He dialution refrigirator
- Composed of 6 coaxial vessels {300K, 40K, 4K, 600mK-still, 50mK-HEX, 10mK-mixing-chamber}
- 300K and 4K chanbers are vacuum tight creating two sections,
  - OVC (outer vacuum chamber) 5.9m3 volume with min pressure < 10-6 mbar
  - OVC (internal vacuum chamber) - 3.4 m3,  min pressure < 10-8
- very complicated design and fabrication process involving many many parts,
  - Romab Pb casing, Leiden dilution refrigirator, vessels and plates with feedthroughs for cryogens and electronics.
  - Adhered to strict radio-purity standards, 40K, 4K, still built from OVC Copper(99.99% Cu, highest purity commercial copper)
  - Most critical inner parts (MC flanges, plates, TSP, detector frames etc) are NOSV (high conductivity, low H)

==== TSP and Detector suspension

- Detector is suspended from the Tower Support Plate (TSP) which is isolated from the cryostat.
- TSP is inside the IVC below the top lead shield (TL-not mentioned before..), inside the 10mk vessel mechanically suspended from a Y beam that is located above the top of the cryostat (top flange?) using detector suspension bars.
- Each detector suspension bar is a segmented structure that is thermalized at each stage of the cryostat from the Y beam/top flange to the still (this really need validation)
- TSP is then suspended from last(??) thermal contact at still stage by kevlar (k49??) ropes and the last segment is made of high purity Cu.
- TSP is connected to 10mK by four Cu connector with a few dozen thin NOSV Cu sheets to provide thermalizatoin while mechanically isolating them from the cryostat.
- detector suspemsopm share OVC vacuum, using a tube with bellows which are connected to the Y beam and the 600mK via o-rings and to the 4K plate with an indium seal that sepeate the OVC from the IVC.
-Y beam is on top of the cryostat support structure (MSP) and anchred to three mechanical insulators by suspension made by Minus-K (technologies), which acts as a low pass with a cutoff frequency around 0.5Hz. Provides ~ 30dB attenuation of the TSP compared to MSP for the verticle axis.

==== Shields

Pb shields to suppress $gamma$s from natural #u238 and #th232 and daughter decay radiation, with two Pb shields are placed within at cryogenic temperatures.
- Side and bottom shields are made of Roman Pb, 200 depleted ancient Pb ingots from 1st century AD cast in N2 ad assembled in 2015, 6cm thick shield weighing about 5 tonnes, placed inside the IVC and suspended from 600mK plate and thermalized at the 4k stage (to save the cold mass).
- top Pb is inside the IVC as well, below the 10mK plate, above the TSP. It is 30cm thick 2 tonnes of mmodern Pb.

==== Cryo stages? insulation?
- Cooling is proivided by the multistage cryostat with cold masses {1ton at 4K??, 7.4\@40K, 4.5 below 50mK and 1.5 < 10mK}
- super insulation, aluminized silicon multilayer fils on 40K and 4K to limit radiation on low temperature stages.
- Ribbon cables bringing wiring from MC to outside, ~2600 wires thermalized by custom Cu connectors
- Cooling power > 96W \@ 45K, 3.6W \@ 4.2K, 3mW \@ still, 125 uW at HEX and 4uW at MC -> explain these numbers more?
- Cooling is done using three different systems,
  - Fast cooking system circulates filtered 4He gas to IVC to pre-cool the mass down to ~50K, He acts as a heat exhcanger between different stages of the IVC, takes about 2 weeks which cut down the cooling time otherwise would have taken months (??)
  - Then 5 pulse tube coolers, two stage cryomech, with 12W cooling power at 4.2K and 36W at 45K nominal takes over.
    - A series of mechnical decouplers are applied below the top of cryostat where the cryogenic lines come through sand-boxed (wuth quartz powder) and all flext lines are suspended from the ceiling so as not to touch the cryostat/MSP supports.
    - Thermalized at 40K and 4K stages using soft Cu braids.
  - The dilution unit, a 3He/4He fridge, custom made for CUORE from Leiden cryogenics provides cooking down to base temp from about 4K.
    - Nominal power of 3uW at 12mK (2mW at 120 mK) and measured 4uK at 10mK.
- The first cooldown was started in Dec 2016, starting with the fast cooling system, and the PTs were turned on after 4 days reaching 3.4K in about 22 days.
  - The DU was turned on on Jan 2017, and the system reached a based temperature of 6.9 mK after 26 days.
- We measured the first background pulses on the 27th of Jan (26th, really ;) )
