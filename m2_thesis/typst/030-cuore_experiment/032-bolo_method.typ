#import "../common.typ": *

== Bolometric Method

The success of the CUORE experiment relies fundamentally on the bolometric technique. A bolometer is a highly sensitive calorimeter that measures incident radiation by absorbing its energy and converting it into a measurable electrical signal. Fundamentally, it consists of two distinct components: an energy absorber (a crystal) and a phonon sensor (a thermistor).

In CUORE, the experiment utilizes #teo2 crystals. This material is strategically chosen because the source isotope ($130$Te, with a high natural abundance of 34%) is intrinsically embedded within the absorber matrix. When a particle interaction occurs, the deposited energy is converted into phonons within the crystal lattice, causing a macroscopic temperature rise. This tiny thermal shift is then read out by Neutron Transmutation Doped (NTD) Germanium thermistors, which convert the temperature change into a measurable voltage pulse.

=== Bolometric Detector Principles
The concept of using crystals as calorimeters has been refined since the early 1970s. The profound advantage of the bolometric approach lies in its extraordinary theoretical energy resolution.

In standard ionization or scintillation detectors, a significant portion of the incident energy is lost to invisible channels (such as lattice vibrations), and the energy required to produce a single information carrier (e.g., an electron-hole pair or a photon) is relatively high (typically $O(1)-O(10)$ eV). Conversely, in a bolometer, almost the entirety of the deposited energy is eventually thermalized into phonons. The fundamental excitation energy of a phonon is on the order of $~10$ meV. This yields a massively higher number of information carriers per MeV deposited, which drastically minimizes statistical fluctuations ($Delta N = sqrt(N)$). For a 750 g #teo2 crystal at 10 mK, generating roughly $10^14$ phonons per MeV, the theoretical intrinsic resolution approaches 20 to 100 eV. While experimental resolution is ultimately broadened by extrinsic electronic and vibrational noise, the intrinsic limit remains far superior to conventional techniques.

=== Absorber Thermodynamics
The thermal dynamics of a bolometer can be modeled as a simple thermal circuit. The absorber, possessing a heat capacity $C$, is weakly coupled to a thermal bath (maintained at a constant base temperature $T_0$) via a thermal link with conductance $G$.

#figure(
  placement: auto,
  grid(
    columns: 2,
    row-gutter: 0.5em,
    image("../../images/03-Bolometer.png", width: 90%),
    image("../../images/03-thermal_cct_simple.png", width: 90%),
  ),
  caption: [Basic diagram of CUORE detector and the thermal circuit],
)<sec3.2-thermal-diag>

When an energy $E$ is deposited, the resulting temperature deviation is given by $Delta T(t) = (E/C) exp(-t/tau)$ (assuming $Delta T << T_0$), where $tau = C/G$ is the thermal relaxation time constant. To maximize the signal amplitude ($Delta T$), the heat capacity $C$ must be minimized. At ultra-low cryogenic temperatures, the heat capacity of dielectric, diamagnetic materials like #teo2 is entirely dominated by lattice vibrations (acoustic phonons), as electronic contributions are nonexistent. According to the Debye law, this capacity scales as $C prop (T/theta_D)^3$, where $theta_D$ is the Debye temperature. Because #teo2 has a sufficiently high $theta_D$, cooling the crystal to $10$ mK effectively "freezes out" nearly all vibrational modes, driving $C$ to extremely low values. Consequently, a standard 1 MeV energy deposition in a 750 g #teo2 crystal produces a measurable temperature spike of approximately $100 mu$K.

=== Phonon Sensor
To read out this micro-Kelvin temperature spike, CUORE utilizes NTD Germanium thermistors. Standard semiconductors are insulators at cryogenic temperatures because their thermal energy is vastly insufficient to excite electrons across the band gap. However, by bombarding Germanium with thermal neutrons, a highly uniform concentration of dopant impurities is created.

The doping concentration is tuned to sit just below the critical density ($N_c$) required for a Metal-to-Insulator Transition (MIT). In this specific regime, charge transport does not occur via continuous conduction bands, but rather through a quantum mechanical process known as Variable Range Hopping (VRH)#footnote[add reference]. Electrons tunnel between localized impurity sites that remain ionized near absolute zero. Because this tunneling probability is highly sensitive to the available thermal energy, the thermistor's resistivity exhibits a steep, exponential temperature dependence:

$ rho(T) = rho_0 exp(T_0/T)^gamma $

Here, $rho_0$ and $T_0$ are parameters defined by the specific doping density, and $gamma approx 1/2$ for the VRH regime with a Coulomb gap. This steep gradient translates a minuscule $Delta T$ into a massive change in resistance, providing the necessary signal amplification.

=== Measurement and Operation
The thermistor readout relies on a continuous bias circuit featuring a load resistor $R_L$ situated at room temperature. A constant bias current $I_("bol")$ is applied across the NTD, and the resulting voltage drop $V_("bol")$ is continuously digitized.

The static, steady-state temperature of the bolometer ($T_("bol")$) rests slightly higher than the bath temperature ($T_s$) due to the continuous Joule power dissipation ($P = V_("bol")^2 / R$) from the readout circuit, defined as $T_("bol") = T_0 + P/G$. This power dissipation introduces a phenomenon known as electrothermal feedback: if the crystal heats up, the NTD resistance drops, which alters the dissipated power and consequently affects the temperature. When characterizing a detector, $V-I$ load curves are measured across different bath temperatures. As $I_("bol")$ increases, the load curve eventually bends into a region of negative dynamic resistance due to this feedback#footnote[validate the wording]. The optimal working point is carefully selected just below this inversion threshold to maximize the signal-to-noise ratio while ensuring thermal stability.

During a physical event, the low heat capacity of the absorber yields a sharp pulse rise time, followed by a much slower exponential cooling tail governed by $tau = C/G$. For CUORE, this decay time is typically on the order of 1 to 3 seconds. To guarantee stability over month-long physical runs, dedicated silicon heaters (pulsers) are glued to each crystal. These heaters inject highly stable, mono-energetic reference heat pulses into the crystal, allowing the data acquisition system to continuously monitor and dynamically correct for minor thermal drifts in the detector's baseline response.
