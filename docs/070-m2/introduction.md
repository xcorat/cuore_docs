Introduction
============

1. This document aims to detail the preliminary analysis of CUORE data searching for [0vbb] decay in Multiplicity 2 events.
2. According to simulations we expect ~5% of [0vbb] decay signal to deposit energy in two CUORE crystals, thus registering as a Multiplicity 2 event where the energy is split between two crystals. 
3. Similar to the main analysis (Multiplicity 1, M1), the basic goal here too, is to model the data from the detector as a combination of background components and [0vb] signal, and extract the best fit [0vbb] rate that is consistant with our data and the expected background contributions. 
4. Unlinke the M1, however, this analysis is done in 2D (E1 vs E2 axes representing the two energy depositions) and the expected signal spans the full energy range allowed (threshold to Qbb) on each axis. 

![bkg_e1e2](../assets/img/test.jpg)


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

register as coincident event pairs register as multiplicity 2 events, or events where 

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



## Fit Results

### Likelihood Comparisons
We use the maximum log probability ($\mathcal{L}_{max}$) of each fit as a point estimator to compare the quality of different fit settings. 
