# R Grundlagen

Im folgenden werden die R-Befehle aus dem Kurs kurz zusammengefasst. Die Liste ist **nicht** ausführlich, beim Fehlen wichtiger Befehle kann bzw. sollte man darüber Bescheid geben, damit ich die Liste aktuellisieren kann! 

Bemerken Sie, dass die Notation `paket::befehl` genutz wird, um das Paket mit der Funktion anzugeben. Die Beispiele für den Befehl funktionieren nur dann, wenn Sie schon `library(paket)` ausgeführt haben.

# Umgang mit Daten

## scale()
Standardisiert eine Variable(Ergebnis: $z$-Wert)
```
scale(x)
```

Zentriert eine Variable
```
scale(x, scale=FALSE)
```
  
# Deskriptive Statistik 

## table()
Erstellt eine Häufigkeitstabelle für eine Variable, in der die absoluten Häufigkeiten aufgelistet werden
```
table(x)
```

## prop.table()
*proportions* table, gibt die relativen Häufigkeiten einer Häufigkeitstabelle wieder
```
prop.table(tabelle)
```
Durch das Multiplizieren mit 100 werden die relativen Häufigkeiten in Prozent umgewandelt
```
100*prop.table(tabelle)
```

## max()

Gibt den höchsten Wert in einem Objekt an
```
max(x)
```

## min()
Gibt den niedrigsten Wert in einem Objekt an
```
min(x)
```

## sum()
Gibt die Summe aller in einem Objekt enthaltenen Werte an
```
sum(x)
```

## median()
Gibt den Median aller Werte in einem Objekt an
```
median(x)
```

## mean()
Gibt das arithmetische Mittel aller Werte in einem Objekt an
```
mean(x)
```

## range()
Gibt den Wertebereich eines Objektes an
```
range(x)
```

## diff()
Berechnet die Differenz mehrere Objekte
```
diff(x)
```

Besonders nützlich mit `range(x)`
```
diff(range(x))
```

## quantile()
Gibt Minimum, Maximum sowie die drei Quartile eines Vektors an
```
quantile(x)
```
## sd()
Gibt die Standardabweichung aller werte in einem Objekt an. Wird mit Bessels Korrektur berechnet, d.h. mit $n-1$ im Nenner, sodass man die den Populationswert aus einer Stichprobe schätzt.
```
sd(x)
```
## var()
Gibt die Varianz aller Werte in einem Objekt an. Wird mit Bessels Korrektur berechnet, d.h. mit $n-1$ im Nenner, sodass man die den Populationswert aus einer Stichprobe schätzt.
```
var(x)
```

## cor()

## cov()

# Verteilungen

## Binomial
`dbinom()`, `pbinom()`, `qbinom()`, `rbinom()`

## Normal
`dnorm()`, `pnorm()`, `qnorm()`, `rnorm()`

## $\chi^2$
`dchisq()`, `pchisq()`, `qchisq()`, `rchisq()`

## F
`df()`, `pf()`, `qf()`, `rf()`

## Poisson
`dpois()`, `ppois()`, `qpois()`, `rpois()`


## t
`dt()`, `pt()`, `qt()`, `rt()`

## Uniform 
`dunif()`, `punif()`, `qunif()`, `runif()`

# Interferenzstatistik

## t.test()

## var.test()

## car::leveneTest()

## shapiro.test()

## aov()

## ez::ezANOVA()

## ez::ezSummary()

## lm()

## confint()

## anova()

## cor.test()

## lme4::lmer()

## chisq.test()

# Grafiken
## base

### qqnorm()

## ggplot2

### qplot()

### ggplot()

### aes()

### geom_point()

### geom_smooth()

### geom_bar()

### geom_error()

### geom_line()

### geom_jitter()

### geom_histogram()

### geom_density()

### geom_boxplot()

# Attributions
Image adapted from <a href='//blog.revolutionanalytics.com/2010/11/acm-data-mining-camp-1.html'>Revolution Analytics Blog</a>.

