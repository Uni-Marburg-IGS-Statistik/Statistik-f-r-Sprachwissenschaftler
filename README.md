% Statistik für Sprachwissenschaftler
% Phillip Alday
% Sommersemester 2014

Diese Veranstaltung bietet eine praktische Einführung in statistische Verfahren und deren Anwendung auf sprachliche Beispiele. Sie vermittelt Grundlagenwissen sowohl aus dem Bereich der deskriptiven Statistik als auch über die gängigsten inferenzstatistischen Verfahren, die im Bereich der Sprache angewendet werden. Alle theoretischen Grundkenntnisse werden anhand von praktischen Übungen vertieft, die mit Hilfe des (frei verfügbaren) Statistikprogramms "R" durchgeführt werden. Nachdem die Teilnehmer Grundlagenkenntnisse in R erworben haben, werden darauf aufbauend Beispielfragestellungen aus unterschiedlichen sprachrelevanten Bereichen bearbeitet. Dabei wird neben der Frage nach einem angemessenen experimentellen Design und dem geeigneten statistischen Verfahren auch die praktische Umsetzung der Auswertung in R im Mittelpunkt stehen. Nach Besuch dieser Veranstaltung sollten Teilnehmer in der Lage sein, eigene Daten statistisch zu analysieren.

# Organisatorisches
- **Termin** montags 12-14 Uhr c.t. Raum HSG +1/0120 und dienstags 10-12 Uhr c.t. WR6 01C08; 
- **Anzahl der ECTS-Punkte und Art der Prüfung (Klausur, "Hausarbeit") nach der jeweilgen Prüfungsordnung.**
- **Vorausgesetzt für die Zulassung zur Prüfung sind**
    - regelmäßige Teilnahme, inkl. Hausaufgaben zu jedem Termin -- siehe Blatt dazu
    - max. 4 unentschuldigte Fehltermine
- **Anmeldung**  verbindliche und obligatorische Anmeldung über ILIAS bis 18.04.2014
- **Sprechstunde** montags 16-17 Uhr oder nach Absprache
- **Kursmaterial** https://github.com/Uni-Marburg-IGS-Statistik/Statistik-f-r-Sprachwissenschaftler
- **Email** Nur Mails von Uni-Konten werden gelesen und beantwortet! 

**WARNUNG** Ich bin v.a. bei Formalien, die mir ein gewisses Workflow ermöglichen, **sehr** streng, z.B. Input-Output-Format, Respository-Layout, usw. Hausaufgaben, die den formalen Anforderungen nicht entsprechen, gelten als nicht eingereicht!

# Ablauf

Woche | Datum          | Themen
----- | -------------- | ----------------------------------------------------------
01.   | **14.04.2014** | Formalia, Einführung, (Textdateien &) DVCS, Warm-Up: Kombinatorik
|     | **15.04.2014** | Warum Statistik? R, RStudio, Git
02.   | **21.04.2014** | fällt aus! (Ostermontag) Ersatz-Lektüre: Stevens (1946)
|     | **22.04.2014** | Warum Statistik? Ziele der Forschung, Modelle, Beschreibungsstatistik  I (Maße der zentralen Tendenz)
|     |                | *Hausaufgabe bis 28.04.2014, 12 Uhr:* (in der Reihenfolge machen!)
|     |                | 1. `hausaufgabe03a.Rmd`
|     |                | 2. `hausaufgabe03b.R` 
03.   | **28.04.2014** | Beschreibungsstatistik  II: Dispersions- und Streuungsmaße
|     |                | *Hausaufgabe bis 29.04.2014 8 Uhr:*
|     |                | 1. An Fragenbogen "Verteilungen" (bei ILIAS) teilnehmen
|     |                | 2. Handout zu Logarithmen anschauen 
|     | **29.04.2014** | Visualisierung der Daten: `ggplot2`-Basics
|     |                | *Hausaufgabe bis 05.05.2014 12 Uhr:*
|     |                | 1. `hausaufgabe05.R`
04.   | **05.05.2014** | Auf dem Weg zu Interferenzstatistik: $z$-Tranformation, Wahrscheinlichkeitsverteilungen, Population vs. Stichprobe
|     |                | *Hausaufgabe bis 06.05.2014 10 Uhr:*
|     |                | Lesen Sie:
|     |                | 1. [wie Statistik oft misbraucht wird](http://www.cracked.com/article_20318_the-5-most-popular-ways-statistics-are-used-to-lie-to-you.html).
|     |                | 2. [warum es in den letzten Jahren eine Krise in der Wissenschaft gibt](http://www.economist.com/news/briefing/21588057-scientists-think-science-self-correcting-alarming-degree-it-not-trouble).
|     | **06.05.2014** | Statistische Inteferenz, $p$-Werte, Intuition von "Messfehler" und "Wahrscheinlichkeit", Fehler-Arten
|     |                | *Hausaufgabe bis 12.05.2014 12 Uhr:*
|     |                | 1. `hausaufgabe07.Rmd`
05.   | **12.05.2014** | Mehr zu Stichproben, Vergleich von Gruppen ($t$-Test), Erwähnung von Confidence-Intervalen und . [BEST](http://www.indiana.edu/~kruschke/BEST/) (etwa bayes'scher $t$-Test) 
|     |                | *Hausaufgabe bis 13.05.2014 10 Uhr:*
|     |                | 1. Schauen Sie sich [das Video zu BEST](https://www.youtube.com/watch?v=fhw1j1Ru2i0) BEST an.
|     | **13.05.2014** | Vergleich von Gruppen ($t$-Test) II: Voraussetzungen und Varianten
|     |                | *Hausaufgabe bis 19.05.2014 12 Uhr:*
|     |                | 1. `hausaufgabe09.R`
06.   | **19.05.2014** | Confidence und Credible-Intervale, BEST, Interferenz in der Praxis: Der Sinn von statischen Tests, neuartige Fehler, Unterschiede in frequentistischen und bayes'schen Aussagen
|     | **20.05.2014** | Intervale II
|     |                | *Hausaufgabe bis 26.05.2014 12 Uhr:*
|     |                | 1. Shiny apps anschauen
|     |                | 2. sich erholen
07.   | **26.05.2014** | ANOVA I
|     | **27.05.2014** | ANOVA II (evtl. auch Fixed vs. Random Effects à Clark 1973)
|     |                | *Hausaufgabe bis 02.06.2014 12 Uhr:*
|     |                | 1. `hausaufgabe13.Rmd`
08.   | **02.06.2014** | ANOVA III: Auswertung und Interpretation 
|     | **03.06.2014** | lineare Regression I
09.   | **09.06.2014** | fällt aus! (Pfingstmontag)
|     | **10.06.2014** | Korrelationen I  
10.   | **16.06.2014** | Korrelationen II, $\chi^2$, logLikelihood & Likelihood-Ratio 
|     | **17.06.2014** | das generalisierte lineare Model (GLM), logit-Regression
11.   | **23.06.2014** | gemischte Modelle I
|     | **24.06.2014** | gemischte Modelle II
12.   | **30.06.2014** | Nicht-parametrische Tests I
|     | **01.07.2014** | Nicht-parametrische Tests II 
13.   | **07.07.2014** | Nicht-parametrische Tests III
|     | **08.07.2014** | Experimentaldesign
14.   | **14.07.2014** | Fragestunde / Puffer
|     | **15.07.2014** | Klausur

# Software
- [R](http://cran.r-project.org/)
- [RStudio](http://rstudio.com/) (mit [RMarkdown](http://rmarkdown.rstudio.com/))
- [Git](http://git-scm.com/) (mit der [Bildungsinitiative](https://education.github.com/) von [GitHub](https://github.com/) )

# Bibliografie
Baayen, R. Harald (2008): Analyzing Linguistic Data: A Practical Introduction to Statistics Using R. Cambridge University Press.

Eid, Gollwitzer und Schmitt (2010): Statistik und Forschungsmethoden. Beltz Verlag.

Field, A., Miles, J., & Field, Z. (2012): Discovering Statistics Using R. Sage Publications.

Luhmann, M. (2010): R für Einsteiger. Einführung in die Statistiksoftware für die Sozialwissenschaften. Beltz Verlag.

Wickham, Hadley (2009): ggplot2. Springer.

Die Reihe *Use R!* von Springer ist **kostenlos** über das Uni-Netz elektronisch verfügbar!  

# Linksammlung
* [RMarkdown](http://rmarkdown.rstudio.com/)
* [GitHub Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
* [GitHub Git Resources](https://help.github.com/articles/what-are-other-good-resources-for-learning-git-and-github)
* [R Bloggers](http://www.r-bloggers.com/)
* [RSeek](http://rseek.org/)
* [CrossValidated](http://stats.stackexchange.com/)
* [How to Search for R Materials](http://stackoverflow.com/questions/102056/how-to-search-for-r-materials)
* [Git -- the simple guide](http://rogerdudler.github.io/git-guide/)
* [Literate programming, version control, reproducible research, collaboration, and all that](http://rpubs.com/bbolker/3153)
* [Handy statistical lexicon](http://andrewgelman.com/2009/05/24/handy_statistic/)
    
# Kommentare zu p-Werten, NHST, und der üblichen statistischen Praxis
* John Myles White
    1. [Good Tools for Individual Researchers are not Good Tools for Research Communities](http://www.johnmyleswhite.com/notebook/2012/05/10/criticism-1-of-nhst-good-tools-for-individual-researchers-are-not-good-tools-for-research-communities/)
    2. [NHST Conflates Rare Events with Evidence Against the Null Hypothesis](http://www.johnmyleswhite.com/notebook/2012/05/12/criticism-2-of-nhst-nhst-conflates-rare-events-with-evidence-against-the-null-hypothesis/)
    3. [Essential Information is Lost When Transforming 2D Data into a 1D Measure](http://www.johnmyleswhite.com/notebook/2012/05/14/criticism-3-of-nhst-essential-information-is-lost-when-transforming-2d-data-into-a-1d-measure/)
    4. [No Mechanism for Producing Substantive Cumulative Knowledge
](http://www.johnmyleswhite.com/notebook/2012/05/18/criticism-4-of-nhst-no-mechanism-for-producing-substantive-cumulative-knowledge/)
    5. [p-Values Measure Effort, Not Truth](http://www.johnmyleswhite.com/notebook/2012/07/17/criticism-5-of-nhst-p-values-measure-effort-not-truth/)
    6. [A Cheap Criticism of p-Values](http://www.johnmyleswhite.com/notebook/2012/12/06/a-cheap-criticism-of-p-values/)
* Andrew Gelman
    - [The p-value is not...](http://andrewgelman.com/2012/12/05/the-p-value-is-not/)
    - [Revised statistical standards for evidence](http://andrewgelman.com/2014/04/25/revised-statistical-standards-evidence-comments-val-johnsons-comments-comments-vals-comments-p-values/)  
    - [One-tailed or two-tailed?](http://andrewgelman.com/2014/04/18/one-tailed-two-tailed/)
    - [Interrogating p-values](http://andrewgelman.com/2013/06/04/interrogating-p-values/)
    - [The problem with p-values is how they're used](http://www.stat.columbia.edu/~gelman/research/published/murtaugh2.pdf)
    - [The Difference Between "Significant" and "Not Significant" is not Itself Statistically Significant](http://dx.doi.org/10.1198/000313006X152649 )
    - [Researcher degrees of freedom and accidental p-hacking](http://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf)
    - [P-Values and Statistical Practice](http://www.stat.columbia.edu/~gelman/research/published/pvalues3.pdf)
    
# Andere Perspektive und Interessantes zur Statistik
* [Famous statistician quotes](http://stats.stackexchange.com/questions/726/famous-statistician-quotes)
* [Common statistical sins](http://stats.stackexchange.com/questions/4551/what-are-common-statistical-sins)
* [Modes, Medians and Means: A Unifying Perspective](http://www.johnmyleswhite.com/notebook/2013/03/22/modes-medians-and-means-an-unifying-perspective/)
* [How do we choose our default methods?](http://www.stat.columbia.edu/~gelman/research/published/copss.pdf)
* ["The graph clearly shows that mammography adds virtually nothing to survival and if anything, decreases survival (and increases cost and provides unnecessary treatment)"](http://andrewgelman.com/2014/05/03/graph-clearly-shows-mammography-adds-virtually-nothing-survival-anything-decreases-survival-increases-cost-provides-unnecessary-treatment/) -- ein wichtiges Beispiel von Effektgröße vs. "signifikant" mit Brustkrebs!
* [Ken Rice presents a unifying approach to statistical inference and hypothesis testing](http://andrewgelman.com/2014/04/29/ken-rice-presents-unifying-approach-statistical-inference-hypothesis-testing/)
* [Understanding Simpson’s paradox using a graph](http://andrewgelman.com/2014/04/08/understanding-simpsons-paradox-using-graph/)
* [loess explained in a GIF](http://simplystatistics.org/2014/02/13/loess-explained-in-a-gif/)
* [On Chomsky and the Two Cultures of Statistical Learning](http://norvig.com/chomsky.html)
* [Big Data...Big Deal? Maybe, if Used with Caution.](http://andrewgelman.com/2014/04/27/big-data-big-deal-maybe-used-caution/)
* [Schools of Statistical Thought as Religion](http://andrewgelman.com/2014/04/12/schools-of-statistical-thoughts-are-sometimes-jokingly-likened-to-religions-this-analogy-is-not-perfect-unlike-religions-statistical-methods-have-no-supernatural-content-and-make-essentially-no-d/)
* [Bayesian Modelling of Anscombe's Quartet](http://www.sumsar.net/blog/2013/06/bayesian-modeling-of-anscombes-quartet/)
* [Bayesian or Frequentist, Which Are You?](http://videolectures.net/mlss09uk_jordan_bfway/) vielleicht die beste holistische Perspektive!
* [Positioning Bayesian inference as a particular application of frequentist inference and vice versa](http://dx.doi.org/10.6084/m9.figshare.867707)
* Software für Bayesian Modelling (wird nicht im Kurs genutzt, aber vielleicht interessant)
    - [Stan](http://mc-stan.org/)
    - [JAGS](http://mcmc-jags.sourceforge.net/)
    - [BUGS](http://www.openbugs.net/w/FrontPage)
    - [Fitting linear mixed models using JAGS and Stan: A tutorial](http://www.ling.uni-potsdam.de/~vasishth/BayesLMMs.html)
* xkcd
    - [Correlation](http://xkcd.com/552/)
    - [Correlation and Trends](http://www.xkcd.com/925/)
    - [Correlation and Heatmaps](http://www.xkcd.com/1138/)
    - [Conditional Risk](http://xkcd.com/795/)
    - [Null Hypothesis](http://www.xkcd.com/892/)
    - [Frequentists vs. Bayesians](http://xkcd.com/1132/)
* [Spurious Correlations](http://www.tylervigen.com/)

# Weitere Links zu spezifischen Themen
* Gemischte Modelle
    - Tutorials
        * [von Bodo  Winter](http://www.bodowinter.com/tutorial/bw_LME_tutorial.pdf)
        * [T. Florian Jaeger](https://hlplab.wordpress.com/2014/02/05/updated-slides-on-glm-glmm-plyr-etc-available/)
        * [Baayen, Davidson und Bates 2008](http://dx.doi.org/10.1016/j.jml.2007.12.005)(und alle anderen Artikel aus der Ausgabe des *Journal of Memory and Language*)
    - [Random Effects: Should I stay or should I go?](https://hlplab.wordpress.com/2009/05/14/random-effect-structure/) (vgl. auch [Barr et al 2013](        http://dx.doi.org/10.1016/j.jml.2012.11.001))
    - [Going full Bayesian with mixed effects regression models](https://hlplab.wordpress.com/2013/12/13/going-full-bayesian-with-mixed-effects-regression-models/)
    - [Diagnosing collinearity in mixed models from lme4](https://hlplab.wordpress.com/2011/02/24/diagnosing-collinearity-in-lme4/)
    - [Multinomial random effects models in R](https://hlplab.wordpress.com/2009/05/07/multinomial-random-effects-models-in-r/)
    - [Plotting effects for glmer(, family=”binomial”) models](https://hlplab.wordpress.com/2009/01/19/plotting-effects-for-glmer-familybimomial-models/)
    - [Nagelkerke and CoxSnell Pseudo R2 for Mixed Logit Models](https://hlplab.wordpress.com/2009/08/29/nagelkerke-and-coxsnell-pseudo-r2-for-mixed-logit-models/)
    - [old and new lme4](https://hlplab.wordpress.com/2014/03/17/old-and-new-lme4/)
    - Nützliche Pakete
        * `lme4`
        * `lmerTest`
        * `effects`
        * `LMERConvenienceFunctions`
        * `languageR`

# License
This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Germany License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/de/.

The programs presented here are mostly so simple as to be trivial, and as such, they should not be able to cause any damage. However, as Murphy once noted, there is always the potential for something to go horribly wrong, and so I hereby explicitly state that

The code here (including but not limited to the code in the pages for the individual sessions) is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Think before you type: I’m not responsible if you blindly copy and paste code and something bad happens.

Longer programs are licensed under the GPL v2, as noted in their respective source files.
