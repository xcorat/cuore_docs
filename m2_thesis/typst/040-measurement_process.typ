= Data Taking and Processing <chap:4>

- CUORE needs quite a few optimization steps before data collection
- some are incremental, like mechanical isolation of noise sources, and others need periodic optimization such as pulse shape phase adjustment.
- To ensure stable data collection we segments our data collection into capaigns aclled dataset. which consists of perriods of optimiation and calibration (energy) data takin that "are at the edges" of regular phucics sruns wich stable conditions and natural readioactivity only.
- Data procesing is done real-time as the adta is being colected mainl for diagnostics and monitoring, which includes basic trigerring, pulse characteristics measurements, and creating preliminary spectra (using calibration settings acquired at the beginning of the run.)
- Each dataset is then processed again after more vigorous analysis stps with optimal trigerring and pulase shape analysis and calibrating using data collected both at the beginning and at the end.
- we perform coincidence analysis for identification of multiplicity, and perform a blinded fit to obtain the 0vbb decay rate using multiplicity 1 data.

#include "040-data/041-optimization.typ"

#include "040-data/042-basic_processing.typ"

// #include "040-data/043-post_processing.typ"
