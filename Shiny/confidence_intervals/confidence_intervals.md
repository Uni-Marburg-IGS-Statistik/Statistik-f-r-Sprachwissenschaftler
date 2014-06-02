### What am I looking at?
This simple app shows the frequentist confidence intervals and its asymptotic interpretation. In particular, it is not possible (without prior knowledge) to say whether a particular confidence intervals contains the true (population) mean. Instead, $x$% of confidence intervals at confidence level $x$ will contain the true mean *in the long run*.

### Why do I care?
This is a common misunderstanding of confidence intervals, both among students and experienced researchers alike. The frequentist framework uses a notion of probability equivalent to **long-term frequencies**. This has certain advantages and certain disadvantages compared to other notions of probability, but one of the more difficult aspects is that statements about single outcomes are often formulated in somewhat contraintuitive ways or not possible at all.

### Why are there more/fewer hits than expected at my confidence level?
Please note that the long-run behavior is in the *very* long-run (i.e., asymptotic as the number of trials goes to infinity) and as such, it is not unexpected for a particular finite selection of population means to contain a different number of hits than the exact confidence level. 

Nonetheless, the general convergence of confidence intervals and sample means can be seen in the population display. The less transparent areas indicate more overlap (more estimates in that area), and the darkest area is the area of convergence. Although some estimates fall comparatively far away, the long-run behaviour is already clear.
