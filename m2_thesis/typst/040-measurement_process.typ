#import "common.typ": *

= Data Taking and Processing <chap:4>

Operating the CUORE detector requires a systematic sequence of optimization, processing, and analysis procedures to ensure data integrity. Prior to data collection, the cryogenic system and detector array undergo hardware and operational optimization to mitigate vibrational noise, stabilize the baseline operating temperature, and determine the optimal bias voltage for each bolometer. To manage long-term thermal and mechanical stability, the data collection timeline is segmented into individual datasets, each consisting of a central background physics run bracketed by dedicated calibration periods. Data is processed and monitored in real-time as the data is being collected, and then reprocessed later with a structured offline post-processing framework. The offline analysis extracts physical observables by implementing an optimum filter to maximize the signal-to-noise ratio, applying thermal gain stabilization to correct for baseline drifts, and calibrating the energy scale using known gamma emission lines. Following basic event reconstruction, the data is filtered using pulse shape discrimination to reject unphysical waveforms and temporal coincidence cuts to isolate single-crystal interactions necessary for the main 0#nbb analysis. After establishing the active exposure and signal efficiencies, further model optimization is performed on blinded data. Finally, after all the selection criteria and analysis methods are fixed, an unbinned Bayesian extended likelihood fit is performed on the unblinded final energy spectrum to evaluate the 0#nbb decay rate without introducing observer bias.

#include "040-data/041-optimization.typ"

#include "040-data/042-basic_processing.typ"

#include "040-data/043-post_processing.typ"
