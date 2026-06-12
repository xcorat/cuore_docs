#import "../common.typ": *

=== Searching for 0#nbb

A 0#nbb search primarily identifies a mono-energetic peak at the 2#nbb decay endpoint ($Q_(beta beta)$). Because the nuclear recoil energy is negligible, the emitted electrons carry the total decay energy, producing a distinct and narrow signal. In contrast, standard 2#nbb decay produces a continuous energy spectrum because the emitted neutrinos carry away a variable fraction of the available energy. If candidate events are observed, the half-life is measured as:

$ t^(0nu)_(1"/"2) = ln 2 dot T epsilon thin N_(beta beta)/N_("peak") $

Here, $T$ is the active live time, $epsilon$ is the detection efficiency, $N_(beta beta)$ is the number of target isotopes in the detector, and $N_("peak")$ is the number of detected signal events.

Ultimately, a detector's sensitivity relies heavily on its background level, energy resolution, and total exposure. Defining the number of background events in the region of interest as $Delta B$, the half-life sensitivity is formulated as:

$ S^(0 nu)_(1"/"2) = ln 2 dot epsilon (x eta)/n_sigma N_A/cal(M)_A (M T)/sqrt(M T Delta B) $

When the background term $M T Delta B$ approaches $O(1)$—often referred to as the "zero-background" regime—this sensitivity scales linearly with exposure ($M T$), rather than with its square root. This linear scaling highlights the paramount importance of background reduction in ton-scale experiments.

=== History of CUORE

The foundational concepts of CUORE trace back to Ettore Fiorini's 1967 2#nbb results and subsequent research on low-temperature Germanium detectors. Developing a ton-scale bolometric array required mitigating background radiation and proportionally scaling cryogenic infrastructure. Consequently, CUORE was developed through a sequence of precursor experiments, each sequentially addressing specific operational challenges to inform the final design.

==== Initial bolometric detectors
Early efforts measured 2#nbb decay using single-crystal bolometers. The Milan Double Beta Decay Experiment (MiDBD), starting in 1997, was the first 0#nbb search to deploy an array of #teo2 crystals. It consisted of 20 standard crystals ($3 times 3 times 3 "cm"^3$), totaling 6.8 kg of active mass. MiDBD pioneered the use of custom Oxygen-Free High Thermal Conductivity (OFHC) copper frames and independent electronic control for each crystal. These innovations proved essential for maintaining uniform detector response and minimizing intrinsic radiation. A subsequent upgrade, MiDBD-II, introduced a more compact design with enhanced shielding. It achieved a background rate of roughly $0.3$ counts/(keV$·$kg$·$yr) (ckky) and an energy resolution between 5 to 15 keV, successfully establishing the feasibility of constructing larger arrays.

==== CUORECINO
Building on these initial successes, the next major milestone was CUORECINO, designed specifically to test the viability of scaling up both individual crystal size and total array mass. Operating from 2003 to 2008 with 40.7 kg of #teo2, it featured 44 large ($5 times 5 times 5 "cm"^3$) and 18 standard crystals. Producing the larger crystals without sacrificing thermodynamic properties required shifting the growth axis to $<1 1 0>$. CUORECINO demonstrated an energy resolution of 4.2 keV at 5407 keV and $~5.8$ keV at the 2615 keV $208$Tl calibration line, proving that macro-bolometers could achieve resolutions comparable to contemporary Germanium detectors.

Crucially, both MiDBD and CUORECINO identified the primary backgrounds that a ton-scale array would face: multi-Compton events originating from $232$Th contamination and degraded alphas from surface contaminants on the crystals and facing materials. Analyzing the specific shape of these alpha peaks enabled precise background modeling. Internal contaminants produced sharp peaks at their nominal Q-values, while surface contaminants caused asymmetric peaks with distinct low-energy tails. To mitigate these backgrounds, targeted R&D campaigns focused on establishing strict radio-assay standards, optimizing crystal growth, and developing advanced surface cleaning protocols for both the #teo2 crystals and copper components. These rigorous efforts yielded refined assembly procedures and guided the selection of ultra-pure materials, such as PEN-insulated copper (PenCu) cables, which directly informed CUORE's final construction parameters.

==== CUORE-0
In 2013, the first full CUORE-like tower—designated as the "0th" tower (CUORE-0)—was installed in the legacy Hall-A cryostat. Serving as a direct test of the newly developed assembly and cleaning protocols, it comprised 52 large crystals containing 39 kg of #teo2. Operating until 2015, CUORE-0 accumulated 9.8 kg$·$yr of exposure with an impressive 80% physics duty cycle, indicating that 80% of the operational time was dedicated to uninterrupted physics data acquisition, with the remainder allocated to calibration and cryogenic maintenance.

The detector surpassed the baseline resolution target, achieving 4.9 keV FWHM at $Q_(beta beta)$. Most importantly, the background index dropped to $0.058$ ckky in the Region of Interest and $0.016$ ckky in the alpha continuum, thoroughly validating the efficacy of the new surface treatment protocols. However, reaching the final CUORE target of $0.01$ ckky would ultimately rely on integrating these proven detector towers with the pristine environment and enhanced shielding of the custom-built, ton-scale CUORE cryostat.
