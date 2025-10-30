# <a id='toc1_'></a>[Bericht zur Datenqualität (klin) 📉](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Bericht zur Datenqualität (klin) 📉](#toc1_)    
  - [load data 📁](#toc1_1_)    
  - [Änderungen seit der letzten Version](#toc1_2_)    
  - [Datenstand ⏱️](#toc1_3_)    
  - [Lieferdatum 📆](#toc1_4_)    
  - [Fallzahlen](#toc1_5_)    
    - [absolut](#toc1_5_1_)    
    - [relativ](#toc1_5_2_)    
  - [missings](#toc1_6_)    
  - [Fallzahlen epi vs clin](#toc1_7_)    
  - [Verteilung von Variablen](#toc1_8_)    
    - [UICC (p)](#toc1_8_1_)    
    - [Diagnosesicherung](#toc1_8_2_)    
    - [Geschlecht](#toc1_8_3_)    
    - [Diagnosejahr](#toc1_8_4_)    
    - [Inzidenzort BL](#toc1_8_5_)    
    - [ICD10 Gruppen](#toc1_8_6_)    
    - [Verstorben](#toc1_8_7_)    
    - [TNM-T (p)](#toc1_8_8_)    
    - [TNM-N (p)](#toc1_8_9_)    
    - [TNM-M (p)](#toc1_8_10_)    
    - [TNM-Auflage (p)](#toc1_8_11_)    
    - [Todesursachen](#toc1_8_12_)    
      - [nach ICD10 Einstellern](#toc1_8_12_1_)    
      - [nach Art der Todesursache bei Verstorbenen](#toc1_8_12_2_)    
      - [nach hat_todesursache bei Nicht-Verstorbenen](#toc1_8_12_3_)    
      - [nach ICD10 Dreistellern (TOP 5)](#toc1_8_12_4_)    
      - [nach IsGrundleiden](#toc1_8_12_5_)    
    - [OP](#toc1_8_13_)    
      - [nach ICD10](#toc1_8_13_1_)    
      - [nach Intention](#toc1_8_13_2_)    
    - [OPS](#toc1_8_14_)    
      - [nach OPS ICD Kapitel (Top 10)](#toc1_8_14_1_)    
      - [nach OPS Einzelcodes (Top 5)](#toc1_8_14_2_)    
  - [Missings / Unbekannt in den Daten](#toc1_9_)    
    - [Missings für verpflichtende Variablen in Tumor Element](#toc1_9_1_)    
    - [Missings für Therapieangaben](#toc1_9_2_)    
    - [Missings für Tumorstadien](#toc1_9_3_)    
    - [Missings für organspezifische Variablen (Mamma)](#toc1_9_4_)    
    - [Missings für organspezifische Variablen (Prostata)](#toc1_9_5_)    
    - [Missings für Prio Variablen](#toc1_9_6_)    
    - [Unbekannt für verpflichtende Variablen](#toc1_9_7_)    
  - [Verteilung Monat von DatumVitalstatus](#toc1_10_)    
  - [Numerische Variablen 🔢](#toc1_11_)    
    - [Diagnosealter](#toc1_11_1_)    
    - [Anzahl Tage zwischen Diagnose und Tod](#toc1_11_2_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

<br>

## <a id='toc1_1_'></a>[load data 📁](#toc0_)

    🐍 3.12.2 | 📦 pandas: 2.2.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.1.2 | 📦 pandas-plots: 0.11.15 | 📦 connection_helper: 0.8.10


<br>

## <a id='toc1_2_'></a>[Änderungen seit der letzten Version](#toc0_)
- Datenaktualisierungen: `SN`, `TH`

<br>

## <a id='toc1_3_'></a>[Datenstand ⏱️](#toc0_)

    sqlite db file:          2024-10-22_data_clin.db
    last kkr data import:    2024-09-20
    sql table created:       2024-10-22 08:59:29
    sql table transmitted:   2024-10-22 10:25:35
    document created:        2024-10-22 17:46:37


<br>

## <a id='toc1_4_'></a>[Lieferdatum 📆](#toc0_)
- `kkr` = Klinisches Krebsregister
- `Lieferdatum` = Datum der letzten Übermittlung durch die KKR
- `Diagnosemonat` = letzter Diagnosemonat in den Daten
- ⚠️ inzwischen sind erste Daten für 2023 enthalten (SN, siehe [DJ](#toc1_8_4_)). Diese sind jedoch noch aus den Analysen ausgeschlossen


    
![png](clin_2_analyze_files/output_11_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_5_'></a>[Fallzahlen](#toc0_)
- in den Darstellungen sind keine Filter angewendet, solange nicht explizit angegeben

<br>

### <a id='toc1_5_1_'></a>[absolut](#toc0_)
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
> die absoluten Werte lassen erkennen, dass inzwischen flächendeckend Elemente für `ST` und `SYST` vorliegen


    
![png](clin_2_analyze_files/output_16_0.png)
    



    
![png](clin_2_analyze_files/output_17_0.png)
    


<br>

### <a id='toc1_5_2_'></a>[relativ](#toc0_)
- **Filter: `DJ` >= 2020, `DCO` = N, `ICD10` != C44**
- der Filter ist gewählt, um eine bessere Vergleichbarkeit der Werte zu gewährleisten
- die Metriken sind **einfache Verhältiszahlen**, z.B: `op_per_tum` = alle OP / alle Tumore (pro kkr)
- es sind jeweils die kumulierten Werte aufgespannt:
  - nach einzelnen **Lieferregistern**
  - nach verwendeten **Tumordokumentationssystemen** (um systemische Effekte darstellen zu können)


    
![png](clin_2_analyze_files/output_19_0.png)
    



    
![png](clin_2_analyze_files/output_20_0.png)
    


<br>

## <a id='toc1_6_'></a>[missings](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**
- ein Wert von bspw. 0.68 ist zu interpretieren als: _"68% aller Tumorfälle im KKR haben keine zugeordneten OP Angaben, die restlichen 32% mindestens eine."_
- `thera_missing_per_tum` stellt den Anteil Fälle dar, bei denen keinerlei Therapieangabe (OP, ST, SYST) vorliegt
- in der Darstellung sind die Max/Min Werte pro Kennzahl mit 🟥/🟩 markiert (kleiner ist besser)
> 💡 `NI` _"Die **Missings für Folgeereignis, Strahlentherapie und Systemische Therapie** sind Resultat der noch ausstehenden Implementierung in der Registersoftware Tristan zur Bildung der jeweiligen Best-Of-Informationen. Die Implementierung ist bereits beauftragt. Neben Niedersachsen nutzen die Bundesländer Schleswig-Holstein, Bremen und das Saarland dieselbe Tristan-Implementierung"_

> aus `st_missing_per_tum` lässt sich ablesen, dass ~23% der Tumoren deutschlandweit mind. eine ST zugeordnet ist (Total: 1 - 0.774 = 0.226). Das entspricht in etwa der Annahme von 30% Anteil von Strahlentherapien an primären Diagnosen 


    
![png](clin_2_analyze_files/output_22_0.png)
    



    
![png](clin_2_analyze_files/output_23_0.png)
    


<br>

## <a id='toc1_7_'></a>[Fallzahlen epi vs clin](#toc0_)
- **Filter: `DJ` = 2022, `DCO` = N, `ICD10` != C44**
- Ziel der Darstellung: Abschätzung der Vollzähligkeit der klinischen Daten
- dargestellt sind die gefilterten Fallzahlen jeweils aus den epi und den klinischen Daten, hier allerdings nur aus dem letzten DJ 2022
- Hinweis: Die Auswertung Daten basiert auf `Inzidenzort` anstatt `Lieferregister`, da in den epi Daten bislang die einzelnen Länder des GKR nicht aufgeschlüsselt waren, und ein matching auf EKRNR somit fehlschlägt
> 💡 `NI` _"Die **höhere Fallzahl** des epidemiologischen Registers im Vergleich zum klinischen Register ist vermutlich auf unterschiedliche Filterkriterien in den beiden Registern zurückzuführen. Im KKN werden neben den Kriterien die das Lieferschema vorgibt auch noch weitere Plausibilitätsprüfungen angewandt. Tumoren, welche diese Prüfungen nicht bestehen, werden vom Export ausgeschlossen"_  

> Die quota in den anderen KKR entspricht der Erwartung, dass die Fallzahl bei klin. Daten höher sein sollte als bei epi

> Das Missverhältnis bei TH entsteht dadurch, dass die epi Daten bislang nicht neu generiert sind 


    
![png](clin_2_analyze_files/output_26_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_8_'></a>[Verteilung von Variablen](#toc0_)
- **Filter: `DJ` 2020-2022** Weitere Filter sind extra aufgeführt
- in den Diagrammen gibt das angegebene _`n=`_ einen Hinweis auf die verwendete Grundgesamtheit
- die _relativen_ Barcharts enthalten ein `Total` item für den Gesamtvergleich

<br>

### <a id='toc1_8_1_'></a>[UICC (p)](#toc0_)
- nach den absoluten Werten ist auch die relative Verteilung gegeben unter Ausschluss der hohen Zahl an UICC missings
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**
- _solide Tumoren_ schliesst folgende Diagnosen _aus_:
  - C44
  - C70-C72, C76-C97
  - alle D

> Variable wird in den meisten kkr selbst gebildet. Für GTDS Länder ist dafür ein Standard definiert  

> 💡 `NI` _"UICC-Stadium: In Tristan ist die Implementierung zur automatisierten Ermittlung des UICC-Stadiums ausstehend. Bis zur Umsetzung der Implementierung wird das KKN **keine gesonderte Berechnung** des UICC-Stadiums vornehmen, liefert aber die Werte, die gemeldet worden sind"_  

> 💡 `HH` _"Komplett fehlende UICC-Stadien: Teilweise bei uns unter **weitere Klassifikationen** zu finden und erst ab 2023 in einem eigenen Feld. UICC nach TNM-8 ist noch nicht vollständig in unserer Datenbank berechnet."_


    
![png](clin_2_analyze_files/output_30_0.png)
    



    
![png](clin_2_analyze_files/output_30_1.png)
    


<br>

### <a id='toc1_8_2_'></a>[Diagnosesicherung](#toc0_)
> aufgrund der verschiedenartigen Handhabung von DCO in den übermittelten Daten ist die Filterung nach DCO mit erheblicher Unschärfe verbunden  

> 💡 `NI` _"Die Ausprägung **DCO als Diagnosesicherung** kommt im KKN-Datensatz nicht vor. Diese Information liegt bisher nur dem EKN vor und wird gegebenenfalls zur Anreicherung von Datenexporten fallspezifisch vom KKN beim EKN angefragt. Der Prozess zur automatisierten Übermittlung dieser Informationen vom EKN zum KKN ist in Planung"_


    
![png](clin_2_analyze_files/output_32_0.png)
    


<br>

### <a id='toc1_8_3_'></a>[Geschlecht](#toc0_)
- Grundgesamtheit: Menge aller **Patienten** 

> Angaben zu Geschlecht ungleich M oder W sind sehr selten, diese Fälle werden nicht gesondert verarbeitet  


    
![png](clin_2_analyze_files/output_34_0.png)
    


    Anzahl Ausprägungen <> M oder W im Gesamtdatensatz: {'D': 22, 'U': 209, 'X': 20}


<br>

### <a id='toc1_8_4_'></a>[Diagnosejahr](#toc0_)
- wie im workshop 2023 besprochen nehmen wir Altfälle weiterhin mit auf, eine Auswertestrategie muss noch erstellt werden
- Filter: keiner, Top 20 Diagnosejahre
> neben den beiden Testfällen aus **DJ=2023** sind inzwischen Daten aus SN enthalten

    Anzahl 2023 Fälle: {'11-BE': 1, '09-BY': 1, '14-SN': 8529}



    
![png](clin_2_analyze_files/output_36_1.png)
    


<br>

### <a id='toc1_8_5_'></a>[Inzidenzort BL](#toc0_)
- vertikal: `Inzidenzort` (Zeile `00` bündelt alle Fälle mit ungültiger Ortsangabe). horizontal: `Lieferregister`
- Beispiel: `03-NI` liefert zu 100% Fälle aus dem Inzidenzort `03`, `13-MV` liefert 159 Fälle aus `03`
- kein Filter, Grundgesamtheit sind alle Fälle
> angestrebt ist eine "Diagonale", möglichst nur noch Fallübermittlungen aus dem eigenen Einzugsgebiet, was in der zweiten Lieferung schon besser erreicht ist. Mindestens `98.5%` der Fälle stammen aus dem liefernden Register


    
![png](clin_2_analyze_files/output_38_0.png)
    


<br>

### <a id='toc1_8_6_'></a>[ICD10 Gruppen](#toc0_)
- die verwendete ICD10 Skala entspricht der Darstellung aus *"Krebs in Deutschland"*
> 💡 `NI` _"Für nicht-melanozytäre Hautkrebsarten bestimmter Histologien sowie fortgeschrittene Plattenepithelkarzinome gilt ab dem 20. September 2023 eine geänderte Meldepflicht. Erst seit diesem Zeitpunkt sind die prognostisch ungünstigen Hauttumore **(C44)** an das KKN zu melden und kommen daher im gelieferten Datensatz bisher nicht vor. In den nächsten Lieferungen werden diese Daten enthalten sein"_


    
![png](clin_2_analyze_files/output_40_0.png)
    


<br>

### <a id='toc1_8_7_'></a>[Verstorben](#toc0_)
- Grundgesamtheit: Alle Patienten mit zugeordneten Tumoren im Filter:
- **Filter: `DJ` 2020-2020, `DCO` = N, `ICD10` != C44**


    
![png](clin_2_analyze_files/output_42_0.png)
    


<br>

### <a id='toc1_8_8_'></a>[TNM-T (p)](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**
> 💡 `HH` _"Hoher Anteil TNM-T(p fehlend). Vielleicht geben andere Bundesländer einfach ein pT1 an, wenn ein Karzinom festgestellt wird z.B. durch eine Biopsie."_


    
![png](clin_2_analyze_files/output_44_0.png)
    


<br>

### <a id='toc1_8_9_'></a>[TNM-N (p)](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**



    
![png](clin_2_analyze_files/output_46_0.png)
    


<br>

### <a id='toc1_8_10_'></a>[TNM-M (p)](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**


    
![png](clin_2_analyze_files/output_48_0.png)
    


<br>

### <a id='toc1_8_11_'></a>[TNM-Auflage (p)](#toc0_)

> 💡 `NI` _"TNM-Version: Die von den Meldenden fehlenden Angaben zur TNM-Version werden nicht durch Manipulation der Daten ergänzt"_


    
![png](clin_2_analyze_files/output_50_0.png)
    


<br>

### <a id='toc1_8_12_'></a>[Todesursachen](#toc0_)

<br>

#### <a id='toc1_8_12_1_'></a>[nach ICD10 Einstellern](#toc0_)
- gezählt sind die ersten Stellen aller TU Codes ohne jeglichen Filter


    
![png](clin_2_analyze_files/output_53_0.png)
    


<br>

#### <a id='toc1_8_12_2_'></a>[nach Art der Todesursache bei Verstorbenen](#toc0_)
- Grundgesamtheit: alle Patienten (nicht Todesursachen)
- **Filter: Verstorben= J**
- `tu_type` Art der TU pro Patient
  - `<NA>` keine Todesursache
  - `c` Todesursache Cxx
  - `other` andere Todesursache


    
![png](clin_2_analyze_files/output_55_0.png)
    


<br>

#### <a id='toc1_8_12_3_'></a>[nach hat_todesursache bei Nicht-Verstorbenen](#toc0_)
- Filter: alle Patienten mit **Verstorben=N**
> 💡 `HH` _"Da haben wir jetzt gesehen, dass es an dem Überhang-Konstrukt liegt. Da handelt es sich um Patienten, die im Datenlieferungszeitraum <31.12.2022 noch gelebt haben, aber dann innerhalb des Zeitraums zur Erstellung des Datensatzes (01.02.2024) verstorben sind. Da passen wir unseren Datenexport noch einmal an."_


    
![png](clin_2_analyze_files/output_57_0.png)
    


<br>

#### <a id='toc1_8_12_4_'></a>[nach ICD10 Dreistellern (TOP 5)](#toc0_)
- Grundgesamtheit: alle Todesursachen
> enthalten sind in einigen KKR auch `C79` (Metastasen), welche in offizieller Todesursachen-Statistik nicht kodiert sind


    
![png](clin_2_analyze_files/output_59_0.png)
    


<br>

#### <a id='toc1_8_12_5_'></a>[nach IsGrundleiden](#toc0_)
- Grundgesamtheit: alle Todesursachen
- kein Filter


    
![png](clin_2_analyze_files/output_61_0.png)
    


<br>

### <a id='toc1_8_13_'></a>[OP](#toc0_)
- Grundgesamtheit: alle OP Meldungen

<br>

#### <a id='toc1_8_13_1_'></a>[nach ICD10](#toc0_)


    
![png](clin_2_analyze_files/output_64_0.png)
    


<br>

#### <a id='toc1_8_13_2_'></a>[nach Intention](#toc0_)


    
![png](clin_2_analyze_files/output_66_0.png)
    


<br>

### <a id='toc1_8_14_'></a>[OPS](#toc0_)
- Grundgesamtheit: alle OPS Codes
- lediglich HH und NW übermitteln ausschliesslich Kapitel 5
- der Anteil von Meldungen <> Kapitel 5 sind wahrscheinlich diagnostische Massnahmen oder nicht-operative Therapien
- Vorschlag: nur noch Kapitel 5 übermitteln

<br>

#### <a id='toc1_8_14_1_'></a>[nach OPS ICD Kapitel (Top 10)](#toc0_)


    
![png](clin_2_analyze_files/output_69_0.png)
    


<br>

#### <a id='toc1_8_14_2_'></a>[nach OPS Einzelcodes (Top 5)](#toc0_)


    
![png](clin_2_analyze_files/output_71_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_9_'></a>[Missings / Unbekannt in den Daten](#toc0_)
- es sind folgende Schwellwerte angezeigt:
  - 🟩 0 bis <5%
  - 🟨 5 bis <100%
  - 🟥 bei 100%
- **Filter: `DJ` 2020-2022** Weitere Filter sind extra aufgeführt
- dargestellt sind Variablen aus dem Schema in folgender Notation: `[Elementknoten]Variablenname`
- die graumelierte `0` kennzeichnet einen leeren Wert (=keine missings), 0% entsteht durch Rundung von kleinen Werten

<br>

### <a id='toc1_9_1_'></a>[Missings für verpflichtende Variablen in Tumor Element](#toc0_)
- kein Filter
- Pflichtangaben aus anderen Elementknoten (z.B. Datum aus dem OP Knoten) sind nicht aufgeführt, da diese selbst optional sind
- ganz überwiegend sind die Angaben vollständig, die wenigen Ausnahmen werden allerdings Stand heute nicht korrigiert


    
![png](clin_2_analyze_files/output_75_0.png)
    


<br>

### <a id='toc1_9_2_'></a>[Missings für Therapieangaben](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` != C44**
- Rechenbeispiel für `[Bestrahlung]Anzahl_Tage_Diagnose_ST` in 01-SH (Zahlen sind veraltet, aber Prinzip bleibt gleich):
  - 5363 Bestrahlungen sind in den Daten unter Beachtung des Filters (DCO/DJ/ICD10) für den zugeordneten Tumor
  - davon enthalten 302 ein leeres Feld `Anzahl_Tage_Diagnose_ST` -> ~ 6%


    
![png](clin_2_analyze_files/output_77_0.png)
    


<br>

### <a id='toc1_9_3_'></a>[Missings für Tumorstadien](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` nur solide Tumoren**


    
![png](clin_2_analyze_files/output_79_0.png)
    


<br>

### <a id='toc1_9_4_'></a>[Missings für organspezifische Variablen (Mamma)](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` = C50**
- die Prozentwerte sind bei allen Darstellungen gerundet, "100%" bei einer gelben Ampel kann interpretiert werden als knapp unter 100%
> 💡 `HH` _"Fehlende Modul-Angaben (C50, C61) 2021. Sind bei uns noch nicht im xml enthalten."_


    
![png](clin_2_analyze_files/output_81_0.png)
    


<br>

### <a id='toc1_9_5_'></a>[Missings für organspezifische Variablen (Prostata)](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` = C61**


    
![png](clin_2_analyze_files/output_83_0.png)
    


<br>

### <a id='toc1_9_6_'></a>[Missings für Prio Variablen](#toc0_)
- **Filter: `DJ` 2020-2022, `DCO` = N, `ICD10` != C44**
> diese Variablen sind wesentlich für die Darstellung der Datenqualität ggü. Antragstellenden


    
![png](clin_2_analyze_files/output_85_0.png)
    


<br>

### <a id='toc1_9_7_'></a>[Unbekannt für verpflichtende Variablen](#toc0_)
- kein Filter
- die Darstellungen sind vorläufig, da die Definitionen für unbekannte Ausprägungen noch nicht ausgereift sind
- einige gewertet Unbekannt-Kodierungen aus der Auflistung
  - `Diagnosesicherung = 9`
  - `Seitenlokalisation = U`
  - _`Inzidenzort` ist bislang nicht berücksichtigt_


    
![png](clin_2_analyze_files/output_87_0.png)
    


<br>

## <a id='toc1_10_'></a>[Verteilung Monat von DatumVitalstatus](#toc0_)
- **Filter: alle Patienten mit `Verstorben=N`**
> angestrebt ist die Verwendung eines einzelnen Erhebungszeitpunkts (z.B. Dezember)

> 💡 `HH` _"Das liegt an unserer Darstellung des Vitalstatus-Datum. Nach Abschluss der DC-Recherche, die nach Abschluss des 'Todesjahres' durchgeführt wird, wird bei allen Patienten bei denen wir keine weiteren Meldungen bzw Informationen zum Vitalstatus bekommen haben der 31.12. des abgeschlossenen 'Todesjahres' gesetzt. In diesem Fall ist dies das aktuelle Jahr - 2 -> 31.12.2022, da die DC-Recherche zum Zeitpunkt der Datenlieferung noch nicht abgeschlossen war. Wenn jetzt ein Patient die letzte Meldung mit einem Leistungsdatum in 2019 hatte, wir aber keine weiteren Informationen bekommen haben, gehen wir also nach Abschluss der Recherche davon aus, dass der Patient am 31.12.2022 noch gelebt hat. Dadurch 'verbessert' sich tatsächlich der Vitalstatus in unseren Daten, ansonsten wäre dieser nämlich irgendwann in 2019."_


    
![png](clin_2_analyze_files/output_89_0.png)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_11_'></a>[Numerische Variablen 🔢](#toc0_)

<br>

### <a id='toc1_11_1_'></a>[Diagnosealter](#toc0_)
- berechnet aus `Diagnosejahr` - `Geburtsjahr`
> negative Werte entstehen aus falscher Datumsreihenfolge von Ereignissen (bislang nicht behandelt)

> 💡 `HH` _"Ja, das liegt an dem Geschätzt-Flag in den Datumsangaben. In unseren Daten haben wir noch die alte Ausprägung 'Jahr geschätzt', diese wird dann im ZFKD-Datensatz mit 'Vollständig geschätzt' übersetzt. Theoretisch könnten Sie statt 1900 auch das angegebene Jahr nutzen… Aber diese Schätz-Angabe ist uns auch ein Dorn im Auge. Wir werden es auch noch in unseren Daten bereinigen. Zumeist handelt es sich da bei uns um Dokumentations oder Verständnisfehler."_


    
![png](clin_2_analyze_files/output_93_0.png)
    



    
![png](clin_2_analyze_files/output_93_1.png)
    


<br>

### <a id='toc1_11_2_'></a>[Anzahl Tage zwischen Diagnose und Tod](#toc0_)

#### Verteilung der Variable

> es treten Extremwerte auf, weit ausserhalb des Interquartilsabstandes (IQR). Grund dafür sind mutmasslich fehlende Datumsangaben, die auf 1900 kodiert werden

> in der KKR Verteilung sind die Extreme in den GTDS Ländern besonders ausgeprägt
 


    
![png](clin_2_analyze_files/output_96_0.png)
    



    
![png](clin_2_analyze_files/output_96_1.png)
    

