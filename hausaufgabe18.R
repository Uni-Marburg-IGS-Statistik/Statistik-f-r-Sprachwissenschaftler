# Hausaufgabe 18
# Phillip Alday <phillip.alday@staff.uni-marburg.de>
# 2014-06-17
# Dieses Werk ist lizenziert unter einer CC-BY-NC-SA Lizenz.


# Die nächsten Punkte sollten ziemlich automatisch sein...
# 1. Kopieren Sie diese Datei in Ihren Ordner (das können Sie innerhalb RStudio machen 
#    oder mit Explorer/Finder/usw.) und öffnen Sie die Kopie. Ab diesem Punkt arbeiten 
#    Sie mit der Kopie. Die Kopie bitte `hausaufgabe18.R` nennen und nicht `Kopie...`
# 2. Sie sehen jetzt im Git-Tab, dass die neue Datei als unbekannt (mit gelbem Fragezeichen)
#    da steht. Geben Sie Git Bescheid, dass Sie die Änderungen in der Datei verfolgen möchten 
#    (auf Stage klicken). 
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
# Datei pyreg.tab aus dem Data-Ordner kopieren, stagen und commiten. 

# Sie müssen ggf. Ihr Arbeitsverzeichnis setzen, wenn R die .tab-Datei nicht 
# finden kann: 
# Session > Set Working Directory > Source File Location

# (Im folgenden müssen Sie die Code-Zeilen wieder aktiv setzen -- ich habe sie
# vorläufig auskommentiert, damit der Output beim ersten Beispiel sehr
# überschaubar war.)

# Weil wir uns immer die Daten auch grafisch anschauen, laden wir jetzt schon ggplot
library(ggplot2)

# Wir fangen mit einem einfachen künstlichen Datensatz an. Sie sehen hier die
# Formlen für die Variablen.
x1 = 1:10
x2 = 2*x1
y = x1 + x2
linreg <- data.frame(x1,x2,y)

# Wir können y ~ x1 und y ~ x2 einzel plotten:
# ggplot(linreg,aes(x=x1,y=y)) + geom_point() + geom_smooth(method="lm")
# ggplot(linreg,aes(x=x2,y=y)) + geom_point() + geom_smooth(method="lm")

# Die Linie passt sehr gut zu den Punkten, was wir hätten erwarten sollen, denn
# wir haben y aus einfachen Summen von x1 und x2 berechnet. Wir berechnen
# zunächst die lineare Regression für die einzelnen unabhängige Variablen.

# CODE_HIER (x1)


# CODE_HIER (x2)

# Was haben Sie für Koeffizeinten bekommen? Wenn wir daran denken, dass x2 = 2*x1 ist, wissen wir, dass 
# y = x1 + x2
#   = x1 + 2*x1
#   = 3*x1
# oder, andersrum:
# y = x1 + x2 
#   = 0.5*x2 + x2 
#   = 1.5*x2
# Das sind doch due Regressionkoeffizienten! 


# Wie sieht es aus, wenn wir beide gleichzeitig aufnehmen? Machen wir zuerst eine Grafik:
# (x1 wird horizontal geplottet, x2 vertikal und y als Größe des Punkts)
ggplot(linreg,aes(x=x1,y=x2)) + geom_point(aes(size=y))


# Wir führen zunächst eine Regression aus, wo sowohl x1 als auch x2 Prediktor
# (=unabhängige Variablen) sind.
model <- lm(y ~ x1 + x2, data=linreg)
model.summary <- summary(model)
print(model.summary)

# Bei x2 steht überall NA -- R könnte keinen eindeutigen Koeffizienten für x2
# berechnen, weil x1 die gesamte Varianz im Modell (s.o.) erklären kann! Was
# passiert, wenn wir die Reihenfolge von x1 und x2 in lm() umstellen? Führen Sie
# die passende Regression aus:

# CODE_HIER

# Bei linearen Regression müssen wir immer aufpassen, dass unsere Prediktoren
# nicht zu stark miteinander korrelieren. Das könnten wir auch mit cor()
# austesten. Hier sollten Sie schon Pearsons Korrelationkoeffizienten nennen
# können, ohne folgenden Befehl auszuführen.
# cor(linreg$x1,linreg$x2)

# Wir laden jetzt einen weiteren Datensatz als Beispiel: 
# (Sie müssen den folgenden Befehl evtl. anpassen!)
pyreg <- read.table("Data/pyreg.tab",header=TRUE) 

# Wie linreg hat pyreg drei Spalten x1, x2, y
# Plotten Sie die Punkte + Regressionslinie für y ~ x1 (wie oben).

# CODE_HIER

# Und das gleiche für y ~ x2. 

# CODE_HIER

# Berechnen Sie die zwei Regressionsmodelle für y ~ x1 und y ~ x2

# CODE_HIER

# CODE_HIER

# Bevor Sie die Regression y ~ x1 + x2 berechnen, schauen Sie sich die
# Korrelation (mit Konfidenzintervall!) zwischen x1 und x2 an:

# CODE_HIER

# Wenn Sie nicht miteinander signifikant korreliert sind, sollten Sie auch die
# Regression y ~ x1 + x2 berechnen:

# CODE_HIER

# Wie gut passt das lineare Modell zu den Daten? Schauen Sie sich die R^2 und 
# F-Werte an sowie auch die t-Werte für die einzelnen Prediktoren. Glauben Sie, 
# dass y im linearen Verhältnis zu x1 und x2 steht? Machen Sie eine Grafik wie
# oben für y ~ x1 + x2, **nachdem Sie sich eine Antwort überlegt haben**.

# CODE_HIER

# Glauben Sie jetzt, dass y im linearen Verhältnis zu x1 und x2 steht? Warum (nicht)?

# Wie sieht mit Korrelationen aus? Berechnen Sie die Korrelation (sowohl Pearson
# als auch Spearman) zwischen (y und x1) sowie auch zwischen (y und x2). 

# CODE_HIER

# CODE_HIER 

# Welche Art von Korrelation macht am meisten Sinn bei diesen Daten?

# Korreliert y mit x1? y mit x2? x1 mit x2? Welche Schlussfolgerung über solche
# Dreiecke von Variablen und ihren Korrelationen können Sie daraus ziehen?

# Welche Methode macht hier am meisten Sinn? Korrelationen oder Regression?

# Die Daten sind übrigens *nicht* linear. x1 besteht aus 10 zufälligen Zahlen
# zwischen [1,10] und x2 besteht aus 10 zufälligen Zahlen zwischen [1,20]. 
# Danach wurde y mit dem Satz von Pythagoras berechnen: 
# y^2 = x1^2 + x2^2  => y = sqrt(x1^2 + x2^2). 
# (Den Code zur Generiung der Daten finden Sie in pythagoras.R, 
# falls Sie sich dafür interessieren)

# Was sagt das uns über (lineare) Regression? Ist es gut, dass das
# Regressionmodell anscheinend so gut war?

