Data
====

## Primary Input

The core inputs for the fit are the PDFs that represent the expected spectra of background and signal components and observed data as an event list. We first create reduced ROOT files (staging files) for each simulated component that selects the data specific for the M2 analysis, and use these to create the input PDFs depending on the selection of data for each specific test of the M2 analysis. 

| Fit Settings  |   | 
|-----------    |-----------|
| Threshold     | 350 keV |
| ROI           | ESum $\in (2400, 2570)$ |
| Coincidence Window  | 30 ms, 150mm 
| Main Cuts     | + `Multiplicity == 2` | 
|               | + `PSA && AllFilters` |

### M2 Reduced Data

+ Rotation
+ Shifts
+ Blinding

### Fit Input

+ Cuts and other settings?