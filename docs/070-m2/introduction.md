Introduction
============

1. This document aims to detail the preliminary analysis of CUORE data searching for [0vbb] decay in Multiplicity 2 events.
2. According to simulations we expect ~5% of [0vbb] decay signal to deposit energy in two CUORE crystals, thus registering as a Multiplicity 2 event where the energy is split between two crystals. 
3. 


Backup
======
1. In this section we explain the [0vbb] search in the CUORE detector array using our Multiplicity 2 data.
2. While our main analysis focuses on events where the full [decay energy][Qbb] is deposited in a single crystal, we expect ~12% of the [0vbb] events to deposit their energy in at least two crystals (or more), a third of which we expect to deposit most of their [decay energy][Qbb] in two crystals [Multiplicity 2 events][M2]
3. Our goal in this analysis, thus, is to obtain a (bayesian posterior) probability distribution of the [0vbb] rate(or $T_{1/2}$) by modeling the observed 2D M2 spectrum as a sum of expected decay spectra which includes the [0vbb] signal and multiple background components as modeled in the [Background Model][BM] while marginalizing over the strength (number of events) of each component.



[0vbb]: /docs/990-glossary/index.md#0vbb "$0\nu\beta\beta$ decay"

[Qbb]: /docs/990-glossary/index.md#qbb

[M2]: /docs/990-glossary/index.md#m2 "Multiplicity 2"

[BM]: ../060-bm/index.md "Background Model"

# CUORE M2 Analysis

## Introduction

This analysis focuses on searching for $0\nu\beta\beta$ decay of ${}^{130}Te$ using dual-site coincident events in the CUORE detector. These events (Multiplicity 2, or M2 events) would capture about ~4% of the possible 0vbb decay signal and spans a while  compared to multiplicity 1 events

While we expect to find ~88% of possible 0vbb signal in events where all decay the energy is deposited in a single crystal, about 4% of these events will deposit energy in two crystals, and register as a multiplicity 2 (M2) event. We analyze the 2-dimentional spectrum of CUORE data near the $Q_{\beta\beta}$ and compare it with a reconstruction of expected background to look for any evidence of 0vbb decay. 




We use a four-component model as background as a sum of four components by simplifying the CUORE background model (from 2v fit)()

To look for evidence of 0vbb in these data

register as coinsident event pairs  register as multiplicity 2 events, or events where 

## Physics Motivation

+ Recover 4% of data
+ Higher sensitivity due to lower background level expected.

## CUORE Background model

+ ROI includes a large fraction of the $\gamma$ region, so we need to simulate 
    the expected background
+ BM: From 2vbb decay search
+ QShields 
+ Ares
+ BM Fit
+ Fit output MCMC

## M2 Fit

We can search for 0vbb decay in M2 data by using the background model output as the expected background and looking for 0vbb decay signature on top of it. If we model the data $D$ as a sum of N background component PDFs ($f_1..f_N)$ and the 0v component  ($_0$),

$$ \mathcal{D} :~ \sum_0^N c_i f_i$$

The probability of observed data is given by:

$$ \mathcal{L}(\mathcal{D}| \vec{\theta}) = \lambda^{n} \frac{e^{-\lambda}}{n} \prod f(\vec E| \vec \theta)
$$

Fit data as a sum of multiple background components as 0vbb signal.
+ Simpler background model by merging components according to the QBM fit output.
+ Signal component: 0vbb processed with the same configuration as that of the rest of the MC
+ Extract 0vbb rate posterior by maximizing the un-binned extended likelihood of data by marginalizing over the components strengths of background and signal.
+ Use PyMC3
+ Priors?

### Optimizing the fit

+ Rotated axes:
    Fit is done on rotated axes $u, v$: 
    $$  u = (E_1+E_2)/\sqrt2 \\
        v = (E_1 - E_2)/\sqrt2 $$
+ Smoothing histograms: The 2D PDFs are 'smoothed' using a kernel density function implemented in ROOT 
`h2 = h2a.Smooth(1, 'k5b')` 


## Fit Input

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

## Fit Results

### Likelihood Comparisons
We use the maximum log probability ($\mathcal{L}_{max}$) of each fit as a point estimator to compare the quality of different fit settings. 

### Sensitivity

### Bias

### Systematic Uncertainty 

#### Background model systematics
To evaluate the effect of uncertainties related to background model predictions, we run the fit multiple times while varying the input components according to the JAGS fit output. We pick a random point from the JAGS Markov Chain (instead of the mode as above) and use those normalization factors to create input component PDFs.

[Histogram of 0v rate modes]

