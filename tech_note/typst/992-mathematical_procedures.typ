== Mathematical procedures <sec:mathematical_procedures>

// === Combining posteriors <sec:combining_posteriors>

=== Background Model Peak Modes <sec:bm_mode>

The mode of the distribution is estimated using Gaussian Kernel Density Estimation (KDE).
To ensure numerical stability, the samples $x$ are first transformed to a relative
scale $x' = (x / macron(x)) - 1$, where $macron(x)$ is the sample mean.

A continuous density function $hat(f)(x')$ is constructed using a Gaussian kernel
with a bandwidth $h$ determined by Scott's rule, $h = n^(-1/5)$. The mode in the
transformed space, $x'_"mode"$, is found by numerically maximizing $hat(f)(x')$
within the interval $[min(x'), max(x')]$ using a bounded scalar optimizer.
The final estimate is transformed back to the original scale:

$ x_"mode" = (x'_"mode" + 1) macron(x) $
