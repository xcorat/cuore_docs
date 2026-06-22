= Background Model <chap:6>

- Intro
  - BM try to reconstruct the physics spectrum of CUORE through the expected radioactive decays that deposit enrgy in the detector.
  - Includes the complex detector geometry coupled with measured radioactive source strngths as priors.
  - Uses a realistic description of CUORE geometry and materials to generate simulate spectra
  - All elements/components of the detector implemented in QShields
  - Run MC simulations for background sources identified by radio-assay
  - Extensive campaigns of radio-assay o different source materials, expectations from cuore-0 and distinctive features are used
  - decay chain generated in one of the volumes and propogated throughout the detactor geometry.
  - Some contaminants in different parts can generate degenerate background spectra -- not sensitive enough to disentabgle
    - group adjascent coolumes together if they give degenerate spectra
  - componnts that re made of the same grade of material and same cleaning techniques assumed to have equal bulk contaminants

== Expected sources and background studies
- Te02, NTDs and heaters have very low backgrounds.
- NOSV copper close to the detector (facing and non-facing,) ran seperately and merged later (low radioctive, high thermal conductivity)
- 600 mK sheild, OFE copper on 50mK, different surface clenaing processes (same bulk, seperate surfaces)
- Roman lead, inner lead shield
- Tower frames, support etc and PTFE (direct line of site)
- MC shield, TSP plates that sandwitch top lead
  - PTFE spacers and NOSV copper different ultra cleaning
  - PTFE very small volume compared to Cu, not able to distinguish so neglect
- outer lead sheilds - top lead sheild externel lead shield
  - TL: specially sepected modern lead,
  - ELS: low radioactive but diferent from TL
- outer shields - 4K shield (4K, 40K, 600mK, OFE, outer roman pb)
- stainless steel cap of 300K, superinsulation -> degenrate background
-

== Qshields
- QShields generate photons, electrons, positrons, nuclear recoils neutrons, muons, alphas
- propagated down to keV energies -- primaries and secondaries
- g4radioactivedecay database -> keep track of time corrections and radioactive decays
- buld simulated assuming uniformly distributed sources
- 40K source in one tower (12) in crystal volume also simulated
- surface contaminands assumed uniform across surfaces -> exponentially decaying depth profile ($e^(-lambda d)$ with charasteristic depth $lambda$)
  - choose nm to 10s of $mu$m
- complete decay chains of 238U, 232Th, simulated in all volumes except TLS, ELS -- only lower part 210i, 206Pb assuming are in equilibrium with 210 Pb.
- U235 simulated only for crystals and close parts since very weak signature, also fixed by ratio to U238 by natural radioactivity ratio.
- TeO2, Cu: simulate promirdial 40K
- Cospogenic activation: 125Sb, 110mAg, 108mAg, 60Co in Teo2, 60Co and 54Mn in Cu
- 190Pt in Teo2 -> leftover from Pt crusibles in trace amounts
- possible 147Sm contamination to explain the peak near 2316 keV -- peak only (at 2311 keV nominal) at alpha transition: found in other xperiments as a crystal contaminant (explain Quenching factor)
- 2vbb on 130Te as a background: single state dominance model preferred
- neutrons, gammas from outside are shielded and negligible
- and cosmic muons
== Detector Response

== Fit Model

== ROI and Binning

== Priors

== Systematics

== Results
