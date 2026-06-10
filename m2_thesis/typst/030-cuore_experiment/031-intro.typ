#import "../common.typ": *

=== Searching for 0#nbb
- A 0#nbb search primarily involves looking for a mono-energetic peak at the 2#nbb decay endpoint ($Q_(beta beta)$).
- Because the nuclear recoil energy is negligible, the emitted betas carry the entirety of the decay energy, making the signal theoretically straight forward to detect at $Q_(beta beta)$. This is in contrast to 2#nbb decay, where most of the energy is carried away by neutrinos, creating a spectrum of deposited energies.
- If candidate events are observed, the half-life is measured as $t^(0nu)_(1"/"2) = ln 2 dot T epsilon thin N_(beta beta)/N_("peak")$.
- The detector's sensitivity depends crucially on its background level, energy resolution, and total exposure.
- The number of background events in the region of interest is given by $Delta B$ (which will be expanded upon later).
- The half-life sensitivity is defined as $S^(0 nu)_(1"/"2) = ln 2 dot epsilon (x eta)/n_sigma N_A/cal(M)_A (M T)/sqrt(M T Delta B)$.
- When the background term $M T Delta B = O(1)$, this sensitivity scales linearly with exposure.

=== History of CUORE
- The seeds of the CUORE experiment were planted over half a century ago. Its foundational concepts trace back to the pioneering 1967 2#nbb decay results by Ettore Fiorini, alongside seminal 1970s papers by Frank and collaborators on low-temperature Germanium detectors.

==== Initial bolometric detectors
- Operating bolometric detectors at ultra-low temperatures presents immense engineering challenges. Consequently, CUORE is the culmination of decades of progressive research across multiple smaller-scale experiments.
- The earliest efforts focused primarily on measuring 2#nbb decay using single-crystal bolometers.
- The first 0#nbb experiment to deploy an array of #teo2 crystals was the Milan Double Beta Decay Experiment (MiDBD), which began operations in 1997. MiDBD was a landmark achievement, representing the integration of numerous incremental improvements in radiopure cryogenics, material selection, and crystal growth.
  - The detector array consisted of 20 "standard-sized" ($3 times 3 times 3 "cm"^3$) crystals, totaling 6.8 kg of #teo2, arranged into five floors of four crystals each.
  - Notable technical advancements included a custom Oxygen-Free High Thermal Conductivity (OFHC) copper tower frame and a sophisticated front-end electronic system that allowed for the independent control of each crystal's operating parameters.
  - A subsequent upgrade, MiDBD-II, introduced a more compact design with enhanced shielding and improved coincidence analysis. It achieved a background rate of $~0.3$ counts/(keV$·$kg$·$yr) (ckky) and an energy resolution ranging from 5 to 15 keV.
  - Crucially, MiDBD served as the initial testbed for the feasibility of a future 1000-detector array, as envisioned early in the bolometric 0#nbb saga.

==== CUORECINO
- Scaling up to a 1000-bolometer array required multiple orders of magnitude of improvement across various technical domains, demanding significant resources. The first major step toward this goal was CUORECINO (the "little heart").
  - Upon its completion, it was by far the largest cryogenic detector ever operated, featuring a total #teo2 mass of 40.7 kg.
  - The array comprised 44 large bolometers ($5 times 5 times 5 "cm"^3$) and 18 standard-sized detectors. Producing the larger crystals was made possible by shifting the growth axis from $<1 0 0>$ to $<1 1 0>$. The tower was structured across 13 floors: 11 floors contained a $2 times 2$ configuration of the new, larger crystals, while 2 floors contained a $3 times 3$ configuration of the older, standard-sized crystals.
  - CUORECINO achieved a remarkable energy resolution of 4.2 keV at the 5407 keV $210$Po line. Throughout the gamma region, its resolution was comparable to state-of-the-art Germanium detectors, successfully laying the foundation for CUORE.
  - Operating from 2003 to 2008, it accumulated a total exposure of 71.45 kg$·$yr. For the large crystals, the background level reached 0.15 ckky, with an energy resolution of $~5.8$ keV measured at the 2615 keV $208$Tl line.
- Both MiDBD and CUORECINO were vital for characterizing and mitigating the backgrounds that a ton-scale array would face.
  - These experiments revealed that the primary backgrounds in the 0#nbb Region of Interest (ROI) were multi-Compton events from the 2615 keV $208$Tl line (predominantly originating from $232$Th contamination) and degraded alphas (originating from surface contaminants on the crystals and surrounding facing materials).
  - Analyzing the position and width of these alpha peaks proved essential for diagnosing the location of the contaminants. Internal (bulk) contaminants deposited their full energy, producing sharp peaks at their respective Q-values, whereas surface contaminants generated peaks centered around the nominal alpha energies. Asymmetric peaks with long, low-energy tails indicated deep-surface contamination.
  - To combat these backgrounds, targeted R&D campaigns—such as the RAD, CAW, TTT, and CCVR tests—were conducted.
  - These efforts yielded significantly improved protocols for detector production and assembly, ranging from crystal growth and cleaning procedures to custom mounting mechanisms for the crystals and semiconductor thermistors. It also guided the strict selection of radiopure materials, such as PEN-insulated copper (PenCu) cables.

==== CUORE-0
- Following nearly a decade of targeted improvements for the ton-scale CUORE project, the first full CUORE-like tower was constructed and installed in the legacy Hall-A cryostat in 2013.
- Dubbed CUORE-0, it consisted of 52 large ($5 times 5 times 5 "cm"^3$) crystals arranged into 13 floors of four. With a total #teo2 mass of 39 kg, its physical structure and production mechanisms were designed to be perfectly identical to those of the final 19 towers of CUORE.
- Operating from 2013 to 2015, CUORE-0 accrued 9.8 kg$·$yr of exposure with an impressive physics duty cycle of 80%.
- This run allowed for the direct verification of the assembly and operational mechanisms developed for CUORE, with the sole independent variable being the use of the old cryostat.
- The detector achieved a 4.9 keV FWHM resolution at $Q_(beta beta)$, successfully surpassing the CUORE baseline target.
- The most significant triumph, however, was the dramatic reduction in backgrounds, proving that the rigorous new cleaning and material selection standards had paid off. The background index dropped to $0.058$ ckky in the ROI and $0.016$ ckky in the alpha continuum.
- While further reduction was still necessary to reach the ultimate CUORE target of $0.01$ ckky, the remaining improvements were expected to come from the enhanced shielding and pristine environment of the new, custom-built CUORE cryostat.
