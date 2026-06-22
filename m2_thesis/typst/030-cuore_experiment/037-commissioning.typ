#import "../common.typ": *

== Commissioning

=== Cryostat Commissioning
The physical assembly of the CUORE cryostat proceeded in parallel with the data-taking operations of CUORE-0, reaching structural completion in early 2014. Following the decommissioning of CUORE-0, a rigorous cryostat commissioning phase began. This involved multiple cooldowns designed to test and characterize major subsystems individually, with each cryogenic cycle spanning several months.#footnote[Kinda want to include these two images in @sec3.7-vib-iso just because it's funny, everything hanging from 100EUR worth of climbing ropes.. but, maybe not :) ]

#figure(
  placement: auto,
  grid(
    columns: 2,
    row-gutter: 0.5em,
    image("../../images/03-vib_isolation_2015.png", width: 90%),
    image("../../images/03-foam_vibrations.png", width: 90%),
  ),
  caption: [Left: Mini-tower test, initial vibration isolation by hanging everything from the roof,\
   Right: Faraday cage at CUORE data taking stage, with electronics mounted.],
)<sec3.7-vib-iso>

These commissioning runs progressively scaled in complexity. Initial tests verified the dilution refrigerator's capacity to reach base temperature and validated the electronic readout chain. Subsequent runs integrated a "mini-tower" consisting of just eight instrumented crystals. A comprehensive end-to-end test of the cryostat was then performed with both the mini-tower and the top lead shield installed on the Tower Support Plate (TSP). During this run, the cryostat successfully recorded thermal pulses from inserted calibration strings, resolving the 2615 keV #tl208 gamma peak with an energy resolution of $~10$ keV FWHM. Crucially, this run provided essential diagnostic data used to map and mitigate mechanical vibrations and electrical noise. The fourth major test run introduced the massive lateral Roman lead shield at the 4 K stage. While cooling an unprecedented cold mass of 19 tonnes down to 4 K, the system achieved a stable base temperature of 6.3 mK.


=== Detector Installation
Following successful cryogenic commissioning, the delicate detector installation phase commenced in the summer of 2016. This highly critical logistical operation required safely integrating the fragile #teo2 crystals into the cryostat without exposing them to radioactive re-contamination, specifically from airborne radon.

To facilitate this, the first floor of the hut was converted into a strictly controlled Class 1000 cleanroom, housing the cryostat top plate and serving as the tower assembly area. Prior to installation, the fully assembled towers were stored securely in custom containers constantly flushed with nitrogen ($N_2$) gas. Transferring them to the TSP was the singular moment they were exposed to ambient cleanroom air. To prevent radioactive re-contamination from the air during this period, the clean room was continuously flushed with radon-free filtered air#footnote[Rn levels kept $lt.tilde 50 "mBq/""m"^3$ for the entirity of installtion time.], and both radon and atmospheric particle levels were strictly monitored in real-time.

The installation adhered to exceptionally strict protocols. Mechanically and electrically mounting a single tower required a full working day. Once an individual tower was secured to the TSP, they were immediately sealed within an $N_2$-flushed protective bag to prevent further atmospheric exposure. To minimize external exposure, the specialized installation team was prohibited from entering or exiting the cleanroom during a tower's installation. An independent oversight team monitored and logged every motion of the operation to ensure the safety of the detector and the installation team.

The entire installation phase was completed in just over a month, concluding on August 26, 2016. Remarkably, out of the 988 integrated channels, only eight were initially identified as problematic. Half of these were successfully repaired *in situ*, leaving only four channels irreparably disconnected.

#figure(
  placement: auto,
  grid(
    columns: 2,
    row-gutter: 0.5em,
    image("../../images/03-bonding.jpg", width: 90%),
    image("../../images/03-towers_in_clean_room.jpg", width: 90%),
  ),
  caption: [Left:The bonding machine and the setup within the glove box, \
    Right: All 19 towers installed, with the $N_2$ filled bag open.],
)<sec3.7-first-pulse>

=== Final Cooldown
Following the final verification of the internal electronics, the cryostat was permanently sealed. The first full cooldown of the completed CUORE experiment commenced on December 5, 2016. The Fast Cooling System (FCS) was activated first, followed by the Pulse Tubes four days later, successfully chilling the entire mass to 3.4 K in approximately 22 days. The Dilution Unit (DU) was subsequently engaged in early January 2017, smoothly driving the vast experimental volume down to an operational base temperature of 6.9 mK over an additional 26 days. Concluding the commissioning phase, the very first physical background pulses from the fully integrated ton-scale array were successfully recorded on January 26-27, 2017.

#figure(
  placement: auto,
  grid(
    columns: 1,
    row-gutter: 0.5em,
    image("../../images/03-CUORE_pulse.png", width: 80%),
  ),
  caption: [The first official pulse of CUORE],
)<sec3.7-first-pulse>
