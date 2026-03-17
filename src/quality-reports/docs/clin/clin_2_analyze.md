# <a id='toc1_'></a>[Bericht zur Datenqualität (klin) 📉](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Bericht zur Datenqualität (klin) 📉](#toc1_)    
  - [Änderungen seit der letzten Version](#toc1_1_)    
  - [Datenstand ⏱️](#toc1_2_)    
  - [Lieferdatum 📆](#toc1_3_)    
  - [Fallzahlen](#toc1_4_)    
    - [absolut](#toc1_4_1_)    
    - [relativ](#toc1_4_2_)    
      - [nach KKR](#toc1_4_2_1_)    
      - [nach System](#toc1_4_2_2_)    
  - [Fehlende Therapieangaben](#toc1_5_)    
    - [alle Therapien](#toc1_5_1_)    
    - [OP](#toc1_5_2_)    
      - [OP wenn OP erwartet](#toc1_5_2_1_)    
        - [C50](#toc1_5_2_1_1_)    
        - [C18-C20](#toc1_5_2_1_2_)    
    - [ST](#toc1_5_3_)    
    - [SYST](#toc1_5_4_)    
  - [Fallzahlen epi vs clin](#toc1_6_)    
  - [Verteilung von Variablen](#toc1_7_)    
    - [UICC (p)](#toc1_7_1_)    
    - [Diagnosesicherung](#toc1_7_2_)    
    - [DCO](#toc1_7_3_)    
    - [DCN](#toc1_7_4_)    
    - [Geschlecht](#toc1_7_5_)    
    - [Grading](#toc1_7_6_)    
      - [Verteilung](#toc1_7_6_1_)    
      - [Anteile](#toc1_7_6_2_)    
    - [Diagnosejahr mit Altdaten](#toc1_7_7_)    
    - [Diagnosejahr ohne Altdaten](#toc1_7_8_)    
    - [Inzidenzort vs Lieferregister](#toc1_7_9_)    
    - [ICD10 Gruppen](#toc1_7_10_)    
    - [Verstorben](#toc1_7_11_)    
    - [TNM-T (p)](#toc1_7_12_)    
    - [TNM-N (p)](#toc1_7_13_)    
    - [TNM-M (p)](#toc1_7_14_)    
  - [Todesursachen (TU)](#toc1_8_)    
    - [nach ICD10 Einstellern](#toc1_8_1_)    
    - [nach Sterbejahr und Todesursachen](#toc1_8_2_)    
    - [nach hat_todesursache bei Nicht-Verstorbenen](#toc1_8_3_)    
    - [nach ICD10 Dreistellern (TOP 5)](#toc1_8_4_)    
    - [nach IsGrundleiden](#toc1_8_5_)    
  - [Therapien](#toc1_9_)    
    - [OP](#toc1_9_1_)    
      - [nach ICD10](#toc1_9_1_1_)    
      - [nach Intention](#toc1_9_1_2_)    
    - [OPS](#toc1_9_2_)    
      - [nach OPS ICD Kapitel (Top 10)](#toc1_9_2_1_)    
    - [SYST](#toc1_9_3_)    
      - [nach Stellung_OP](#toc1_9_3_1_)    
  - [Missings- und Unbekannt-Kodierungen](#toc1_10_)    
    - [Verpflichtende Tumorvariablen](#toc1_10_1_)    
    - [Weitere Tumorangaben](#toc1_10_2_)    
    - [Tumorstadien](#toc1_10_3_)    
    - [Therapieangaben](#toc1_10_4_)    
      - [OP](#toc1_10_4_1_)    
      - [ST](#toc1_10_4_2_)    
      - [SYST](#toc1_10_4_3_)    
    - [Folgeereignisse](#toc1_10_5_)    
    - [Freitexte](#toc1_10_6_)    
    - [Organspezifische Variablen](#toc1_10_7_)    
      - [Mamma](#toc1_10_7_1_)    
      - [Prostata](#toc1_10_7_2_)    
      - [Darm](#toc1_10_7_3_)    
      - [Melanom](#toc1_10_7_4_)    
  - [🆕 Weitere Klassifikationen](#toc1_11_)    
    - [nach Quelle](#toc1_11_1_)    
    - [nach Jahren](#toc1_11_2_)    
    - [PSA](#toc1_11_3_)    
    - [UICC](#toc1_11_4_)    
  - [🆕 Freitexte](#toc1_12_)    
  - [Datum_Vitalstatus](#toc1_13_)    
    - [Verteilung Monat](#toc1_13_1_)    
    - [Vitalstatus Jahr](#toc1_13_2_)    
  - [Numerische Variablen 🔢](#toc1_14_)    
    - [Diagnosealter](#toc1_14_1_)    
    - [Anzahl Tage zwischen Diagnose und Tod](#toc1_14_2_)    
    - [Tumordicke](#toc1_14_3_)    
    - [PSA](#toc1_14_4_)    
    - [LK_befallen](#toc1_14_5_)    
    - [LK_untersucht](#toc1_14_6_)    
    - [RektumAbstandAnokutanlinie](#toc1_14_7_)    
    - [LDH](#toc1_14_8_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

<div style="page-break-after: always;"></div>

## <a id='toc1_1_'></a>[Änderungen seit der letzten Version](#toc0_)
- Neulieferung für Daten mit max DJ=2024

<br>

## <a id='toc1_2_'></a>[Datenstand ⏱️](#toc0_)

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.4 | 📦 pandas-plots: 1.3.0 | 📦 connection-helper: 0.13.3


    
    database file:           2026-03-04_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-02-26
    sql table created:       2026-03-04 10:17:13
    doi:                     -
    document created:        2026-03-17 17:27:17


<br>

## <a id='toc1_3_'></a>[Lieferdatum 📆](#toc0_)
- `kkr` = Klinisches Krebsregister
- `Lieferdatum` = Datum der letzten Übermittlung durch die KKR
- `Diagnosemonat` = letzter Diagnosemonat in den Daten


    
![png](clin_2_analyze_files/output_10_0.png)
    


    kkr ohne aktuelle Daten:  [('13-MV',)]


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
- Erklärung für einige Elementknoten: (`_cnt` = count/Fallzahl)
  - **Diagnose**
    - `diag_weitere_cnt` = Weitere Klassifikation im Elementknoten "Diagnose"
    - `diag_fm_cnt` = Fernmetastasen im Elementknoten "Diagnose"
  - **Folge**
    - `folge_fm_cnt`= Fernmetastasen im Elementknoten "Folgeereignis"
    - `folge_weitere_cnt` = Weitere Klassifikation im Elementknoten "Folgeereignis"
    - `folge_tnm_cnt` = TNM im Elementknoten "Folgeereignis"

> 💡 `ZfKD` die absoluten Werte lassen erkennen, dass inzwischen die meisten Elemente flächendeckend vorliegen


    
![png](clin_2_analyze_files/output_15_0.png)
    



    
![png](clin_2_analyze_files/output_16_0.png)
    


<br>

### <a id='toc1_4_2_'></a>[relativ](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` != C44**
- der Filter ist gewählt, um eine bessere Vergleichbarkeit der Werte zu gewährleisten
- die Metriken sind **einfache Verhältiszahlen**, z.B: `op_per_tum` = alle OP / alle Tumore (pro kkr)
- es sind jeweils die kumulierten Werte aufgespannt:
  - nach einzelnen **Lieferregistern**
  - nach verwendeten **Tumordokumentationssystemen** (um systemische Effekte darstellen zu können)

#### <a id='toc1_4_2_1_'></a>[nach KKR](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>



<img src="clin_2_analyze_files/output_19_5.png" width="800">
    


#### <a id='toc1_4_2_2_'></a>[nach System](#toc0_)


<img src="clin_2_analyze_files/output_21_1.png" width="800">
    


<br>

## <a id='toc1_5_'></a>[Fehlende Therapieangaben](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C76-C97, alle D)
- ein Wert von bspw. 0.68 ist zu interpretieren als: _"68% aller Tumorfälle im KKR haben keine zugeordneten OP Angaben, die restlichen 32% mindestens eine."_
- `treat_missing_per_tum` stellt den Anteil Fälle dar, bei denen keinerlei Therapieangabe (OP, ST, SYST) vorliegt
- in der Darstellung sind die Max/Min Werte pro Kennzahl mit 🟥/🟩 markiert (kleiner ist besser)
> 💡 `NI`: _"Die **Missings für Folgeereignis, Strahlentherapie und Systemische Therapie** sind Resultat der noch ausstehenden Implementierung in der Registersoftware Tristan zur Bildung der jeweiligen Best-Of-Informationen. Die Implementierung ist bereits beauftragt. Neben Niedersachsen nutzen die Bundesländer Schleswig-Holstein, Bremen und das Saarland dieselbe Tristan-Implementierung"_

> 💡 `ZfKD`: _aus `st_missing_per_tum` lässt sich ablesen, dass ~23% der Tumoren deutschlandweit mind. eine ST zugeordnet ist (Total: 1 - 0.77 = 0.23). Das entspricht in etwa der Annahme von 30% Anteil von Strahlentherapien an primären Diagnosen_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                        (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:      n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:         n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur solide Tumore]: n = 2_270_570  (56.5%) ░░░░░░░░░░░░░░████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and 
    z_icd10_3d not in ('C44')
    and left(z_icd10_3d,1) = 'C'
    and right(z_icd10_3d, 2)::int8 <= 75

```

</details>



<img src="clin_2_analyze_files/output_23_5.png" width="800">
    


### <a id='toc1_5_1_'></a>[alle Therapien](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_430_058  (85.4%) ░░░░░█████████████████████████
    └ [keine DCO]:                     n = 3_318_557  (82.6%) ░░░░░░████████████████████████
    └ [ICD10 nur C]:                   n = 2_773_478  (69.1%) ░░░░░░░░░░████████████████████
    └ [keine C44,D04]:                 n = 2_291_677  (57.1%) ░░░░░░░░░░░░░█████████████████
    └ [keine Verstorbenen < 180 Tage]: n = 1_959_965  (48.8%) ░░░░░░░░░░░░░░░░██████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Diagnosedatum between '2020-01-01' and '2024-06-30'
and not z_is_dco
and left(z_icd10_3d,1) = 'C'
and z_icd10_3d not in ('C44','D04')
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>



<img src="clin_2_analyze_files/output_25_5.png" width="800">
    


### <a id='toc1_5_2_'></a>[OP](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [DJ 2020-2024 ohne letzte 6m]: n = 3_430_058  (85.4%) ░░░░░█████████████████████████
    └ [keine DCO]:                   n = 3_318_557  (82.6%) ░░░░░░████████████████████████
    └ [nur solide Tumore]:           n = 2_065_352  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Diagnosedatum between '2020-01-01' and '2024-06-30'
and not z_is_dco
and 
    z_icd10_3d not in ('C44')
    and left(z_icd10_3d,1) = 'C'
    and right(z_icd10_3d, 2)::int8 <= 75

```

</details>



<img src="clin_2_analyze_files/output_27_5.png" width="800">
    


#### <a id='toc1_5_2_1_'></a>[OP wenn OP erwartet](#toc0_)
- kategorien
  - `1_op`: mind. eine OPS im definierten Bereich (3Steller, organspezifisch) ist dokumentiert
  - `2_no_op_but_tp`: keine OPS, aber pT 1-4 ist dokumentiert
  - `3_rest`: keine der zuvor genannten Merkmale trifft

##### <a id='toc1_5_2_1_1_'></a>[C50](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [DJ 2020-2024 ohne letzte 6m]:   n = 3_430_058  (85.4%) ░░░░░█████████████████████████
    └ [ICD10 C50]:                       n = 362_653   (9.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [nur M0]:                          n = 273_283   (6.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine Verstorbenen < 180 Tage]:   n = 270_004   (6.7%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Diagnosedatum between '2020-01-01' and '2024-06-30'
and z_icd10_3d = 'C50'
and z_m_pc_1 = '0'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>



    
![svg](clin_2_analyze_files/output_30_4.svg)
    


##### <a id='toc1_5_2_1_2_'></a>[C18-C20](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [ICD10 C18-C20]:                   n = 284_931   (7.1%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [nur M0]:                          n = 167_650   (4.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [keine Verstorbenen < 180 Tage]:   n = 154_254   (3.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and z_icd10_3d in ('C18', 'C19', 'C20')
and z_m_pc_1 = '0'
and ifnull(z_period_diag_death_day,181) >= 180
```

</details>



    
![svg](clin_2_analyze_files/output_32_4.svg)
    


### <a id='toc1_5_3_'></a>[ST](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [DJ 2020-2024 ohne letzte 6m]: n = 3_430_058  (85.4%) ░░░░░█████████████████████████
    └ [keine DCO]:                   n = 3_318_557  (82.6%) ░░░░░░████████████████████████
    └ [nur solide Tumore]:           n = 2_065_352  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Diagnosedatum between '2020-01-01' and '2024-06-30'
and not z_is_dco
and 
    z_icd10_3d not in ('C44')
    and left(z_icd10_3d,1) = 'C'
    and right(z_icd10_3d, 2)::int8 <= 75

```

</details>



<img src="clin_2_analyze_files/output_35_1.png" width="600">
    


### <a id='toc1_5_4_'></a>[SYST](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [DJ 2020-2024 ohne letzte 6m]: n = 3_430_058  (85.4%) ░░░░░█████████████████████████
    └ [keine DCO]:                   n = 3_318_557  (82.6%) ░░░░░░████████████████████████
    └ [kein M1]:                     n = 2_997_763  (74.6%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Diagnosedatum between '2020-01-01' and '2024-06-30'
and not z_is_dco
and ifnull(z_m_pc_1,'') <> '1'
```

</details>



<img src="clin_2_analyze_files/output_37_5.png" width="600">
    


<br>

## <a id='toc1_6_'></a>[Fallzahlen epi vs clin](#toc0_)
- **Filter: `DJ` = 2024, `DCO` = N, `ICD10` != C44**
- Ziel der Darstellung: Abschätzung der Vollzähligkeit der klinischen Daten
- dargestellt sind die gefilterten Fallzahlen jeweils aus den epi und den klinischen Daten, hier allerdings nur aus dem letzten DJ 2023
- Hinweis: Die Auswertung Daten basiert auf `Inzidenzort` anstatt `Lieferregister`, da in den epi Daten bislang die einzelnen Länder des GKR nicht aufgeschlüsselt waren, und ein matching auf EKRNR somit fehlschlägt
> 💡 `NI`: _"Die **höhere Fallzahl** des epidemiologischen Registers im Vergleich zum klinischen Register ist vermutlich auf unterschiedliche Filterkriterien in den beiden Registern zurückzuführen. Im KKN werden neben den Kriterien die das Lieferschema vorgibt auch noch weitere Plausibilitätsprüfungen angewandt. Tumoren, welche diese Prüfungen nicht bestehen, werden vom Export ausgeschlossen"_  

> 💡 `ZfKD`: _Die quota in den anderen KKR entspricht der Erwartung, dass die Fallzahl bei klin. Daten höher sein sollte als bei epi Daten._



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2024]:         n = 691_248  (17.2%) ░░░░░░░░░░░░░░░░░░░░░░░░░█████
    └ [keine DCO]:       n = 672_045  (16.7%) ░░░░░░░░░░░░░░░░░░░░░░░░░█████
    └ [keine C44,D04]:   n = 568_242  (14.1%) ░░░░░░░░░░░░░░░░░░░░░░░░░░████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy in (2024)
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>



```
    ┌──────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┐
    │   kkr    │  01-SH  │  02-HH  │  03-NI  │  04-HB  │  05-NW  │  06-HE  │  07-RP  │  08-BW  │  09-BY  │  10-SL  │  11-BE  │  12-BB  │  13-MV  │  14-SN  │  15-ST  │  16-TH  │
    │ varchar  │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │
    ├──────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┤
    │ clin_cnt │ 23_860  │ 12_999  │ 47_593  │ 4_541   │ 129_531 │ 29_173  │ 29_734  │ 80_888  │ 88_739  │ 8_774   │ 25_458  │ 20_371  │ 1_150   │ 33_715  │ 17_664  │ 14_045  │
    │ epi_cnt  │ 22_820  │ 12_347  │ 56_134  │ 4_371   │ 129_466 │ 27_955  │ 28_807  │ 74_961  │ 81_866  │ 8_349   │ 24_019  │ 19_266  │ 1_011   │ 32_952  │ 17_291  │ 13_473  │
    │ quota    │ 105     │ 105     │ 85      │ 104     │ 100     │ 104     │ 103     │ 108     │ 108     │ 105     │ 106     │ 106     │ 114     │ 102     │ 102     │ 104     │
    └──────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┘
```

<div style="page-break-after: always;"></div>

## <a id='toc1_7_'></a>[Verteilung von Variablen](#toc0_)
- in den Diagrammen gibt das angegebene _`n=`_ einen Hinweis auf die verwendete Grundgesamtheit
- die _relativen_ Barcharts enthalten ein `Total` item für den Gesamtvergleich

<br>

### <a id='toc1_7_1_'></a>[UICC (p)](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)
- nach den absoluten Werten ist auch die relative Verteilung gegeben unter Ausschluss der hohen Zahl an UICC missings
- die Variable wird in den meisten kkr selbst gebildet. Für GTDS Länder ist dafür ein Standard definiert  

> 💡 `NI`: _"UICC-Stadium: In Tristan ist die Implementierung zur automatisierten Ermittlung des UICC-Stadiums ausstehend. Bis zur Umsetzung der Implementierung wird das KKN **keine gesonderte Berechnung** des UICC-Stadiums vornehmen, liefert aber die Werte, die gemeldet worden sind"_  

> 💡 `HH`: _"Komplett fehlende UICC-Stadien: Teilweise bei uns unter **weitere Klassifikationen** zu finden und erst ab 2023 in einem eigenen Feld. UICC nach TNM-8 ist noch nicht vollständig in unserer Datenbank berechnet."_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                        (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:      n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:         n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur solide Tumore]: n = 2_270_570  (56.5%) ░░░░░░░░░░░░░░████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and 
    z_icd10_3d not in ('C44')
    and left(z_icd10_3d,1) = 'C'
    and right(z_icd10_3d, 2)::int8 <= 75

```

</details>



    
![svg](clin_2_analyze_files/output_43_4.svg)
    


<br>

### <a id='toc1_7_2_'></a>[Diagnosesicherung](#toc0_)
- **Filter: `DJ` = 2020-2024**

> 💡 `NI`: _"Die Ausprägung **DCO als Diagnosesicherung** kommt im KKN-Datensatz nicht vor. Diese Information liegt bisher nur dem EKN vor und wird gegebenenfalls zur Anreicherung von Datenexporten fallspezifisch vom KKN beim EKN angefragt. Der Prozess zur automatisierten Übermittlung dieser Informationen vom EKN zum KKN ist in Planung"_

> 💡 `ZfKD`: _die Kodes `6` und `7` sind noch enthalten, allerdings on der aktuellen oBDS Referenz nicht mehr gültig_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
```

</details>



    
![svg](clin_2_analyze_files/output_45_4.svg)
    


### <a id='toc1_7_3_'></a>[DCO](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine C44,D04]: n = 3_158_460  (78.6%) ░░░░░░░███████████████████████
    └ [ICD10 nur C]:   n = 2_627_689  (65.4%) ░░░░░░░░░░░███████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and z_icd10_3d not in ('C44','D04')
and left(z_icd10_3d,1) = 'C'
```

</details>



<img src="clin_2_analyze_files/output_47_5.png" width="800">
    


### <a id='toc1_7_4_'></a>[DCN](#toc0_)


<img src="clin_2_analyze_files/output_49_1.png" width="800">
    


<br>

### <a id='toc1_7_5_'></a>[Geschlecht](#toc0_)
- Grundgesamtheit: Menge aller **Patienten** 
- **Filter: `DJ` = 2020-2024, Geschlecht in (`M`,`W`)**

> 💡 `ZfKD`: _Angaben zu Geschlecht ungleich `M` oder `W` sind sehr selten, diese Fälle werden nicht gesondert verarbeitet_



```
    counts: distinct z_pat_id
    ---
    n = 3_420_720                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_412_547  (99.8%) ░█████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
```

</details>



    
![svg](clin_2_analyze_files/output_51_4.svg)
    


    Anzahl Ausprägungen <> M oder W im Gesamtdatensatz: {'D': 43, 'U': 246, 'X': 31}


### <a id='toc1_7_6_'></a>[Grading](#toc0_)

#### <a id='toc1_7_6_1_'></a>[Verteilung](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                   n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur gradingrelevante Tumore]: n = 1_265_707  (31.5%) ░░░░░░░░░░░░░░░░░░░░░█████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



    
![svg](clin_2_analyze_files/output_54_4.svg)
    


#### <a id='toc1_7_6_2_'></a>[Anteile](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                                  (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:                n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                   n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur gradingrelevante Tumore]: n = 1_265_707  (31.5%) ░░░░░░░░░░░░░░░░░░░░░█████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



<img src="clin_2_analyze_files/output_56_5.png" width="80%">
    


<br>

### <a id='toc1_7_7_'></a>[Diagnosejahr mit Altdaten](#toc0_)
- Filter: Top 5 Diagnosejahre
- Legende ist **absteigend sortiert nach Fallzahl im DJ**, Restkategorie `<other>` ist aufgeführt

    Anzahl 2025 Fälle: {'11-BE': 322, '12-BB': 351, '15-ST': 2769, '14-SN': 5, '06-HE': 443, '09-BY': 3102, '13-MV': 10}



    
![svg](clin_2_analyze_files/output_58_1.svg)
    


<br>

### <a id='toc1_7_8_'></a>[Diagnosejahr ohne Altdaten](#toc0_)
- Filter: 2020 - 2024



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
```

</details>



    
![svg](clin_2_analyze_files/output_60_4.svg)
    


<br>

### <a id='toc1_7_9_'></a>[Inzidenzort vs Lieferregister](#toc0_)
- **Filter: keiner**
- vertikal: `Inzidenzort` (Zeile `00` bündelt alle Fälle mit ungültiger Ortsangabe). horizontal: `Lieferregister`
- Beispiel: `03-NI` liefert zu 100% Fälle aus dem Inzidenzort `03`, `13-MV` liefert 159 Fälle aus `03`
> 💡 `ZfKD`: _Angestrebt ist eine "Diagonale", möglichst nur noch Fallübermittlungen aus dem eigenen Einzugsgebiet, was inzwischen schon besser erreicht ist. ~ 99% der Fälle stammen aus dem liefernden Register_


    
![png](clin_2_analyze_files/output_62_0.png)
    


<br>

### <a id='toc1_7_10_'></a>[ICD10 Gruppen](#toc0_)
- **Filter: `DJ` =  2020 - 2024**
- die verwendete ICD10 Skala entspricht der Darstellung aus *"Krebs in Deutschland"*
> 💡 `NI`: _"Für nicht-melanozytäre Hautkrebsarten bestimmter Histologien sowie fortgeschrittene Plattenepithelkarzinome gilt ab dem 20. September 2023 eine geänderte Meldepflicht. Erst seit diesem Zeitpunkt sind die prognostisch ungünstigen Hauttumore **(C44)** an das KKN zu melden und kommen daher im gelieferten Datensatz bisher nicht vor. In den nächsten Lieferungen werden diese Daten enthalten sein"_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
```

</details>



    
![svg](clin_2_analyze_files/output_64_4.svg)
    


<br>

### <a id='toc1_7_11_'></a>[Verstorben](#toc0_)

- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` != C44**
- gezählt sind **Personen**



```
    counts: distinct z_pat_id
    ---
    n = 3_420_720                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_412_547  (99.8%) ░█████████████████████████████
    └ [keine DCO]:     n = 3_300_566  (96.5%) ░░████████████████████████████
    └ [keine C44,D04]: n = 2_823_609  (82.5%) ░░░░░░████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>



    
![svg](clin_2_analyze_files/output_66_4.svg)
    


<br>

### <a id='toc1_7_12_'></a>[TNM-T (p)](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` nur solide Tumoren**



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:             n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur tnm-relevante Tumore]: n = 2_064_712  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



    
![svg](clin_2_analyze_files/output_68_4.svg)
    


<br>

### <a id='toc1_7_13_'></a>[TNM-N (p)](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)




```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:             n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur tnm-relevante Tumore]: n = 2_064_712  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



    
![svg](clin_2_analyze_files/output_70_4.svg)
    


<br>

### <a id='toc1_7_14_'></a>[TNM-M (p)](#toc0_)
- **Filter: `DJ` = 2020-2024, `DCO` = N, `ICD10` nur TNM relevante**



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:             n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur tnm-relevante Tumore]: n = 2_064_712  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



    
![svg](clin_2_analyze_files/output_72_4.svg)
    


<br>

## <a id='toc1_8_'></a>[Todesursachen (TU)](#toc0_)

### <a id='toc1_8_1_'></a>[nach ICD10 Einstellern](#toc0_)
- gezählt sind die ersten Stellen aller TU Codes ohne jeglichen Filter


    
![svg](clin_2_analyze_files/output_75_0.svg)
    


### <a id='toc1_8_2_'></a>[nach Sterbejahr und Todesursachen](#toc0_)
- gezählt werden **Personen**
- **Filter: `SJ`= 2020-2024, `Verstorben` = J**
- `tu_type` Art der TU pro Patient
  - `<NA>` keine Todesursache zugeordnet
  - `c_only` nur Todesursachen Cxx
  - `other_only` nur Todesursachen <> Cxx
  - `c_and_other` Cxx und andere Todesursachen

<!-- > 💡 `ZfKD`: _"`03-NI` und `06-HE` übermitteln deutlich weniger Todesursachen asl in den epi Daten, für `07-RP` ist der Anteil in beiden Datenräumen gering. Für `15-ST` sind auffällig wenige Todesfälle in 2023 übermittelt."_ -->



```
    counts: distinct z_pat_id
    ---
    n = 3_420_720                      (100.0%) ██████████████████████████████
    └ [SJ 2020-2024]:    n = 2_679_098  (78.3%) ░░░░░░░███████████████████████
    └ [nur Verstorbene]:   n = 896_564  (26.2%) ░░░░░░░░░░░░░░░░░░░░░░░███████
```

<details>
<summary>filter-sql</summary>

```sql
year(Datum_Vitalstatus::date) between 2020 and 2024
and Verstorben='J'
```

</details>



    
![png](clin_2_analyze_files/output_77_4.png)
    


<br>

### <a id='toc1_8_3_'></a>[nach hat_todesursache bei Nicht-Verstorbenen](#toc0_)
- gezählt werden **Personen**
- **Filter: `Verstorben` = N**


```
    ┌─────────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┬───────┐
    │   kkr   │ 01-SH │ 02-HH │ 03-NI │ 04-HB │ 05-NW │ 06-HE │ 07-RP │ 08-BW │ 09-BY │ 10-SL │ 11-BE │ 12-BB │ 13-MV │ 14-SN │ 15-ST │ 16-TH │ Total │
    │ varchar │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │ int16 │
    ├─────────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┼───────┤
    │ cnt_tu  │     1 │     0 │     0 │     0 │     0 │     0 │     0 │     0 │     2 │    15 │     1 │     3 │   472 │     0 │     0 │     2 │     0 │
    └─────────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┴───────┘
```

<br>

### <a id='toc1_8_4_'></a>[nach ICD10 Dreistellern (TOP 5)](#toc0_)
- Grundgesamtheit: alle **Todesursachen**, kein Filter

> 💡 `ZfKD`: _Enthalten sind in einigen KKR auch `C79` (Metastasen), welche in offizieller Todesursachen-Statistik nicht kodiert sind_


<img src="clin_2_analyze_files/output_82_1.png" width="80%">
    


<br>

### <a id='toc1_8_5_'></a>[nach IsGrundleiden](#toc0_)
- Grundgesamtheit: **alle Todesursachen**


    
![svg](clin_2_analyze_files/output_84_0.svg)
    


## <a id='toc1_9_'></a>[Therapien](#toc0_)

<br>

### <a id='toc1_9_1_'></a>[OP](#toc0_)


#### <a id='toc1_9_1_1_'></a>[nach ICD10](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**



```
    counts: distinct OPId
    ---
    n = 2_090_962                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 2_059_981  (98.5%) ░█████████████████████████████
    └ [nur erste OP]: n = 1_641_865  (78.5%) ░░░░░░░███████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and z_op_order = 1
```

</details>



    
![svg](clin_2_analyze_files/output_88_4.svg)
    


<br>

#### <a id='toc1_9_1_2_'></a>[nach Intention](#toc0_)
- Grundgesamtheit: alle **OP Meldungen**


    
![svg](clin_2_analyze_files/output_90_0.svg)
    


<br>

### <a id='toc1_9_2_'></a>[OPS](#toc0_)


#### <a id='toc1_9_2_1_'></a>[nach OPS ICD Kapitel (Top 10)](#toc0_)
- Grundgesamtheit: **alle OPS Codes**

> 💡 `ZfKD`: _Lediglich `02-HH` und `05-NW` übermitteln ausschliesslich Kapitel 5. Der Anteil von Meldungen <> Kapitel 5 sind wahrscheinlich diagnostische Massnahmen oder nicht-operative Therapien. Vorschlag: nur noch Kapitel 5 übermitteln_


    
![svg](clin_2_analyze_files/output_93_0.svg)
    


### <a id='toc1_9_3_'></a>[SYST](#toc0_)

#### <a id='toc1_9_3_1_'></a>[nach Stellung_OP](#toc0_)

- Grundgesamtheit: **alle SYST Elemente**


    
![svg](clin_2_analyze_files/output_96_0.svg)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_10_'></a>[Missings- und Unbekannt-Kodierungen](#toc0_)
- es sind folgende Schwellwerte angezeigt:
  - 🟩 0 bis <5%
  - 🟨 **missings**: 5% bis <100% | **unbekannt**: 5% bis <35%>
  - 🟥 **missings**: bei 100% | **unbekannt** >= 35%
- dargestellt sind Variablen aus dem Schema in folgender Notation: `[Elementknoten]Variablenname`
- die graumelierte `0` kennzeichnet einen leeren Wert (=keine missings), 0% entsteht durch Rundung von kleinen Werten
- `Total` 
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

### <a id='toc1_10_1_'></a>[Verpflichtende Tumorvariablen](#toc0_)
- kein Filter
- Pflichtangaben aus anderen Elementknoten (z.B. Datum aus dem OP Knoten) sind nicht aufgeführt, da diese selbst optional sind

> 💡 `ZfKD`: _Pflichtfelder sind nahezu komplett vorhanden, die wenigen Ausnahmen werden allerdings Stand heute nicht korrigiert_

> 💡 `ZfKD`: _`Gesamtbeurteilung_Tumorstatus`ist zwar vollständig geliefert (siehe vorherige Grafiken), aber häufig als Unbekannt kodiert. Viele Pflichtvariablen haben keine Unbekannt Kodes, etwas auffällig sind hier `Diagnosesicherung` und `Seitenlokalisation`. Ähnlich auch `Morphologie` (kein Pflichtfeld)._ 




```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_101_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_101_7.png)
    


### <a id='toc1_10_2_'></a>[Weitere Tumorangaben](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



<img src="clin_2_analyze_files/output_103_6.png" width="60%">
    


    🟠 unknowns



<img src="clin_2_analyze_files/output_103_9.png" width="60%">
    


<br>

### <a id='toc1_10_3_'></a>[Tumorstadien](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` nur solide Tumoren**

> 💡 `ZfKD`: _"`05-NW` hat die Auflage als Konstante im Datensatz hinterlegt"_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:             n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur tnm-relevante Tumore]: n = 2_064_712  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_105_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_105_7.png)
    


<br>

### <a id='toc1_10_4_'></a>[Therapieangaben](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` != C44**
- fiktives Rechenbeispiel für `[Bestrahlung]Anzahl_Tage_Diagnose_ST`:
  - 5363 Bestrahlungen sind in den 01-SH Daten unter Beachtung des Filters (DCO/DJ/ICD10) für den zugeordneten Tumor
  - davon enthalten 302 ein leeres Feld `Anzahl_Tage_Diagnose_ST` -> ~ 6%

#### <a id='toc1_10_4_1_'></a>[OP](#toc0_)

> 💡 `ZfKD`: _Für überlieferte OP liegen `Datum_OP` und `Intention` komplett vollständig vor. Der Tagesabstand hat wenige Lücken, während `Lokale_Beurteilung_Residualstatus` auch ausserhalb von Tristan erkennbar häufiger fehlt._



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



<img src="clin_2_analyze_files/output_108_6.png" width="80%">
    


    🟠 unknowns



<img src="clin_2_analyze_files/output_108_9.png" width="80%">
    


#### <a id='toc1_10_4_2_'></a>[ST](#toc0_)

> 💡 `ZfKD`: _`Datum_Beginn_Bestrahlung` und `Intention` sind nahezu komplett verfügbar in den dokumentierten ST / Bestrahlungen, mit Abstrichen auch `Anzahl_Tage_Diagnose_ST`._  
> _`Anzahl_Tage_ST_Dauer` und `Stellung_OP` fehlen bei Tristan_  
> _`Applikationsart` wird nicht von allen kkr übermittelt, davon abgesehen ist `Seite_Zielgebiet` zuverlässig angegeben, die CodeVersionen ergänzen sich, wobei `2014` deutlich häufiger angewendet wird als `2021`._



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_110_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_110_7.png)
    


#### <a id='toc1_10_4_3_'></a>[SYST](#toc0_)

> 💡 `ZfKD`: _Die meisten Angaben im SYST Element liegen komplett vor. `Anzahl_Tage_SYST_Dauer` fehlt häufig, was auch an noch nicht abgeschlossenen Therapien liegen könnte - wohingegen `08-BW` hier als einzige keine missings ausweisen._



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_112_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_112_7.png)
    


### <a id='toc1_10_5_'></a>[Folgeereignisse](#toc0_)

> 💡 `ZfKD`: _`Datum_Folgeereignis` und `Gesamtbeurteilung_Tumorstatus` liegen komplett vor, die anderen Angaben zum Tumorstatus allerdings nicht. Angaben für `Folgeereignis_TNM` fehlen ganz überwiegend, auch wenn Folgereignisse keine TNM enthalten müssen. Die Erkennung von Rezidiven ist so deutlich erschwert._



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_114_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_114_7.png)
    


### <a id='toc1_10_6_'></a>[Freitexte](#toc0_)

> 💡 `ZfKD`: _Protokolle und Substanzen werden nach und nach in den Datensatz eingebunden. Protokolle bislang ausschliesslich als Freitext. Bei Substanzen komplementieren sich Freitexte und Kodierungen, bei vielen GTDS Ländern überwiegen inzwischen die Kodierungen._




```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                    (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:  n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:     n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [keine C44,D04]: n = 3_038_346  (75.7%) ░░░░░░░░██████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d not in ('C44','D04')
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_116_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_116_7.png)
    


<br>

### <a id='toc1_10_7_'></a>[Organspezifische Variablen](#toc0_)
- die Prozentwerte sind bei allen Darstellungen gerundet, "100%" bei einer gelben Ampel kann interpretiert werden als knapp unter 100%
> 💡 `HH` _"Fehlende Modul-Angaben (C50, C61) 2021. Sind bei uns noch nicht im xml enthalten."_

<br>

#### <a id='toc1_10_7_1_'></a>[Mamma](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` = C50**



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:    n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [ICD10 C50]:      n = 391_652   (9.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d = 'C50'
```

</details>


    🟠 missings



    
![png](clin_2_analyze_files/output_119_5.png)
    


    🟠 unknowns



    
![png](clin_2_analyze_files/output_119_7.png)
    


<br>

#### <a id='toc1_10_7_2_'></a>[Prostata](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` = C61**

> 💡 `ZfKD` _Auch innerhalb eines KKR gibt es deutliche Varianzen zwischen Variablen des organspezifischen Moduls, z.B. in 11-16_



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:    n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [ICD C61]:        n = 375_506   (9.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d = 'C61'
```

</details>


    🟠 missings



<img src="clin_2_analyze_files/output_121_6.png" width="70%">
    


    🟠 unknowns



<img src="clin_2_analyze_files/output_121_9.png" width="70%">
    


<br>

#### <a id='toc1_10_7_3_'></a>[Darm](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` = C18-C20**



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:    n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [ICD C18-20]:     n = 276_412   (6.9%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d in ('C18','C19','C20')
```

</details>


    🟠 missings



<img src="clin_2_analyze_files/output_123_6.png" width="50%">
    


    🟠 unknowns



<img src="clin_2_analyze_files/output_123_9.png" width="50%">
    


<br>

#### <a id='toc1_10_7_4_'></a>[Melanom](#toc0_)
- **Filter: `DJ` 2020-2024, `DCO` = N, `ICD10` = C43**



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:    n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [ICD C43]:        n = 143_542   (3.6%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d = 'C43'
```

</details>


    🟠 missings



<img src="clin_2_analyze_files/output_125_6.png" width="50%">
    


    🟠 unknowns



<img src="clin_2_analyze_files/output_125_9.png" width="50%">
    


## <a id='toc1_11_'></a>[🆕 Weitere Klassifikationen](#toc0_)

- Freitexte werden per regex in diesem [sql script](../sql/check_if_class.sql) zugeordnet

### <a id='toc1_11_1_'></a>[nach Quelle](#toc0_)
- `source`
  - `diag`: Klassifikation ist der Diagnose zugeordnet
  - `fol`: Klassifikation ist einem Folgeereignis zugeordnet 



```
    counts: all rows (no grouping)
    ---
    n = 849_517                        (100.0%) ██████████████████████████████
    └ [Stadium vorhanden]: n = 849_517 (100.0%) ██████████████████████████████
    └ [z_dy < 2025]:       n = 848_904  (99.9%) ░█████████████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
Stadium is not null
and z_dy < 2025
```

</details>



    
![svg](clin_2_analyze_files/output_131_0.svg)
    


### <a id='toc1_11_2_'></a>[nach Jahren](#toc0_)



    
![svg](clin_2_analyze_files/output_133_0.svg)
    


### <a id='toc1_11_3_'></a>[PSA](#toc0_)

- Kategorien für die Kombination von PSA Werten zu jedem Tumor
  - `1_all_null`: keine PSA Werte zum Tumor
  - `2_tum_only`: PSA Wert nur vom Organmodul
  - `3_class_only`: PSA Wert nur aus Weitere Klassifikationen (Diagnose oder Folgeereignis)
  - `4_tum_and_class`: PSA Werte aus Organmodul und Weitere Klassifikationen



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                   (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]: n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:    n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [ICD C61]:        n = 375_506   (9.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and not z_is_dco
and z_icd10_3d = 'C61'
```

</details>



    
![svg](clin_2_analyze_files/output_136_4.svg)
    


    n = 375_506 | n(true) = 245_759



    
![png](clin_2_analyze_files/output_136_6.png)
    


### <a id='toc1_11_4_'></a>[UICC](#toc0_)



```
    counts: all rows (no grouping)
    ---
    n = 4_015_983                               (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:             n = 3_758_513  (93.6%) ░░████████████████████████████
    └ [keine DCO]:                n = 3_637_144  (90.6%) ░░░███████████████████████████
    └ [nur tnm-relevante Tumore]: n = 2_064_712  (51.4%) ░░░░░░░░░░░░░░░███████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
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
```

</details>



    
![svg](clin_2_analyze_files/output_138_4.svg)
    


    n = 2_064_712 | n(true) = 655_640



    
![png](clin_2_analyze_files/output_138_6.png)
    


## <a id='toc1_12_'></a>[🆕 Freitexte](#toc0_)


    
![svg](clin_2_analyze_files/output_141_0.svg)
    


<br>

## <a id='toc1_13_'></a>[Datum_Vitalstatus](#toc0_)

### <a id='toc1_13_1_'></a>[Verteilung Monat](#toc0_)
- **Filter: alle Patienten mit `Verstorben`=N, `DJ` und `SJ` 2020-2024**

> 💡 `HH`: _"Das liegt an unserer Darstellung des Vitalstatus-Datum. Nach Abschluss der DC-Recherche, die nach Abschluss des 'Todesjahres' durchgeführt wird, wird bei allen Patienten bei denen wir keine weiteren Meldungen bzw Informationen zum Vitalstatus bekommen haben der 31.12. des abgeschlossenen 'Todesjahres' gesetzt. In diesem Fall ist dies das aktuelle Jahr - 2 -> 31.12.2022, da die DC-Recherche zum Zeitpunkt der Datenlieferung noch nicht abgeschlossen war. Wenn jetzt ein Patient die letzte Meldung mit einem Leistungsdatum in 2019 hatte, wir aber keine weiteren Informationen bekommen haben, gehen wir also nach Abschluss der Recherche davon aus, dass der Patient am 31.12.2022 noch gelebt hat. Dadurch 'verbessert' sich tatsächlich der Vitalstatus in unseren Daten, ansonsten wäre dieser nämlich irgendwann in 2019."_

> 💡 `ZfKD`: angestrebt ist die Verwendung eines einzelnen Erhebungszeitpunkts (z.B. Dezember)



```
    counts: distinct z_pat_id
    ---
    n = 3_420_720                          (100.0%) ██████████████████████████████
    └ [DJ 2020-2024]:        n = 3_412_547  (99.8%) ░█████████████████████████████
    └ [Verstorben = 'N']:    n = 2_431_448  (71.1%) ░░░░░░░░░█████████████████████
    └ [Vitalstatus >= 2020]: n = 2_426_295  (70.9%) ░░░░░░░░░█████████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2020 and 2024
and Verstorben = 'N'
and year(Datum_Vitalstatus) >= 2020
```

</details>



    
![png](clin_2_analyze_files/output_145_0.png)
    



    
![png](clin_2_analyze_files/output_146_0.png)
    


### <a id='toc1_13_2_'></a>[Vitalstatus Jahr](#toc0_)


    
![svg](clin_2_analyze_files/output_148_0.svg)
    


<div style="page-break-after: always;"></div>

## <a id='toc1_14_'></a>[Numerische Variablen 🔢](#toc0_)

<br>

### <a id='toc1_14_1_'></a>[Diagnosealter](#toc0_)
- berechnet aus `Diagnosejahr` - `Geburtsjahr`
- negative Werte entstehen aus falscher Datumsreihenfolge von Ereignissen
- die Datumsangaben sind **nicht bereinigt**, um strukturelle Effekte sichtbar zu machen

> 💡 `HH`: _"Ja, das liegt an dem Geschätzt-Flag in den Datumsangaben. In unseren Daten haben wir noch die alte Ausprägung 'Jahr geschätzt', diese wird dann im ZFKD-Datensatz mit 'Vollständig geschätzt' übersetzt. Theoretisch könnten Sie statt 1900 auch das angegebene Jahr nutzen… Aber diese Schätz-Angabe ist uns auch ein Dorn im Auge. Wir werden es auch noch in unseren Daten bereinigen. Zumeist handelt es sich da bei uns um Dokumentations oder Verständnisfehler."_


    
![png](clin_2_analyze_files/output_152_0.png)
    



    
![png](clin_2_analyze_files/output_152_1.png)
    


    
    column (n = 4_015_983) |     notnull      |   min   | lower |  q25  | median | mean  |  q75  | upper  |  max   |  std  |  cv 
    -----------------------+------------------+---------+-------+-------+--------+-------+-------+--------+--------+-------+-----
    z_age                  | 4_015_983 (100%) | -122.00 | 30.25 | 59.67 |  70.00 | 68.01 | 79.33 | 108.50 | 125.25 | 15.27 | 0.22
    
    
    item (n = 4_015_983) |   count   |   min   | lower |  q25  | median | mean  |  q75  | upper  |  max   |  std  |  cv 
    ---------------------+-----------+---------+-------+-------+--------+-------+-------+--------+--------+-------+-----
    01-SH                |   194_283 |  -86.25 | 32.58 | 61.58 |  72.50 | 70.09 | 80.92 | 106.67 | 112.50 | 14.37 | 0.21
    02-HH                |    69_613 |  -95.17 | 22.83 | 56.42 |  68.58 | 66.06 | 78.83 | 104.83 | 104.83 | 16.54 | 0.25
    03-NI                |   277_590 |  -93.33 | 30.58 | 58.92 |  68.75 | 67.02 | 77.83 | 105.33 | 105.33 | 14.50 | 0.22
    04-HB                |    30_960 |  -85.83 | 32.08 | 61.08 |  71.58 | 69.41 | 80.42 | 107.33 | 107.33 | 14.72 | 0.21
    05-NW                | 1_017_558 |    0.00 | 30.33 | 60.33 |  70.75 | 69.00 | 80.33 | 110.33 | 124.67 | 14.67 | 0.21
    06-HE                |   207_946 |  -97.50 | 28.08 | 57.58 |  68.00 | 65.94 | 77.25 | 105.00 | 124.67 | 15.48 | 0.23
    07-RP                |   162_063 |   18.00 | 30.33 | 58.83 |  68.67 | 67.02 | 77.83 | 102.75 | 124.67 | 14.34 | 0.21
    08-BW                |   457_569 | -100.83 | 28.17 | 59.00 |  69.75 | 67.45 | 79.58 | 107.83 | 123.17 | 16.54 | 0.25
    09-BY                |   572_135 | -122.00 | 29.00 | 58.42 |  68.75 | 66.79 | 78.08 | 106.67 | 124.67 | 15.87 | 0.24
    10-SL                |    63_249 |  -76.17 | 32.50 | 61.25 |  70.83 | 69.37 | 80.42 | 103.92 | 103.92 | 14.41 | 0.21
    11-BE                |   146_981 |  -96.50 | 24.50 | 57.00 |  68.75 | 65.78 | 78.67 | 106.75 | 123.92 | 17.95 | 0.27
    12-BB                |   130_868 |  -99.92 | 29.25 | 58.50 |  68.17 | 66.63 | 78.00 | 105.00 | 108.50 | 15.23 | 0.23
    13-MV                |   110_032 |  -96.58 | 33.92 | 61.25 |  70.42 | 68.97 | 79.50 | 106.25 | 123.17 | 13.72 | 0.20
    14-SN                |   334_093 |  -76.25 | 36.25 | 62.58 |  72.08 | 70.02 | 80.17 | 105.00 | 122.00 | 13.77 | 0.20
    15-ST                |   163_371 | -103.42 | 34.83 | 62.17 |  71.75 | 69.56 | 80.42 | 104.17 | 125.25 | 16.02 | 0.23
    16-TH                |    77_672 |  -81.83 | 32.33 | 59.42 |  68.67 | 66.89 | 77.50 | 103.08 | 103.08 | 14.55 | 0.22
    


<br>

### <a id='toc1_14_2_'></a>[Anzahl Tage zwischen Diagnose und Tod](#toc0_)

> 💡 `ZfKD`: _Es treten Extremwerte auf, weit ausserhalb des Interquartilsabstandes. Grund dafür sind mutmasslich fehlende Datumsangaben, die auf 1900 kodiert werden._  
> _In der KKR Verteilung sind die Extreme in den GTDS Ländern besonders ausgeprägt_


    
![png](clin_2_analyze_files/output_154_0.png)
    



    
![png](clin_2_analyze_files/output_154_1.png)
    


    
    column (n = 4_015_983)   |     notnull     |   min   | lower |  q25  | median |  mean  |  q75   | upper |  max   |   std    |  cv 
    -------------------------+-----------------+---------+-------+-------+--------+--------+--------+-------+--------+----------+-----
    Anzahl_Tage_Diagnose_Tod | 1_154_107 (28%) | -27_320 |  -212 | 52.00 | 259.00 | 653.42 | 706.00 | 1_687 | 30_590 | 1_271.47 | 1.95
    
    
    item (n = 4_015_983) |  count  |   min   | lower |  q25   | median |   mean   |   q75    | upper |  max   |   std    |  cv 
    ---------------------+---------+---------+-------+--------+--------+----------+----------+-------+--------+----------+-----
    01-SH                |  55_342 |       0 |     0 |  31.00 | 217.00 |   391.41 |   611.00 | 1_481 |  2_185 |   450.63 | 1.15
    02-HH                |  23_361 |       0 |     0 |  38.00 | 184.00 |   349.72 |   521.00 | 1_245 |  2_159 |   415.34 | 1.19
    03-NI                |  85_931 |       0 |     0 |  81.00 | 273.00 |   420.74 |   625.00 | 1_441 |  2_187 |   431.13 | 1.02
    04-HB                |  10_380 |       0 |     0 |  33.00 | 187.00 |   366.26 |   568.00 | 1_370 |  2_126 |   433.75 | 1.18
    05-NW                | 279_472 |       0 |     0 |  39.00 | 215.00 |   375.82 |   582.00 | 1_396 |  2_064 |   426.00 | 1.13
    06-HE                |  62_551 |       0 |     0 |  84.00 | 291.00 |   593.66 |   716.00 | 1_664 | 20_880 |   967.44 | 1.63
    07-RP                |  33_079 |       0 |     0 |  63.00 | 221.00 |   358.28 |   531.00 | 1_232 |  2_141 |   383.08 | 1.07
    08-BW                | 130_832 |       0 |     0 |  47.00 | 214.00 |   355.38 |   542.00 | 1_284 |  2_192 |   391.62 | 1.10
    09-BY                | 181_562 |       0 |     0 |  39.00 | 296.00 | 1_055.89 |   980.00 | 2_391 | 30_590 | 1_954.06 | 1.85
    10-SL                |   3_859 |       0 |     0 |   0.00 |   0.00 |    93.34 |    56.00 |   140 |  2_054 |   239.94 | 2.57
    11-BE                |  49_512 |       0 |     0 |  29.00 | 184.00 |   452.70 |   583.00 | 1_414 | 12_262 |   769.67 | 1.70
    12-BB                |  48_367 |       0 |     0 |  42.00 | 251.00 |   949.41 |   838.00 | 2_032 | 21_026 | 1_806.10 | 1.90
    13-MV                |  25_806 | -27_320 |  -212 | 113.00 | 394.00 | 1_146.03 | 1_127.00 | 2_648 | 16_507 | 1_859.12 | 1.62
    14-SN                |  98_743 |       0 |     0 | 154.00 | 558.00 | 1_405.87 | 1_610.00 | 3_793 | 25_923 | 2_062.48 | 1.47
    15-ST                |  53_400 |       0 |     0 |  56.00 | 322.00 |   963.14 |   991.00 | 2_393 | 16_227 | 1_696.78 | 1.76
    16-TH                |  11_910 |       0 |     0 |  45.00 | 165.00 |   301.56 |   427.75 | 1_001 |  2_112 |   354.96 | 1.18
    


<br>

### <a id='toc1_14_3_'></a>[Tumordicke](#toc0_)


    
![png](clin_2_analyze_files/output_156_0.png)
    


    
    column (n = 4_015_983) |   notnull   |  min  | lower |  q25  | median | mean  |  q75  | upper |  max   |  std  |  cv  
    -----------------------+-------------+-------+-------+-------+--------+-------+-------+-------+--------+-------+------
    Tumordicke             | 59_055 (1%) | 0.010 | 0.010 | 0.400 |  0.900 | 1.950 | 2.200 | 4.900 | 99.000 | 3.516 | 1.804
    



    
![png](clin_2_analyze_files/output_156_2.png)
    


### <a id='toc1_14_4_'></a>[PSA](#toc0_)


    
![png](clin_2_analyze_files/output_158_0.png)
    


    
    column (n = 4_015_983) |   notnull    |  min  | lower |  q25  | median |  mean  |  q75   | upper  |    max     |   std   |  cv  
    -----------------------+--------------+-------+-------+-------+--------+--------+--------+--------+------------+---------+------
    PSA                    | 244_596 (6%) | 0.000 | 0.000 | 5.630 |  8.730 | 90.297 | 18.000 | 36.550 | 99_999.000 | 741.436 | 8.211
    



    
![png](clin_2_analyze_files/output_158_2.png)
    


### <a id='toc1_14_5_'></a>[LK_befallen](#toc0_)


    
![png](clin_2_analyze_files/output_160_0.png)
    


    
    column (n = 4_015_983) |    notnull    | min | lower |  q25  | median | mean  |  q75  | upper | max |  std  |  cv  
    -----------------------+---------------+-----+-------+-------+--------+-------+-------+-------+-----+-------+------
    LK_befallen            | 796_925 (19%) |   0 |     0 | 0.000 |  0.000 | 0.916 | 0.000 |     0 | 722 | 3.076 | 3.358
    



    
![png](clin_2_analyze_files/output_160_2.png)
    


### <a id='toc1_14_6_'></a>[LK_untersucht](#toc0_)


    
![png](clin_2_analyze_files/output_162_0.png)
    


    
    column (n = 4_015_983) |    notnull    | min | lower |  q25  | median |  mean  |  q75   | upper |  max  |  std   |  cv  
    -----------------------+---------------+-----+-------+-------+--------+--------+--------+-------+-------+--------+------
    LK_untersucht          | 968_685 (24%) |   0 |     0 | 1.000 |  5.000 | 10.630 | 17.000 |    41 | 2_319 | 13.662 | 1.285
    



    
![png](clin_2_analyze_files/output_162_2.png)
    


### <a id='toc1_14_7_'></a>[RektumAbstandAnokutanlinie](#toc0_)


    
![png](clin_2_analyze_files/output_164_0.png)
    


    
    column (n = 4_015_983)     |   notnull   | min | lower |  q25  | median |  mean  |  q75   | upper | max |  std   |  cv  
    ---------------------------+-------------+-----+-------+-------+--------+--------+--------+-------+-----+--------+------
    RektumAbstandAnokutanlinie | 42_445 (1%) |   0 |     0 | 5.000 |  9.000 | 11.282 | 14.000 |    27 | 930 | 16.945 | 1.502
    



    
![png](clin_2_analyze_files/output_164_2.png)
    


### <a id='toc1_14_8_'></a>[LDH](#toc0_)


    
![png](clin_2_analyze_files/output_166_0.png)
    


    
    column (n = 4_015_983) |  notnull   | min | lower |   q25   | median  |  mean   |   q75   | upper |  max  |   std   |  cv  
    -----------------------+------------+-----+-------+---------+---------+---------+---------+-------+-------+---------+------
    LDH                    | 8_083 (0%) |   1 |    85 | 173.000 | 198.000 | 223.739 | 232.000 |   320 | 5_756 | 207.009 | 0.925
    



    
![png](clin_2_analyze_files/output_166_2.png)
    

