#import "common.typ": *

= CUORE Experiment <chap:3>

== Introduction to CUORE

Among contemporary 0#nbb experiments, CUORE employs a somewhat unique approach to achieve both ton-scale active mass and exceptionally high energy resolution. This is made possible by combining the ultra-cold bolometric technique with the direct use of the high natural abundance #te130 isotope. CUORE represents the culmination of a decades-long saga of bolometric 0#nbb searches. Successive precursor experiments systematically resolved profound engineering challenges, yielding incremental but vital improvements in background radiation mitigation, noise reduction, and cryogenic scalability.

To achieve its target sensitivity, the experiment relies on a highly modular architecture. The core detector array comprises 988 #teo2 crystals, which function simultaneously as the primary 0#nbb source volume and the thermal energy absorber. These macro-calorimeters are instrumented with highly sensitive Neutron Transmutation Doped (NTD) Germanium thermistors and designed to operate at a stable base temperature of 10 mK. Reaching and maintaining this extreme thermal state for a ton-scale mass requires a massive, custom-built, multistage cryogen-free dilution refrigerator.

Operating such a massive and thermally sensitive array demands pristine environmental isolation. To severely suppress internal and environmental radioactivity, the cryostat itself incorporates nested layers of ancient Roman and modern lead shielding. Furthermore, the entire apparatus is housed within a dedicated infrastructure—the CUORE hut—which is equipped with sophisticated mechanical suspensions and a continuous Faraday cage to explicitly isolate the delicate detectors from seismic vibrations and electromagnetic noise. Finally, to adequately attenuate the cosmic muon flux, the experiment operates beneath approximately a kilometer of granite at the Laboratori Nazionali del Gran Sasso (LNGS), the world's largest deep underground laboratory.

#include "./030-cuore_experiment/031-intro.typ"

#include "./030-cuore_experiment/032-bolo_method.typ"

#include "030-cuore_experiment/033-detector.typ"

#include "./030-cuore_experiment/034-setup.typ"

#include "030-cuore_experiment/035-electronics.typ"

#include "030-cuore_experiment/036-daq.typ"

#include "030-cuore_experiment/037-commissioning.typ"
