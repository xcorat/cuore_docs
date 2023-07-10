Method
======

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