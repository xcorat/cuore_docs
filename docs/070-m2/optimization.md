Fit Optimization
================

+ Rotated axes:
    Fit is done on rotated axes $u, v$: 
    $$  u = (E_1+E_2)/\sqrt2 \\
        v = (E_1 - E_2)/\sqrt2 $$
+ Smoothing histograms: The 2D PDFs are 'smoothed' using a kernel density function implemented in ROOT 
`h2 = h2a.Smooth(1, 'k5b')` 
