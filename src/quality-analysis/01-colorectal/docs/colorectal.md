# <a id='toc1_'></a>[Auswertungen: kolorektale Krebserkrankungen](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Auswertungen: kolorektale Krebserkrankungen](#toc1_)    
  - [📆 Datenstand](#toc1_1_)    
  - [⚙️ Teildatensatz](#toc1_2_)    
  - [Fallzahlen](#toc1_3_)    
    - [Teildatensatz](#toc1_3_1_)    
    - [Fallzahlen C18-C20 in Verhältnis zu allen Diagnosen](#toc1_3_2_)    
    - [Fallzahlen C18-C20 nach Viersteller](#toc1_3_3_)    
  - [OP](#toc1_4_)    
    - [Operation erfolgt bei C18 mit T_p > 0](#toc1_4_1_)    
    - [Operation erfolgt nach Jahren](#toc1_4_2_)    
  - [OPS](#toc1_5_)    
    - [OPS 5-4xx nach Diagnose](#toc1_5_1_)    
    - [ Verteilung OPS 5-455 bei C18](#toc1_5_2_)    
    - [ Verteilung OPS 5-484 bei C20](#toc1_5_3_)    
    - [Details OPS 5-455.2](#toc1_5_4_)    
      - [Ileozökalresektion](#toc1_5_4_1_)    
      - [rechte Hemikolektomie](#toc1_5_4_2_)    
      - [Sigmaresektion](#toc1_5_4_3_)    
  - [Lokalisation (Fernmetastasen)](#toc1_6_)    
    - [für M1](#toc1_6_1_)    
  - [Rezidive](#toc1_7_)    
    - [Verteilung OP in 2020](#toc1_7_1_)    
      - [davon: Verteilung nur R0](#toc1_7_1_1_)    
  - [Behandlung innerhalb von 6 Wochen](#toc1_8_)    
  - [Erste Behandlung](#toc1_9_)    
    - [Was wurde zuerst behandelt](#toc1_9_1_)    
    - [Zeitlicher Abstand der Behandlungen](#toc1_9_2_)    
  - [Behandlungsverlauf](#toc1_10_)    
  - [🕹️ interaktiv](#toc1_11_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->


1. Kohortenstruktur (ICD-Differenzierung)
Ich würde im ersten Schritt die Kohorte C18–C20 noch aufteilen in:
•              C18
•              C19
•              C20

und die Fallzahlen separat ausweisen. Auf dieser Basis könnten wir dann getrennt weiterarbeiten. Vermutlich werden die C19-Zahlen eher klein sein, sodass man diese ggf. in den weiteren Analysen aus methodischen Gründen ausklammern kann.

2. OPS-Analyse getrennt nach Lokalisation
Bei den OPS würde ich nicht mehr mit dem Sammelfilter C18–C20 arbeiten, sondern drei getrennte Analysen fahren:
•              einmal nur C18
•              einmal nur C19
•              einmal nur C20

Idealerweise jeweils als vollständige Liste (6-stellige OPS-Codes) mit absoluter Anzahl – ggf. als Excel-Export.
Hier wäre auch wichtig zu klären, wie wir Doppelnennungen (mehrere OPS pro Tumor) sauber behandeln oder identifizieren können.

3. Zeitverlauf statt nur regionale Darstellung
Die übliche Darstellung ist ja stark register- bzw. bundeslandbezogen. Zusätzlich fände ich sehr spannend, das Ganze auch im Zeitverlauf darzustellen:
•              2020
•              2021
•              2022
•              2023

und zu sehen, ob sich OP-Techniken oder Dokumentationsqualität verändern.

4. Robotik-Kodierung
Ergänzend sollten wir berücksichtigen, dass der „echte“ Roboter über OPS 5-987.01 generiert wird. Das wäre wichtig, um Robotik korrekt zu identifizieren.


    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.4 | 📦 pandas-plots: 1.2.8 | 📦 connection-helper: 0.13.3


## <a id='toc1_1_'></a>[📆 Datenstand](#toc0_)

    database file:           2026-02-26_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-02-24
    sql table created:       2026-02-26 16:43:32
    doi:                     -
    document created:        2026-03-04 08:14:25


## <a id='toc1_2_'></a>[⚙️ Teildatensatz](#toc0_)
- Filter für gültige Fälle: (dieser Filter ist für **alle** Analysen gesetzt)
  - `z_dy` (Diagnosejahr) in 2020-2024
  - `z_icd10_3d` (Primärdiagnose) in `C18`-`C20`

<!-- ### <a id='toc1_2_1_'></a>[Deskriptive Statistik](#toc0_) -->

## <a id='toc1_3_'></a>[Fallzahlen](#toc0_)



```python
    counts: rows
    ---
    n = 4_000_795                (100.0%) ██████████████████████████████
    └ [2020-2024]: n = 3_743_336  (93.6%) ░░████████████████████████████
    └ [C18-C20]:     n = 284_137   (7.1%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

### <a id='toc1_3_2_'></a>[Fallzahlen C18-C20 in Verhältnis zu allen Diagnosen](#toc0_)
- Filter: alle Diagnosen inkludiert (C,D)


    
![svg](colorectal_files/output_21_0.svg)
    


### <a id='toc1_3_3_'></a>[Fallzahlen C18-C20 nach Viersteller](#toc0_)
- Filter: `C18-20`
> 💡 `C19` darf eigentlich nicht verwendet werden, wird von Krebsgesellschaft nicht akzeptiert



```python
    # filter
    z_dy between 2020 and 2024
    and z_icd10_3d in ('C18','C19','C20')
```

![svg](colorectal_files/output_23_3.svg)
    



    
![svg](colorectal_files/output_23_4.svg)
    


## <a id='toc1_4_'></a>[OP](#toc0_)

### <a id='toc1_4_1_'></a>[Operation erfolgt bei C18 mit T_p > 0](#toc0_)
- Filter: `C18` und pathologisches T in 1-4
> 💡 5% wäre realistisch. patho stadium müsste zwingend vorhanden sein nach OP



```python
    counts: rows
    ---
    n = 284_137                                        (100.0%) ██████████████████████████████
    └ [z_icd10_3d in ('C18')]:             n = 192_963  (67.9%) ░░░░░░░░░░████████████████████
    └ [z_t_p_1 in ('1','2','3','4')]:      n = 150_524  (53.0%) ░░░░░░░░░░░░░░░███████████████
```

![svg](colorectal_files/output_26_3.svg)
    


### <a id='toc1_4_2_'></a>[Operation erfolgt nach Jahren](#toc0_)
- Filter: `C18` und pathologisches T in 1-4
- `categ_treat`
  - `1-op` - OP dokumentiert
  - `2-noop-sy-st` - keine OP dokumentiert, aber ST oder SYST
  - `3-noop-nosy-nost` - keine Behandlung dokumentiert


    
![svg](colorectal_files/output_28_0.svg)
    


## <a id='toc1_5_'></a>[OPS](#toc0_)


### <a id='toc1_5_1_'></a>[OPS 5-4xx nach Diagnose](#toc0_)
- Filter: `C18-C20`
- gezählt sind OPS Angaben, nicht Tumore

<br>



```python
    counts: rows
    ---
    n = 600_790                                        (100.0%) ██████████████████████████████
    └ [z_icd10_3d in ('C18')]:             n = 389_721  (64.9%) ░░░░░░░░░░░███████████████████
    └ [left(Code,3) in ('5-4')]:           n = 217_886  (36.3%) ░░░░░░░░░░░░░░░░░░░░██████████
```

    Anzahl verschiedene ops_codes:  17787

```python
    ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬─────────┐
    │                                                                 ops                                                                 │ cnt_ops │
    │                                                               varchar                                                               │  int32  │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼─────────┤
    │ 5-455.41 - Partielle Resektion des Dickdarmes: Resektion des Colon ascendens mit Coecum und rechter Flexur [Hemikolektomie rechts…  │   30558 │
    │ 5-455.45 - Partielle Resektion des Dickdarmes: Resektion des Colon ascendens mit Coecum und rechter Flexur [Hemikolektomie rechts…  │   21279 │
    │ 5-469.20 - Andere Operationen am Darm: Adhäsiolyse: Offen chirurgisch                                                               │   10308 │
    │ 5-455.75 - Partielle Resektion des Dickdarmes: Sigmaresektion: Laparoskopisch mit Anastomose                                        │    9859 │
    │ 5-406.9 - Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) im Rahmen einer anderen Operation: Mesenterial  │    7681 │
    │ 5-469.21 - Andere Operationen am Darm: Adhäsiolyse: Laparoskopisch                                                                  │    5526 │
    │ 5-484.35 - Rektumresektion unter Sphinktererhaltung: Anteriore Resektion: Laparoskopisch mit Anastomose                             │    4770 │
    │ 5-455.71 - Partielle Resektion des Dickdarmes: Sigmaresektion: Offen chirurgisch mit Anastomose                                     │    4418 │
    │ 5-455.65 - Partielle Resektion des Dickdarmes: Resektion des Colon descendens mit linker Flexur [Hemikolektomie links]: Laparosko…  │    4152 │
    │ 5-455.61 - Partielle Resektion des Dickdarmes: Resektion des Colon descendens mit linker Flexur [Hemikolektomie links]: Offen chi…  │    4115 │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴─────────┤
    │ 10 rows                                                                                                                             2 columns │
    └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

```python
    # filter
    z_dy between 2020 and 2024
    and z_icd10_3d in ('C18','C19','C20')
    and z_icd10_3d in ('C18')
    and left(Code,3) in ('5-4')
```

![svg](colorectal_files/output_32_7.svg)
    



    
![svg](colorectal_files/output_32_8.svg)
    




```python
    counts: rows
    ---
    n = 600_790                                        (100.0%) ██████████████████████████████
    └ [z_icd10_3d in ('C19')]:               n = 6_176   (1.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [left(Code,3) in ('5-4')]:             n = 2_818   (0.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

    Anzahl verschiedene ops_codes:  1473

```python
    ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬─────────┐
    │                                                               ops                                                               │ cnt_ops │
    │                                                             varchar                                                             │  int32  │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼─────────┤
    │ 5-484.35 - Rektumresektion unter Sphinktererhaltung: Anteriore Resektion: Laparoskopisch mit Anastomose                         │     423 │
    │ 5-484.31 - Rektumresektion unter Sphinktererhaltung: Anteriore Resektion: Offen chirurgisch mit Anastomose                      │     160 │
    │ 5-484.55 - Rektumresektion unter Sphinktererhaltung: Tiefe anteriore Resektion: Laparoskopisch mit Anastomose                   │     137 │
    │ 5-462.1 - Anlegen eines Enterostomas (als protektive Maßnahme) im Rahmen eines anderen Eingriffs: Ileostoma                     │     124 │
    │ 5-455.75 - Partielle Resektion des Dickdarmes: Sigmaresektion: Laparoskopisch mit Anastomose                                    │      98 │
    │ 5-484.32 - Rektumresektion unter Sphinktererhaltung: Anteriore Resektion: Offen chirurgisch mit Enterostoma und Blindverschluss │      91 │
    │ 5-469.20 - Andere Operationen am Darm: Adhäsiolyse: Offen chirurgisch                                                           │      77 │
    │ 5-469.21 - Andere Operationen am Darm: Adhäsiolyse: Laparoskopisch                                                              │      72 │
    │ 5-455.71 - Partielle Resektion des Dickdarmes: Sigmaresektion: Offen chirurgisch mit Anastomose                                 │      50 │
    │ 5-484.51 - Rektumresektion unter Sphinktererhaltung: Tiefe anteriore Resektion: Offen chirurgisch mit Anastomose                │      44 │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴─────────┤
    │ 10 rows                                                                                                                         2 columns │
    └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

```python
    # filter
    z_dy between 2020 and 2024
    and z_icd10_3d in ('C18','C19','C20')
    and z_icd10_3d in ('C19')
    and left(Code,3) in ('5-4')
```

![svg](colorectal_files/output_33_7.svg)
    



    
![svg](colorectal_files/output_33_8.svg)
    


    Anzahl verschiedene ops_codes:  13127

```python
    ┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┬─────────┐
    │                                                                 ops                                                                 │ cnt_ops │
    │                                                               varchar                                                               │  int32  │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┼─────────┤
    │ 5-484.55 - Rektumresektion unter Sphinktererhaltung: Tiefe anteriore Resektion: Laparoskopisch mit Anastomose                       │   12538 │
    │ 5-462.1 - Anlegen eines Enterostomas (als protektive Maßnahme) im Rahmen eines anderen Eingriffs: Ileostoma                         │   12045 │
    │ 5-484.35 - Rektumresektion unter Sphinktererhaltung: Anteriore Resektion: Laparoskopisch mit Anastomose                             │    5599 │
    │ 5-485.02 - Rektumresektion ohne Sphinktererhaltung: Abdominoperineal: Kombiniert offen chirurgisch-laparoskopisch                   │    4465 │
    │ 5-484.51 - Rektumresektion unter Sphinktererhaltung: Tiefe anteriore Resektion: Offen chirurgisch mit Anastomose                    │    3493 │
    │ 5-465.1 - Rückverlagerung eines doppelläufigen Enterostomas: Ileostoma                                                              │    3223 │
    │ 5-469.21 - Andere Operationen am Darm: Adhäsiolyse: Laparoskopisch                                                                  │    3132 │
    │ 5-469.20 - Andere Operationen am Darm: Adhäsiolyse: Offen chirurgisch                                                               │    3043 │
    │ 5-484.65 - Rektumresektion unter Sphinktererhaltung: Tiefe anteriore Resektion mit peranaler Anastomose: Laparoskopisch mit Anast…  │    2846 │
    │ 5-406.9 - Regionale Lymphadenektomie (Ausräumung mehrerer Lymphknoten einer Region) im Rahmen einer anderen Operation: Mesenterial  │    2508 │
    ├─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┴─────────┤
    │ 10 rows                                                                                                                             2 columns │
    └───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

```python
    # filter
        z_icd10_3d in ('C20')
        and left(ops.Code,3) in ('5-4')
        and 
        z_dy between 2020 and 2024
```

![svg](colorectal_files/output_34_4.svg)
    



    
![svg](colorectal_files/output_34_5.svg)
    


### <a id='toc1_5_2_'></a>[ Verteilung OPS 5-455 bei C18](#toc0_)
- Filter: `C18` und `M0`
- gezählt sind Tumore
- `has_5-455`: True wenn Tumor >= 1 OPS 5-455 hat
> 💡 Erwartet sind ~95% Anteil für True, tatsächlich sind es für D ~75%

    FILTER: z_icd10_3d = 'C18' and z_m_pc_1 = '0'
    



    
![svg](colorectal_files/output_36_1.svg)
    


### <a id='toc1_5_3_'></a>[ Verteilung OPS 5-484 bei C20](#toc0_)
- Filter: `C18` und `M0`
- `has_5-48x`: True wenn Tumor >= 1 OPS 5-484 oder 5-485 hat
> 💡 ~40% haben True, weniger als erwartet 


    
![svg](colorectal_files/output_38_0.svg)
    


### <a id='toc1_5_4_'></a>[Details OPS 5-455.2](#toc0_)
- Filter: `C18-C20`, alle Tumore mit min 1 OP
- gezählt sind Tumore / OPS
- die Gruppen können überlappen bei der Tumordarstellung
  - `lleo` - Ileozökalresektion
  - `hemi` - rechte Hemikolektomie
  - `sigma` - Sigmaresektion
- in allen Darstellungen ist Robotik ebenfalls angegeben (`5-987`) bzw `5-987.01`
  <!-- - `-` - keine der genannten OPS -->



```python
    counts: distinct z_tum_id
    ---
    n = 284_137                                        (100.0%) ██████████████████████████████
    └ [z_tum_op_count > 0]:                n = 185_057  (65.1%) ░░░░░░░░░░░███████████████████
    └ [ops]:                                n = 89_983  (31.7%) ░░░░░░░░░░░░░░░░░░░░░█████████
```


```python
    # filter
    z_dy between 2020 and 2024
    and z_icd10_3d in ('C18','C19','C20')
    and z_tum_op_count > 0
    and 
        (
            left(Code,7) in ('5-455.2', '5-455.4', '5-455.7')
            OR left(Code,5) in ('5-987')
        )
```

    n = 89_983 | n(true) = 89_983



    
![png](colorectal_files/output_41_4.png)
    


#### <a id='toc1_5_4_1_'></a>[Ileozökalresektion](#toc0_)
- Filter: alle Tumore, die einen OPS Code `5-455.2` aufweisen
- Gruppen
  - `5-455.21` - offen
  - `5-455.25` - laparoskopisch
  - `5-455.27` - konversion

> 💡 keine Robotik `5-987.1` geschlüsselt für diese Tumore



```python
    counts: distinct z_tum_id
    ---
    n = 284_137                         (100.0%) ██████████████████████████████
    └ [z_tum_op_count > 0]: n = 185_057  (65.1%) ░░░░░░░░░░░███████████████████
    └ [ops-lleo]:            n = 15_269   (5.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```


```python
    # filter
        z_dy between 2020 and 2024
        and z_icd10_3d in ('C18','C19','C20')
        and (left(Code,8) in ('5-455.21', '5-455.25', '5-455.27') OR left(Code,5) in ('5-987'))
```

    n = 15_269 | n(true) = 15_269



    
![png](colorectal_files/output_44_4.png)
    


#### <a id='toc1_5_4_2_'></a>[rechte Hemikolektomie](#toc0_)
- Filter: alle Tumore, die einen OPS Code `5-455.4` aufweisen
- gezählt sind Tumore
- die Gruppen können überlappen

> 💡 kaum Robotik `5-987.1` geschlüsselt für diese Tumore (n=4)



```python
    counts: distinct z_tum_id
    ---
    n = 284_137                         (100.0%) ██████████████████████████████
    └ [z_tum_op_count > 0]: n = 185_057  (65.1%) ░░░░░░░░░░░███████████████████
    └ [ops-hemi]:            n = 64_476  (22.7%) ░░░░░░░░░░░░░░░░░░░░░░░░██████
```


```python
    # filter
        z_dy between 2020 and 2024
        and z_icd10_3d in ('C18','C19','C20')
        and 
        (
            left(Code,8) in ('5-455.41', '5-455.45', '5-455.47')
            OR left(Code,5) in ('5-987')
        )
```

    n = 64_476 | n(true) = 64_476



    
![png](colorectal_files/output_47_4.png)
    


#### <a id='toc1_5_4_3_'></a>[Sigmaresektion](#toc0_)
- Filter: alle Tumore, die einen OPS Code `5-455.7` aufweisen
- gezählt sind Tumore
- die Gruppen können überlappen

> 💡 kaum Robotik `5-987.1` geschlüsselt für diese Tumore (n=4)



```python
    counts: distinct z_tum_id
    ---
    n = 284_137                         (100.0%) ██████████████████████████████
    └ [z_tum_op_count > 0]: n = 185_057  (65.1%) ░░░░░░░░░░░███████████████████
    └ [ops-sigma]:           n = 28_290  (10.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```


```python
    # filter
        z_dy between 2020 and 2024
        and z_icd10_3d in ('C18','C19','C20')
        and 
        (
            left(Code,8) in ('5-455.71', '5-455.75', '5-455.77')
            OR left(Code,5) in ('5-987')
        )
```

    n = 28_290 | n(true) = 28_290



    
![png](colorectal_files/output_50_4.png)
    


## <a id='toc1_6_'></a>[Lokalisation (Fernmetastasen)](#toc0_)


### <a id='toc1_6_1_'></a>[für M1](#toc0_)
- Filter: `C18`-`C20`, nur `M1`
- gezählt sind Tumore. Allerdings: Bei mehrfachen FM Angaben werden Tumore **mehrfach** gezählt

> 💡 45% von M1 haben Leber FM

    599_413 Tumore im Filter haben M1, 590_364 haben M0



    
![svg](colorectal_files/output_54_0.svg)
    


## <a id='toc1_7_'></a>[Rezidive](#toc0_)

### <a id='toc1_7_1_'></a>[Verteilung OP in 2020](#toc0_)
- Filter: `C18`-`C20`, 2020
- gezählt sind Tumore
- Einteilung der Verteilung in eine Kategorie Tabelle
  - `1_op_r0` - OP und R0 dokumentiert
  - `2_op_no_r0` - OP, kein R0
  - `3_no_op_but_pt` - keine OP, aber pT (Diagnose oder Verlauf)
  - `4_no_op_pt_but_st_sy` - keine OP, keine pT, aber ST oder SYST
  - `5_no_op_st_sy_pt` - keine Therapie oder pT




```python
    counts: rows
    ---
    n = 284_137                            (100.0%) ██████████████████████████████
    └ [z_dy = 2020]:            n = 57_996  (20.4%) ░░░░░░░░░░░░░░░░░░░░░░░░██████
    └ [z_icd10_3d in ('C18')]:  n = 39_316  (13.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░████
```

![svg](colorectal_files/output_58_0.svg)
    


- `r_status`
  - `1_R0`: wenn >= 1 OP zum Tumor dokumentiert is mit `R0`
  - `2_R1_R2`: wenn kein `R0` dokumentiert, aber >= 1 OP mit `R1` oder `R2`
  - `3_NA_U_RX`: wenn beides nicht zutrifft (Feld ist leer, `U` oder `RX`)


    
![svg](colorectal_files/output_60_0.svg)
    



    
![png](colorectal_files/output_60_1.png)
    


#### <a id='toc1_7_1_1_'></a>[davon: Verteilung nur R0](#toc0_)

**enge Definition eines Rezidivs** 
- Filter: lokaler Beurteilung Residualstatus = R0 (UND M <> 1)
- Rezidiv wenn  
  - Gesamtbeurteilung: Y  oder  
  - Lokaler Tumorstatus: R  oder  
  - Tumorstatus Lymphknoten:R oder  
  - Verlauf Fernmetastasen:R   

**erweiterte Definition (Verworfen)**
- Rezidiv wenn
  - (TNM)r_Symbol:r UND 
  - (Folgeereignis T>0 oder Folgeereignis N>0 oder Folgeereignis M>0)

**Diagramm**
- gezählt sind Tumore mit R0
- Kategorien
  - `1_fo_relapse` - Tumore mit Rezidiv nach enger Definition
  - `2_fo_relapse_tnm` - Tumore mit Rezidiv nach erweiterter Definition
  - `3_fo_no_relapse` - Tumore mit Folgeereignis ohne o.a. Rezidiv
  - `4_no_fo` - Tumore ohne Folgeereignis



```python
    counts: distinct z_tum_id
    ---
    n = 284_137                            (100.0%) ██████████████████████████████
    └ [z_dy = 2020]:            n = 57_996  (20.4%) ░░░░░░░░░░░░░░░░░░░░░░░░██████
    └ [Residualstatus R0]:      n = 29_567  (10.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░███
    └ [z_icd10_3d in ('C18')]:  n = 20_605   (7.3%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

![svg](colorectal_files/output_63_0.svg)
    



    
![png](colorectal_files/output_63_1.png)
    


<br>

## <a id='toc1_8_'></a>[Behandlung innerhalb von 6 Wochen](#toc0_)
- Filter: `C18`-`C20`
- `first_treatment_6w`
  - `<=6w`: erste Behandlung innerhalb von 6 Wochen
  - `>6w`: erste Behandlung nach 6 Wochen
  - `-`: keine Behandlung dokumentiert


    
![svg](colorectal_files/output_65_0.svg)
    



    
![svg](colorectal_files/output_65_1.svg)
    


## <a id='toc1_9_'></a>[Erste Behandlung](#toc0_)

### <a id='toc1_9_1_'></a>[Was wurde zuerst behandelt](#toc0_)
- Filter: `M1` und Tumor hat Lebermetastasen und `C18` oder `C20`
- gezählt sind Tumore


    
![svg](colorectal_files/output_68_0.svg)
    


### <a id='toc1_9_2_'></a>[Zeitlicher Abstand der Behandlungen](#toc0_)
- Filter: `C18`, Tumore mit Behandlung
- gezählt sind Tumore
- abgebildet sind Median Werte für den Abstand Diagnose bis erste Behandlung in Tagen (logarithmische Skala)


    
![png](colorectal_files/output_70_0.png)
    


    
    column (n = 139_071)         |    notnull     | min | lower | q25  | median | mean  |  q75  | upper |  max  |  std  |  cv 
    -----------------------------+----------------+-----+-------+------+--------+-------+-------+-------+-------+-------+-----
    z_first_treatment_after_days | 139_071 (100%) |   0 |     0 | 2.00 |  12.00 | 24.94 | 25.00 |    59 | 2_092 | 73.63 | 2.95
    
    
    item (n = 139_071) | count  | min  | lower | q25  | median | mean  |  q75  | upper |   max    |  std  |  cv 
    -------------------+--------+------+-------+------+--------+-------+-------+-------+----------+-------+-----
    01-SH              |  5_899 | 0.00 |  0.00 | 3.00 |  14.00 | 22.26 | 27.00 | 63.00 | 1_520.00 | 56.66 | 2.54
    02-HH              |  2_962 | 0.00 |  0.00 | 1.00 |   9.00 | 21.21 | 21.00 | 51.00 | 1_413.00 | 65.26 | 3.08
    03-NI              | 12_255 | 0.00 |  0.00 | 3.00 |  14.00 | 28.50 | 29.00 | 68.00 | 1_645.00 | 83.94 | 2.95
    04-HB              |  1_172 | 0.00 |  0.00 | 5.00 |  13.00 | 21.88 | 25.00 | 55.00 | 1_584.00 | 65.25 | 2.98
    05-NW              | 27_852 | 0.00 |  0.00 | 3.00 |  12.00 | 27.86 | 24.00 | 55.00 | 2_051.00 | 89.89 | 3.23
    06-HE              |  8_495 | 0.00 |  0.00 | 3.00 |  12.00 | 23.84 | 24.00 | 55.00 | 1_615.00 | 67.95 | 2.85
    07-RP              |  6_888 | 0.00 |  0.00 | 0.00 |  10.00 | 24.73 | 24.00 | 60.00 | 1_743.00 | 77.67 | 3.14
    08-BW              | 17_655 | 0.00 |  0.00 | 2.00 |  13.00 | 28.43 | 28.00 | 67.00 | 1_573.00 | 79.71 | 2.80
    09-BY              | 21_126 | 0.00 |  0.00 | 2.00 |  13.00 | 26.55 | 28.00 | 67.00 | 2_092.00 | 74.38 | 2.80
    10-SL              |  1_496 | 0.00 |  0.00 | 2.00 |  10.00 | 19.18 | 24.00 | 57.00 |   387.00 | 35.64 | 1.86
    11-BE              |  6_033 | 0.00 |  0.00 | 2.00 |  10.00 | 20.27 | 21.00 | 49.00 | 1_289.00 | 57.73 | 2.85
    12-BB              |  5_221 | 0.00 |  0.00 | 3.00 |  11.00 | 20.79 | 23.00 | 53.00 | 1_098.00 | 48.08 | 2.31
    13-MV              |  2_891 | 0.00 |  0.00 | 0.00 |  10.00 | 18.68 | 25.00 | 62.00 |   898.00 | 39.47 | 2.11
    14-SN              |  9_823 | 0.00 |  0.00 | 2.00 |  12.00 | 19.77 | 25.00 | 59.00 | 1_325.00 | 43.00 | 2.17
    15-ST              |  5_175 | 0.00 |  0.00 | 2.00 |  11.00 | 18.89 | 21.00 | 49.00 | 1_701.00 | 48.86 | 2.59
    16-TH              |  4_128 | 0.00 |  0.00 | 0.00 |   8.00 | 20.03 | 20.00 | 50.00 | 1_939.00 | 78.47 | 3.92
    


## <a id='toc1_10_'></a>[Behandlungsverlauf](#toc0_)
- Filter: `C18`, nur Tumore mit Therapie
- gezählt sind Tumore
- beschränkt auf die ersten 5 Therapien
- Therapien mit gleichem Tumor / Datum / Behandlung sind zusammengeführt
- verschiedene Therapien mit gleichem Tumor und Datum sind hier nicht entfernt



```python
    # filter
        z_dy between 2020 and 2024
        and z_icd10_3d in ('C18')
```

    darin 192_963 Tumore, 617_495 deduplizierte Therapien | darin mit Datum: 139_260 Tumore, 212_397 Therapien



    
![svg](colorectal_files/output_73_0.svg)
    


## <a id='toc1_11_'></a>[🕹️ interaktiv](#toc0_)
