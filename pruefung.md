# Prüfung
Stand: 2014-07-07

## Formalia
* Zulassung nur mit Erreichen 80% der möglichen Hausaufgabenpunkte
* Anmeldung bis 14.07.2014 um 16 Uhr über ILIAS Fragebogen
* Prüfungsart nach jeweiliger Prüfungsordnung
* Hauptdatei sinnvoll bennen(voraussichtlich bei Klausur vorgegeben!)
* UTF-8 als Encodierung nutzen (vgl. vorgegebene Vorlagen)

## Benotung
Um volle Punkte zu bekommen, müssen Code und Analyse:

* Formalia erfüllen
* ohne Probleme und Warnungen laufen  
* das machen, was vorgegeben wurde:  
    - sinnvolle Auswahl an Methoden und Verfahren
    - die Vorgehensweise, soweit vorgegeben, muss auch stimmen  
* für den Menschen lesbar sein, inkl:  
    - einen angemessenen Stil haben
    - gut dokumentiert sein (deshalb RMarkdown!)
    
Skripte, die perfekt funktionieren, aber schlecht lesbar oder schlecht dokumentiert sind, bekommen maximal 9 Notenpunkte: eine 3+.

## Sonstiges
Es gelten die Regelungen zum Einreichen und zu Coding-Stil aus dem Blatt zu Hausaufgaben!

# Klausur
## Form und Formalia
* Zweiteilig
    1. "Theorie" -- ohne Rechner
    2. "Analyse" -- mit Rechner
* Lesbarkeit beim Theorieteil sehr wichtig -- unlesbar wird als nicht beantwortet bewertet!
* Lösungsskript zum Rechnerteil muss wie folgt anfangen:  
    1. Zeile: `# Klausur`
    2. Zeile: `# Anrede Nachname, Vorname <benutzername@students.uni-marburg.de>`
    3. Zeile: `# 2014-MM-TT` (Datum) 
    4. Zeile einfache Lizenz, z.B.: 
          - `# Diese Datei darf weiter als anonymes Beispiel genutzt werden.`
          - `# Diese Datei darf nur Prüfungszwecken dienen.`
* Methode für Verteilung des Datensatzes und für Abgabe des Skripts wird spätestens am Montag, den 14.07.2014, bekannt gegeben.

## Datum
15.07.2015

- Vorspiel ab: 10 Uhr
- Offizieller Anfang: 10:15 Uhr
- Offizielles Ende: 11:45 Uhr
- Nachspiel bis: 12:00 Uhr

## Verlauf
1. Sie bekommen die gesamte Klausur, inkl. Beschreibung des Datensatzes und der Aufgabe desgleichen
2. Sie schreiben den rechnerfreien Teil -- Bedienung des Rechners zu diesem Zeitpunkt wird als Täuschungsversuch betrachtet!
3. Sie trennen den rechnerfreien Teil vom Rest und geben ihn ab.
4. Sie schreiben bzw. tippen den Teil mit dem Rechner.
5. Sie dürfen *nur* die eingebaute R-Hilfe und die Zusammenfassung der R-Funktionen nutzen.
    - Verwendung von Google oder andere Online-Ressourcen ird als Täuschungsversuch betrachtet.
    - Verwendung der Folien und sonstige Kursmaterialen wird als Täuschungsversuch betrachtet.
6. Sie geben Ihr Skript ab.

## Erlaubte Hilfsmittel
- Zusammenfassung der R-Funktionen (ob auf der Webseite oder in einer anderen Form wird bekannt gegeben)
- eingebaute R-Hilfe
- mit der Klausur verteilte Merkblätter, z.B. Formelblatt

## Fehlen
Fehlen nach Anmeldung ohne ärztliches Attest bzw. sonstige Regelung eines Sonderfalls wird als "nicht bestanden" bewertet.

# Hausarbeit
## Form
Analyse und Bearbeitung eines größeren echten aber trotzdem einigermaßen schönen Datensatzes

## Datum
* Freischalttermin: Dienstag, 15.07.2014 um 10 Uhr (zum Beginn der Klausur)
  - Daten über GitHub herunterladen
  - Beim Erscheinen zum Klausurtermin Ausdruck des Aufgabeblatts auch verfügbar, sonst in der Repository 
* Abgabetermin: 31.07.2014

## Formalia
* Abgabge über Private-Repository unter der Uni-Marburg-IGS-Statistik-Organisation (wird von mir eingerichtet) 
* Metadaten angeben (vgl. [Dokumentation zu pandoc](http://johnmacfarlane.net/pandoc/README.html#title-block))  
    1. Zeile: `% Hausarbeit`
    2. Zeile: `% Anrede Nachname, Vorname <benutzername@students.uni-marburg.de>`
    3. Zeile: `% 2014-MM-TT` (Datum)
* einfache Lizenz im letzten Kapitel, z.B.: 
```
# Lizenz
Diese Datei darf weiter als anonymes Beispiel genutzt werden.
```
oder
```
# Lizenz
Diese Datei darf nur Prüfungszwecken dienen.
```