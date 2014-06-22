# Hausaufgabe 15
# Phillip Alday <phillip.alday@staff.uni-marburg.de>
# 2014-06-22
# Dieses Werk ist lizenziert unter einer CC-BY-NC-SA Lizenz.


# Die nächsten Punkte sollten langsam automatisch sein...
# 1. Kopieren Sie diese Datei in Ihren Ordner (das können Sie innerhalb RStudio machen 
#    oder mit Explorer/Finder/usw.) und öffnen Sie die Kopie. Ab diesem Punkt arbeiten 
#    Sie mit der Kopie. Die Kopie bitte `hausaufgabe15.R` nennen und nicht `Kopie...`
# 2. Sie sehen jetzt im Git-Tab, dass der neue Ordner als unbekannt (mit gelbem Fragezeichen)
#    da steht. Geben Sie Git Bescheid, dass Sie die Änderungen im Ordner verfolgen möchten 
#    (auf Stage klicken). Die neue Datei steht automatisch da.
# 3. Machen Sie ein Commit mit den bisherigen Änderungen (schreiben Sie eine sinnvolle 
#    Message dazu -- sinnvoll bedeutet nicht unbedingt lang) und danach einen Push.
# 4. Ersetzen Sie meinen Namen oben mit Ihrem. Klicken auf Stage, um die Änderung zu merken.
# 5. Ändern Sie das Datum auf heute. (Seien Sie ehrlich! Ich kann das sowieso am Commit sehen.)
# 6. Sie sehen jetzt, dass es zwei Symbole in der Status-Spalte gibt, eins für den Zustand 
#    im *Staging Area* (auch als *Index* bekannt), eins für den Zustand im Vergleich zum 
#    Staging Area. Sie haben die Datei modifiziert, eine Änderung in das Staging Area aufgenommen,
#    und danach weitere Änderungen gemacht. Nur Änderungen im Staging Area werden in den Commit aufgenommen.
# 7. Stellen Sie die letzten Änderungen auch ins Staging Area und machen Sie einen Commit 
#    (immer mit sinnvoller Message!).
# 8. Vergessen Sie nicht am Ende, die Lizenz ggf. zu ändern!

# Um einiges leichter zu machen, sollten Sie auch die
# Datei body_dim_long.tab aus dem Data-Ordner kopieren, stagen und commiten. 
# (Das haben Sie wahrscheinlich schon bei den vorigen Hausaufgaben gemacht!)
# Sie müssen ggf. Ihr Arbeitsverzeichnis setzen, wenn R die .tab-Datei nicht 
# finden kann: 
# Session > Set Working Directory > Source File Location

# (Im folgenden müssen Sie die Code-Zeilen wieder aktiv setzen -- ich habe sie
# vorläufig auskommentiert, damit der Output beim ersten Beispiel sehr
# überschaubar war.)

# Weil wir uns immer die Daten auch grafisch anschauen, laden wir jetzt schon ggplot
library(ggplot2)

# und danach die Daten:
body <- read.table("body_dim_long.tab",header=TRUE) 

# Wir werden auch den Datensatz women nutzen, der schon mit R geliefert wird.
# Mehr Information zum Datensatz bekommen Sie mit ?women. Die Angaben sind in
# US-Einheiten, weshalb wir eine Kopie mit den SI-Einheiten machen.
women.metric <- women
women.metric$height.cm <- women.metric$height * 2.54 # 2.54 cm pro inch
women.metric$weight.kg <- women.metric$weight / 2.2 # 2.2 lb pro kg

# Plotten wir erst mal die Daten in US-Einheiten. Die Bestimmung des
# method-Parameters ist sehr wichtig: bei so wenigen Datenpunkten ist der
# Default bei ggplot2 LOESS und wir wollen normale lineare Regression.
plot1 <- ggplot(women.metric,aes(x=height,y=weight)) +  geom_point() + geom_smooth(method="lm")
print(plot1)

# Ist der Fit gut? Schauen wir uns die Regression an:
m <- lm(weight ~ height, data=women.metric)
print(summary(m))

# Aber Pfund (lb) und Zoll (inch) sind komische Einheiten. Wie sieht es aus mit
# kg und cm?
plot2 <-ggplot(women.metric,aes(x=height.cm,y=weight.kg)) +  geom_point() + geom_smooth(method="lm")
print(plot2)
m2 <- lm(weight.kg ~ height.cm, data=women.metric)
print(summary(m2))

# Sehen die Plots anders aus? Hat sich der R^2 Wert geändert? Die t-Werte? Die Koeffizienten? 
# Nur die Koeffizienten haben sich geändert und zwar bei einem konstanten Faktor
#-- dem gleichen wie oben in der Konversion!

# Was passiert, wenn wir das Modell umdrehen? Also, height.cm als eine Funktion
# von weight.kg darstellen? Plotten und berechnen Sie das neue Modell, wie ich
# es oben für die zwei bisherigen Modelle gemacht habe.
plot3 <-ggplot(women.metric,aes(y=height.cm,x=weight.kg)) +  geom_point() + geom_smooth(method="lm")
print(plot3)
m3 <- lm(height.cm ~ weight.kg, data=women.metric)
print(summary(m3))

# Hat sich der R^2 Wert geändert? Die t-Werte? Die Koeffizienten? Was ist die
# Beziehung zwischen diesem Modell und m2?
# Das ist (fast) die Spiegelung des vorherigen Modells um die Linie y = x

# Wie sieht es aus mit den Daten zum Kursteilnehmern? Plotten Sie und berechnen
# Sie ein Modell für das Gewicht der Teilnehmer als Funktion von Körpergröße.
plot4 <- ggplot(body,aes(x=height,y=weight)) +  geom_point() + geom_smooth(method="lm")
print(plot4)
m4 <- lm(weight ~ height, data=body)
print(summary(m4))

# Warum funktioniert die Regression besser beim Datensatz "women" als bei den
# Kursteilnehmerdaten? HINT: Lesen Sie die Hilfe-Beschreibung von women! 

# Women besteht aus Mittelwerten! Im Prinzip sind die Daten in Women schon Punkte
# entlag einer Regressionslinie!