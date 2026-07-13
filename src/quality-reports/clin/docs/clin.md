# <a id='toc1_'></a>[Bericht zur Qualität der klinischen Daten](#toc0_)

**Inhalt**<a id='toc0_'></a>    
- [Bericht zur Qualität der klinischen Daten](#toc1_)    
  - [Informationen zum Dokument](#toc1_1_)    
  - [Änderungen seit der letzten Version](#toc1_2_)    
  - [Datenstand](#toc1_3_)    
  - [Lieferdatum](#toc1_4_)    
  - [Fallzahlen](#toc1_5_)    
    - [absolut](#toc1_5_1_)    
    - [relativ](#toc1_5_2_)    
      - [nach KKR](#toc1_5_2_1_)    
      - [nach System](#toc1_5_2_2_)    
  - [Fehlende Therapieangaben](#toc1_6_)    
    - [alle Therapien](#toc1_6_1_)    
    - [OP](#toc1_6_2_)    
      - [OP wenn OP erwartet](#toc1_6_2_1_)    
        - [C50](#toc1_6_2_1_1_)    
        - [C18-C20](#toc1_6_2_1_2_)    
    - [ST](#toc1_6_3_)    
      - [ST wenn ST erwartet](#toc1_6_3_1_)    
    - [SYST](#toc1_6_4_)    
      - [SYST wenn SYST erwartet](#toc1_6_4_1_)    
  - [Fallzahlen epi vs clin](#toc1_7_)    
  - [Verteilung von Variablen](#toc1_8_)    
    - [UICC (p)](#toc1_8_1_)    
    - [Diagnosesicherung](#toc1_8_2_)    
    - [DCO](#toc1_8_3_)    
    - [DCN](#toc1_8_4_)    
    - [Grading](#toc1_8_5_)    
    - [Diagnosejahr mit Altdaten](#toc1_8_6_)    
    - [Inzidenzort vs Lieferregister](#toc1_8_7_)    
    - [Diagnosegruppen](#toc1_8_8_)    
    - [Altersgruppen Kinder und Heranwachsende](#toc1_8_9_)    
    - [Verstorben](#toc1_8_10_)    
    - [TNM-T (p)](#toc1_8_11_)    
    - [TNM-N (p)](#toc1_8_12_)    
    - [TNM-M (pc)](#toc1_8_13_)    
  - [Todesursachen (TU)](#toc1_9_)    
    - [nach ICD10 Einstellern](#toc1_9_1_)    
    - [nach Sterbejahr und Todesursachen](#toc1_9_2_)    
    - [nach ICD10 Dreistellern (TOP 5)](#toc1_9_3_)    
    - [nach IsGrundleiden](#toc1_9_4_)    
  - [Therapien](#toc1_10_)    
    - [OP](#toc1_10_1_)    
      - [nach ICD10](#toc1_10_1_1_)    
      - [nach Intention](#toc1_10_1_2_)    
    - [OPS](#toc1_10_2_)    
      - [nach OPS ICD Kapitel (Top 10)](#toc1_10_2_1_)    
    - [SYST](#toc1_10_3_)    
      - [nach Stellung_OP](#toc1_10_3_1_)    
  - [Missings- und Unbekannt-Kodierungen](#toc1_11_)    
    - [Verpflichtende Tumorvariablen](#toc1_11_1_)    
    - [Weitere Tumorangaben](#toc1_11_2_)    
    - [Tumorstadien](#toc1_11_3_)    
    - [Therapieangaben](#toc1_11_4_)    
      - [OP](#toc1_11_4_1_)    
      - [ST](#toc1_11_4_2_)    
      - [SYST](#toc1_11_4_3_)    
    - [Folgeereignisse](#toc1_11_5_)    
    - [Freitexte](#toc1_11_6_)    
    - [Organspezifische Variablen](#toc1_11_7_)    
      - [Mamma](#toc1_11_7_1_)    
      - [Prostata](#toc1_11_7_2_)    
      - [Darm](#toc1_11_7_3_)    
      - [Melanom](#toc1_11_7_4_)    
  - [Weitere Klassifikationen](#toc1_12_)    
    - [nach Quelle](#toc1_12_1_)    
    - [nach KKR](#toc1_12_2_)    
    - [PSA](#toc1_12_3_)    
      - [Angabe zu Diagnose vs Weitere Klassifikationen](#toc1_12_3_1_)    
      - [Kombinationen der PSA Merkmale](#toc1_12_3_2_)    
      - [Weitere Klassifikationen: Diagnose vs Folgeereignis](#toc1_12_3_3_)    
    - [UICC](#toc1_12_4_)    
      - [Kombinationen](#toc1_12_4_1_)    
      - [nach KKR](#toc1_12_4_2_)    
  - [Freitextkodierung](#toc1_13_)    
    - [Substanzen](#toc1_13_1_)    
  - [Datum Vitalstatus](#toc1_14_)    
    - [Zeitpunkt der Erhebung](#toc1_14_1_)    
  - [Numerische Variablen](#toc1_15_)    
    - [Diagnosealter](#toc1_15_1_)    
    - [Anzahl Tage zwischen Diagnose und Tod](#toc1_15_2_)    
    - [PSA](#toc1_15_3_)    
    - [LK_untersucht](#toc1_15_4_)    
    - [LK_befallen](#toc1_15_5_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->


<br>

## <a id='toc1_1_'></a>[Informationen zum Dokument](#toc0_)
- Neben den Hinweisen zum Verständnis der Auswertungen sind auch häufig **Interpretationen** angefügt, diese sind optisch abgesetzt als **Notiz** erkennbar
- die jeweils angewendeten **Filter** sind für jede Auswertung dargestellt, jeweils zur besseren Einordnung als Anteil von der Gesamtzahl der Entität in unserer Datenbank
- die _relativen_ Barcharts enthalten ein `Total` item für den Gesamtvergleich
- die Filter können exakt nachvollzogen werden mit Hilfe der **ausklappbaren SQL Abfragen**
- in den Diagrammen gibt ebenfalls das angegebene _`n=`_ einen Hinweis auf die verwendete Grundgesamtheit
- der komplette Quellcode dieses Dokumentes ist [hier abrufbar](../../clin.ipynb)

<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_2_'></a>[Änderungen seit der letzten Version](#toc0_)
- Neulieferung für Daten mit **Diagnosejahr 2024**

<br>

## <a id='toc1_3_'></a>[Datenstand](#toc0_)

    database file:           2026-05-12_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-04-18
    sql table created:       2026-05-12 16:38:32
    doi:                     10.18444/5.03.01.0005.0021.0003
    document created:        2026-05-22 15:17:44


<br>

## <a id='toc1_4_'></a>[Lieferdatum](#toc0_)
- `kkr` = Klinisches Krebsregister
- `Lieferdatum` = Datum der letzten Übermittlung durch die KKR
- `Diagnosemonat` = letzter Diagnosemonat in den Daten


    
<img alt="png" src="clin_files/output_12_0.png">
    


<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_5_'></a>[Fallzahlen](#toc0_)
- in den Darstellungen sind keine Filter angewendet, solange nicht explizit angegeben

<br>

### <a id='toc1_5_1_'></a>[absolut](#toc0_)
- aufgespannt sind die Fallzahlen für Lieferregister und Elementknoten
- für jedes Register ist hier insbesondere einsehbar, wie viele Tumore/Patienten aus der aktuellsten Lieferung verarbeitet wurden
- kein Filter, "Altfälle" (DJ < 2020) sind also enthalten
- aufgeteilt auf 2 Tabellen zur besseren Übersicht
- die `%` Werte sowie die farbigen Datenbalken zeigen das relative Gewicht jedes KKR an "D gesamt" (`Total` Zeile)
- Erklärung für einige Elementknoten:
  - **Diagnose**
    - `diag_weitere` = Weitere Klassifikation im Elementknoten "Diagnose"
    - `diag_fm` = Fernmetastasen im Elementknoten "Diagnose"
  - **Folge**
    - `folge_fm`= Fernmetastasen im Elementknoten "Folgeereignis"
    - `folge_weitere` = Weitere Klassifikation im Elementknoten "Folgeereignis"
    - `folge_tnm` = TNM im Elementknoten "Folgeereignis"

> 💡 **ZfKD**
> - inzwischen liegen die meisten Elemente flächendeckend vor, bis auf `Applikationsart` und `Folgeereignis_WeitereKlassifikation`
> - einige Elemente sind überproportional zur Verteilung der Tumore vorhanden, z.B. Weitere Klassifikationen bei Folgeereignissen aus `05-NW`
> - die für viele Analysen relevanten `Folgeereignisse` sind nun zwar deutschlandweit verfügbar, aber aus einigen KKR mit sehr geringem Anteil


    
<img alt="png" src="clin_files/output_17_0.png">
    



    
<img alt="png" src="clin_files/output_18_0.png">
    


<br>

### <a id='toc1_5_2_'></a>[relativ](#toc0_)
- der Filter ist gewählt, um eine bessere Vergleichbarkeit der Werte zu gewährleisten
- die Metriken sind **einfache Verhältniszahlen**, z.B: `op_per_tum` = alle OP / alle Tumore (pro kkr)
- es sind jeweils die kumulierten Werte aufgespannt:
  - nach einzelnen **Lieferregistern**
  - nach verwendeten **Tumordokumentationssystemen** (um systemische Effekte darstellen zu können)

> 💡 **ZfKD**
> - die Quote Tumor pro Patient ist verlässlich konstant
> - bei den Therapien gibt es einige Auffälligkeiten, wie z.B. wenige Folgeereignisse aus den `tristan` Ländern, oder hohe ST pro Tumor Quote aus `07-RP`


<br>

#### <a id='toc1_5_2_1_'></a>[nach KKR](#toc0_)



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024]:                  n = 3_794_188  (93.4%) 
    └ [keine DCO]:                     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]:                 n = 3_065_024  (75.4%) 
    └ [keine Verstorbenen < 180 Tage]: n = 2_688_879  (66.2%) 
    └ [kein M1]:                       n = 2_472_554  (60.9%)
```

<img alt="png" src="clin_files/output_21_4.png" width="800">
    



<br>

#### <a id='toc1_5_2_2_'></a>[nach System](#toc0_)


<img alt="png" src="clin_files/output_23_1.png" width="800">
    


<br>

## <a id='toc1_6_'></a>[Fehlende Therapieangaben](#toc0_)

- ein Wert von bspw. 0.68 ist zu interpretieren als: _"68% aller Tumorfälle im KKR haben keine zugeordneten OP Angaben, die restlichen 32% mindestens eine."_
- in der Darstellung sind die Max/Min Werte pro Kennzahl mit 🟥/🟩 markiert (kleiner ist besser)


<br>

### <a id='toc1_6_1_'></a>[alle Therapien](#toc0_)
- da hier alle Therapieangabe im Überblick dargestellt sind können keine therapiespezifischen Filter wie etwa "nur solide Tumoren" wirken
- der Filter `DJ 2020-2024 ohne letzte 6m` soll gezielt Effekte des jüngsten Lieferjahres ausschliessen
- Metrik: Anteil Tumore ohne jegliche Therapieangaben an Gesamt

> 💡 **ZfKD**
> - der Anteil liegt in den neuen Bundesländern und Berlin fast durchgehend niedriger (10%-19%) als in den alten Bundesländern (17%-31%)
> - im Zeitverlauf ist zwischen 2020 und 2023 keine eindeutige Tendenz zu beobachten
> - trotz Ausschluss der Diagnosen im 2. Halbjahr 2023 liegt der Anteil von Fällen ohne Therapieangabenin 2023 noch etwas über dem Wert der Vorjahre, auch hier ist wahrscheinlich noch mit nachträglichen Ergänzungen zu rechnen



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [ICD10 nur C]:                   n = 2_787_382  (68.6%) 
    └ [keine C44,D04]:                 n = 2_301_507  (56.6%) 
    └ [keine Verstorbenen < 180 Tage]: n = 1_968_506  (48.5%) 
    └ [kein M1]:                       n = 1_771_571  (43.6%)
```

<img alt="png" src="clin_files/output_27_4.png" width="800">
    



<br>

### <a id='toc1_6_2_'></a>[OP](#toc0_)
- **nur solide Tumoren**  schliesst folgende Diagnosen aus: C44, C76-C97, alle D
- Metrik: Anteil Tumore ohne OP an Gesamt



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [keine C44,D04]:                 n = 2_781_485  (68.5%) 
    └ [nur solide Tumore]:             n = 2_073_984  (51.0%) 
    └ [keine Verstorbenen < 180 Tage]: n = 1_789_432  (44.0%) 
    └ [kein M1]:                       n = 1_597_594  (39.3%)
```

<img alt="png" src="clin_files/output_29_4.png" width="800">
    



<br>

#### <a id='toc1_6_2_1_'></a>[OP wenn OP erwartet](#toc0_)
- dargestellt ist die Verteilung von OP Kategorien bei Tumoren, für die eine OP erwartet werden kann
- Kategorien
  - `1_op`: mind. eine OPS im definierten Bereich (3Steller, organspezifisch) ist dokumentiert
  - `2_no_op_but_tp`: keine OPS, aber T_p 1-4 ist dokumentiert
  - `3_rest`: keine der zuvor genannten Merkmale trifft zu


<br>

##### <a id='toc1_6_2_1_1_'></a>[C50](#toc0_)



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [ICD10 C50]:                       n = 356_237   (8.8%) 
    └ [kein M1]:                         n = 330_742   (8.1%) 
    └ [keine Verstorbenen < 180 Tage]:   n = 323_899   (8.0%)
```

<img alt="OP Kategorien (C50)" src="clin_files/output_32_4.svg">
    



<br>

##### <a id='toc1_6_2_1_2_'></a>[C18-C20](#toc0_)



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [ICD10 C18-C20]:                   n = 252_341   (6.2%) 
    └ [kein M1]:                         n = 206_884   (5.1%) 
    └ [keine Verstorbenen < 180 Tage]:   n = 185_172   (4.6%)
```

<img alt="OP-Kategorien (C18-C20)" src="clin_files/output_34_4.svg">
    



<br>

### <a id='toc1_6_3_'></a>[ST](#toc0_)
- Metrik: Anteil Tumore ohne Strahlentherapie an Gesamt
- die experimentelle Darstellung verwendet eine heatmap, um Nuancen in diesem relativ homogenen Diagramm optisch hervorzuheben

> 💡 **ZfKD**
> - der Anteil Tumore ohne ST (~73%) entspricht grob der Annahme von 30% Anteil von Strahlentherapien an primären Diagnosen
> - `05-NW` und `06-HE` weisen optisch relativ hohe Anteile auf
> - in nahezu allen KKR nimmt der Anteil in jüngeren DJ zu



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [nur solide Tumore]:             n = 2_073_984  (51.0%) 
    └ [kein M1]:                       n = 1_763_564  (43.4%) 
    └ [keine Verstorbenen < 180 Tage]: n = 1_597_594  (39.3%)
```

<img alt="png" src="clin_files/output_37_1.png" width="400">
    



<br>

#### <a id='toc1_6_3_1_'></a>[ST wenn ST erwartet](#toc0_)
- Beispiel: Anteil ST bei C50 nach OP: brusterhaltender Therapie (BET)
- BET: ein OPS Code mit den ersten 5 Stellen `5-870` liegt vor

> Kategorien:
>   - `1_op_st` - Strahlentherapie nach BET
>   - `2_op_no_st_but_sy` - BET, keine Strahlentherapie aber systemische
>   - `3_no_treat` - keine Therapie



```
    count: distinct z_tum_id
    ---
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [ICD10 C50]:                       n = 363_831   (9.0%) 
    └ [kein M1]:                         n = 338_236   (8.3%) 
    └ [nur OPS für BET]:                 n = 190_253   (4.7%) 
    └ [keine Verstorbenen < 180 Tage]:   n = 189_842   (4.7%)
```

<img alt="ST Kategorien nach OP mit BET bei C50" src="clin_files/output_39_4.svg">
    



<br>

### <a id='toc1_6_4_'></a>[SYST](#toc0_)
- Metrik: Anteil Tumore **ohne** systemische Therapie an Gesamt

> 💡 **ZfKD**
> - entgegen dem Trend sinkt der Anteil in `04-HB` im letzten DJ
> - den stabil geringsten Anteil weist `16-TH` auf



```
    n = 4_062_856                                    (100.0%) 
    └ [DJ 2020-2024]:                  n = 3_794_188  (93.4%) 
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_447_269  (84.8%) 
    └ [keine DCO]:                     n = 3_335_696  (82.1%) 
    └ [kein M1]:                       n = 3_011_971  (74.1%) 
    └ [keine Verstorbenen < 180 Tage]: n = 2_783_094  (68.5%)
```

<img alt="png" src="clin_files/output_41_4.png" width="400">
    



<br>

#### <a id='toc1_6_4_1_'></a>[SYST wenn SYST erwartet](#toc0_)
- Beispiel: akut verlaufenden Leukämien und Lymphome (akute myeloide und lymphatische Leukämie, diffuses großzelliges B-Zell-Lymphom, follikuläres Lymphom Grad IIIb)

> Kategorien:
>   - `1_sy` - systemische Therapie
>   - `2_no_sy_but_other` - keine systemische Therapie, aber andere Therapie
>   - `3_no_treat` - keine Therapie



```
    n = 4_062_856                                              (100.0%) 
    └ [DJ 2020-2024 ohne letzte 6m]:             n = 3_447_269  (84.8%) 
    └ [akut verlaufende Leukämien und Lymphome]:    n = 51_375   (1.3%) 
    └ [keine DCO]:                                  n = 49_776   (1.2%) 
    └ [kein M1]:                                    n = 49_724   (1.2%) 
    └ [keine Verstorbenen < 180 Tage]:              n = 36_693   (0.9%)
```

<img alt="SYST Kategorien bei akut verlaufenden Leukämien und Lymphomen" src="clin_files/output_43_4.svg">
    


<br>

## <a id='toc1_7_'></a>[Fallzahlen epi vs clin](#toc0_)
- Ziel der Darstellung: Abschätzung der Vollzähligkeit der klinischen Daten
- dargestellt sind die gefilterten Fallzahlen jeweils aus den epi und den klinischen Daten, hier allerdings nur aus dem aktuellstem DJ
- Hinweis: Die Auswertung Daten basiert auf `Inzidenzort` anstatt `Lieferregister`, da in den epi Daten bislang die einzelnen Länder des GKR nicht aufgeschlüsselt waren, und ein matching auf EKRNR somit fehlschlägt

> 💡 **NI**: _"Die **höhere Fallzahl** des epidemiologischen Registers im Vergleich zum klinischen Register ist vermutlich auf unterschiedliche Filterkriterien in den beiden Registern zurückzuführen. Im KKN werden neben den Kriterien die das Lieferschema vorgibt auch noch weitere Plausibilitätsprüfungen angewandt. Tumoren, welche diese Prüfungen nicht bestehen, werden vom Export ausgeschlossen"_ 
> 
> ---
> 💡 **ZfKD**: Die quota in den anderen KKR entspricht der Erwartung, dass die Fallzahl bei klin. Daten höher sein sollte als bei epi Daten.



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2024]:         n = 723_706  (17.8%) 
    └ [keine DCO]:       n = 704_349  (17.3%) 
    └ [keine C44,D04]:   n = 592_575  (14.6%)
```

<img alt="png" src="clin_files/output_45_3.png">
    


<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_8_'></a>[Verteilung von Variablen](#toc0_)

<br>

### <a id='toc1_8_1_'></a>[UICC (p)](#toc0_)
- nach den absoluten Werten ist auch die relative Verteilung gegeben unter Ausschluss der hohen Zahl an UICC missings
- die Variable wird in den meisten KKR selbst gebildet. Für GTDS Länder ist dafür ein Standard definiert  




```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [keine C44,D04]:            n = 3_065_024  (75.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

<img alt="UICC (p)" src="clin_files/output_49_4.svg">
    


<br>

### <a id='toc1_8_2_'></a>[Diagnosesicherung](#toc0_)

> 💡 **ZfKD**: _die Kodes `6` und `7` werden von vielen KKR noch geliefert, sind allerdings in der aktuellen oBDS Referenz nicht mehr gültig_



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine C44,D04]: n = 3_185_327  (78.4%)
```

<img alt="svg" src="clin_files/output_51_3.svg">
    



<br>

### <a id='toc1_8_3_'></a>[DCO](#toc0_)

- Metrik: Anteil der als DCO markierten Fälle an Gesamt

> 💡 **ZfKD**
> - aus einigen KKR sind DCO nicht, oder nur rudimentär markiert
> - ein weiterer sichtbarer Effekt ist die Zunahme des DCO Anteils in den jüngeren DJ in einigen KKR



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine C44,D04]: n = 3_185_327  (78.4%) 
    └ [ICD10 nur C]:   n = 2_649_060  (65.2%)
```

<img alt="png" src="clin_files/output_53_4.png" width="800">
    



<br>

### <a id='toc1_8_4_'></a>[DCN](#toc0_)

- Metrik: Anteil der als DCN markierten Fälle an Gesamt

> 💡 **ZfKD**: aus einigen KKR sind DCN nicht, oder nur rudimentär markiert



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine C44,D04]: n = 3_185_327  (78.4%) 
    └ [ICD10 nur C]:   n = 2_649_060  (65.2%)
```

<img alt="png" src="clin_files/output_55_4.png" width="800">
    



<br>

### <a id='toc1_8_5_'></a>[Grading](#toc0_)



```
    n = 4_062_856                                  (100.0%) 
    └ [DJ 2020-2024]:                n = 3_794_188  (93.4%) 
    └ [keine DCO]:                   n = 3_672_629  (90.4%) 
    └ [nur gradingrelevante Tumore]: n = 1_275_551  (31.4%)
```

<img alt="svg" src="clin_files/output_57_3.svg">
    


<br>

### <a id='toc1_8_6_'></a>[Diagnosejahr mit Altdaten](#toc0_)



```
    n = 4_062_856                (100.0%) 
    └ [DJ < 2025]: n = 4_051_316  (99.7%)
```

<img alt="svg" src="clin_files/output_59_3.svg">
    


<br>

### <a id='toc1_8_7_'></a>[Inzidenzort vs Lieferregister](#toc0_)
- **Filter: keiner**
- vertikal: `Inzidenzort` (Zeile `00` bündelt alle Fälle mit ungültiger Ortsangabe). horizontal: `Lieferregister`
- Beispiel: `03-NI` liefert zu 100% Fälle aus dem Inzidenzort `03`, `13-MV` liefert 159 Fälle aus `03`

> 💡 **ZfKD**: _Angestrebt ist eine "Diagonale", möglichst nur noch Fallübermittlungen aus dem eigenen Einzugsgebiet, was inzwischen schon besser erreicht ist. ~ 99% der Fälle stammen aus dem liefernden Register_


    
<img alt="png" src="clin_files/output_61_0.png">
    


<br>

### <a id='toc1_8_8_'></a>[Diagnosegruppen](#toc0_)
- die verwendete ICD10 Skala entspricht der Darstellung aus *"Krebs in Deutschland"*




```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%)
```

<img alt="Diagnosegruppen" src="clin_files/output_63_4.svg">
    



<br>

### <a id='toc1_8_9_'></a>[Altersgruppen Kinder und Heranwachsende](#toc0_)

> 💡 **ZfKD**: Fälle von unter 18-jährigen Personen sind nicht flächendeckend vorhanden



```
    count: distinct z_pat_id
    ---
    n = 3_452_844                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_444_458  (99.8%) 
    └ [Alter <= 20]:     n = 10_614   (0.3%)
```

<img alt="Altersgruppen Kinder und Heranwachsende" src="clin_files/output_65_4.svg">
    


<br>

### <a id='toc1_8_10_'></a>[Verstorben](#toc0_)

- gezählt sind **Personen**
- Metrik: Anteil Verstorbener an Gesamtzahl Patienten pro erstes DJ der Person

>  💡 **ZfKD**: Sterbefälle in TH sind noch nicht vollständig eingegangen



```
    count: distinct z_pat_id
    ---
    n = 3_452_844                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_444_458  (99.8%) 
    └ [keine DCO]:     n = 3_332_300  (96.5%) 
    └ [keine C44,D04]: n = 2_848_584  (82.5%)
```

<img alt="png" src="clin_files/output_69_4.png" width="800">
    


<br>

### <a id='toc1_8_11_'></a>[TNM-T (p)](#toc0_)




```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

<img alt="svg" src="clin_files/output_71_3.svg">
    


<br>

### <a id='toc1_8_12_'></a>[TNM-N (p)](#toc0_)
<!-- (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D) -->



```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

<img alt="svg" src="clin_files/output_73_3.svg">
    


<br>

### <a id='toc1_8_13_'></a>[TNM-M (pc)](#toc0_)

- abweichend von den anderen TNM Angaben ist hier die Verbundvariable `z_m_pc_1` dargestellt
- diese enthält den Wert aus `p`, wenn leer dann aus `c`



```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

<img alt="svg" src="clin_files/output_76_3.svg">
    


<br>

## <a id='toc1_9_'></a>[Todesursachen (TU)](#toc0_)

### <a id='toc1_9_1_'></a>[nach ICD10 Einstellern](#toc0_)
- gezählt sind die ersten Stellen aller TU Codes ohne jeglichen Filter


<img alt="nach ICD10 Einstellern" src="clin_files/output_79_1.svg">
    



<br>

### <a id='toc1_9_2_'></a>[nach Sterbejahr und Todesursachen](#toc0_)
- gezählt werden **Personen**
- `tu_type` Art der TU pro Patient
  - `<NA>` keine Todesursache zugeordnet
  - `c_only` nur Todesursachen Cxx
  - `other_only` nur Todesursachen <> Cxx
  - `c_and_other` Cxx und andere Todesursachen

<!-- > 💡 ZfKD: _"`03-NI` und `06-HE` übermitteln deutlich weniger Todesursachen asl in den epi Daten, für `07-RP` ist der Anteil in beiden Datenräumen gering. Für `15-ST` sind auffällig wenige Todesfälle in 2023 übermittelt."_ -->



```
    count: distinct z_pat_id
    ---
    n = 3_452_844                      (100.0%) 
    └ [SJ 2020-2024]:    n = 2_636_984  (76.4%) 
    └ [nur Verstorbene]:   n = 900_310  (26.1%)
```

<img alt="nach Sterbejahr und Todesursachen" src="clin_files/output_81_4.svg">
    


<br>

### <a id='toc1_9_3_'></a>[nach ICD10 Dreistellern (TOP 5)](#toc0_)
- Grundgesamtheit: alle **Todesursachen**, kein Filter

> 💡 **ZfKD**: _Enthalten sind in einigen KKR auch `C79` (Metastasen), welche in offizieller Todesursachen-Statistik nicht kodiert sind_


<img alt="png" src="clin_files/output_84_1.png" width="80%">
    


<br>

### <a id='toc1_9_4_'></a>[nach IsGrundleiden](#toc0_)
- Grundgesamtheit: **alle Todesursachen**



<img alt="nach IsGrundleiden" src="clin_files/output_86_1.svg">
    



<br>

## <a id='toc1_10_'></a>[Therapien](#toc0_)

<br>

### <a id='toc1_10_1_'></a>[OP](#toc0_)


#### <a id='toc1_10_1_1_'></a>[nach ICD10](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**



```
    count: distinct OPId
    ---
    n = 2_121_378                    (100.0%) 
    └ [DJ 2020-2024]:  n = 2_085_372  (98.3%) 
    └ [keine DCO]:     n = 2_085_319  (98.3%) 
    └ [keine C44,D04]: n = 1_919_103  (90.5%) 
    └ [nur erste OP]:  n = 1_532_530  (72.2%)
```

<img alt="OP-Meldungen nach ICD10" src="clin_files/output_90_4.svg">
    


<br>

#### <a id='toc1_10_1_2_'></a>[nach Intention](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**


<img alt="OP-Meldungen nach Intention" src="clin_files/output_92_1.svg">
    


<br>

### <a id='toc1_10_2_'></a>[OPS](#toc0_)


#### <a id='toc1_10_2_1_'></a>[nach OPS ICD Kapitel (Top 10)](#toc0_)
- Grundgesamtheit: **alle OPS Codes**

> 💡 **ZfKD**: lediglich `02-HH` und `05-NW` übermitteln ausschliesslich Kapitel 5. Der Anteil von Meldungen <> Kapitel 5 sind wahrscheinlich diagnostische Massnahmen oder nicht-operative Therapien. Vorschlag: nur noch Kapitel 5 übermitteln


<img alt="OPS nach ICD-Kapitel (Top 10)" src="clin_files/output_95_1.svg">
    



<br>

### <a id='toc1_10_3_'></a>[SYST](#toc0_)

#### <a id='toc1_10_3_1_'></a>[nach Stellung_OP](#toc0_)

- Grundgesamtheit: **alle SYST Elemente**


<img alt="SYST nach Stellung_OP" src="clin_files/output_98_1.svg">
    


<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_11_'></a>[Missings- und Unbekannt-Kodierungen](#toc0_)
- in diesem Kapitel sind Ampelfarben zugeordnet, da Zielwerte klar identifizierbar sind
- die Zuordnung zu Wertebereichen ist Diskussionsgrundlage
- es sind folgende Schwellwerte verwendet:
  - 🟩 0 bis <5%
  - 🟨 **missings**: 5% bis <100% | **unbekannt**: 5% bis <35%>
  - 🟥 **missings**: bei 100% | **unbekannt** >= 35%
- dargestellt sind Variablen aus dem Schema in folgender Notation: `[Elementknoten]Variablenname`
- die graumelierte `0` kennzeichnet einen leeren Wert (=keine missings), 0% entsteht durch Rundung von kleinen Werten
- die Prozentwerte sind bei allen Darstellungen gerundet, "100%" bei einer gelben Ampel kann interpretiert werden als knapp unter 100%
- - `Total` 
  - ist als Spalte neu eingefügt, und bildet den Anteil von missings bzw unbekannt deutschlandweit ab
  - ⚠️ verliert an Aussagekraft, wenn aus KKR keine Daten vorliegen für diese Variable (100% missings), der Wert wirkt dann geschönt

**unbekannt**
- bei 100% missings wird auch unbekannt auf 100% gesetzt
- Beispiele für gewertete Unbekannt-Kodierungen:
  - `Diagnosesicherung` = 9
  - `Seitenlokalisation` = U
  - `Datumsgenauigkeit` in ('M','V')
- der Quellcode zur Bestimmung von `Unbekannt` Kodierungen ist hier abrufbar: [sql](sql/check_if_unknown.sql)

<br>

### <a id='toc1_11_1_'></a>[Verpflichtende Tumorvariablen](#toc0_)
- kein Filter
- Pflichtangaben aus anderen Elementknoten (z.B. Datum aus dem OP Knoten) sind nicht aufgeführt, da diese selbst optional sind

> 💡 **ZfKD** 
> - Pflichtfelder sind nahezu komplett vorhanden, die wenigen Ausnahmen werden allerdings Stand heute nicht korrigiert
> - `Gesamtbeurteilung_Tumorstatus`ist zwar vollständig geliefert (siehe vorherige Grafiken), aber häufig als Unbekannt kodiert. Viele Pflichtvariablen haben keine Unbekannt Kodes, etwas auffällig sind hier `Diagnosesicherung` und `Seitenlokalisation`. Ähnlich auch `Morphologie` (kein Pflichtfeld)




```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_103_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_103_6.png">
    



<br>

### <a id='toc1_11_2_'></a>[Weitere Tumorangaben](#toc0_)



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



<img alt="png" src="clin_files/output_105_5.png" width="50%">
    


    🟠 unknowns



<img alt="png" src="clin_files/output_105_8.png" width="50%">
    


<br>

### <a id='toc1_11_3_'></a>[Tumorstadien](#toc0_)

> 💡 **ZfKD** 
> - die Auflage ist in `05-NW` als Konstante im Datensatz hinterlegt
> - für `07-RP` liegen keine pathologischen Angaben vor



```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_107_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_107_6.png">
    


<br>

### <a id='toc1_11_4_'></a>[Therapieangaben](#toc0_)


#### <a id='toc1_11_4_1_'></a>[OP](#toc0_)

> 💡 **ZfKD**: für überlieferte OP liegen `Datum_OP` und `Intention` komplett vollständig vor. Der Tagesabstand hat wenige Lücken, während `Lokale_Beurteilung_Residualstatus` auch ausserhalb der Tristan KKR erkennbar häufiger fehlt



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



<img alt="png" src="clin_files/output_110_5.png" width="80%">
    


    🟠 unknowns



<img alt="png" src="clin_files/output_110_8.png" width="80%">
    



<br>

#### <a id='toc1_11_4_2_'></a>[ST](#toc0_)

> 💡 **ZfKD**
> - `Datum_Beginn_Bestrahlung` und `Intention` sind nahezu komplett verfügbar in den dokumentierten ST / Bestrahlungen, mit Abstrichen auch `Anzahl_Tage_Diagnose_Bestrahlung`.
> - `Anzahl_Tage_Bestrahlung_Dauer` und `Stellung_OP` fehlen bei Tristan
> - `Applikationsart` wird nicht von allen kkr übermittelt, davon abgesehen ist `Seite_Zielgebiet` zuverlässig angegeben, die CodeVersionen ergänzen sich, wobei `2014` deutlich häufiger angewendet wird als `2021`



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_112_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_112_6.png">
    



<br>

#### <a id='toc1_11_4_3_'></a>[SYST](#toc0_)

> 💡 **ZfKD**: die meisten Angaben im SYST Element liegen komplett vor. `Anzahl_Tage_SYST_Dauer` fehlt häufig, was auch an noch nicht abgeschlossenen Therapien liegen könnte



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_114_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_114_6.png">
    



<br>

### <a id='toc1_11_5_'></a>[Folgeereignisse](#toc0_)
- die Variablen aus `Folgeereignis` und `Folgeereignis_TNM` sind hier zusammengefasst

> 💡 **ZfKD**
> - `Datum_Folgeereignis` und `Gesamtbeurteilung_Tumorstatus` liegen komplett vor, die anderen Angaben zum Tumorstatus allerdings nicht
> - die Erkennung von Rezidiven ist so deutlich erschwert
> - Angaben für `Folgeereignis_TNM` fehlen ganz überwiegend, auch wenn Folgereignisse keine TNM enthalten müssen
> - Folgeereignisse aus `07-RP` und `08-BW` enthalten keine Missings, dafür allerdings erhöhte Anteile an Unbekannt Kodierungen
> - T-Stadien zu Folgeereignissen weisen in `02-HH` einen ungewöhnlich niedrigen Missing Anteil auf, bei gleichzeitig fast Unbekannt-freien Kodierungen. Die Fallzahlen dieser Folgeereignisse sind in etwa im erwarteten Rahmen



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_116_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_116_6.png">
    



<br>

### <a id='toc1_11_6_'></a>[Freitexte](#toc0_)

> 💡 **ZfKD**: 
> - Protokolle und Substanzen werden nach und nach in den Datensatz eingebunden. Protokolle bislang ausschliesslich als Freitext
> - bei Substanzen komplementieren sich Freitexte und Kodierungen, bei vielen GTDS Ländern überwiegen inzwischen die Kodierungen



```
    n = 4_062_856                    (100.0%) 
    └ [DJ 2020-2024]:  n = 3_794_188  (93.4%) 
    └ [keine DCO]:     n = 3_672_629  (90.4%) 
    └ [keine C44,D04]: n = 3_065_024  (75.4%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_118_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_118_6.png">
    


<br>

### <a id='toc1_11_7_'></a>[Organspezifische Variablen](#toc0_)


<br>

#### <a id='toc1_11_7_1_'></a>[Mamma](#toc0_)

> 💡 **ZfKD**
> - missing Anteile sind besonders niedrig aus `04-HB` und den GTDS Ländern bei gleichzeitig unauffälligem Unbekannt Anteil
> - `HormonrezeptorStatus_Progesteron` ist in der Fläche erkennbar schlechter erfasst als z.B. `Her2neuStatus`



```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%) 
    └ [ICD10 C50]:      n = 394_544   (9.7%)
```

    🟠 missings



    
<img alt="png" src="clin_files/output_121_4.png">
    


    🟠 unknowns



    
<img alt="png" src="clin_files/output_121_6.png">
    


<br>

#### <a id='toc1_11_7_2_'></a>[Prostata](#toc0_)

> 💡 **ZfKD**: auch innerhalb eines KKR gibt es deutliche Varianzen zwischen Variablen des organspezifischen Moduls, z.B. in den NBL



```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%) 
    └ [ICD C61]:        n = 379_354   (9.3%)
```

    🟠 missings



<img alt="png" src="clin_files/output_123_5.png" width="70%">
    


    🟠 unknowns



<img alt="png" src="clin_files/output_123_8.png" width="70%">
    


<br>

#### <a id='toc1_11_7_3_'></a>[Darm](#toc0_)




```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%) 
    └ [ICD C18-20]:     n = 277_957   (6.8%)
```

    🟠 missings



<img alt="png" src="clin_files/output_125_5.png" width="40%">
    


    🟠 unknowns



<img alt="png" src="clin_files/output_125_8.png" width="40%">
    


<br>

#### <a id='toc1_11_7_4_'></a>[Melanom](#toc0_)

> 💡 **ZfKD**: insgesamt weist dieses Modul die höchsten Werte für Missings auf



```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%) 
    └ [ICD C43]:        n = 144_842   (3.6%)
```

    🟠 missings



<img alt="png" src="clin_files/output_127_5.png" width="50%">
    


    🟠 unknowns



<img alt="png" src="clin_files/output_127_8.png" width="50%">
    



<br>

## <a id='toc1_12_'></a>[Weitere Klassifikationen](#toc0_)
- Kodierungen zu `Weitere Klassifikationen` können an verschiedenen Orten des Schemas übermittelt werden
  - im Element `Primärdiagnose`
  - im Element `Folgeereignisse`
- darüber hinaus können diese Kodierungen Angaben darstellen, welche in dedizierten Feldern vorgesehen sind (z.B. UICC, PSA)
- die Zuordnung der Freitexte zu von der Plattform 65c definierten Klassifikationen (internes Plattform Dokument)[https://plattform65c.atlassian.net/wiki/spaces/UMK/pages/15532511/Weitere+Klassifikationen] erfolgt per regex in diesem [sql script](../sql/check_if_class.sql)


<br>

### <a id='toc1_12_1_'></a>[nach Quelle](#toc0_)
- untersucht wird der Zusammenhang zwischen den Orten im Schema ("Quelle"), wo die Klassifikation übermittelt wird
- gezeigt sind die 20 häufigsten Klassifikationen
- Kategorie `source`
  - `diag`: Klassifikation ist der Diagnose zugeordnet
  - `fol`: Klassifikation ist einem Folgeereignis zugeordnet

> **💡 ZfKD**
> - die überwiegende Zahl der Kodierungen ist der Diagnose zugeordnet
> - Ausnahme: für PSA gibt es viele Kodes aus Folgeereignissen, für Hormonrezeptoren sogar überwiegend



```
    n = 873_871                        (100.0%) 
    └ [Stadium vorhanden]: n = 873_871 (100.0%)
```

<img alt="Weitere Klassifikationen nach Quelle" src="clin_files/output_133_1.svg">
    



<br>

### <a id='toc1_12_2_'></a>[nach KKR](#toc0_)
- gezeigt sind die 20 häufigsten Klassifikationen

> **💡 ZfKD**
> - visuell erkennbare "hotspots":
>   - die grösste Gruppe der Kodierungen stellt `PSA` dar aus `05-NW`
>   - markante Anteile sind `KI67` und `UICC` aus `08-BW`
>   - ebenfalls erwähnenswert: Anteile vor allem aus `05-NW` und `08-BH`, welche nicht zu den von der Plattform definierten Klassifikationen zugeordnet werden können (siehe Zeile `(NA)`) 


<img alt="png" src="clin_files/output_135_1.png" width="100%">
    



<br>

### <a id='toc1_12_3_'></a>[PSA](#toc0_)



```
    n = 4_062_856                   (100.0%) 
    └ [DJ 2020-2024]: n = 3_794_188  (93.4%) 
    └ [keine DCO]:    n = 3_672_629  (90.4%) 
    └ [ICD C61]:        n = 379_354   (9.3%)
```

<br>

#### <a id='toc1_12_3_1_'></a>[Angabe zu Diagnose vs Weitere Klassifikationen](#toc0_)
- untersucht wird, ob PSA Angaben jeweils Diagnosen zugeordnet sind (erwartete Quelle der Angabe), oder Weiteren Klassifikationen (aus Freitext isoliert)
- Kategorien für die Kombination von PSA Werten zu jedem Tumor
  - `1_all_null`: keine PSA Werte zum Tumor
  - `2_tum_only`: PSA Wert nur vom Organmodul
  - `3_class_only`: PSA Wert nur aus Weitere Klassifikationen (Diagnose oder Folgeereignis)
  - `4_tum_and_class`: PSA Werte aus Organmodul und Weitere Klassifikationen

> 💡 **ZfKD**
> - Angaben aus `02-HH` sind fast komplett leer aufgrund der fehlenden Organmodule
> - überwiegend stammen die PSA Werte aus dem Diagnose Element, mit bis zu 87% der C61 Fälle (`14-SN`)
> - Besonderheit `05-NW`: hier stammen zum grossen Teil PSA Angaben sowohl aus Diagnosen als auch aus Weiteren Klassifikationen


<img alt="PSA: Angabe zu Diagnose vs Weitere Klassifikationen" src="clin_files/output_141_1.svg">
    



<br>

#### <a id='toc1_12_3_2_'></a>[Kombinationen der PSA Merkmale](#toc0_)
- untersucht wird, in welchen Kombinationen folgende Merkmale auftreten (deutschlandweit):
  - `has_psa` - Tumor hat einen PSA Wert aus dem Organmodul
  - `has_diag` - Tumor hat einen PSA Wert aus Diagnose -> Weitere Klassifikationen
  - `has_fol` - Tumor hat einen PSA Wert aus Folgeereignis -> Weitere Klassifikationen
- Tumore ohne jegliche PSA Angabe sind ignoriert

> 💡 **ZfKD**
> - von den 375k Tumore im Filter haben 245k mind. eine PSA Angabe
>   - 98% der Tumore mit PSA haben eine Angabe im Organmodul
>   - 75% der Tumore mit PSA haben ausschliesslich eine Angabe im Organmodul
>   - 23% (addiert) der Tumore mit PSA haben Angaben sowohl im Organmodul als auch kodiert im Element Diagnose und sind somit potentiell widersprüchlich
>   - 9% der Tumore mit PSA haben Angaben zum Verlauf (kodiert in Folgeereignissen)

    n = 379_354 | n(true) = 248_236



<img alt="Kombinationen der PSA Merkmale" src="clin_files/output_143_2.png">
    



<br>

#### <a id='toc1_12_3_3_'></a>[Weitere Klassifikationen: Diagnose vs Folgeereignis](#toc0_)
- untersucht wird pro KKR, ob sich PSA Angaben aus `Weitere Klassifikationen` überlappen
- um Verlaufsangaben zu erkennen ist es relevant, ob Angaben in `Weitere Klassifikationen` jeweils zur Diagnose oder Folgeereignis gemacht werden
- Kategorien für die Kombination von PSA Werten zu jedem Tumor:
  - `1_none`: kein PSA Wert in `Weitere Klassifikationen` 
  - `2_both`: PSA Wert sowohl für Diagnose als auch für Folgeereignis vorhanden 
  - `3_diag_only`: PSA Wert nur für Diagnose vorhanden
  - `4_fol_only`: PSA Werte nur für Folgeereignis vorhanden

> 💡 **ZfKD**
> - nur `05-NW`: 
>   - kodiert nennenswert in `Weitere Klassifikationen` (78% der Tumore im Filter)
>   - für ~27% der Tumore (addiert) liegen Verlaufsangaben vor


<img alt="PSA: Weitere Klassifikationen - Diagnose vs Folgeereignis" src="clin_files/output_145_1.svg">
    



<br>

### <a id='toc1_12_4_'></a>[UICC](#toc0_)



```
    n = 4_062_856                               (100.0%) 
    └ [DJ 2020-2024]:             n = 3_794_188  (93.4%) 
    └ [keine DCO]:                n = 3_672_629  (90.4%) 
    └ [nur tnm-relevante Tumore]: n = 2_082_538  (51.3%)
```

<br>

#### <a id='toc1_12_4_1_'></a>[Kombinationen](#toc0_)

- untersucht wird die Überlappung von UICC Angaben
- UICC Angaben können an folgenden Orten im Schema überliefert sein:
  - Element `Diagnose` im `TNM` Modul (hier sind `c` und `p` Angaben zusammengefasst) - `has_diag_uicc`
  - Element `Diagnose` in `Weitere Klassifikationen` - `has_diag_class` 
  - Element `Folgeereignis` im `TNM` Modul - `has_fol`
  - Element `Folgeereignis` in `Weitere Klassifikationen` - `has_fol`
- Angaben in den Folgeereignissen sind hier nicht weiter differenziert (TNM Modul und Freitext zusammengefasst)

> **💡 ZfKD**
> - bei ~7% (addiert) der Tumore werden UICC zur Diagnose übermittelt sowohl im TNM Modul als auch als Freitext Klassifikation
> - diese Angaben sind potentiell widersprüchlich

    n = 2_082_538 | n(true) = 1_056_708



<img alt="UICC: Kombinationen" src="clin_files/output_149_2.png">
    



<br>

#### <a id='toc1_12_4_2_'></a>[nach KKR](#toc0_)
- Folgeereignisse sind hier nicht betrachtet
- Kategorien:
  - `1_no_diag`: keine UICC Angabe im Diagnose Element
  - `2_diag_uicc_only`: UICC Angabe nur im `TNM` Modul
  - `3_diag_both`: UICC Angabe sowohl im `TNM` Modul als auch in `Weitere Klassifikationen`
  - `4_diag_class_only`: UICC Angabe nur in `Weitere Klassifikationen`
- 

> 💡 **ZfKD**
> - Anteil Tumore im Filter mit UICC Angabe ist sehr variabel, zwischen 0% in `05-NW` und 94% in `14-SN`
> - überlappende Angaben (Kategorie `3_diag_both`) sind potentiell widersprüchlich, bis zu 15% der Tumore in `08-BW`
> - `03-NI` liefert die UICC Angaben zur Diagnose ausschliesslich als Freitext, `10-SL` mit erheblichem Anteil. Diese Werte werden bei UICC Auswertungen üblicherweise nicht erfasst


<img alt="UICC in Weitere Klassifikationen" src="clin_files/output_151_1.svg">
    



<br>

## <a id='toc1_13_'></a>[Freitextkodierung](#toc0_)

### <a id='toc1_13_1_'></a>[Substanzen](#toc0_)
- untersucht wird die Abdeckung von kodierten Freitexten im `Substanz` Element
- die Freitextkodierung (abrufbar in: `z_substance_prediction_name`) wird hier als erfolgreich angesehen, wenn der Score (abrufbar in: `z_substance_prediction_score`) über 85% liegt
- Kategorien:
  - `1_all_null` - weder ATC noch Freitext vorhanden
  - `2_code_only` - nur ATC vorhanden, keine Kodierung möglich
  - `3_text_unpredicted` - Freitext vorhanden, keine erfolgreiche Kodierung
  - `4_text_predicted` - Freitext vorhanden, Kodierung erfolgreich

> **💡 ZfKD**
> - Substanz Informationen werden inzwischen überwiegend als Kodierung übermittelt
> - wenn Freitexte vorhanden sind werden diese mit hohem Anteil von dem Algorithmus zur Kodierung erfasst
> - Extreme: in `07-RP` / `13-MV` sind fast alle Freitexte kodiert, in `14-SN` fast keine. Ursache noch unklar


<img alt="Freitextkodierung: Substanzen" src="clin_files/output_153_1.svg">
    


<br>

## <a id='toc1_14_'></a>[Datum Vitalstatus](#toc0_)

### <a id='toc1_14_1_'></a>[Zeitpunkt der Erhebung](#toc0_)

> 💡 **ZfKD**: angestrebt ist die Verwendung eines einzelnen Erhebungszeitpunkts (z.B. Dezember)



```
    count: distinct z_pat_id
    ---
    n = 3_452_844                          (100.0%) 
    └ [DJ 2020-2024]:        n = 3_444_458  (99.8%) 
    └ [Verstorben = 'N']:    n = 2_452_511  (71.0%) 
    └ [Vitalstatus >= 2020]: n = 2_447_358  (70.9%)
```

<img alt="Zeitpunkt der Erhebung" src="clin_files/output_157_1.svg">
    


<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_15_'></a>[Numerische Variablen](#toc0_)

<br>

### <a id='toc1_15_1_'></a>[Diagnosealter](#toc0_)
- berechnet aus `Diagnosedatum` - `Geburtsdatum`
- negative Werte entstehen aus falscher Datumsreihenfolge von Ereignissen
- die Angaben sind 
  - in der Tabelle unbereinigt, um strukturelle Effekte sichtbar zu machen
  - in den Boxplots gefiltert nach `z_age between 0 and 130` um die Verteilung besser darstellen zu können

> 💡 **ZfKD**
> - für die eingeschlossenen DJ liegen (nahezu) keine vollständig geschätzten Angaben vor
> - wenige (aber extreme) Ausreisser in `13-MV`



```
    count: distinct z_tum_id
    ---
    n = 4_062_856                                      (100.0%) 
    └ [DJ 2020-2024]:                    n = 3_794_188  (93.4%) 
    └ [keine geschätzten Datumsangaben]: n = 3_793_405  (93.4%)
```

<img alt="png" src="clin_files/output_162_0.png">
    



    
<img alt="png" src="clin_files/output_162_1.png">
    



    
<img alt="png" src="clin_files/output_162_2.png">
    



    
<img alt="png" src="clin_files/output_162_3.png">
    


<br>

### <a id='toc1_15_2_'></a>[Anzahl Tage zwischen Diagnose und Tod](#toc0_)
- die Angaben sind 
  - in der Tabelle unbereinigt, um strukturelle Effekte sichtbar zu machen
  - in den Boxplots gefiltert nach `Anzahl_Tage_Diagnose_Tod > 0` um die Verteilung besser darstellen zu können


    
<img alt="png" src="clin_files/output_164_0.png">
    



    
<img alt="png" src="clin_files/output_164_1.png">
    



    
<img alt="png" src="clin_files/output_164_2.png">
    



    
<img alt="png" src="clin_files/output_164_3.png">
    



<br>

### <a id='toc1_15_3_'></a>[PSA](#toc0_)


    
<img alt="png" src="clin_files/output_166_0.png">
    



    
<img alt="png" src="clin_files/output_166_1.png">
    



    
<img alt="png" src="clin_files/output_166_2.png">
    



    
<img alt="png" src="clin_files/output_166_3.png">
    



<br>

### <a id='toc1_15_4_'></a>[LK_untersucht](#toc0_)


    
<img alt="png" src="clin_files/output_168_0.png">
    



    
<img alt="png" src="clin_files/output_168_1.png">
    



    
<img alt="png" src="clin_files/output_168_2.png">
    



<br>

### <a id='toc1_15_5_'></a>[LK_befallen](#toc0_)


    
<img alt="png" src="clin_files/output_170_0.png">
    



    
<img alt="png" src="clin_files/output_170_1.png">
    



    
<img alt="png" src="clin_files/output_170_2.png">
    

