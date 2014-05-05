# Hausaufgabe 05
# Phillip Alday <phillip.alday@staff.uni-marburg.de>
# 2014-05-02
# Dieses Werk ist lizenziert unter einer CC-BY-NC-SA Lizenz.

# Sie sollten die Datei auch in Ihren Ordner kopieren und einen Commit machen, 
# bevor Sie die Kopie weiter anpassen! Vergessen Sie dabei nicht, Namen, Datum 
# und ggf. Lizenz zu ändern. Um einiges leichter zu machen, sollten Sie auch die
# Datei body_dim_long.tab aus dem Data-Ordner kopieren, stagen und commiten. Sie
# müssen ggf. Ihr Arbeitsverzeichnis setzen, wenn R die .tab-Datei nicht finden
# kann: 
# Session > Set Working Directory > Source File Location

# (Im folgenden müssen Sie die Code-Zeilen wieder aktiv setzen -- ich habe sie
# vorläufig auskommentiert, damit der Output beim ersten Beispiel sehr
# überschaubar war.)

# Am Dienstag haben wir uns ein paar Plots mit den Daten aus dem Fragebogen
# gemacht. Hier werden wir weiter üben.

# Zuerst müssen wir ggplot laden
library(ggplot2)

# und danach die Daten:
dat <- read.table("body_dim_long.tab",header=TRUE) 

# Wir haben im Kurs die Verteilung der Variabel weight angeschaut. In Skripten
# werden Ergebnisse nicht automatich dargestellt, sondern nur dann, wenn ein
# print Befehl genutzt wird. Dann müssten wir eigentlich den ganzen "ggplot() +
# ..." Befehl in die Klammer von print() einpacken, was nicht besonders lesbar
# ist. Wie bei anderen Berechnungen können wir den Output von ggplot einer
# Variabel zuweisen. Danach müssen wir nur den Variabelnamen in die Klammer von
# print() einpacken.
#weight.grafik <- ggplot(data=dat,aes(x=weight)) + geom_histogram(aes(y=..density..),fill="white",color="black") + geom_density()
#print(weight.grafik)

# Wenn wir verschiedene Grafiken mit einem Datenzsatz machen möchten, ist es
# nervig, wenn wir den gemeinsamen Teil immer wieder eingeben müssen. Auch Teile
# von ggplot-Grafiken können einer Variabel zugewiesen werden:
#weight.grafik.basis <- ggplot(data=dat,aes(x=weight))
#print(weight.grafik.basis + geom_histogram())
#print(weight.grafik.basis + geom_density())

# Wir haben auch mal die qplot()-Funktion gesehen. Sie ergibt eigentlich das
# Gleiche wie die "ggplot() + ..."-Befehle, hat nun eine andere Schnittstelle. 
#weight.grafik.alt <- qplot(x=weight,data=dat,geom="density")
#print(weight.grafik.alt)

# Weil das Gleiche ergeben wird, können wir auch den Ouput von qplot() mit
# weiteren geom_XXXX() Funktionen erweitern. 
#weight.grafik.alt2 <- weight.grafik.alt + geom_histogram(aes(y=..density..),fill="white",color="black")
#print(weight.grafik.alt2)

# Sie sehen an dieser Grafik auch, dass ggplot gestappelte Layers nutzt -- das 
# Histogramm wird auf das Layer mit Dichte gestappelt und daher wird die 
# Dichtekurve zum Teil versteckt. Wir können auch das Histogramm mit alpha
# transparenter machen.
#weight.grafik.alt3 <- weight.grafik.alt + geom_histogram(aes(y=..density..),fill="white",color="black",alpha=0.65)
#print(weight.grafik.alt3)

# ggplot hat auch eingebaute Untestützung für Box-Whisker-Plots, allerdings sind x und y jetzt anders:
#weight.bw <- weight.grafik.basis + geom_boxplot(aes(x="weight",y=weight))
#print(weight.bw)
# Sie sehen auch dabei, dass Layer-Asthetics Basis-Athetics brechen. 

# Aber viel interessanter ist eben, wenn wir Gruppen unterscheiden. Dann können etwas machen wie BW-Plot nach Geschlecht:
#weight.bw.sex <- weight.grafik.basis + geom_boxplot(aes(x=sex,y=weight))
#print(weight.bw.sex)

# Und als Erinnerung können wir auch ähnliches mit der Dichte machen:
#print( weight.grafik.basis + geom_density(aes(color=sex,fill=sex),alpha=0.5) )

# Aber jetzt haben wir uns Gewicht mehrmals angeschaut. Es wird Zeit, dass uns
# auch Größe anschauen. Sind die Studenten mancher Studiengänge größer als die anderen?
# Weil wir deutlich weniger Männer haben und es einen bekannten Unterschied in der Größe 
# zwischen Männern und Frauen gibt, schließen wir erstmal die Männer aus:
#frauen <- subset(dat, CODE_HIER)

# (Sie sollten sich wirklich überlegen, ob der Schritt "gut" ist. Haben wir 
# dadurch unsre Ergebnisse verstellt? Sie müssen hier nichts schreiben, aber 
# überlegen Sie sich wirklich, ob der Schritt sinnvoll war und was für Probeme 
# er verursachen könnte. Sie könnten u.a. die folgenden Berechnungen und Plots
# zweimal machen und schauen, wie sich die Ergebnisse geändert haben.)

#Das erste, was wir machen, ist uns die Daten einfach als Box-Whisker-Diagramm 
#darzustellen. (Box-Whisker zuerst, weil Sie das auch per Hand machen könnten, 
#falls Sie unsicher sind, ob das Bild korrekt aussieht.) Hier und im Folgenden
#sollten Sie die Plots so machen, damit man einen Vergleich zwischen den Gruppen
#ziehen kann. Dafür gibt es verschiedene Möglichkeiten; die Wahl bleibt Ihnen
#überlassen. frauen.studiengang.bw <- CODE_HIER print(frauen.studiengang.bw)

# Sehen die Studiengänge anders aus? Wir müssen hier noch relativ vorrsichtig
# sein, weil die Gruppen *unbalanziert* sind, d.h. die Gruppen sind
# unterschiedlich groß. Aber wie sieht der Vergleich auf den ersten Blick aus?
# (Keine explizite Antwort nötig, nur eine Überlegung.)

# Wir können natürlich auch die Dichte anschauen:
#frauen.studiengang.dichte <- CODE_HIER
#print(frauen.studiengang.dichte)

# Haben Sie den gleichen Eindruck wie bei Box-Whisker bekommen? Unterscheiden
# sich die Gruppen?
# (Keine explizite Antwort nötig, nur eine Überlegung.)

# Welche Gruppe hat gefehlt? Wie viele Datenpunkte gab es für die Gruppe?
# (Keine explizite Antwort nötig, nur eine Überlegung.)

# Wir können auch die verschiedenen Maße der Streuung berechnen.
# In R gibt es oft verschiedene Möglichkeiten, etwas zu machen. Wir haben bisher
# Teile einer Datenmenge mit subset() rausgezogen, aber wir können das auch mit 
# einer weiteren Syntax machen:
#klinisch <- frauen[frauen$major == "M.A..Klinische.Linguistik",]
#print(klinisch)

# Das sieht erstmal sehr vervwirrend aus, ist es aber nicht. Die eckigen
# Klammern bestimmen die Auswahl an Elementen. Wir haben das ja bei Indizen in
# Vektoren schon gesehen. Man kann eigentlich Indizen oder logische
# Einschränkungen nutzen, und das gleiche gilt für Data Frames. Bei Data Frames
# haben wir zwei Dimensionen, Zeilen (rows) und Spalten (columns), daher das
# Komma. Vor dem Komma werden die Zeilen spezifiziert, nach dem Komma die
# Spalten. Wir wollen alle Spalten mitnehmen, deshalb haben wir nach dem Komma
# nichts. (Das Komma ist hier *sehr* wichtig -- wenn Sie das Komma weglassen,
# selegieren Sie einzelne Elemente statt Zeilen und bekommen dann später
# verwirrende Fehlermeldungen.) 

# Jetzt brauchen wir die Teilmenge für die anderen beiden Studiengänge, 
# Linguistik Kognition und Kommunikation und Speech Science
# HINT: wie sehen die Namen aus bzw. wie werden sie im data frame buchstabiert?
#linkk <- frauen[CODE_HIER]
#speech <- frauen[CODE_HIER] 

# Berechnen Sie -- ohne Hilfe von sd() -- die Standardabweichung für die Größe der drei 
# Gruppen. Sie können auch weitere Zeilen hinzufügen, wenn es Ihnen so leichter
# ist. 
# HINT: Formel und Beispiel für die Berechnung auf den Folien!
#klinisch.sd <- CODE_HIER
#linkk.sd <- CODE_HIER
#speech.sd <- CODE_HIER

# Berichten Sie jetzt die Mittelwerte und Standardabweichungen für die drei Gruppen. Die erste Gruppe steht hier als Muster:
#print( paste("Studiengang: Klinische Linguistik","Mean:",mean(klinisch$height),"SD:",klinisch.sd) )
#CODE_HIER

