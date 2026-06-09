#import "../common.typ": *

== Detector Assembly

- Consists of 988 TeO₂ crystals arranged into 19 towers, with each with 13 floors of 4 crystals similar to CUORE-0.

=== Crystals

- The Basic unit of the detector is the crystal with its attached NTD thermistor and the heater/pulser for stabilization/calibration)
each crystal is 5cm×5cm×5cm w/ TeO₂ crystal w/ natural abundant Te (@ 34.0X%) ~ 206 kg total, with 750g ± (?), with very low tolerance in size, each side at 50mm ± 0.05 mm.
- They are instrumented with the NTD thermistor and a silicon pulser each.
// - Mounted on to the copper assembly with PTFE spacers (?)
- crystals were manufactured from 2009-2013 by Shanghai Inst Ceramics, SICCAS, w/ rigorous quality & radiopurity controls.
  - High-sensitivity radiopurity tests were done to guard against and measure the bulk and surface contamination (ICP-MS) along the entire production line.
- Final crystals were shipped to Italy by sea to minimize cosmogenic activation
- crystals were grown from high purity TeO₂, starting with (purity??) powder, acid etched(??)
- After growth they were subject to cutting and rough processing before the final polishing and packaging. All were done in dedicated clean rooms.
- Average flatness < 0.01 mm to ensure reproducible thermal and mechanical coupling with the tower support structures and chips.
- the faces of the crystals (cut) to be parallel to (0 0 1), (1 1 0) and (1 -1 0) crystal planes. two faces parallel to (0 0 1) are hard(less transparent? rough?) & rest softer.
- The crystals were stored underground triple vacuum packed (?? this is true for for all comps?) in the parts storage hut.
- ten crystals from each production batch were tested cryogenically to test for radiopurity & cryogenic/bolometric performance (in the CCVR - CUORE Crystal Validation Runs) tests.

=== NTD
- NTD Germanium thermistor serves as the temperature sensor as desctibed in *XXX*, converting the signal to electrical signal readable from outside. — room temp electronics).
- Able tp detect a typical temperature change of ~ 0.1 μK, which is crucial in determining SNR and hence the resolution & threshold.
- NTDs are made using Germanium single crystals doped by exposure to thermal neutrons,
- (mentioned before: R(T) = R₀ e^(T₀/T); T₀ → by doping level, (neutron fluence), R₀ → doping level + geometry. targets T₀=4K, R₀=1kΩ), ~0.5 Ω \@ 10mK
- Irradiated thermistors were cut, optically polished, etched with nitric acid & HF. Then Boron implanted (compensation?), then metallized w/ palladium & gold \@ LBNL.
- Chip dimensions: 3mm × 2.9mm × 0.9 (or 1?) mm) with gold pads along the sides (0.2 × 3.0) on parallel sides. Gold pads wrap around the sensor, this was chosen after rigorous testing to be compatible with bonding
- Gold wires with a diameter of 25 μm ( $<1.0 times 10^(-9)$ g/g #th232 ) is bonded to the gold pads connecting them to the Cu pads. Each chip has about (does the number of bonds change the average pulse characteristics?) 5-10 (8? usually 3-4 each side) wires bonded for redundancy.
- Some were selected to test down to 12mK and register  < $1 times 10^(-9)$ g/g #u238
- measured ~ R₀=3.84 \@ T₀=1.13 Ω → ~370 MΩ \@ 10 mK
- *ADD* GLUING? SPOTS?

=== Heaters

- as was done in CUORECINO and CUORE-0, we use silicone heaters to calibrate the detector by periodically injecting known energy pulses into each crystal tower.
- These energy pulses emulate energy deposit from decays, (300keV, 3MeV? -- what are the preset values we used?)
- There are 2.33 × 2-41 × 0.52 mm3 "heavily doped" meander through standard silicone resistors made through a planar process(?).
- 4 Al pads allow for resistances 100 kΩ, 200 kΩ, 300 kΩ and contaminant levels below 8×10-11 / 1.7×10-10 g/g  for #th232 & #u238

=== Cu Support Structure and Towers

- Cu used for structure to shield the largest inactive mass and surface that is close to the crystal.
- these are used to assemble 2×2×13 towers of 52 crystals.
- The frame of the tower made of NOSV Cu, and also acts as a heat sink.
- crystals are held in frames with PTFE spacers, weak thermal link to heat bath
- heaters & NTD's are attached to copper-nickel flexible polythene naphthalene PCB strips w/ high density Cu wires (PENCu cables)
- each cable instruments 3-4 sensor fibers and total 9 per tower inc. other sensors like the (top?/) bottom thermistor that is attached to the copper frame (?)
- past top of the tower ribbons plugged into NTD crystal ribbon cables after
