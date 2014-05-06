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
|     |                | 1. 
05.   | **12.05.2014** |  Frequentism vs Bayes
|     | **13.05.2014** | Interferenz in der Praxis: Der Sinn von statischen Tests, neuartige Fehler 
06.   | **19.05.2014** | 
|     | **20.05.2014** | 
07.   | **26.05.2014** | 
|     | **27.05.2014** | 
08.   | **02.06.2014** | 
|     | **03.06.2014** | 
09.   | **09.06.2014** |  fällt aus! (Pfingstmontag)
|     | **10.06.2014** | 
10.   | **16.06.2014** | 
|     | **17.06.2014** | 
11.   | **23.06.2014** | 
|     | **24.06.2014** | 
12.   | **30.06.2014** | 
|     | **01.07.2014** | 
13.   | **07.07.2014** | 
|     | **08.07.2014** | 
14.   | **14.07.2014** | 
|     | **15.07.2014** | 

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
  
# License
This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Germany License. To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/de/.

The programs presented here are mostly so simple as to be trivial, and as such, they should not be able to cause any damage. However, as Murphy once noted, there is always the potential for something to go horribly wrong, and so I hereby explicitly state that

The code here (including but not limited to the code in the pages for the individual sessions) is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Think before you type: I’m not responsible if you blindly copy and paste code and something bad happens.

Longer programs are licensed under the GPL v2, as noted in their respective source files.
