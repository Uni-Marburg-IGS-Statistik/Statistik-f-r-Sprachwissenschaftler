Beim F-Test habe ich den F-Wert als das Verhältnis zwischen der Varianzen zweier Gruppen. Wenn die Varianzen gleich (homogen) sind, sollte das Verhältnis nah an 1 sein. Manche von Ihnen haben sich andere Daten angeschaut, wo der F-Wert größer war, und haben sich gefragt, was "nah an 1" bedeutet. Diese Überlegung ist der Grund, weshalb wir den F-Test (einen Vergleich zwischen dem F-Wert und der F-Verteilung -> p-Wert) und nicht direkt den F-Wert nutzen. "Nah genug" an 1 ist abhängig von den Freiheitsgraden (sowohl Zähler als auch Nenner). Mit mehr Freiheitsgraden ist es leichter größere Varianz per Zufall zu bekommen, und der F-Test berücksichtigt auch diesen Zufall.

Ein konkretes Beispiel zur Erklärung:
    
Sie merken, dass ich (Dozent Zähler) und ein anderer Dozent (Dozent Nenner) beide versuchen, die Namen aller Studenten in unseren jeweiligen Kursen zu merken. Irgendwann haben ich und Herr Nenner beide alle Namen auswendig gelernt, nun müssen wir die Namen Personen zuordnen. Im Statistik-Kurs haben wir n=50 Teilnehmer, d.h. df1 = 49. Im Kurs von Herrn Nenner gibt es aber nur n=10 Teilnehmer, d.h. df2 = 9. Es ist viel wahrscheinlicher, dass Herr Nenner Namen per Zufall korrekt zuweist als ich, einfach weil er weniger Möglichkeiten hat, Fehler zu machen. Jetzt kommt die Frage: welcher von uns kann sich die Namen+Gesichter seiner Studenten besser merken? Man könnte auch dafür einen t-Test nutzen (schauen z.B. wie viele neuen Namen im Durchschnitt jeder Dozent pro Woche gelernt hat), aber es wäre nicht überraschend, dass Herr Zähler (ich) "mehr" Varianz in meiner Akkuratheit hätte, weil ich mehr Freiheitsgrade (Möglichkeiten, Fehler zu machen) habe. Um den Vergleich "fair" zu machen, müsste man irgendeine Korrektur für diese zusätzlichen Freiheitsgrade einbauen. (Ich kann mir Namen von Mails und Gesichter in der Stunde merken, aber ich habe Schwierigkeiten, sie miteinander zu verbinden -- Verzeihung, wenn ich Ihre Namen in der Sitzung nicht weiß!)

Der F-Test macht diese Korrektur beim Vergleich zweier Gruppen durch einen Vergleich des Verhältnisses mit der F-Verteilung. Warum die F-Verteilung für solche Vergleiche geeignet ist, ist sogar zu viel trockene Mathematik für mich.  Den F-Wert (also das Verhältnis) kann man nur verstehen, wenn man die beiden Freiheitsgrade hat, aber auch das ist relativ viel zu interpretieren, daher reduziert man das oft auf den p-Wert.

Pr(>F) ist ein p-Wert -- p-Werte sind die Wahrscheinlichkeit (Pr.obability), ein solches oder noch extremeres Ergebnis zu bekommen, gegeben dass es nur Zufall gibt. Die Berechnung davon läuft über eine "Nullverteilung", d.h. eine Verteilung, die für einen gewissen Vergleich die Verteilung unter  der Null-Hypothese entsprechen sollte. Beim z-Test war das die z (=Standardnormal)Verteilung, beim t-Test war das die t-Verteilung. (Bei manchen wurden die Tests zuerst entwickelt und die später entdeckte entsprechende Verrteilung nach dem Test genannt, manchmal war es anders rum.)

Übrigens: der t-Test wurde von William Gosset entwickelt, der den Test unter dem Pseudonym "Student" veröffentlicht hat. Gosset hat nämlich den Test für seine Arbeit bei Guinness entwickelt und Guinness wollte nicht, dass andere Brauereien mitbekommen, dass der Test auch dafür sehr
nützlich wäre: http://www.mlive.com/kalamabrew/index.ssf/2009/03/because_of_beer_1900s_guinness.html 

Zurück zum Thema: die Null-Hypothese beim F-Test ist, dass die Varianzen gleich sind -- Sie sehen das auch im R-Output, dass H1 "true ratio of variances is not equal to 1" ist. (R nennt immer die Alternative Hypothese, aber daraus kann man auch die Null schließen.)* Dass heißt, der p-Wert beim
F-Test ist die "Signifikanz der Abweichung bzw. Unterschieds". (Das ist vielleicht ein bisschen zu sehr vereinfacht, aber hoffentlich leichter zu merken) In der ursprünglichen Version der Hausaufgabe gab es einen Fehler, den ich gestern Abend korrigiert habe. Auf den Folien wurden die Tests korrekt berechnet.

[*] Wenn Sie ?var.test eingeben, gibt es auch in der Hilfe
den Hinweis:
    
> The null hypothesis is that the ratio of the variances of the 
> populations from which x and y were drawn, or in the data to which 
> the linear models x and y were fitted, is equal to ratio.
