#import "../common.typ": *

=== Searching for 0#nbb
- 0vbb search is basically looking for a mono-energetic peak at the end point of the 2vbb where all the energy is carried by the betas (the nuclear recoil energy is negligible),
- compared to 2vbb where most of the decay energy is transferred to the neutrinos.
- Easy to detect signal at Qbb
- If we see any events that belong to this decay, measure the half-life $t^(0nu)_(1"/"2) = ln 2 dot T epsilon thin N_(beta beta)/N_("peak")$
- The sensitivity of the detector depends crucially on the background, resolution and the exposure.
- The number of background events in the region is given by $Delta B $ (explain more of this )
- Sensitivity $S^(0 nu)_(1"/"2) = ln 2 dot epsilon (x eta)/n_sigma N_A/cal(M)_A (M T)/sqrt(M T Delta B)$,
- Sensitivity scales linearly with exposure when the $M T Delta B = O(1)$

=== History of CUORE
- Seeds of CUORE runs back more than half a century to the results published by the fathers of CUORE: Ettore, with his 1967 2#nbb results among others and Frank's 1970s papers on Germanium low temperature detectors (validate).

==== Initial bolometric detectors
- Low temperature bolometric detectors pose immense engineering challenges, and CUORE is the result of the efforts of many smaller experiments spanning decades.
- Earliest experiments focused on bolometric method and measureing 2#nbb, and used single crystal detectors.
- The first 0#nbb experimen to boast a bolometric array with #teo2 crystals was the Milan Double Beta Decay Experiment (MiDBD) which ran from 1997-?. This was a landmark experiment since it was the culmination of many different improvements such as radio-pure cryogenics and detector material, crystals etc etc
  - MiDBD consisted of 20 crystals (5 floors of 4 crystals) of "standard" size (what is standard?) 3x3x3 cm3, totaling 6.8kg of #teo2.
  - The notable improvements included OFHC copper tower frame, a more complicated front-end electronic system that allowed controlling each crystals parameters seperately
  - MiDBD II allowed for more shielding and better conincidence analysis with a more compact design, and achieved ~0.3 ckky with the resolution ranging from 5-15 keV.
  - MiDBD was already a testing bed for future 1000 detector array as described in the paper (saga, 87).

==== CUORECINO

- Reaching 1000 bolometers would require multiple orders of maginitude improvements across multiple domains, and a lot of resources,
- CUORECINO was the first step towards this, the little heart.
  - it would already be the largest cryogenic detector by far (is this correct for the actual CUORECINO version?) with a total #teo2 mass of 40.7 kg
  - It had 44 5x5x5 large bolometers, growth of whom was possible by changing the growth axis to $<"1 1 0">$ from the previous $<"1 0 0">$, 18 standard size detectors, arranged into 3 floors, 11 floors of 2x2 new crystals, and two floors with 3x3 configuration with the old style crystals.
  - It remarkably achived 4.2 keV (across all detectors?) resolution at the 5407 keV 210Po line, and throughout the gamma region achieved resolution comparable to Ge detectors, laying the foundation for CUORE.
  - The background levels reached 0.15 ckky for the large crystals, and from 2003-2008 collected a total exposure of 71.45 kg.yr with resolution at the Tl208 line measured to be ~ 5.8keV.
- CURECINO (and MiDBD) were very important to understand and reduce the backgrounds a ton-scale detector array would have to tackle with
  - Initial experiments showed that the multi-compton events from 2615 keV Tl208 line (mainly coming from 232Th contaminants,) and degraded alphas (coming from the surface contaminants of the crystals and materials facing the detector) are the main backgrounds in the ROI of 0#nbb
  - (The position and the width of alpha peaks was important in understanding the source and location of the contaminants. Internal/Bulk contaminants would deposit all the energy making the peak appear at the Q value, while surface contaminants would register a peak centered around the $alpha$ energies. Long-tailed assymetric peaks corrosponds to deep-surface contaminants).
  - RAD, CAW, TTT and CCVR tests;
  - These tests allowed for developing a much better procedures and standards for production and assembly of the detector, from crystal production and cleaning to custom mechanisms for mounting the crystals and the semiconductor chips.
  - It also helped select other materials such as PenCu cables.

==== CUORE-0

- After close to a decade of improvements targetting CUORE ton-scale experiment, the first CUORE-like tower was constructed and mounted in the Hall-A cryostat in 2013.
- Consisted of 52 5x5x5cm3 crystals arranged into 13 floors of 4 crystals, with the structure and production mechanisms envisioned to be identical to that of the future 19 towers of CUORE. The total #teo2 mass was 39 kg.
- Accrued about 9.8 kg.yr exposure from 2013-2015, and the final duty cycle of 80% (for the cryostat? excluding warm-up etc etc?)
- Allowed for direct verification of the mechanisms developed for CUORE, the ony difference being the cryostat.
- Achieved 4.9 keV FWHM @ $Q_(beta beta)$, surpassing the CUORE target.
- The largest improvemnt was in background reduction, with backgrounds in the ROI reaching $0.058$ and in the alpha continuum reaching $0.016$ ckky, proving that the strict standards for cleaning and material selection has paid off.
- Still more improvement was needed to reach CUORE target of $0.01$ ckky, a major part of which was expected to come from the new cryostat.
