# Freiheitsgrade beim F-Test

## F-Test als Verhältnis zwischen der Varianzen zweier Gruppen

Die Prüfgröße beim $F$-Test gibt das Verhältnis zwischen der Varianzen zweier Gruppen wieder. Wenn die Varianzen gleich (homogen) sind, sollte das Verhältnis nah an 1 sein. Manche schauen sich andere Daten an, wo der $F$-Wert größer ist, und fragen sich, was "nah an 1" bedeutet. Diese Überlegung ist der Grund, weshalb wir den $F$-Test (einen Vergleich zwischen dem $F$-Wert und der $F$-Verteilung -> $p$-Wert) und nicht direkt den $F$-Wert nutzen. "Nah genug" an 1 ist abhängig von den Freiheitsgraden (sowohl Zähler als auch Nenner). Mit mehr Freiheitsgraden ist es leichter größere Varianz per Zufall zu bekommen, und der F-Test berücksichtigt auch diesen Zufall.

## Parabel zu Freiheitsgraden beim F-Test
    
Zwei Dozenten (Frau Zähler und Herr Nenner) beide versuchen, die Namen aller Studenten in ihren jeweiligen Kursen zu merken. Irgendwann haben Frau Zähler und Herr Nenner beide alle Namen auswendig gelernt, nun müssen sie die Namen Personen zuordnen. Im Kurs von Frau Zähler gibt es $n=50$ Teilnehmer, d.h. $df_1 = 49$. Im Kurs von Herrn Nenner gibt es aber nur $n=10$ Teilnehmer, d.h. $df_2 = 9$. Es ist viel wahrscheinlicher, dass Herr Nenner Namen per Zufall korrekt zuweist als Frau Zähler, einfach weil er weniger Möglichkeiten hat, Fehler zu machen. Jetzt kommt die Frage: wer kann sich die Namen+Gesichter seiner Studenten besser merken? Man könnte auch dafür einen $t$-Test nutzen (schauen z.B. wie viele neuen Namen im Durchschnitt jeder Dozent pro Woche gelernt hat), aber es wäre nicht überraschend, dass Frau Zähler "mehr" Varianz in ihrer Akkuratheit hätte, weil sie mehr Freiheitsgrade (Möglichkeiten, Fehler zu machen) hat. Um den Vergleich "fair" zu machen, müsste man irgendeine Korrektur für diese zusätzlichen Freiheitsgrade einbauen. 

## Erklärung der Parabel

Der $F$-Test macht diese Korrektur beim Vergleich zweier Gruppen durch einen Vergleich des Verhältnisses mit der $F$-Verteilung. Warum die $F$-Verteilung für solche Vergleiche geeignet ist, ist zu viel trockene Mathematik für diese Parabel.  Den $F$-Wert (also das Verhältnis) kann man nur verstehen, wenn man die beiden Freiheitsgrade hat, aber auch das ist relativ viel zu interpretieren, daher reduziert man das oft auf den $p$-Wert.

`Pr(>F)` im R-Output ist ein $p$-Wert -- $p$-Werte sind die Wahrscheinlichkeit (Pr.obability), ein solches oder noch extremeres Ergebnis zu bekommen, gegeben dass es nur Zufall gibt. Die Berechnung davon läuft über eine "Nullverteilung", d.h. eine Verteilung, die für einen gewissen Vergleich die Verteilung unter  der Null-Hypothese entsprechen sollte. Beim $z$-Test ist das die $z$ (=Standardnormal)Verteilung, beim $t$-Test ist das die $t$-Verteilung.[^t-test] (Bei manchen wurden die Tests zuerst entwickelt und die später entdeckte entsprechende Verrteilung nach dem Test genannt, manchmal war es anders rum.)

[^t-test]: Der $t$-Test wurde von William Gosset entwickelt, der den Test unter dem Pseudonym "Student" veröffentlicht hat. Gosset hat nämlich den Test für seine Arbeit bei Guinness entwickelt und [Guinness wollte nicht, dass andere Brauereien mitbekommen](http://www.mlive.com/kalamabrew/index.ssf/2009/03/because_of_beer_1900s_guinness.html), dass der Test auch dafür sehr
nützlich wäre. 

Die Null-Hypothese beim $F$-Test ist, dass die Varianzen gleich sind -- Sie sehen das auch im R-Output, dass $H_1$ "true ratio of variances is not equal to 1" ist. (R nennt immer die Alternative Hypothese, aber daraus kann man auch die Null schließen.[^hilfe-null]) Dass heißt, der p-Wert beim $F$-Test ist die "Signifikanz der Abweichung bzw. Unterschieds". (Das ist vielleicht ein bisschen zu sehr vereinfacht, aber hoffentlich leichter zu merken.) 

[^hilfe-null]: Wenn Sie `?var.test` eingeben, gibt es auch in der Hilfe
den Hinweis:

    > The null hypothesis is that the ratio of the variances of the 
    > populations from which x and y were drawn, or in the data to which 
    > the linear models x and y were fitted, is equal to ratio.
