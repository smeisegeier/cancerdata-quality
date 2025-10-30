# <a id='toc1_'></a>[Bericht zur Datenqualität (klin) 📉](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Bericht zur Datenqualität (klin) 📉](#toc1_)    
  - [Änderungen seit der letzten Version](#toc1_1_)    
  - [Datenstand ⏱️](#toc1_2_)    
  - [Lieferdatum 📆](#toc1_3_)    
  - [Fallzahlen](#toc1_4_)    
    - [absolut](#toc1_4_1_)    
    - [relativ](#toc1_4_2_)    
  - [missings](#toc1_5_)    
  - [Fallzahlen epi vs clin](#toc1_6_)    
  - [Verteilung von Variablen](#toc1_7_)    
    - [UICC (p)](#toc1_7_1_)    
    - [Diagnosesicherung](#toc1_7_2_)    
    - [Geschlecht](#toc1_7_3_)    
    - [Diagnosejahr](#toc1_7_4_)    
    - [Inzidenzort vs Lieferregister](#toc1_7_5_)    
    - [ICD10 Gruppen](#toc1_7_6_)    
    - [Verstorben](#toc1_7_7_)    
    - [TNM-T (p)](#toc1_7_8_)    
    - [TNM-N (p)](#toc1_7_9_)    
    - [TNM-M (p)](#toc1_7_10_)    
    - [TNM-Auflage (p)](#toc1_7_11_)    
    - [Todesursachen (TU)](#toc1_7_12_)    
      - [nach ICD10 Einstellern](#toc1_7_12_1_)    
      - [nach Sterbejahr und Todesursachen](#toc1_7_12_2_)    
      - [nach hat_todesursache bei Nicht-Verstorbenen](#toc1_7_12_3_)    
      - [nach ICD10 Dreistellern (TOP 5)](#toc1_7_12_4_)    
      - [nach IsGrundleiden](#toc1_7_12_5_)    
    - [OP](#toc1_7_13_)    
      - [nach ICD10](#toc1_7_13_1_)    
      - [nach Intention](#toc1_7_13_2_)    
    - [OPS](#toc1_7_14_)    
      - [nach OPS ICD Kapitel (Top 10)](#toc1_7_14_1_)    
      - [nach OPS Einzelcodes (Top 5)](#toc1_7_14_2_)    
    - [SYST](#toc1_7_15_)    
      - [nach Stellung_OP](#toc1_7_15_1_)    
  - [Missings / Unbekannt in den Daten](#toc1_8_)    
    - [Missings für verpflichtende Variablen in Tumor Element](#toc1_8_1_)    
    - [Missings für Therapieangaben](#toc1_8_2_)    
    - [Missings für Tumorstadien](#toc1_8_3_)    
    - [Missings für organspezifische Variablen (Mamma)](#toc1_8_4_)    
    - [Missings für organspezifische Variablen (Prostata)](#toc1_8_5_)    
    - [Missings für organspezifische Variablen (Darm)](#toc1_8_6_)    
    - [Missings für organspezifische Variablen (Melanom)](#toc1_8_7_)    
    - [Missings für Prio Variablen](#toc1_8_8_)    
    - [Unbekannt für verpflichtende Variablen](#toc1_8_9_)    
  - [Verteilung Monat von DatumVitalstatus](#toc1_9_)    
  - [Numerische Variablen 🔢](#toc1_10_)    
    - [Diagnosealter](#toc1_10_1_)    
    - [Anzahl Tage zwischen Diagnose und Tod](#toc1_10_2_)    
    - [Tumordicke](#toc1_10_3_)    
    - [PSA](#toc1_10_4_)    
    - [LK_befallen](#toc1_10_5_)    
    - [LK_untersucht](#toc1_10_6_)    
    - [RektumAbstandAnokutanlinie](#toc1_10_7_)    
    - [LDH](#toc1_10_8_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[Änderungen seit der letzten Version](#toc0_)
- Neulieferung `06-HE`
- [Numerische Variablen 🔢](#toc1_10_) enthalten nun mehr Diagramme

<br>

## <a id='toc1_2_'></a>[Datenstand ⏱️](#toc0_)

    🐍 3.13.2 | 📦 pandas: 2.3.0 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.3.1 | 📦 pandas-plots: 0.12.27 | 📦 connection-helper: 0.11.1


    sqlite db file:          2025-06-24_data_clin.duckdb
    data tag:                v2.2
    last kkr data import:    2025-05-27
    sql table created:       2025-06-24 13:47:18
    sql table transmitted:   2025-06-25 08:33:57
    document created:        2025-06-26 16:21:39


<br>

## <a id='toc1_3_'></a>[Lieferdatum 📆](#toc0_)
- `kkr` = Klinisches Krebsregister
- `Lieferdatum` = Datum der letzten Übermittlung durch die KKR
- `Diagnosemonat` = letzter Diagnosemonat in den Daten


    
![png](clin_2_analyze_files/output_10_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_4_'></a>[Fallzahlen](#toc0_)
- in den Darstellungen sind keine Filter angewendet, solange nicht explizit angegeben

<br>

### <a id='toc1_4_1_'></a>[absolut](#toc0_)
- aufgespannt sind die Fallzahlen für Lieferregister und Elementknoten
- für jedes Register ist hier insbesondere einsehbar, wie viele Tumore/Patienten aus der aktuellsten Lieferung verarbeitet wurden
- kein Filter, "Altfälle" (DJ < 2020) sind also enthalten
- aufgeteilt auf 2 Tabellen zur besseren Übersicht
- die `%` Werte sowie die farbigen Datenbalken zeigen das relative Gewicht jedes KKR an "D gesamt" (`Total` Zeile)
- Erklärung für einige Elementknoten: (_cnt = count/Fallzahl)
  - `weitere_diag_cnt` = Weitere Klassifikation im Elementknoten "Diagnose"
  - `weitere_folge_cnt` = Weitere Klassifikation im Elementknoten "Folgeereignis"
  - `fm_folge_cnt`= Fernmetastasen im Elementknoten "Folgeereignis"
  - `fm_diag_cnt` = Fernmetastasen im Elementknoten "Diagnose"
  - `tnm_folge_cnt` = TNM im Elementknoten "Folgeereignis"

> 💡 `ZfKD`: _"die absoluten Werte lassen erkennen, dass inzwischen die meisten Elemente flächendeckend vorliegen. Ausnahmen: `Applikationsart`, `Folgeereignisse`, `Protokolle` / `Substanzen`"_


    
![png](clin_2_analyze_files/output_15_0.png)
    



    
![png](clin_2_analyze_files/output_16_0.png)
    


<br>

### <a id='toc1_4_2_'></a>[relativ](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` != C44**
- der Filter ist gewählt, um eine bessere Vergleichbarkeit der Werte zu gewährleisten
- die Metriken sind **einfache Verhältiszahlen**, z.B: `op_per_tum` = alle OP / alle Tumore (pro kkr)
- es sind jeweils die kumulierten Werte aufgespannt:
  - nach einzelnen **Lieferregistern**
  - nach verwendeten **Tumordokumentationssystemen** (um systemische Effekte darstellen zu können)


    
![png](clin_2_analyze_files/output_18_0.png)
    



    
![png](clin_2_analyze_files/output_19_0.png)
    


<br>

## <a id='toc1_5_'></a>[missings](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)
- ein Wert von bspw. 0.68 ist zu interpretieren als: _"68% aller Tumorfälle im KKR haben keine zugeordneten OP Angaben, die restlichen 32% mindestens eine."_
- `treat_missing_per_tum` stellt den Anteil Fälle dar, bei denen keinerlei Therapieangabe (OP, ST, SYST) vorliegt
- in der Darstellung sind die Max/Min Werte pro Kennzahl mit 🟥/🟩 markiert (kleiner ist besser)
> 💡 `NI`: _"Die **Missings für Folgeereignis, Strahlentherapie und Systemische Therapie** sind Resultat der noch ausstehenden Implementierung in der Registersoftware Tristan zur Bildung der jeweiligen Best-Of-Informationen. Die Implementierung ist bereits beauftragt. Neben Niedersachsen nutzen die Bundesländer Schleswig-Holstein, Bremen und das Saarland dieselbe Tristan-Implementierung"_

> 💡 `ZfKD`: _"aus `st_missing_per_tum` lässt sich ablesen, dass ~23% der Tumoren deutschlandweit mind. eine ST zugeordnet ist (Total: 1 - 0.77 = 0.23). Das entspricht in etwa der Annahme von 30% Anteil von Strahlentherapien an primären Diagnosen "_


    
![png](clin_2_analyze_files/output_21_0.png)
    



    
![png](clin_2_analyze_files/output_22_0.png)
    


<br>

## <a id='toc1_6_'></a>[Fallzahlen epi vs clin](#toc0_)
- **Filter: `DJ` = 2023, `DCO` = N, `ICD10` != C44, Inzidenzort(BL) = Register**
- Ziel der Darstellung: Abschätzung der Vollzähligkeit der klinischen Daten
- dargestellt sind die gefilterten Fallzahlen jeweils aus den epi und den klinischen Daten, hier allerdings nur aus dem letzten DJ 2023
- Hinweis: Die Auswertung Daten basiert auf `Inzidenzort` anstatt `Lieferregister`, da in den epi Daten bislang die einzelnen Länder des GKR nicht aufgeschlüsselt waren, und ein matching auf EKRNR somit fehlschlägt
> 💡 `NI`: _"Die **höhere Fallzahl** des epidemiologischen Registers im Vergleich zum klinischen Register ist vermutlich auf unterschiedliche Filterkriterien in den beiden Registern zurückzuführen. Im KKN werden neben den Kriterien die das Lieferschema vorgibt auch noch weitere Plausibilitätsprüfungen angewandt. Tumoren, welche diese Prüfungen nicht bestehen, werden vom Export ausgeschlossen"_  

> 💡 `ZfKD`: _"Die quota in den anderen KKR entspricht der Erwartung, dass die Fallzahl bei klin. Daten höher sein sollte als bei epi Daten. Beim Vergleich der ehemaligen GKR Länder entstehen prozessbedingt Artefakte, welche das Ergebnis leicht verfälschen. Die Fallzahl bei den epi Daten kann nicht höher sein, da diese aus den klinischen Daten generiert wurden."_


    
![png](clin_2_analyze_files/output_24_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_7_'></a>[Verteilung von Variablen](#toc0_)
- in den Diagrammen gibt das angegebene _`n=`_ einen Hinweis auf die verwendete Grundgesamtheit
- die _relativen_ Barcharts enthalten ein `Total` item für den Gesamtvergleich

<br>

### <a id='toc1_7_1_'></a>[UICC (p)](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)
- nach den absoluten Werten ist auch die relative Verteilung gegeben unter Ausschluss der hohen Zahl an UICC missings
- die Variable wird in den meisten kkr selbst gebildet. Für GTDS Länder ist dafür ein Standard definiert  

> 💡 `NI`: _"UICC-Stadium: In Tristan ist die Implementierung zur automatisierten Ermittlung des UICC-Stadiums ausstehend. Bis zur Umsetzung der Implementierung wird das KKN **keine gesonderte Berechnung** des UICC-Stadiums vornehmen, liefert aber die Werte, die gemeldet worden sind"_  

> 💡 `HH`: _"Komplett fehlende UICC-Stadien: Teilweise bei uns unter **weitere Klassifikationen** zu finden und erst ab 2023 in einem eigenen Feld. UICC nach TNM-8 ist noch nicht vollständig in unserer Datenbank berechnet."_


    
![png](clin_2_analyze_files/output_28_0.png)
    



    
![png](clin_2_analyze_files/output_28_1.png)
    


<br>

### <a id='toc1_7_2_'></a>[Diagnosesicherung](#toc0_)
- **Filter: `DJ` = 2020-2023**

> 💡 `NI`: _"Die Ausprägung **DCO als Diagnosesicherung** kommt im KKN-Datensatz nicht vor. Diese Information liegt bisher nur dem EKN vor und wird gegebenenfalls zur Anreicherung von Datenexporten fallspezifisch vom KKN beim EKN angefragt. Der Prozess zur automatisierten Übermittlung dieser Informationen vom EKN zum KKN ist in Planung"_

> 💡 `ZfKD`: _"aufgrund der verschiedenartigen Handhabung von DCO in den übermittelten Daten ist die Filterung nach DCO mit erheblicher Unschärfe verbunden"_


    
![png](clin_2_analyze_files/output_30_0.png)
    


<br>

### <a id='toc1_7_3_'></a>[Geschlecht](#toc0_)
- Grundgesamtheit: Menge aller **Patienten** 
- **Filter: `DJ` = 2020-2023**

> 💡 `ZfKD`: _"Angaben zu Geschlecht ungleich `M` oder `W` sind sehr selten, diese Fälle werden nicht gesondert verarbeitet"_


    
![png](clin_2_analyze_files/output_32_0.png)
    


    Anzahl Ausprägungen <> M oder W im Gesamtdatensatz: {'D': 37, 'U': 217, 'X': 28}


<br>

### <a id='toc1_7_4_'></a>[Diagnosejahr](#toc0_)
- Filter: Top 5 Diagnosejahre
- Legende ist **absteigend sortiert nach Fallzahl im DJ**, Restkategorie `<other>` ist aufgeführt

    Anzahl 2024 Fälle: {'13-MV': 2835, '12-BB': 642, '09-BY': 2233, '06-HE': 844, '11-BE': 509, '15-ST': 1917}



    
![png](clin_2_analyze_files/output_34_1.png)
    


<br>

### <a id='toc1_7_5_'></a>[Inzidenzort vs Lieferregister](#toc0_)
- **Filter: keiner, Grundgesamtheit sind alle Fälle**
- vertikal: `Inzidenzort` (Zeile `00` bündelt alle Fälle mit ungültiger Ortsangabe). horizontal: `Lieferregister`
- Beispiel: `03-NI` liefert zu 100% Fälle aus dem Inzidenzort `03`, `13-MV` liefert 159 Fälle aus `03`
> 💡 `ZfKD`: _"angestrebt ist eine "Diagonale", möglichst nur noch Fallübermittlungen aus dem eigenen Einzugsgebiet, was inzwischen schon besser erreicht ist. Mindestens `99%` der Fälle stammen aus dem liefernden Register"_


    
![png](clin_2_analyze_files/output_36_0.png)
    


<br>

### <a id='toc1_7_6_'></a>[ICD10 Gruppen](#toc0_)
- die verwendete ICD10 Skala entspricht der Darstellung aus *"Krebs in Deutschland"*
> 💡 `NI`: _"Für nicht-melanozytäre Hautkrebsarten bestimmter Histologien sowie fortgeschrittene Plattenepithelkarzinome gilt ab dem 20. September 2023 eine geänderte Meldepflicht. Erst seit diesem Zeitpunkt sind die prognostisch ungünstigen Hauttumore **(C44)** an das KKN zu melden und kommen daher im gelieferten Datensatz bisher nicht vor. In den nächsten Lieferungen werden diese Daten enthalten sein"_


    
![png](clin_2_analyze_files/output_38_0.png)
    


<br>

### <a id='toc1_7_7_'></a>[Verstorben](#toc0_)

- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` != C44**


    
![png](clin_2_analyze_files/output_40_0.png)
    


<br>

### <a id='toc1_7_8_'></a>[TNM-T (p)](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)


    
![png](clin_2_analyze_files/output_42_0.png)
    


<br>

### <a id='toc1_7_9_'></a>[TNM-N (p)](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)



    
![png](clin_2_analyze_files/output_44_0.png)
    


<br>

### <a id='toc1_7_10_'></a>[TNM-M (p)](#toc0_)
- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren**

> 💡 `ZfKD`: _"pM0 und pMX sind nach TNM Manual keine anwendbaren Kodierungen"_


    
![png](clin_2_analyze_files/output_46_0.png)
    


<br>

### <a id='toc1_7_11_'></a>[TNM-Auflage (p)](#toc0_)

- **Filter: `DJ` = 2020-2023**


    
![png](clin_2_analyze_files/output_48_0.png)
    


<br>

### <a id='toc1_7_12_'></a>[Todesursachen (TU)](#toc0_)

#### <a id='toc1_7_12_1_'></a>[nach ICD10 Einstellern](#toc0_)
- gezählt sind die ersten Stellen aller TU Codes ohne jeglichen Filter


    
![png](clin_2_analyze_files/output_51_0.png)
    


#### <a id='toc1_7_12_2_'></a>[nach Sterbejahr und Todesursachen](#toc0_)
- gezählt werden **Personen**
- **Filter: `SJ`= 2020-2023, `Verstorben` = J**
- `tu_type` Art der TU pro Patient
  - `<NA>` keine Todesursache
  - `C` Todesursache Cxx
  - `<other>` andere Todesursache

> 💡 `ZfKD`: _"`03-NI` und `06-HE` übermitteln deutlich weniger Todesursachen asl in den epi Daten, für `07-RP` ist der Anteil in beiden Datenräumen gering. Für `15-ST` sind auffällig wenige Todesfälle in 2023 übermittelt."_


    
![png](clin_2_analyze_files/output_55_0.png)
    


<br>

#### <a id='toc1_7_12_3_'></a>[nach hat_todesursache bei Nicht-Verstorbenen](#toc0_)
- gezählt werden **Personen**
- **Filter: `Verstorben` = N**

> 💡 `HH`: _"Da haben wir jetzt gesehen, dass es an dem Überhang-Konstrukt liegt. Da handelt es sich um Patienten, die im Datenlieferungszeitraum <31.12.2022 noch gelebt haben, aber dann innerhalb des Zeitraums zur Erstellung des Datensatzes (01.02.2024) verstorben sind. Da passen wir unseren Datenexport noch einmal an."_


    
![png](clin_2_analyze_files/output_57_0.png)
    


<br>

#### <a id='toc1_7_12_4_'></a>[nach ICD10 Dreistellern (TOP 5)](#toc0_)
- Grundgesamtheit: alle **Todesursachen**, kein Filter

> 💡 `ZfKD`: _"enthalten sind in einigen KKR auch `C79` (Metastasen), welche in offizieller Todesursachen-Statistik nicht kodiert sind"_


    
![png](clin_2_analyze_files/output_59_0.png)
    


<br>

#### <a id='toc1_7_12_5_'></a>[nach IsGrundleiden](#toc0_)
- Grundgesamtheit: **alle Todesursachen**


    
![png](clin_2_analyze_files/output_61_0.png)
    


<br>

### <a id='toc1_7_13_'></a>[OP](#toc0_)


#### <a id='toc1_7_13_1_'></a>[nach ICD10](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**


    
![png](clin_2_analyze_files/output_64_0.png)
    


<br>

#### <a id='toc1_7_13_2_'></a>[nach Intention](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**


    
![png](clin_2_analyze_files/output_66_0.png)
    


<br>

### <a id='toc1_7_14_'></a>[OPS](#toc0_)


#### <a id='toc1_7_14_1_'></a>[nach OPS ICD Kapitel (Top 10)](#toc0_)
- Grundgesamtheit: **alle OPS Codes**

> 💡 `ZfKD`: _"lediglich `02-HH` und `05-NW` übermitteln ausschliesslich Kapitel 5. Der Anteil von Meldungen <> Kapitel 5 sind wahrscheinlich diagnostische Massnahmen oder nicht-operative Therapien. Vorschlag: nur noch Kapitel 5 übermitteln"_


    
![png](clin_2_analyze_files/output_69_0.png)
    


<br>

#### <a id='toc1_7_14_2_'></a>[nach OPS Einzelcodes (Top 5)](#toc0_)
- Grundgesamtheit: **alle OPS Codes**


    
![png](clin_2_analyze_files/output_71_0.png)
    


### <a id='toc1_7_15_'></a>[SYST](#toc0_)

#### <a id='toc1_7_15_1_'></a>[nach Stellung_OP](#toc0_)

- Grundgesamtheit: **alle SYST Elemente**
> 💡 `ZfKD`: _"einige KKR übermitteln de facto keine OP Stellung"_


    
![png](clin_2_analyze_files/output_74_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_8_'></a>[Missings / Unbekannt in den Daten](#toc0_)
- es sind folgende Schwellwerte angezeigt:
  - 🟩 0 bis <5%
  - 🟨 5 bis <100%
  - 🟥 bei 100%
- **Filter: `DJ` 2020-2023** Weitere Filter sind extra aufgeführt
- dargestellt sind Variablen aus dem Schema in folgender Notation: `[Elementknoten]Variablenname`
- die graumelierte `0` kennzeichnet einen leeren Wert (=keine missings), 0% entsteht durch Rundung von kleinen Werten

<br>

### <a id='toc1_8_1_'></a>[Missings für verpflichtende Variablen in Tumor Element](#toc0_)
- kein Filter
- Pflichtangaben aus anderen Elementknoten (z.B. Datum aus dem OP Knoten) sind nicht aufgeführt, da diese selbst optional sind
- ganz überwiegend sind die Angaben vollständig, die wenigen Ausnahmen werden allerdings Stand heute nicht korrigiert

> 💡 `ZfKD`: _"Die absoluten Fallzahlen für fehlende ICD10 oder Inzidenzort sind sehr gering, verursachen jedoch in Analysen einige Artefakte, wenn sie in Filtern nicht korrekt adressiert werden"_


    
![png](clin_2_analyze_files/output_78_0.png)
    


<br>

### <a id='toc1_8_2_'></a>[Missings für Therapieangaben](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` != C44**
- Rechenbeispiel für `[Bestrahlung]Anzahl_Tage_Diagnose_ST` in 01-SH (Zahlen sind veraltet, aber Prinzip bleibt gleich):
  - 5363 Bestrahlungen sind in den Daten unter Beachtung des Filters (DCO/DJ/ICD10) für den zugeordneten Tumor
  - davon enthalten 302 ein leeres Feld `Anzahl_Tage_Diagnose_ST` -> ~ 6%

> 💡 `ZfKD`: _"Es gibt deutliche Unterschiede in der Nutzbarkeit von Therapieangaben. So weist etwa `Anzahl_Tage_Diagnose_OP` fast keine missings auf, `Anzahl_Tage_SYST_Dauer` jedoch (flächendeckend) sehr viele."_


    
![png](clin_2_analyze_files/output_80_0.png)
    


<br>

### <a id='toc1_8_3_'></a>[Missings für Tumorstadien](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren**

> 💡 `ZfKD`: _"0% missings ist bei diagnoseabhängigen Angaben wie den Tumorstadien nicht zu erreichen (`05-NW` hat die Auflage als Konstante im Datensatz hinterlegt). Hier kann nur der relative Vergleich als Maßstab dienen."_


    
![png](clin_2_analyze_files/output_82_0.png)
    


<br>

### <a id='toc1_8_4_'></a>[Missings für organspezifische Variablen (Mamma)](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C50**
- die Prozentwerte sind bei allen Darstellungen gerundet, "100%" bei einer gelben Ampel kann interpretiert werden als knapp unter 100%
> 💡 `HH` _"Fehlende Modul-Angaben (C50, C61) 2021. Sind bei uns noch nicht im xml enthalten."_


    
![png](clin_2_analyze_files/output_84_0.png)
    


<br>

### <a id='toc1_8_5_'></a>[Missings für organspezifische Variablen (Prostata)](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C61**

> 💡 `ZfKD` _"Auch innerhalb eines KKR gibt es deutliche Varianzen zwischen Variablen des organspezifischen Moduls, z.B. in 11-16"_


    
![png](clin_2_analyze_files/output_86_0.png)
    


<br>

### <a id='toc1_8_6_'></a>[Missings für organspezifische Variablen (Darm)](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C18-C20**


    
![png](clin_2_analyze_files/output_88_0.png)
    


<br>

### <a id='toc1_8_7_'></a>[Missings für organspezifische Variablen (Melanom)](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C43**


    
![png](clin_2_analyze_files/output_90_0.png)
    


<br>

### <a id='toc1_8_8_'></a>[Missings für Prio Variablen](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` != C44**
- diese Variablen sind wesentlich für die Darstellung der Datenqualität ggü. Antragstellenden


    
![png](clin_2_analyze_files/output_92_0.png)
    


<br>

### <a id='toc1_8_9_'></a>[Unbekannt für verpflichtende Variablen](#toc0_)
- kein Filter
- die Darstellungen sind vorläufig, da die Definitionen für unbekannte Ausprägungen noch nicht ausgereift sind
- einige gewertet Unbekannt-Kodierungen aus der Auflistung
  - `Diagnosesicherung = 9`
  - `Seitenlokalisation = U`
  - _`Inzidenzort` ist bislang nicht berücksichtigt_


    
![png](clin_2_analyze_files/output_94_0.png)
    


<br>

## <a id='toc1_9_'></a>[Verteilung Monat von DatumVitalstatus](#toc0_)
- **Filter: alle Patienten mit `Verstorben`=N, `DJ` und `SJ` 2020-2023**

> 💡 `HH`: _"Das liegt an unserer Darstellung des Vitalstatus-Datum. Nach Abschluss der DC-Recherche, die nach Abschluss des 'Todesjahres' durchgeführt wird, wird bei allen Patienten bei denen wir keine weiteren Meldungen bzw Informationen zum Vitalstatus bekommen haben der 31.12. des abgeschlossenen 'Todesjahres' gesetzt. In diesem Fall ist dies das aktuelle Jahr - 2 -> 31.12.2022, da die DC-Recherche zum Zeitpunkt der Datenlieferung noch nicht abgeschlossen war. Wenn jetzt ein Patient die letzte Meldung mit einem Leistungsdatum in 2019 hatte, wir aber keine weiteren Informationen bekommen haben, gehen wir also nach Abschluss der Recherche davon aus, dass der Patient am 31.12.2022 noch gelebt hat. Dadurch 'verbessert' sich tatsächlich der Vitalstatus in unseren Daten, ansonsten wäre dieser nämlich irgendwann in 2019."_

> 💡 `ZfKD`: angestrebt ist die Verwendung eines einzelnen Erhebungszeitpunkts (z.B. Dezember)


    
![png](clin_2_analyze_files/output_96_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_10_'></a>[Numerische Variablen 🔢](#toc0_)

<br>

### <a id='toc1_10_1_'></a>[Diagnosealter](#toc0_)
- berechnet aus `Diagnosejahr` - `Geburtsjahr`
- negative Werte entstehen aus falscher Datumsreihenfolge von Ereignissen
- die Datumsangaben sind **nicht bereinigt**, um strukturelle Effekte sichtbar zu machen

> 💡 `HH`: _"Ja, das liegt an dem Geschätzt-Flag in den Datumsangaben. In unseren Daten haben wir noch die alte Ausprägung 'Jahr geschätzt', diese wird dann im ZFKD-Datensatz mit 'Vollständig geschätzt' übersetzt. Theoretisch könnten Sie statt 1900 auch das angegebene Jahr nutzen… Aber diese Schätz-Angabe ist uns auch ein Dorn im Auge. Wir werden es auch noch in unseren Daten bereinigen. Zumeist handelt es sich da bei uns um Dokumentations oder Verständnisfehler."_


    
![png](clin_2_analyze_files/output_100_0.png)
    



    
![png](clin_2_analyze_files/output_100_1.png)
    


    🟧 all data
    z_age -> min: -121.0 | lower: 30.12 | q25: 59.75 | median: 70.17 | mean: 68.15 | q75: 79.5 | upper: 109.12 | max: 123.67 | std: 15.18 | cv: 0.22 | sum: 220_565_445.76 | skew: -1.24 | kurto: 4.86  
    🟧 boxes
    01-SH -> min: -65.75 | lower: 31.8 | q25: 61.17 | median: 72.33 | mean: 69.85 | q75: 80.75 | upper: 110.12 | max: 112.5 | std: 14.3 | cv: 0.2 | sum: 10_526_086.83 | skew: -0.89 | kurto: 1.14  
    02-HH -> min: -67.17 | lower: 22.5 | q25: 56.25 | median: 68.67 | mean: 66.15 | q75: 78.75 | upper: 103.5 | max: 103.5 | std: 16.19 | cv: 0.24 | sum: 3_675_405.92 | skew: -0.76 | kurto: 0.99  
    03-NI -> min: -90.17 | lower: 30.21 | q25: 58.83 | median: 68.75 | mean: 67.03 | q75: 77.92 | upper: 105.33 | max: 105.33 | std: 14.23 | cv: 0.21 | sum: 14_526_448.0 | skew: -0.88 | kurto: 1.93  
    04-HB -> min: -85.83 | lower: 32.08 | q25: 61.08 | median: 71.67 | mean: 69.36 | q75: 80.42 | upper: 107.33 | max: 107.33 | std: 15.0 | cv: 0.22 | sum: 1_746_680.92 | skew: -1.23 | kurto: 4.39  
    05-NW -> min: 0.0 | lower: 30.08 | q25: 60.33 | median: 70.92 | mean: 69.14 | q75: 80.5 | upper: 110.75 | max: 123.67 | std: 14.83 | cv: 0.21 | sum: 55_707_786.33 | skew: -0.69 | kurto: 0.81  
    06-HE -> min: -103.08 | lower: 27.67 | q25: 57.42 | median: 67.92 | mean: 65.82 | q75: 77.25 | upper: 107.0 | max: 123.67 | std: 15.61 | cv: 0.24 | sum: 11_489_972.67 | skew: -1.28 | kurto: 4.99  
    07-RP -> min: -83.25 | lower: 29.8 | q25: 58.67 | median: 68.58 | mean: 66.89 | q75: 77.92 | upper: 106.79 | max: 123.67 | std: 14.6 | cv: 0.22 | sum: 8_235_296.83 | skew: -0.84 | kurto: 1.78  
    08-BW -> min: -100.58 | lower: 27.7 | q25: 58.83 | median: 69.67 | mean: 67.39 | q75: 79.58 | upper: 110.71 | max: 123.17 | std: 16.44 | cv: 0.24 | sum: 24_073_780.67 | skew: -1.49 | kurto: 5.89  
    09-BY -> min: -121.0 | lower: 28.83 | q25: 58.33 | median: 68.75 | mean: 66.65 | q75: 78.0 | upper: 107.5 | max: 123.25 | std: 15.83 | cv: 0.24 | sum: 28_780_605.0 | skew: -1.53 | kurto: 7.16  
    10-SL -> min: -36.58 | lower: 32.0 | q25: 61.0 | median: 70.75 | mean: 69.23 | q75: 80.33 | upper: 103.92 | max: 103.92 | std: 14.43 | cv: 0.21 | sum: 3_327_310.33 | skew: -0.81 | kurto: 0.94  
    11-BE -> min: -94.33 | lower: 24.3 | q25: 56.92 | median: 68.75 | mean: 65.83 | q75: 78.67 | upper: 111.29 | max: 123.25 | std: 17.67 | cv: 0.27 | sum: 7_564_274.67 | skew: -1.84 | kurto: 8.91  
    12-BB -> min: -99.92 | lower: 28.83 | q25: 58.33 | median: 68.0 | mean: 66.51 | q75: 78.0 | upper: 107.5 | max: 108.5 | std: 14.98 | cv: 0.23 | sum: 6_936_654.92 | skew: -1.11 | kurto: 4.69  
    13-MV -> min: -96.58 | lower: 33.88 | q25: 61.25 | median: 70.42 | mean: 68.97 | q75: 79.5 | upper: 106.88 | max: 123.17 | std: 13.72 | cv: 0.2 | sum: 7_588_763.33 | skew: -0.97 | kurto: 2.75  
    14-SN -> min: -80.83 | lower: 37.5 | q25: 63.25 | median: 72.67 | mean: 70.5 | q75: 80.42 | upper: 106.17 | max: 122.0 | std: 13.57 | cv: 0.19 | sum: 21_167_263.25 | skew: -1.21 | kurto: 3.72  
    15-ST -> min: -101.42 | lower: 34.87 | q25: 62.0 | median: 71.58 | mean: 69.38 | q75: 80.08 | upper: 107.21 | max: 123.5 | std: 15.86 | cv: 0.23 | sum: 8_755_541.34 | skew: -2.74 | kurto: 17.81  
    16-TH -> min: -81.83 | lower: 37.12 | q25: 62.75 | median: 71.83 | mean: 70.12 | q75: 79.83 | upper: 105.46 | max: 120.17 | std: 13.15 | cv: 0.19 | sum: 6_463_574.75 | skew: -1.24 | kurto: 5.24  


<br>

### <a id='toc1_10_2_'></a>[Anzahl Tage zwischen Diagnose und Tod](#toc0_)

> 💡 `ZfKD`: _"es treten Extremwerte auf, weit ausserhalb des Interquartilsabstandes. Grund dafür sind mutmasslich fehlende Datumsangaben, die auf 1900 kodiert werden"_  
> 💡 `ZfKD`: _"in der KKR Verteilung sind die Extreme in den GTDS Ländern besonders ausgeprägt"_


    
![png](clin_2_analyze_files/output_102_0.png)
    


    Anzahl_Tage_Diagnose_Tod -> min: -27_320 | lower: -813.5 | q25: 46.0 | median: 230.0 | mean: 596.359 | q75: 619.0 | upper: 1_478.5 | max: 81_801 | std: 1_227.785 | cv: 2.059 | sum: 515_433_242 | skew: 5.321 | kurto: 60.213  



    
![png](clin_2_analyze_files/output_102_2.png)
    


<br>

### <a id='toc1_10_3_'></a>[Tumordicke](#toc0_)


    
![png](clin_2_analyze_files/output_104_0.png)
    


    Tumordicke -> min: 0.1 | lower: 0.1 | q25: 0.4 | median: 0.7 | mean: 1.721 | q75: 1.7 | upper: 3.65 | max: 99.0 | std: 3.194 | cv: 1.856 | sum: 45_659.1 | skew: 8.052 | kurto: 129.868  



    
![png](clin_2_analyze_files/output_104_2.png)
    


### <a id='toc1_10_4_'></a>[PSA](#toc0_)


    
![png](clin_2_analyze_files/output_106_0.png)
    


    PSA -> min: 0.0 | lower: 0.0 | q25: 5.76 | median: 8.99 | mean: 95.388 | q75: 19.0 | upper: 38.86 | max: 89_280.0 | std: 732.474 | cv: 7.679 | sum: 13_692_046.74 | skew: 40.251 | kurto: 3025.77  



    
![png](clin_2_analyze_files/output_106_2.png)
    


### <a id='toc1_10_5_'></a>[LK_befallen](#toc0_)


    
![png](clin_2_analyze_files/output_108_0.png)
    


    LK_befallen -> min: 0 | lower: 0.0 | q25: 0.0 | median: 0.0 | mean: 0.912 | q75: 0.0 | upper: 0.0 | max: 722 | std: 3.098 | cv: 3.397 | sum: 576_995 | skew: 26.001 | kurto: 4705.951  



    
![png](clin_2_analyze_files/output_108_2.png)
    


### <a id='toc1_10_6_'></a>[LK_untersucht](#toc0_)


    
![png](clin_2_analyze_files/output_110_0.png)
    


    LK_untersucht -> min: 0 | lower: 0 | q25: 0.0 | median: 5.0 | mean: 10.542 | q75: 17.0 | upper: 42.5 | max: 2_319 | std: 13.52 | cv: 1.283 | sum: 8_020_609 | skew: 14.161 | kurto: 1865.88  



    
![png](clin_2_analyze_files/output_110_2.png)
    


### <a id='toc1_10_7_'></a>[RektumAbstandAnokutanlinie](#toc0_)


    
![png](clin_2_analyze_files/output_112_0.png)
    


    RektumAbstandAnokutanlinie -> min: 0 | lower: 0 | q25: 5.0 | median: 10.0 | mean: 11.616 | q75: 14.0 | upper: 27.5 | max: 930 | std: 18.375 | cv: 1.582 | sum: 379_100 | skew: 14.746 | kurto: 457.754  



    
![png](clin_2_analyze_files/output_112_2.png)
    


### <a id='toc1_10_8_'></a>[LDH](#toc0_)


    
![png](clin_2_analyze_files/output_114_0.png)
    


    LDH -> min: 1 | lower: 81.25 | q25: 173.5 | median: 199.0 | mean: 225.322 | q75: 235.0 | upper: 327.25 | max: 3_650 | std: 185.664 | cv: 0.824 | sum: 447_715 | skew: 9.642 | kurto: 129.635  



    
![png](clin_2_analyze_files/output_114_2.png)
    

