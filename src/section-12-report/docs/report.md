# <a id='toc1_'></a>[Bericht §12](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Bericht §12](#toc1_)    
  - [Einführung](#toc1_1_)    
    - [Gesetzliche Grundlagen für den Datensatz des ZfKD und den vorliegenden Bericht](#toc1_1_1_)    
    - [Beschreibung der aktuell am ZfKD verfügbaren Datensätze](#toc1_1_2_)    
      - [Epidemiologischer Datensatz](#toc1_1_2_1_)    
      - [Klinischer Datensatz](#toc1_1_2_2_)    
      - [Unterschiede zwischen ZfKD-Datensatz und oBDS](#toc1_1_2_3_)    
  - [Zusammenarbeit mit den Krebsregistern](#toc1_2_)    
  - [Angaben zur Datenqualität](#toc1_3_)    
    - [Vorbemerkungen und methodische Aspekte](#toc1_3_1_)    
    - [Vollzähligkeit der Erfassung von Krebsneuerkrankungen](#toc1_3_2_)    
    - [Landesspezifische Besonderheiten im aktuellen Datensatz](#toc1_3_3_)    
    - [Informationen zur Diagnose](#toc1_3_4_)    
      - [Anteil fehlendes Grading (wenn Angaben zum Grading erwartet werden)](#toc1_3_4_1_)    
      - [Vollständigkeit der Angaben zum klinischen und pathologischem T-Stadium](#toc1_3_4_2_)    
      - [Vollständigkeit pathologischer T-Stadien bei dokumentierter Operation](#toc1_3_4_3_)    
    - [Informationen zur Therapie](#toc1_3_5_)    
      - [Fälle ohne Therapieangaben](#toc1_3_5_1_)    
      - [Fehlende Angaben zur Operation bei erwartbarer Operation (Brust- Darm-, Hodenkrebs und Malignes Melanom)](#toc1_3_5_2_)    
    - [Fehlende Angaben zur systemischen Therapie bei erwarteter systemischer Therapie (akute Leukämien und hochmaligne Lymphome, Kolonkarzinom Stadium III)](#toc1_3_6_)    
      - [Fehlende Angaben zur Strahlentherapie bei erwarteter Strahlentherapie (nach brusterhaltender Operation bei Brustkrebs)](#toc1_3_6_1_)    
      - [Abstand zwischen Diagnose und erster Operation](#toc1_3_6_2_)    
    - [Informationen zum Krankheitsverlauf](#toc1_3_7_)    
      - [Nach Brustkrebs](#toc1_3_7_1_)    
      - [Nach Darmkrebs](#toc1_3_7_2_)    
    - [Einordnung der Ergebnisse zur Datenqualität](#toc1_3_8_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.5.0 | 📦 pandas-plots: 1.4.5


    database file:           2025-11-11_data_clin.duckdb
    data tag:                v2.3
    last kkr data import:    2025-09-30
    sql table created:       2025-11-11 11:52:01
    doi:                     10.18444/5.03.01.0005.0021.0002
    document created:        2026-04-02 17:16:19



<br>

## <a id='toc1_1_'></a>[Einführung](#toc0_)
### <a id='toc1_1_1_'></a>[Gesetzliche Grundlagen für den Datensatz des ZfKD und den vorliegenden Bericht](#toc0_)
Mit dem Gesetz zur Zusammenführung von Krebsregisterdaten (2021) wurde auch das Bundeskrebsregisterdatengesetz (BKRG) novelliert. Unter anderem wurde der jährlich aus den Landeskrebsregistern an das Zentrum für Krebsregisterdaten (ZfKD) am Robert Koch-Institut zu übermittelnde Datensatz um wesentliche Elemente der klinischen Krebsregistrierung (Angaben zur Therapie und Krankheitsverlauf) sowie zusätzliche diagnostische Variablen für ausgewählte Diagnosen erweitert. Diese werden in den Krebsregistern je nach Zeitpunkt der landesgesetzlichen Umsetzung des Krebsfrüherkennungs- und Registergesetzes (KFRG 2013) mindestens seit 2019 erfasst. DieDefinition der einzelnen Variablen im Onkologischen Basisdatensatz (oBDS) erfolgt durch die Arbeitsgemeinschaft Deutscher Tumorzentren und den Deutsche Krebsregister e.V. (vormals: Gesellschaft der epidemiologischen Krebsregister in Deutschland) und werden nach § 65c Abs. 1a S. 1 regelmäßig angepasst. 
Um aus dem  für die Meldungen an die  Krebsregister maßgeblichen OBDS im Rahmen der Vorgaben des BKRG einen auswertefähigen Datensatz für die Übermittlung an das ZfKD zu erzeugen, wurde im Jahr 2022 entsprechend § 5 Abs. 3 BKRG in einer Arbeitsgruppe aus Vertretern des ZfKD und den Krebsregistern der „ZfKD-Lieferdatensatz“ vereinbart. 
Der vorliegende Bericht über die Erfahrungen mit der bundesweiten Erfassung von Krebsregisterdaten nach §12 BKRG enthält Angaben zur Datenqualität, zur Zusammenarbeit des ZfKD mit den Krebsregistern und zur Bearbeitung externer Datennutzungsanträge.

<br>

### <a id='toc1_1_2_'></a>[Beschreibung der aktuell am ZfKD verfügbaren Datensätze](#toc0_)
Wegen der institutionellen Trennung der (flächendeckenden) epidemiologischen und klinischen Krebsregistrierung in Niedersachsen und Baden-Württemberg, der in den meisten Registern bereits etablierten Schnittstelle für die epidemiologischen Daten  und der unterschiedlich langen verfügbaren Zeitreihen wurde zunächst vereinbart, dass die Register jeweils einen epidemiologischen Datensatz im bisherigen csv-Format (ab erstem verfügbarem Diagnosejahr, je nach Bundesland also mindestens ab 2009) und einen „klinischen Datensatz“ als relationalen Datensatz im xml-Format (für Diagnosen ab 2020) übermitteln. Auf die früher aus einzelnen Bundesländern verfügbaren wenig detaillierten Angaben zur Primärtherapie (z.B. Operation ja/nein) wurde wegen der fehlenden Überführbarkeit in den aktuellen  klinischen Datensatz und der sehr heterogenen Verfügbarkeit und Vollständigkeit  verzichtet. Im ersten Quartal 2023 wurden neben den epidemiologischen Daten erstmals klinische Daten im neuen Datenformat für die Diagnosejahre 2020 und 2021 an das ZfKD übermittelt.

Inhaltlich kann der epidemiologische Datensatz als Teilmenge der klinischen Daten angesehen werden. Unterschiede bestehen bezüglich der Falldefinition: Während für den epidemiologischen Datensatz die internationale gültige Regel gilt, nach der mehrere Tumoren in gleichen Organen oder Organsystemen unter bestimmten Bedingungen (gleicher histologischer Typ) nur einmal gezählt werden, weicht die klinische Falldefinition in einigen Fällen davon ab. So werden zwei Tumoren in paarigen Organen (z.B. Niere, Hoden, Brust) doppelt erfasst, wenn sie beidseitig auftreten, ebenso wird bei zeitlich nacheinander auftretenden in situ und invasiven Tumoren des gleichen Organs und in bestimmten Fällen bei mehreren Darm- und Hauttumoren unterschiedlicher Lokalisation vorgegangen.


<br>

#### <a id='toc1_1_2_1_'></a>[Epidemiologischer Datensatz](#toc0_)

Der epidemiologische Datensatz enthält alle Angaben, die in den meisten internationalen bevölkerungsbezogenen Krebsregistern erfasst werden: Angaben zur Diagnose (inkl. monatsgenauem Diagnosedatum, Topographie und Morphologie nach ICD-O, Tumorstadium nach TNM, Differenzierungsgrad sowie Art der Diagnosesicherung) sowie zum monatsgenauen Sterbedatum und zur Todesursache.


<br>

#### <a id='toc1_1_2_2_'></a>[Klinischer Datensatz](#toc0_)
Der klinische Datensatz enthält darüber hinaus detaillierte Angaben zur Therapie (Operationen nach OPS-Klassifikation inklusive Residualstatus, Strahlentherapie inkl. Angaben zum Zielgebiet und systemische Therapie einschließlich der verwendeten Medikamente bzw. Protokolle, sowie jeweils monatsgenaue Datumsangaben und tagesgenaue zeitliche Abstände zwischen Diagnose und Therapiebeginn). Für die Strahlentherapie und systemische Therapie ist zudem die Stellung zur OP (adjuvant oder neoadjuvant) angegeben. Therapieangaben betreffen den gesamten Krankheitsverlauf und damit auch Informationen zu Zweit- oder Drittlinientherapien sowie Therapien nach Rezidiven und Progression. Daher handelt es sich technisch im Gegensatz zu den epidemiologischen Daten um einen relationalen Datensatz mit mehreren, auf Tumorebene verknüpfbaren Tabellen. Für ausgewählte Entitäten (bisher: Darm-, Prostata und Brustkrebs sowie malignes Melanom) sind ergänzende Angaben zur Diagnose aus den entsprechenden Modulen des oBDS übernommen worden (u.a. Gleason-Score und prätherapeutischer PSA-Wert beim Prostatakarzinom, Hormonrezeptor- und Her2neu-Status beim Brustkrebs).

<br>

#### <a id='toc1_1_2_3_'></a>[Unterschiede zwischen ZfKD-Datensatz und oBDS](#toc0_)

Im Vergleich zum oBDS fehlen in den Daten des ZfKD vor allem Angaben zu den meldenden bzw. behandelnden Einrichtungen, Nebenwirkungen der Therapie, Tumorkonferenzen, zum allgemeinen Leistungszustand (ECOG oder Karnofsky), sowie Gründe für Beendigung einer systemischen Therapie und Strahlendosis. 


<br>

## <a id='toc1_2_'></a>[Zusammenarbeit mit den Krebsregistern](#toc0_)
Die Datenlieferung für die klinischen Daten erfolgt nach dem vereinbarten xml-Schema, die epidemiologischen Daten werden nach dem früheren Schema als csv-Dateien übermittelt. Bei jeder Datenlieferung werden jeweils die Daten aus allen Diagnosejahren übermittelt, um Nachmeldungen und Änderungen des Vitalstatus und (bei den klinischen Daten) des Krankheitsverlaufs abbilden zu können. Die Register der ostdeutschen Bundesländer (Berlin/Brandenburg, Mecklenburg-Vorpommern, Sachsen, Sachsen-Anhalt und Thüringen) liefern bisher nur einen klinischen Datensatz ab dem Diagnosejahr 2020, aus dem das ZfKD nach Prüfung auf Mehrfachtumoren (nach epidemiologischer Zählweise) jeweils epidemiologische Datensätze erzeugt. Die aus diesen Ländern am ZfKD verfügbaren epidemiologischen Daten bis einschließlich 2019 stammen noch aus der letzten Datenlieferung des Gemeinsamen Krebsregisters der neuen Bundesländer und Berlins (GKR), das seit Ende 2022 nicht mehr besteht, weshalb der Vitalstatus für diese Fälle bisher noch nicht aktualisiert werden konnte.  Nach Einarbeitung der Daten aus dem Datenbestand des GKR und Aktualisierung des Vitalstatus dieser Fälle (nachträgliche Abgleiche mit den Sterbefällen und Wegzügen in den jeweiligen Bundesländern) werden diese Register voraussichtlich in absehbarer Zeit (mindestens Sachsen-Anhalt schon im kommenden Jahr) in der Lage sein, auch epidemiologische Daten über eine längere Zeitreihe bereitzustellen.
  
Nach eigenem Ermessen und Rücksprache mit dem ZfKD liefern einige Register im Laufe des Jahres aktualisierte Datenstände, häufig mit einer deutlich höheren Fallzahl für das jeweils letzte Diagnosejahr, und tragen damit auch unterjährig zu einer Verbesserung der Datenbasis und Datenqualität bei.

Rückmeldungen an die Register erfolgen mittels automatisierter Qualitätsberichte, die inhaltlich fortlaufend erweitert und mindestens einmal jährlich in Videokonferenzen mit den Registervertretern diskutiert werden. Bei Unklarheiten und Auffälligkeiten erfolgt zusätzlich ein bilateraler Austausch. 
Darüber hinaus nimmt das ZfKD an den alle 6 bis 8 Wochen stattfindenden Treffen der Plattform der klinischen Krebsregister („§65c“) teil und entsendet zwei Vertreter als Mitglied in den Deutsche Krebsregister e.V. (derzeit ein Vertreter im Vorstand). An den vielfältigen Arbeitsgruppen von Plattform und Verein nimmt das ZfKD nur sporadisch teil. Hier wäre eine stärkere Beteiligung sinnvoll, kann aber bisher aus Kapazitätsgründen nicht geleistet werden. Entsprechend hat das ZfKD praktisch keine Ressourcen für eine zentrale Unterstützung der Krebsregister bei übergreifenden Problemstellungen wie den anstehenden Versionswechseln der für die Krebsregistrierung relevanten Klassifikationssysteme (TNM-9, ICD-O-4 und ICD-11).
Die Zusammenarbeit mit den Landeskrebsregistern kann seitens des ZfKD als sehr harmonisch und konstruktiv beschrieben werden. Kooperationen gehen über die reine Datenübermittlung und -prüfung hinaus und betreffen u.a. auch wissenschaftliche Projekte und Vorträge, Drittmittelanträge sowie Gremien- und Öffentlichkeitsarbeit. So ist für 2026 die Bereitstellung eines gemeinsamen interaktiven bundesweiten Datenberichts aus dem ZfKD-Datensatz über die Website des DKR e.V. geplant.


<br>

## <a id='toc1_3_'></a>[Angaben zur Datenqualität](#toc0_)
### <a id='toc1_3_1_'></a>[Vorbemerkungen und methodische Aspekte](#toc0_)

Die Prüfung der Qualität der von den Krebsregistern übermittelten Daten sowie entsprechende Rückmeldungen an die Register gehören zu den gesetzlichen Aufgaben des ZfKD. Im Folgenden werden erstmals ausgewählte Auswertungen zur Datenqualität öffentlich bereitgestellt, um auch potentiell Datennutzenden außerhalb der Krebsregistrierung einen ersten Überblick zur Vollständigkeit bestimmter Angaben im Datensatz zu verschaffen. Zukünftig ist mindestens alle zwei Jahre eine Aktualisierung, gegenenfalls mit Erweiterung der entsprechenden Auswertungen, geplant.

Der Fokus der Auswertungen liegt dabei auf der Vollständigkeit von Angaben zur Diagnose (einschließlich Tumorstadien, Differenzierungsgrad) und Therapie, sowie ersten orientierenden Analysen zu Ereignissen im Krankheitsverlauf.  Die hier vorgelegten Auswertungen beziehen sich, mit Ausnahme der Aussagen zur geschätzten Vollzähligkeit der Erfassung, auf den klinischen Datensatz (Diagnosejahre 2020-2023). Nur auf Todesbescheinigungen beruhende Fälle (DCO=death vcertificate only) sowie Fälle mit  nicht-melannotischem Hautkrebs sind ausgeschlossen. Auswertungen zum  epidemiologischen Datensatz, die auch Veränderungen über einen längeren Zeitraum abbilden und Aussagen zur Qualität der Sterbedaten/Angaben zum Vitalstatus beinhalten, werden zu einem späteren Zeitpinkt gesondert veröffentlicht. 

Für Auswertungen zur Vollständigkeit von Therapieangaben wurden Diagnosen aus dem 2. Halbjahr 2023 ausgeschlossen, da Therapiemeldungen häufig deutlich später als Diagnosemeldungen im Krebsregister eingehen. Ausgeschlossen wurden außerdem Personen, die innerhalb von 6 Monaten nach Diagnose verstorben waren, da hier eine eine höhere Wahrscheinlichkeit von Kontraindikationen für eine tumorbezogene Therapie vermutet werden kann. Bei den Operationen wurden alle Prozeduren aus dem Kapitel 5 des OPS berücksichtigt, nur bei den organspezifischen Auswertungen (3.5.2) wurde überprüft, ob der OPS-Kode mit einer tumorresektierenden Operation vereinbar war. Die jeweiligen Filterfunktionen zu den einzelnen Auswertungen sind als eigene Grafiken mit Nennung der Fallzahlen den eigentlichen Abbildungen vorangestellt.

	


<br>

### <a id='toc1_3_2_'></a>[Vollzähligkeit der Erfassung von Krebsneuerkrankungen](#toc0_)

Die Vollzähligkeit der Erfassung von Krebserkrankungen (ohne nicht-melanotischem Hautkrebs) wird vom ZfKD lediglich auf Basis des epidemiologischen Datensatzes regelmäßig geschätzt. Nicht berücksichtigt werden Fälle, die den Registern nur über eine Todesbescheinigung oder einen entsprechenden Datenabgleich bekannt werden (DCO-Fälle). Die Schätzung basiert im Kern auf der sogenannten „M/I“ Methode, die in ihrer ursprünglichen Form von einem konstanten Verhältnis der Mortalität zur Inzidenz (M/I), nach Geschlecht, Alter und Diagnose ausgeht. Die Methode der Vollzähligkeitsschätzung war ursprünglich vor allem als Orientierung für neue Register in deren Aufbaujahren konzipiert. Sie wurde im Laufe der Jahre weiterentwickelt und berücksichtigt inzwischen unter bestimmten Bedingungen regionale Abweichungen des Verhältnisses von M/I,  die nach den Ergebnissen aus internationalen und nationalen Studien z.B. in Abhängigkeit von sozioökonomischen Faktoren auf regionaler Ebene auch zu erwarten sind. Dennoch muss betont werden, dass es sich um eine Schätzung mit nicht unerheblichen Unsicherheiten handelt und die Methode mangels Goldstandards in Deutschland noch nicht validiert werden konnte.
Die aktuellen Ergebnisse der Schätzung deuten darauf hin, dass seit mindestens 2020 alle Register eine ausreichende Vollzähligkeit der Erfassung bösartiger Tumorerkrankungen (ohne Berücksichtigung nicht-melanotischer Hautkrebsfälle) nach epidemiologischer Zählweise aufweisen, da jeweils mehr als 90% der aus dem Schätzmodell errechneten erwarteten Fälle erfasst wurden. Für einige Register konnte dieser Wert für das jeweils letzte Lieferdatenjahr erst durch Nachlieferungen im laufenden Jahr erreicht werden, eine ausreichende Vollzähligkeit war in diesen Fällen also erst einige Monate nach dem gesetzlich vorgesehen Lieferdatum gegeben. Wenn man berücksichtigt, dass sich die Frist für die Datenlieferung durch die Register ab 2023 von zwei Jahren auf ein Jahr verkürzt hat, ist dennoch festzustellen, dass sich die Aktualität der im ZfKD verfügbaren Daten in den letzten Jahren deutlich verbessert hat, was eine aktuellere Berichterstattung des ZfKD ermöglicht. 
Teilweise sehr aufwändige Nachrecherche z.B. nur über Sterbe- oder Pathologiemeldungen bekannt gewordener Fälle führen in der Regel zu deutlich verzögert eingehenden Meldungen, die jedoch die Vollzähligkeit und Vollständigkeit der Erfassung verbessern. Daher ist auch in Zukunft damit zu rechnen, dass sich Ergebnisse aus zurückliegenden Jahren nachträglich noch leicht verändern können, was für bevölkerungsbezogene Krankheitsregister generell gilt (Prinzip der „lebenden Datenbanken“).



<br>

### <a id='toc1_3_3_'></a>[Landesspezifische Besonderheiten im aktuellen Datensatz](#toc0_)
In Thüringen, Sachsen-Anhalt und Bayern (Regierungsbezirk Oberbayern) ist davon auszugehen, dass Sterbefälle in den aktuellen Jahren (ab 2020 oder später) noch nicht vollständig eingegangen sind, da der entsprechende Datenabgleich zum Zeitpunkt der Datenlieferung noch nicht etabliert war oder sich (in Oberbayern) verzögerte. 
Für Niedersachsen enthält der klinische Datensatz derzeit noch nicht alle Fälle, die im epidemiologischen Datensatz übermittelt wurden.
In Thüringen fehlen im klinischen (und damit auch in den daraus abgeleiteten epidemiologischen Daten ab 2020) derzeit noch etwa 20 - 25% der Fälle, der zugrundeliegende  Fehler (beim Datenexport aus den regionalen Register) wurde inzwischen identifiziert und behoben. Eine probeweise Neulieferung aktueller Diagnosejahre ergab plausible Fallzahlen, so dass der 2026 verfügbare Datensatz (2020-2024) für Thüringen aller Voraussicht nach eine ausreichende Vollzähligkeit aufweisen wird. In Sachsen-Anhalt führte eine abweichende Kodierung der Dignität bei über eine Fernmetastase diagnostizierten Primärtumoren dazu, dass im aktuellen ZfKD-Datensatz knapp 5 Prozent der Fälle aus den aktuellen Jahren fehlen. Auch dies wird bei der kommenden Datenlieferung korrigiert werden. 
Aus Schleswig-Holstein, Niedersachsen, Bremen und dem Saarland wurden dem ZfKD bisher keine Daten zu Verlaufsereignissen und zum Residualstatus übermittelt. Aus Hamburg fehlen Angaben aus allen Organmodulen, in Nordrhein-Westfalen aus dem Prostatamodul, und nur aus sechs Bundesländern liegen Angaben aus dem Modul zum malignen Melanom vor. Dies bedeutet nicht, dass in diesen Ländern keine entsprechenden Informationen vorliegen: in erster Linie liegt  der Grund für die noch bestehenden Lücken in noch nicht umgesetzten „Best-of“-Programmierungen zur Zusammenfassung von Informationen aus mehreren Meldungen entsprechend der ZfKD-Schnittstelle. Diese Lücken sollten sich aller Voraussicht nach in absehbarer Zeit (auch nachträglich für die bereits übermittelten Diagnosejahre) schließen lassen.



<br>

### <a id='toc1_3_4_'></a>[Informationen zur Diagnose](#toc0_)
#### <a id='toc1_3_4_1_'></a>[Anteil fehlendes Grading (wenn Angaben zum Grading erwartet werden)](#toc0_)
Der Differenzierungsgrad (Grading)  ist nur für bestimmte Tumoren relevant, die folgenden Auswertung beschränkt sich daher auf Karzinome (ICD-O-3: 81010/3 – 8576/3) und Tumorlokalisationen, bei denen im Falle einer histologischen Sicherung in der Regel eine Angabe zum Grading erwartet werden kann (C00-C33, C50-C57, C60, C62-C68). Prostatakarzinome (C61) wurden hier nicht berücksichtigt, da hier in der Regel der spezifischere Gleason-Score über das entsprechende Modul übermittelt wurde.  Der Anteil fehlender Werte zum Differenzierungsgrad bei den genannten Entiäten lag bundesweit (ohne Rheinland-Pfalz) bei 9%. Für Rheinland Pfalz führte ein Fehler beim Datenexport zu einer sehr hohen Anteil fehlender Werte, dieser Fehler wird bei der nächsten Datenlieferung korrigiert werden.


**Lokalisationen C00-C33, C50-C57, C60-C68 und Morphologie: 8010-8576**



```
    n = 3_241_401                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [keine DCO]:                   n = 2_890_167  (89.2%) ░░░░██████████████████████████
    └ [nur gradingrelevante Tumore]:   n = 997_299  (30.8%) ░░░░░░░░░░░░░░░░░░░░░█████████
    └ [ohne 07-RP]:                    n = 949_525  (29.3%) ░░░░░░░░░░░░░░░░░░░░░░████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and not z_is_dco
and 
    (
        left(z_icd10_3d, 1) ='C' and
        (
            right(z_icd10_3d, 2)::int8 between 00 and 33
            or right(z_icd10_3d, 2)::int8 between 50 and 57
            or right(z_icd10_3d, 2)::int8 between 63 and 68
            or right(z_icd10_3d, 2)::int8 = 60
        )
        and left(Morphologie_Code,4)::int between 8010 and 8576
    )
and z_kkr <> 7
```

</details>


    
    



    
![svg](report_files/output_10_5.svg)
    



<br>

#### <a id='toc1_3_4_2_'></a>[Vollständigkeit der Angaben zum klinischen und pathologischem T-Stadium](#toc0_)
In bundesweit  84% der Fälle mit Diagnosen, für die ein TNM-Stadium in der Regel definiert ist, liegt mindestens ein klinisches (cT) oder pathologisches (pT) T-Stadium vor (Bundesländer: 81%-92%), in 25% sind beide Angaben vorhanden. Aus Rheinland-Pfalz wurde grundsätzlich nur entweder ein pT oder cT übermittelt.

- Kategorien
  - `1_t_cp` - cT und pT sind vorhanden und nicht `X`
  - `2_t_c`- cT ist vorhanden und nicht `X`, pT ist leer
  - `3_t_p`- pT ist vorhanden und nicht `X`, cT ist leer
  - `4_no_t`- beide leer

**Lokalisationen C00-C43, C45-C69, C73-C75  außer: C26, C39, C55, C14.0, C57.9, C63.9, C75.9  und Morphologie: 8010-8790**



```
    n = 3_241_401                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:             n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [keine DCO]:                n = 2_890_167  (89.2%) ░░░░██████████████████████████
    └ [nur tnm-relevante Tumore]: n = 1_610_344  (49.7%) ░░░░░░░░░░░░░░░░██████████████
    └ [ohne 07-RP]:               n = 1_532_637  (47.3%) ░░░░░░░░░░░░░░░░██████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and not z_is_dco
and 
    (
        left(z_icd10_3d, 1) ='C' and
        (
            right(z_icd10_3d, 2)::int8 between 00 and 43
            or right(z_icd10_3d, 2)::int8 between 45 and 69
            or right(z_icd10_3d, 2)::int8 between 73 and 74
        )
        and left(Morphologie_Code,4)::int between 8010 and 8790
        and z_icd10_3d not in ('C26', 'C39', 'C55')
        and z_icd10 not in ('C14.0', 'C57.9', 'C63.9')
    )
and z_kkr <> 7
```

</details>


    
    



    
![svg](report_files/output_12_5.svg)
    



<br>

#### <a id='toc1_3_4_3_'></a>[Vollständigkeit pathologischer T-Stadien bei dokumentierter Operation](#toc0_)

Nach einer in den Krebsregistern dokumentierten Operation (innerhalb von 6 Monaten nach Diagnose)  ist in 85% der Fälle ein der Tumordiagnose zugeordnetes pathologisches T-Stadium vorhanden (Bundesländer: 74%-93%). Bei Vorhandensein des pT ist bundesweit in 88% auch ein gültiger pathologischer Lymphknotenstatus (pN, ohne pNX) dokumentiert (Bundesländer: 73%-99%, ohne Abbildung).

**Lokalisationen C00-C43, C45-C69, C73-C75  außer: C26, C39, C55, C14.0, C57.9, C63.9, C75.9 und mit Morphologie: 8010-8790**




```
    n = 3_241_401                                        (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                      n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [keine DCO]:                         n = 2_890_167  (89.2%) ░░░░██████████████████████████
    └ [nur tnm-relevante Tumore]:          n = 1_610_344  (49.7%) ░░░░░░░░░░░░░░░░██████████████
    └ [Tumor hat OP < 180d nach Diagnose]:   n = 835_516  (25.8%) ░░░░░░░░░░░░░░░░░░░░░░░███████
    └ [nur Tumore mit OPS Kap. 5]:           n = 817_684  (25.2%) ░░░░░░░░░░░░░░░░░░░░░░░███████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and not z_is_dco
and 
    (
        left(z_icd10_3d, 1) ='C' and
        (
            right(z_icd10_3d, 2)::int8 between 00 and 43
            or right(z_icd10_3d, 2)::int8 between 45 and 69
            or right(z_icd10_3d, 2)::int8 between 73 and 74
        )
        and left(Morphologie_Code,4)::int between 8010 and 8790
        and z_icd10_3d not in ('C26', 'C39', 'C55')
        and z_icd10 not in ('C14.0', 'C57.9', 'C63.9')
    )
and z_tum_id in (select distinct z_tum_id from OP where z_period_diag_op_day < 180)
and z_tum_id in (select distinct z_tum_id from OPS where left(ops.Code,1) in ('5'))
```

</details>


    
    



    
![svg](report_files/output_14_5.svg)
    



<br>

### <a id='toc1_3_5_'></a>[Informationen zur Therapie](#toc0_)
#### <a id='toc1_3_5_1_'></a>[Fälle ohne Therapieangaben](#toc0_)

Der Anteil von Fällen ohne Therapieangaben betrug bundesweit über alle bösartigen Tumorerkrankungen (C00-C97 ohne C44, mit den unter 3.1. genannten Ausschlusskriterien) 23 % (nach Bundesland: 10%-31%). Der Anteil lag in den neuen Bundesländern und Berlin fast durchgehend niedriger (10%-19%) als in den alten Bundesländern (17%-31%) und bei soliden Tumoren (22%) niedriger als bei systemischen Erkrankungen (Leukämien und Lymphome: 35%). Im Zeitverlauf ist zwischen 2020 und 2022 keine Tendenz zu beobachten. Trotz Ausschluss der Diagnosen im 2. Halbjahr 2023 liegt der Anteil von Fällen ohne Therapieangabenin 2023 noch etwas über dem Wert der Vorjahre, auch hier ist wahrscheinlich noch mit nachträglichen Ergänzungen zu rechnen.




```
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023 ohne letzte 6m]:   n = 2_633_644  (81.3%) ░░░░░░████████████████████████
    └ [ICD10 nur C]:                   n = 2_207_903  (68.1%) ░░░░░░░░░░████████████████████
    └ [keine DCO]:                     n = 2_129_378  (65.7%) ░░░░░░░░░░░███████████████████
    └ [keine C44,D04]:                 n = 1_736_942  (53.6%) ░░░░░░░░░░░░░░████████████████
    └ [keine Verstorbenen < 180 Tage]: n = 1_486_572  (45.9%) ░░░░░░░░░░░░░░░░░█████████████
```

<details>
<summary>filter-sql</summary>

```sql
Diagnosedatum between '2020-01-01' and '2023-06-30'
and left(z_icd10_3d,1) = 'C'
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_16_5.svg)
    



<br>

#### <a id='toc1_3_5_2_'></a>[Fehlende Angaben zur Operation bei erwartbarer Operation (Brust- Darm-, Hodenkrebs und Malignes Melanom)](#toc0_)
In den folgenden Auswertungen wurden zusätzlich zu den unter 3.1. genannten Fällen auch noch solche mit primärer Fernmetastasierung ausgeschlossen. Für Fälle ohne dokumentierte, das jeweilige Organ betreffende Operation (ohne Berücksichtigung diagnostischer Eingriffe) wurde zusätzlich ausgewertet, ob ein gültiges pathologisches T-Stadium (pT) vorlag, was als Hinweis auf eine fehlende oder unvollständige klinische Meldung interpretiert werden kann. 

Nach Brustkrebsdiagnose liegen bundesweit in 25% (nach Bundesländern: 9%-32%) keine Angaben zu einer Operation an der Brust vor. Bei etwa einem Drittel dieser Fälle ist ein pT vorhanden. Der Anteil von Fällen ohne dokumentierte Operation sinkt bei Ausschluss älterer Patientinnen (über 80 Jahre) von 25% auf 23%.
Nach dokumentierten Operationen war ein R-Status in 98% der Fälle mit R0-2 angegeben (Bundesländer: 95%-99%), unter den sonstigen Fällen sind fehlende Befunde aufgrund nicht beurteilbarer Präparate (RX) eingerechnet (ohne Abbildung).

- Kategorien
  - `1_op`: mind. eine OPS im definierten Bereich (3Steller, organspezifisch) ist dokumentiert
  - `2_no_op_but_tp`: keine OPS, aber pT 1-4 ist dokumentiert
  - `3_rest`: keine der zuvor genannten Merkmale trifft zu



```
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                  n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [ICD10 C50]:                       n = 316_685   (9.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [kein M1]:                         n = 295_287   (9.1%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine Verstorbenen < 180 Tage]:   n = 283_195   (8.7%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and z_icd10_3d = 'C50'
and ifnull(z_m_pc_1,'') <> '1'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_18_5.svg)
    


Beim Darmkrebs (C18-C20) liegen bundesweit in 32% (nach Bundesländern: 10%-41%) keine Angaben zu einer Darmoperation vor. In rund der Hälfte dieser Fälle ist ein pT vorhanden. Der Anteil von Fällen ohne dokumentierte Operation sinkt bei Ausschluss älterer Patientinnen und Patienten (>80 Jahre) auf 31%. 



```
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                  n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [ICD10 C18-C20]:                   n = 226_382   (7.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [kein M1]:                         n = 187_563   (5.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [keine Verstorbenen < 180 Tage]:   n = 161_924   (5.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and z_icd10_3d in ('C18', 'C19', 'C20')
and ifnull(z_m_pc_1,'') <> '1'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_20_5.svg)
    


Beim Malignen Hautmelanom (C43) liegen bundesweit in 42% (nach Bundesländern: 3%-77%) keine Angaben zu einer zur Diagnose passenden Operation vor. In rund 80% dieser Fälle ist ein pT vorhanden. Auch nach Ausschluss älterer am Melanom erkrankter Personen (>80 Jahre) liegt der Anteil von Fällen ohne dokumentierte Operationen bei 42%.




```
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                  n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [C43]:                             n = 110_067   (3.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [kein M1]:                         n = 107_527   (3.3%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:   n = 104_913   (3.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and z_icd10_3d = 'C43'
and ifnull(z_m_pc_1,'') <> '1'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_22_5.svg)
    


Beim Hodenkrebs (C62) liegen bundesweit in 30% (nach Bundesländern: 4%-46%) keine Angaben zu einer Hodenoperation vor. In rund 80% dieser Fälle ist ein pT vorhanden. Auch nach Ausschluss älterer Hodenkrebspatienten (>80 Jahre) liegt der Anteil von Fällen ohne dokumentierte Operationen bei 30%.




```
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]:                  n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [ICD10 C62]:                        n = 16_882   (0.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [kein M1]:                          n = 15_892   (0.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:    n = 15_657   (0.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and z_icd10_3d in ('C62')
and ifnull(z_m_pc_1,'') <> '1'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_24_5.svg)
    



<br>

### <a id='toc1_3_6_'></a>[Fehlende Angaben zur systemischen Therapie bei erwarteter systemischer Therapie (akute Leukämien und hochmaligne Lymphome, Kolonkarzinom Stadium III)](#toc0_)
Bei akut verlaufenden Leukämien und Lymphome (akute myeloide und lymphatische Leukämie, diffuses großzelliges B-Zell-Lymphom, follikuläres Lymphom Grad IIIb) liegen bundesweit in 23% (nach Bundesländern: 9%-55%) keine Angaben zu einer systemischen Therapie vor. In der überwiegenden Mehrzahl dieser Fälle ist auch keine andere Therapie dokumentiert, dies betrifft bundesweit insgesamt 18% der Fälle. 




```
    count: distinct z_tum_id
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2023 ohne letzte 6m]:   n = 2_633_644  (81.3%) ░░░░░░████████████████████████
    └ [ICD10 C50]:                       n = 278_699   (8.6%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [kein M1]:                         n = 259_569   (8.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [nur OPS für BET]:                 n = 144_136   (4.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [keine Verstorbenen < 180 Tage]:   n = 143_832   (4.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```

<details>
<summary>filter-sql</summary>

```sql
Diagnosedatum between '2020-01-01' and '2023-06-30'
and z_icd10_3d = 'C50'
and ifnull(z_m_pc_1,'') <> '1'
and left(Code,5) in ('5-870')
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_26_5.svg)
    



<br>

#### <a id='toc1_3_6_1_'></a>[Fehlende Angaben zur Strahlentherapie bei erwarteter Strahlentherapie (nach brusterhaltender Operation bei Brustkrebs)](#toc0_)
Nach brusterhaltender Operation eines bösartigen Tumors der Brust liegen bundesweit in 33% (nach Bundesländern: 13%-54%) keine Angaben zu einer Strahlentherapie vor. Bei etwas mehr als der Hälfte dieser Fälle ist auch keine systemische Therapie dokumentiert, dies betrifft bundesweit insgesamt 18% der Fälle. 




```
    n = 3_241_401                                                      (100.0%) ██████████████████████████████
    └ [DJ 2020-2023 ohne letzte 6m]:                     n = 2_633_644  (81.3%) ░░░░░░████████████████████████
    └ [z_icd10 in ('C91.0', 'C92.0', 'C83.3', 'C82.4')]:    n = 38_768   (1.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine DCO]:                                          n = 37_488   (1.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [kein M1]:                                            n = 37_461   (1.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:                      n = 27_653   (0.9%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

<details>
<summary>filter-sql</summary>

```sql
Diagnosedatum between '2020-01-01' and '2023-06-30'
and z_icd10 in ('C91.0', 'C92.0', 'C83.3', 'C82.4')
and not z_is_dco
and ifnull(z_m_pc_1,'') <> '1'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_28_5.svg)
    


Beim Kolonkarzinom im Stadium III (regionäre Lymphknotenbeteiligung) liegen bundesweit in 54% (nach Bundesländern:42%-62%) keine Angaben zu einer systemischen Therapie vor. In der überwiegenden Mehrzahl dieser Fälle ist eine andere Therapie dokumentiert, nur in 11% der Fälle ist keine Therapie dokumentiert.


<br>

#### <a id='toc1_3_6_2_'></a>[Abstand zwischen Diagnose und erster Operation](#toc0_)
Der mediane Abstand zwischen Diagnose und erster Operation lag bei 26 Tagen (nach Bundesländern: 7-31 Tage).




```
    count: distinct z_tum_id
    ---
    n = 3_241_401                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2023]: n = 2_989_092  (92.2%) ░░░███████████████████████████
    └ [nur erste OP]: n = 1_290_573  (39.8%) ░░░░░░░░░░░░░░░░░░░███████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2023
and z_op_order = 1
```

</details>


    
    



    
![png](report_files/output_32_5.png)
    


    
    column (n = 1_290_573)  |     notnull     | min  | lower | q25  | median | mean  |  q75  | upper |  max  |  std  |  cv 
    ------------------------+-----------------+------+-------+------+--------+-------+-------+-------+-------+-------+-----
    Anzahl_Tage_Diagnose_OP | 1_271_631 (98%) | -304 |   -34 | 0.00 |  19.00 | 47.54 | 49.00 |   122 | 2_204 | 98.96 | 2.08
    
    
    item (n = 1_290_573) |  count  | min  | lower | q25  | median | mean  |  q75  | upper |  max  |  std   |  cv 
    ---------------------+---------+------+-------+------+--------+-------+-------+-------+-------+--------+-----
    01-SH                |  44_153 |    0 |     0 | 0.00 |  20.00 | 39.21 | 46.00 |   115 | 1_498 |  59.89 | 1.53
    02-HH                |  26_895 |    0 |     0 | 0.00 |  15.00 | 45.86 | 42.00 |   105 | 2_204 | 107.44 | 2.34
    03-NI                |  92_380 |    0 |     0 | 0.00 |  22.00 | 47.08 | 55.00 |   137 | 1_635 |  76.37 | 1.62
    04-HB                |   9_001 |    0 |     0 | 3.00 |  25.00 | 42.04 | 49.00 |   118 |   384 |  57.03 | 1.36
    05-NW                | 257_291 |    0 |     0 | 1.00 |  23.00 | 58.11 | 54.00 |   133 | 1_812 | 124.40 | 2.14
    06-HE                |  69_922 |    0 |     0 | 0.00 |  21.00 | 45.40 | 49.00 |   122 | 1_632 |  83.01 | 1.83
    07-RP                |  48_914 |    0 |     0 | 0.00 |  20.00 | 43.81 | 45.00 |   112 | 1_649 |  88.96 | 2.03
    08-BW                | 166_886 |    0 |     0 | 0.00 |  22.00 | 53.24 | 54.00 |   135 | 1_967 | 112.39 | 2.11
    09-BY                | 179_760 |    0 |     0 | 0.00 |  16.00 | 44.65 | 48.00 |   120 | 1_671 |  89.88 | 2.01
    10-SL                |  15_891 |    0 |     0 | 0.00 |  13.00 | 35.94 | 38.00 |    95 | 1_080 |  65.85 | 1.83
    11-BE                |  56_246 |    0 |     0 | 0.00 |  21.00 | 47.61 | 52.00 |   130 | 1_599 |  90.79 | 1.91
    12-BB                |  48_958 |    0 |     0 | 0.00 |  20.00 | 47.47 | 51.00 |   127 | 1_724 |  93.58 | 1.97
    13-MV                |  51_567 | -304 |   -34 | 0.00 |   2.00 | 36.04 | 37.00 |    92 | 1_753 |  86.56 | 2.40
    14-SN                |  95_890 |    0 |     0 | 0.00 |  16.00 | 46.77 | 50.00 |   125 | 1_680 |  96.66 | 2.07
    15-ST                |  61_468 |    0 |     0 | 0.00 |   9.00 | 36.29 | 40.00 |   100 | 1_595 |  79.32 | 2.19
    16-TH                |  46_409 |    0 |     0 | 0.00 |   1.00 | 30.89 | 29.00 |    72 | 1_569 |  81.09 | 2.62
    



<br>

### <a id='toc1_3_7_'></a>[Informationen zum Krankheitsverlauf](#toc0_)
#### <a id='toc1_3_7_1_'></a>[Nach Brustkrebs](#toc0_)
Für Patientinnen mit Brustkrebsdiagnosen und Operation ohne Residualtumor (R0) aus  den Jahren 2020/2021 ist bis Ende 2023 in 5% der Fälle (nach Bundesländern: 2%-8%, 4 Bundesländer ohne Angaben) ein Verlaufsereignis dokumentiert. In gut zwei Drittel dieser Fälle betraf dies Fernmetastasen, teilweise in Kombination mit Lokalrezidiven und Lymphknotenmetastasen. Für diese Auswertungen wurden verschiedene Variablen genutzt, Abbildung 3.6.1.2 zeigt alle Kombinationen der relevanten Ausprägungen. Es wurde kein Mindestabstand zum Diagnosedatum festgelegt. 




```
    count: distinct z_tum_id
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2021]:                  n = 1_495_715  (46.1%) ░░░░░░░░░░░░░░░░░█████████████
    └ [ICD10 C50]:                       n = 157_980   (4.9%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [kein M1]:                         n = 146_979   (4.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [Residualstatus R0]:                n = 89_812   (2.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:    n = 89_461   (2.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2021
and z_icd10_3d = 'C50'
and ifnull(z_m_pc_1,'') <> '1'
and upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_34_5.svg)
    


Abb. 3.13b: Verteilung der Verlaufsereignisse bis Ende 2023 nach Brustkrebsdiagnose in 2020/2021 (inkl. aller Kombinationen)

    n = 89_461 | n(true) = 4_521



    
![png](report_files/output_36_1.png)
    



<br>

#### <a id='toc1_3_7_2_'></a>[Nach Darmkrebs](#toc0_)
Für Personen mit Darmkrebsdiagnosen und Operation ohne Residualtumor (R0) aus den Jahren 2020/2021 ist bis Ende 2023 in 10% der Fälle (nach Bundesländern: 3%-14%, 4 Bundesländer ohne Angaben) ein Verlaufsereignis dokumentiert. In gut zwei Drittel dieser Fälle betraf dies Fernmetastasen, teilweise in Kombination mit Lokalrezidiven und Lymphknotenmetastasen. Für diese Auswertungen wurden verschiedene Variablen genutzt, Abbildung 3.6.2.2 zeigt alle Kombinationen der relevanten Ausprägungen. Es wurde kein Mindestabstand zum Diagnosedatum festgelegt. 




```
    count: distinct z_tum_id
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2021]:                  n = 1_495_715  (46.1%) ░░░░░░░░░░░░░░░░░█████████████
    └ [ICD10 C18-C20]:                   n = 114_553   (3.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [kein M1]:                          n = 94_460   (2.9%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [Residualstatus R0]:                n = 49_856   (1.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:    n = 46_861   (1.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2021
and z_icd10_3d in ('C18', 'C19', 'C20')
and ifnull(z_m_pc_1,'') <> '1'
and upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>


    
    



    
![svg](report_files/output_38_5.svg)
    


Abb. 3.14b Verteilung der Verlaufsereignisse bis Ende 2023 nach Darmkrebsdiagnose 2020/2021 (inkl. aller Kombinationen)

    n = 46_861 | n(true) = 4_494



    
![png](report_files/output_40_1.png)
    



<br>

### <a id='toc1_3_8_'></a>[Einordnung der Ergebnisse zur Datenqualität](#toc0_)

Bei der Interpretation der Auswertungen sind folgende Aspekte zu berücksichtigen:

Bei Krebsregisterdaten ist grundsätzlich nicht zu erwarten, dass die Qualität von Daten aus klinischen, z.B.  Zulassungsstudien erreicht werden kann. Trotz Meldepflicht können die Register eine vollständige und fehlerfreie Meldung aller klinisch verfügbaren Informationen (soweit im oBDS abbildbar) nicht erzwingen.
Viele Methoden, die in Studien zur Steigerung der Datenqualität zur Anwendung kommen (Datenaudits, Validierung anhand von Krankenakten) kommen in bevölkerungsbezogenen Krebsregistern nicht oder nur bedingt zum Einsatz. Auch Plausibilitätsprüfungen bei der Dateneingabe bzw. beim Export aus Krankenhausinformationssystemen können nur einen gewissen Teil fehlerhafte Meldungen abfangen, oft ergeben sich Widersprüche aus Meldungen unterschiedlicher Einrichtungen zum gleichen Erkrankungsfall. 

Unvollständige Daten, z.B. zum Tumorstadium, können sich auch aus der klinischen Situation ergeben: so wird auf umfassende Untersuchungen zum Staging im klinischen Alltag im bestimmten Fällen, aufgrund des gesundheitlichen Zustands oder auf Wunsch der Betroffenen, verzichtet, vor allem, wenn sich aus den Ergebnissen absehbar keine therapeutischen Konsequenzen ergeben würden. 

Bezüglich der Daten zur Therapie und zum Krankheitsverlauf kann in den Krebsregisterdaten nicht zwischen nicht gemeldeten und nicht durchgeführten Therapien bzw. stattgefunden Ereignissen unterschieden werden. Es gibt für die Meldenden außerdem keine Möglichkeit, den Grund für eine Abweichung von etablierten Therapieschemata bzw. Leitlinien im OBDS zu dokumentieren. 

In den obigen Auswertungen wurden exemplarische Fallkonstellationen ausgewählt, in denen (mangels gleichwertiger Alternativen) eine bestimmte Therapie in der Regel bzw. nach aktuellen Leitlinien zu erwarten wäre (z.B. Operationen bei Brustkrebs im Stadium I-III). Im klinischen Alltag ist aus den genannten Gründen (z.B. schwere Begleiterkrankungen) jedoch nicht davon auszugehen, dass diese Therapien in allen Fällen durchgeführt werden.  Es ist vielmehr damit zu rechnen, dass sich in einem gewissen Anteil der Fälle Behandelnde und/oder Betroffene begründet gegen eine bestimmte Behandlung entschieden haben. Die je nach Diagnose und Therapieart gefundenen Anteile und die teilweise große Heterogenität zwischen den Bundesländern spricht jedoch dafür, dass tumorbezogene Therapien derzeit noch nicht vollständig in den Krebsregistern erfasst werden. Der in allen Registern gefundene hohe Anteil von Patientinnen und Patienten ohne gemeldete bzw. dokumentierte systemische Therapie bei bösartigen Tumoren des Kolons im Stadium III (Lymphknotenbefall)  könnte aber auch darauf hindeuten, dass diese Therapie in einem relevanten Anteil der Fälle entgegen der Leitlinienempfehlungen nicht durchgeführt wird.

Der Anteil nicht erfasster Therapien lässt sich aus den Ergebnissen aus den genannten gründen nicht direkt ableiten.  Es ist daher auch nicht auszuschließen, dass die gezeigten Unterschiede zwischen den Bundesländern bezüglich nicht gemeldeter (aber erwarteter) Therapien zum Teil auch reale Unterschiede in der Versorgung abbilden. Außerdem sind die hier gezeigten Ergebnisse für ausgewählte Diagnosen nicht ohne weiteres auf andere Entitäten übertragbar.

Insgesamt ist allerdings davon auszugehen, dass die Erfassung von inzidenter Krebsdiagnosen in den Krebsregistern derzeit noch vollständiger gelingt als die Erfassung der Therapien. Dies ist auch dadurch bedingt, dass pathologische Institute direkt an das Krebsregister melden, da sie zu den „Krebserkrankungen diagnostizierenden“ Einrichtungen gehören. Eine pathologische Befundmeldung reicht in vielen Fällen aus, um im Krebsregister Angaben zur Diagnose differenziert (nach Lokalisation, Histologie und Tumorstadium) zu dokumentieren, bei Fehlen einer klinischen Meldung wären dann allerdings keine Angaben zur Therapie vorhanden. Umgekehrt ist es bei Fehlen einer pathologischen Meldung und Vorhandensein einer klinischen Meldung in der Regel zu erwarten, dass die wesentlichen Informationen aus dem pathologischen Befund (z.B. zu Histologie und pathologischem Tumorstadium) über die klinische Meldung an das Register übermittelt werden. Da im Datensatz des ZfKD Informationen von verschiedenen meldenden Einrichtungen zusammengefasst sind („Best-of“), ist in den Daten nicht direkt erkennbar, welche Meldungstypen den Angaben zugrunde liegen. Ein Hinweis auf eine fehlende oder unvollständige klinische Meldung bei vorhandener pathologischer Meldung kann die relativ häufig vorhandene gültige Angabe zum pathologischem T-Stadium („pT“) bei fehlenden Angaben zu einer (zur Lokalisation des Tumors passenden) Operation sein. In Einzelfällen kann es allerdings zumindest beim Melanom und beim Darmkrebs vorkommen, dass der Tumor im Rahmen einer ursprünglich diagnostischen Prozedur im Ganzen entfernt werden kann und daher auch ohne Operation eine pathologisches T-Stadium bestimmbar ist, dies könnte einen Teil der Fälle mit pT ohne Operation erklären.

Die in einigen Registern deutlich nach unten abweichenden medianen Abstände zwischen Diagnose und erster Operation lassen auf Unterschiede zwischen den Registern bei der Definition des Diagnosedatums oder unterschiedliches Meldeverhalten zu dieser Variable schließen. 

Derzeit kann die Vollständigkeit der Erfassung bestimmter Ereignisse im Krankheitsverlauf noch nicht beurteilt werden. Zum einen ist die Beobachtungszeit ab Erstdiagnose noch relativ kurz (maximal knapp vier Jahre), zum anderen existiert derzeit keine einzelne Datenquelle, mit denen sich an den Krebsregisterdaten ermittelten diagnosespezifischen Rezidiv- und Metastasierungsraten validieren lassen. 

Das ZfKD plant eine entsprechende Evaluation in den nächsten zwei Jahren anhand einer ausführlichen Literaturrecherche für ausgewählte Diagnosen, ggf. in Abhängigkeit vom Tumorstadium.

Eine gewisse Einschränkung bei der Beurteilung von Rezidiven ergibt sich aus der Definition eines Rezidivs. Ein Rezidiv kann grundsätzlich nur festgestellt werden, wenn zuvor Tumorfreiheit (Remission) bestand. Diese kann grundsätzlich nach einer Operation, Strahlentherapie, systemischen Therapie oder einer Kombination verschiedener Therapieformen erzielt werden. 

Im Datensatz des ZfKD kann Tumorfreiheit durch den R-Status nach Operation (R0), durch ein yT0 während oder nach multimodaler Therapie oder durch die Angabe einer Remission im Krankheitsverlauf abgebildet werden. Da eine Remission im Verlauf in vielen Bundesländern kein meldebegründendes Ereignis darstellt (im Gegensatz zum Lokalrezidiv, einer Metastasierung oder einer Änderung der Therapie) wird in einigen Fällen die Abgrenzung zwischen einem Fortschreiten der Erkrankung (Progression) und einem Rezidiv schwierig sein, vor allem wenn eine Tumorfreiheit nicht primär durch eine Operation erzielt wurde.  Dies gilt vor allem für Neubildungen der blutbildenden und lymphatischen Organe, für die in der Regel werder der R-Status noch das y-TNM zur Verfügung steht. Dazu kommt, dass auch bei operativ behandelten Tumoren nach den Erfahrungen aus den Landeskrebsregistern die Angaben zu  Rezidiven und Progressionen in den klinischen Verlaufsmeldungen häufig inkonsistent sind. 

Mögliche Gründe für unterbliebene oder unvollständige (klinische) Meldungen an die Krebsregister können aus den Daten des ZfKD nicht abgeleitet werden. Bekannt ist, dass die Meldung für nicht auf Krebsbehandlungen spezialisierte Kliniken und vor allem für niedergelassene Ärztinnen und Ärzte um einiges aufwändiger ist als für zertifizierte Tumorzentren und Pathologische Institute. Gerade im Bereich der Niedergelassenen, aber auch in vielen Kliniken ist eine automatisierte Meldung über eine Schnittstelle aus der elektronischen Klinik- oder Praxisdokumentation noch nicht realisiert. Hier liegt es nahe, dass Meldungen an das Krebsregister wegen des hohen Aufwands trotz Meldepflicht im Praxis- oder Klinikalltag häufiger unterbleiben.
