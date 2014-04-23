% Hausaufgaben 
% 
% Stand: 2014-04-23

# Formalia
* Abgabge Termin (auf GitHub gepusht): wird bekannt gegeben, meistens 15 Minuten vor Anfang des nächten Termins
* Dateien in Ihrem Ordner in der Repository abspeichern (vgl. Hausaufgabe 01)
* Soweit nicht anders in der Aufgabestellung vorgesehen, Dateien `hausaufgabeXX.Rmd` benennen, wo `XX` die zweistellige Sitzungsnummer ist.
* UTF-8 als Encodierung nutzen (vgl. vorgegebene Vorlagen)
* Metadaten angeben (vgl. [Dokumentation zu pandoc](http://johnmacfarlane.net/pandoc/README.html#title-block))  
    - 1. Zeile: `% Hausaufgabe XX`
    - 2. Zeile: `% Anrede Nachname, Vorname <benutzername@students.uni-marburg.de>`
    - 3. Zeile: `% 2014-MM-TT` (Abgabe Termin)
* einfache Lizenz im letzten Kapitel, z.B.: 
```
    # Lizenz
    Diese Datei darf weiter als Beispiel genutzt werden.
```
  oder
```
    # Lizenz
    Diese Datei darf nur Prüfungszwecken dienen.
```

# Grundlegendes
Um volle Punkte zu bekommen, muss all R-Code:

* Formalia erfüllen
* ohne Probleme und Warnungen laufen  
* das machen, was vorgegeben wurde:  
    - sinnvolle Auswahl an Methoden und Verfahren
    - die Vorgehensweise, soweit vorgegeben, muss auch stimmen  
* für den Menschen lesbar sein, inkl:  
    - einen angemessenen Stil haben
    - gut dokumentiert sein (deshalb RMarkdown!)
    
Hausaufgaben, die die o.g. Voraussetzungen nicht erfüllen, können trotzdem Punkte bekommen. In dem Fall sollte möglichst viel gemacht worden sein. Die Schwierigkeiten sind gut zu dokumentieren und am besten haben Sie sich schon bei mir gemeldet -- geht natürlich nur, wenn Sie früh genug anfangen. Es gibt weniger Mitleid (und weniger Punkte), wenn Sie keine Fragen stellen.

Skripte, die perfekt funktionieren, aber schlecht lesbar oder schlecht dokumentiert sind, bekommen maximal 60% der Höchstpunktzahl.

Für jeden Tag Verspätung werden 15% der jeweiligen Punkte für die Aufgabe abgezogen. Ein Tag der Verspätung fängt immer um die genannte Uhrzeit an. Zum Beispiel ist die Hausaufgabe, die bis Dienstag um 10 Uhr aufzugeben ist, Dienstag um 10:01 insoweit so schlecht wie Mittwoch um 9:59.

Die maximale Punktzahl wird pro Aufgabe nach Schwierigkeit und Aufwand angepasst. Für die Zulassung zur Prüfung wird vorausgestetzt, dass Sie zumindest 80% der insgesamt möglichen Punkte bekommen haben.

# Einreichen

## GitHub
Bevorzugt wird Einreichen über GitHub. Am einfachsten geht es, wenn Sie dort ein Konto einrichten und einen (evtl. privaten) Fork der Kurs-Repository machen.

Wenn Sie wollen, dass niemand außer mir Ihre Hausaufgaben sehen kann, müssen Sie mir Leserechte auf Ihren -- in dem Fall privaten -- Fork geben.  

Jedoch empfehle ich, dass Sie Ihre Arbeit öffentlich verfügbar stellen, denn 

1. die anderen Kursmitglieder können von Ihren Erfolgen und Schwierigkeiten lernen
2. Sie bekommen evtl. hilfreiches Feedback von anderen
3. wenn alle das machen, ergibt sich evtl. eine optimalere Lösung -- vielleicht hat einer einen Teil besonders gut gemacht, während ein anderer einen anderen Teil besonders schön gemacht hat.

Um private Forks bei GitHub aufzumachen, brauchen Sie ein Konto-Upgrade, dass [Studierende kostenlos bekommen können](https://education.github.com/).

Der GitHub-Weg hat zwei große Vorteile: 

1. Es ist einfacher in der Bedienung (für Sie und für mich).
2. Wenn Sie regelmäßig push-en, haben Sie immer ein Backup Ihrer Hausaufgaben!

Auf meinem Arbeitsrechner läuft automatisch ein Skript, dass alle vorhandenen Änderungen pünktlich zum Abgabetermin sychronisiert, sowie auch ein Tag später, usw.

## Patches über Email
Wenn Sie aus Datenschutzgründen kein Konto bei GitHub eröffnen möchten, dürfen Sie mir auch Ihre Änderungen über Mail verschicken, *dennoch* müssen Sie Git benutzen. Die einfachste Methode ist [`git send-email`](http://git-scm.com/docs/git-send-email). Auch hier müssen Sie Bescheid geben, ob ich Ihren Code öffentlich verfügbar stellen darf (s.o.).

Ich finde diesen Weg viel umständlicher, für mich und für Sie, aber er hat den Vorteil, dass kein dritter Ihre Hausaufgaben oder sonstige persönliche Daten sehen kann.

Bemerken Sie bitte: auch -- vor allem! -- hier gilt die Regelung, dass nur Nachrichten von Uni-Mails gelesen und verarbeitet werden.
