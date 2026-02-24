# <a id='toc1_'></a>[Technische Prüfungen in klinischen und epi Daten](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Technische Prüfungen in klinischen und epi Daten](#toc1_)    
  - [Hintergrund](#toc1_1_)    
  - [Zusammenfassung ⚖️](#toc1_2_)    
  - [⚙️ settings](#toc1_3_)    
  - [Datenstand ⏱️](#toc1_4_)    
  - [Qualitätsprüfungen](#toc1_5_)    
    - [⚠️ geschlecht_missing](#toc1_5_1_)    
    - [✅ verstorben_missing](#toc1_5_2_)    
    - [⚠️ diagnose_missing](#toc1_5_3_)    
    - [⚠️ inzidenzort_missing](#toc1_5_4_)    
    - [✅ geschlecht_icd_konflikt](#toc1_5_5_)    
    - [⚠️ datum_missing](#toc1_5_6_)    
    - [datum_fehlerhaft](#toc1_5_7_)    
  - [⚠️ Duplikate](#toc1_6_)    
    - [Echte Duplikate](#toc1_6_1_)    
    - [Duplikatverdacht](#toc1_6_2_)    
      - [Verteilung nach Inzidenzort](#toc1_6_2_1_)    
      - [Verteilung nach Diagnosejahr](#toc1_6_2_2_)    
      - [Verteilung nach ICD10](#toc1_6_2_3_)    
      - [Verteilung der Gruppen mit gleichen Merkmalen](#toc1_6_2_4_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

<br>

## <a id='toc1_1_'></a>[Hintergrund](#toc0_)
- Ziel der Auswertungen ist es, Qualitätsprüfungen auf **technischer** Ebene darzustellen
- im Abgrenzung zu den **inhaltlichen** Prüfungen des klinischen Datenberichtes sollen hier eher Auffälligkeiten des Verarbeitungsprozesses sichtbar werden, z.B. missings / Konflikte bei zentralen Variablen wie Datumsangaben, Geschlecht etc.
- die Auswertungen sind angelehnt an die bei den epi Daten etablierten _ABC Prüfungen_ (siehe `Bericht zur Datenqualität (epi2023)`)
- die Abgrenzung dieses Dokumentes zum DQ Bericht epi ist derzeit nicht zufriedenstellend gelöst und muss zukünftig verbessert werden
- dargestellt sind hier jeweils Auffälligkeiten sowohl in den klinischen als auch in den epi Daten
- weiterhin nehmen wir bei keinem dieser Prüfungen eine Korrektur in den **klinischen Daten** vor

## <a id='toc1_2_'></a>[Zusammenfassung ⚖️](#toc0_)
- [fehlendes Geschlecht](#toc1_4_1_) tritt nicht auf in den klinischen Daten, in den epi Daten überwiegend in `06-HE`
- für [fehlende Diagnose](#toc1_4_3_) bei den klinischen Daten gibt es einige wenige Fälle in `13-MV` und `16-TH`. Für die epi Daten ist eine Bewertung schwierig aufgrund der vielfältigen Bearbeitungsschritte nach Lieferung
- fehlender Inzidenzort tritt in den klinischen Daten nur in `13-MV` auf. Bei den epi Daten wird diese Variable bei missings auto-korrigiert 
- Widerspruch zwischen Geschlecht und Diagnose ist in den klinischen Daten eine Randerscheinung, in den epi Daten treten diese Kombinationen inzwischen nicht mehr auf
- fehlende Datumsangaben sind in den klinischen Daten in etwa proportional zur Registergrösse, bei den epi Daten überwiegend in `10-SL`
- [echte Duplikate](#toc1_5_1_) (gleiches set an Merkmalen und gleiche ID) für klinische Daten kommen ausschliesslich aus `09-BY`, bleiben aber Randfälle
- [Duplikatverdachtsfälle](#toc1_5_2_) sind deutlich weniger auffällig als letztes Jahr. Diese verteilen sich hauptsächlich auf `11-BE`, `09-BY` und `03-NI`, was möglicherweise an lokalen Häufungen von Fällen mit gleichem Inzidenzort liegt

<br>

## <a id='toc1_3_'></a>[⚙️ settings](#toc0_)

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.4 | 📦 pandas-plots: 1.2.3 | 📦 connection-helper: 0.13.3


<br>

## <a id='toc1_4_'></a>[Datenstand ⏱️](#toc0_)

    database file:           2026-02-19_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-02-15
    sql table created:       2026-02-19 14:42:56
    doi:                     -
    document created:        2026-02-24 08:52:00
    
    database file:           2025-06-20_data_epi.duckdb
    data tag:                epi2024_2
    sql table created:       2025-06-20 15:31:26
    doi:                     10.18444/5.03.01.0005.0020.0002
    document created:        2026-02-24 08:52:00


<div style="page-break-after: always;"></div>

## <a id='toc1_5_'></a>[Qualitätsprüfungen](#toc0_)
- kein Filter, die Prüfungen wirken auf den gesamten Datenbestand
- zur Darstellung wird eine heatmap verwendet, dem maximalen Wert je Prüfung wird die kräftigste Farbe zugewiesen. Aus diesem relativ gesetzten Farbton ist nicht ableitbar, wie schwerwiegend die Fallzahl ist

<br>

### <a id='toc1_5_1_'></a>[⚠️ geschlecht_missing](#toc0_)
- Variable `Geschlecht` / `SEX` missing

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_14_1.png)
    


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_15_1.png)
    


<br>

### <a id='toc1_5_2_'></a>[✅ verstorben_missing](#toc0_)
- Variable `Verstorben` / `TOD` missing

>Die Variable `TOD` wird in den epi Daten imputiert, kann also dort auch nicht fehlen

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_17_1.png)
    


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_18_1.png)
    


<br>

### <a id='toc1_5_3_'></a>[⚠️ diagnose_missing](#toc0_)
- Variable `Diagnose_ICD10_Code` ist 
  - leer (konkret sind hier die Felder bei der Übermittlung zumeist nicht fehlend, sondern als `''` kodiert)
  - oder nicht in [`C`,`D`]
> klin: nur wenige Kodierungen im Datensatz aus anderen Kapiteln

> ⚠️ epi: In den ABC Prüfungen der epi Daten wird getestet, ob ein Diagnosecode leer ist oder ausserhalb des "Diagnosebandes" des ZfKD (konkret: `A_ICD10_keineAuswertung[54]`). Der Test ist auch im Datenbericht der epi Daten sichtbar, dort wird allerdings nur das letzte DJ herangezogen, um auf die aktuelle Entwicklung zu fokussieren.


    🟧 🗄️ klin



    
![png](clin_3_check_files/output_20_1.png)
    


    Verteilung icd10 ausserhalb [C,D]: {None: 397}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_21_1.png)
    


    Verteilung icd10 ausserhalb [C,D]: {None: 34482}


<br>

### <a id='toc1_5_4_'></a>[⚠️ inzidenzort_missing](#toc0_)
- Variable `Inzidenzort` fehlt, oder ist unbrauchbar kodiert (_00000_, _99999_, oder Länge !> 5)
> epi: die Variable GKZlk wird nachbearbeitet im workflow

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_23_1.png)
    


    Verteilung inzidenzort missing oder ungültig{'99999': 47, None: 1000}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_24_1.png)
    


    Verteilung inzidenzort missing oder ungültig{}


<br>

### <a id='toc1_5_5_'></a>[✅ geschlecht_icd_konflikt](#toc0_)
- Widerspruch zwischen Geschlecht und Diagnose, eines der Kombinationen:
  - männlich und `['C51','C52','C53','C54','C55','C56','C57','C58']`
  - weiblich und `['C60','C61','C62','C63']`

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_26_1.png)
    


    Kombination Geschlecht - ICD10 ungültig: {'C61-W': 31, 'C62-W': 5, 'C56-M': 4, 'C54-M': 3, 'C53-M': 2, 'C63-W': 2, 'C52-M': 2, 'C57-M': 1, 'C60-W': 1, 'C55-M': 1, 'C51-M': 1, 'C58-M': 1}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_27_1.png)
    


    Kombination Geschlecht - ICD10 ungültig: {'C61-W': 7, 'C56-M': 1, 'C52-M': 1, 'C62-W': 1, 'C63-W': 1}


<br>

### <a id='toc1_5_6_'></a>[⚠️ datum_missing](#toc0_)
- `Diagnosedatum` oder `Geburtsdatum` ist leer (bzw. als Jahr 1900 kodiert)
- nicht gesetzte Angaben zum Vitalstatus sind ignoriert
> ⚠️ hier sind auch regulär übermittelte Fälle mit vollständig (`V`) geschätztem Datum enthalten

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_29_1.png)
    


    Verteilung top 3 (GebDat - DiagDat): {'1900-04-01-2023-07-15': 72, '1900-04-01-2024-01-15': 59, '1900-04-01-2024-03-15': 47}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_30_1.png)
    


    Verteilung top 3 (GebDat - DiagDat): {'<NA>-': 155, '1932-06-15-1900-04-15': 12, '1937-02-15-1900-04-15': 12}


<br>

### <a id='toc1_5_7_'></a>[datum_fehlerhaft](#toc0_)
- `Vitalstatus` vor `Geburt` oder `Diagnose` vor/gleich `Geburt`
- alle 3 beteiligten Felder dürfen nicht missing sein

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_32_1.png)
    


    Verteilung datum_fehlerhaft top 5:

```python
    ┌──────────────┬───────────────┬───────┐
    │ Geburtsdatum │ Diagnosedatum │  cnt  │
    │     date     │     date      │ int64 │
    ├──────────────┼───────────────┼───────┤
    │ 2023-11-15   │ 2023-11-15    │     4 │
    │ 2023-01-15   │ 2023-01-15    │     3 │
    │ 2020-10-15   │ 2020-10-15    │     3 │
    │ 2023-03-15   │ 2023-03-15    │     3 │
    │ 2020-11-15   │ 2020-11-15    │     3 │
    └──────────────┴───────────────┴───────┘
```

    🟧 🗄️ epi



    
![png](clin_3_check_files/output_33_1.png)
    


    Verteilung datum_fehlerhaft top 5:

```python
    ┌──────────────┬───────────────┬───────┐
    │ Geburtsdatum │ Diagnosedatum │  cnt  │
    │     date     │     date      │ int64 │
    ├──────────────┼───────────────┼───────┤
    │ 2013-09-15   │ 2013-09-15    │    12 │
    │ 2013-04-15   │ 2013-04-15    │    10 │
    │ 2013-11-15   │ 2013-11-15    │    10 │
    │ 2019-03-15   │ 2019-03-15    │    10 │
    │ 2019-04-15   │ 2019-04-15    │    10 │
    └──────────────┴───────────────┴───────┘
```

## <a id='toc1_6_'></a>[⚠️ Duplikate](#toc0_)

- Echte Duplikate stellen Fälle **mit gleicher Id und gleichem hash-wert dar**
- Duplikat-Verdacht: Duplikate **mit gleicher Id**, **aber ohne inhaltliche Gleichheit** sind häufiger, stellen aber lediglich eine Folge der Id Vergabe im GTDS Verbund dar. Da in der Verarbeitung eine zufällige `uuid` vergeben wird entstehen hier auch keine Kollisionen

<br/>

### <a id='toc1_6_1_'></a>[Echte Duplikate](#toc0_)
- analysiert werden Tumorfälle auf Basis gleicher `Tumor_ID` (original gelieferte Id)
- ebenfalls herangezogen wird ein #️⃣hash-wert über eine Auswahl von Spalten
- haben Tumorfälle den gleichen hash-wert, kann eine inhaltliche Gleichheit **angenommen** werden

- **Ergebnis**
  - ~1000 Paare mit echten Duplikaten sind in den Daten, alle aus `09-BY`.
  - keine der Paare sind innerhalb einer Lieferdatei, also keine Gefahr für die Verarbeitung
  - im Beispiel sind zwei Tumore mit gleicher originalen ID und gleichem hash-wert, aber verschiedenen Dateien
  - in allen Duplikaten werden technische ID neu vergeben, es kommt also nicht zu Kollisionen

Tests:

    Für den hash-wert sind folgende Spalten herangezogen:
    Diagnose_ICD10_Code, Morphologie_Code, Topographie_Code, Geburtsdatum, Diagnosedatum, Geschlecht, Verstorben, Inzidenzort, Seitenlokalisation, T_p, Grading, N_p, Diagnosesicherung, M_p


    Echte Duplikate (gleiche Tumor_ID UND gleicher Inhalt/hash):

```python
    ┌──────┬──────────┬───────────┬───────────┬───────────────────┬────────────────────────────────────────────┐
    │ kkr  │ same_kkr │ same_file │ cnt_cases │ max_cases_in_dupl │              example_Tumor_ID              │
    │ int8 │ boolean  │  boolean  │   int64   │       int64       │                  varchar                   │
    ├──────┼──────────┼───────────┼───────────┼───────────────────┼────────────────────────────────────────────┤
    │    9 │ true     │ false     │         4 │                 2 │ 0C38B26E95677F0A15C56E8F238CFBFC4D94EB76_1 │
    └──────┴──────────┴───────────┴───────────┴───────────────────┴────────────────────────────────────────────┘
![png](clin_3_check_files/output_38_0.png)
<br>
### <a id='toc1_6_2_'></a>[Duplikatverdacht](#toc0_)
- die originale `Tumor_ID` wird hier ignoriert
- es wird für alle Tumorfälle geprüft, ob es Fälle mit gleicher Kombination verschiedener Merkmale gibt
- Verdachtsfälle mit gleicher Kombination aus verschiedenen Registern und Patienten sind möglich
- die Übereinstimmungswahrscheinlichkeit steigt deutlich, wenn mehr Merkmale leer sind
    Verwendete Merkmale: Diagnose_ICD10_Code, Morphologie_Code, Topographie_Code, Geburtsdatum, Diagnosedatum, Geschlecht, Verstorben, Inzidenzort, Seitenlokalisation, T_p, Grading, N_p, Diagnosesicherung, M_p
    🟧 🗄️ klin
![png](clin_3_check_files/output_40_1.png)
    🟧 🗄️ epi
![png](clin_3_check_files/output_41_1.png)
<br>
#### <a id='toc1_6_2_1_'></a>[Verteilung nach Inzidenzort](#toc0_)
    🟧 🗄️ klin
![svg](clin_3_check_files/output_43_1.svg)
    🟧 🗄️ epi
![svg](clin_3_check_files/output_44_1.svg)
<br>
#### <a id='toc1_6_2_2_'></a>[Verteilung nach Diagnosejahr](#toc0_)
    🟧 🗄️ klin
![svg](clin_3_check_files/output_46_1.svg)
    🟧 🗄️ epi
![svg](clin_3_check_files/output_47_1.svg)
<br>
#### <a id='toc1_6_2_3_'></a>[Verteilung nach ICD10](#toc0_)
    🟧 🗄️ klin
![svg](clin_3_check_files/output_49_1.svg)
    🟧 🗄️ epi
![svg](clin_3_check_files/output_50_1.svg)
<br>
#### <a id='toc1_6_2_4_'></a>[Verteilung der Gruppen mit gleichen Merkmalen](#toc0_)
- "_Gruppe_" = >1 Verdachtsfälle mit gleichen Merkmalen
- verwendete Metriken (jeweils aufgetragen: `is_equal` = "alle Fälle in der Gruppe haben den gleichen Wert")
> es gibt wenige Gruppen, in denen die Duplikate aus verschiedenen kkr stammen  
> in den meisten Gruppen stammen die Duplikate nicht von einem einzelnen Patienten  
    🟧 🗄️ klin
    8_917 Fälle verteilen sich auf 4_303 Gruppen mit max 14 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 4172, False: 131}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 3903, True: 400}
    🟧 🗄️ epi
    36_512 Fälle verteilen sich auf 18_022 Gruppen mit max 6 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 18022}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 16671, True: 1351}
    ┌──────────────────────┬─────────────────────┬──────────────────┬──────────────────┬────────────────┬────────────────┬────────────────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬───────────────────┬────────────────┬──────────┬──────────────┬─────────────┬─────────────┬────────────┬────────────┬──────────────┬──────────────────────────┬───────────────┬───────────────────────────┬───────────────────┬───────────────────────────────┬──────────────────────┬──────────────────────┬───────┬──────────┬──────────┐
    │        hash2         │ Diagnose_ICD10_Code │ Morphologie_Code │ Topographie_Code │ UICC_Stadium_c │ UICC_Stadium_p │ Seitenlokalisation │   T_c   │   T_p   │ Grading │   N_p   │   N_c   │   M_c   │   M_p   │ Diagnosesicherung │ Lieferregister │ icd10_3d │ Diagnosejahr │ Inzidenzort │ Geburtsjahr │ Geschlecht │ Verstorben │ Geburtsdatum │ Geburtsdatum_Genauigkeit │ Diagnosedatum │ Diagnosedatum_Genauigkeit │ Datum_Vitalstatus │ Datum_Vitalstatus_Genauigkeit │       hash2_1        │      hash2_1_1       │  cnt  │ same_kkr │ same_pat │
    │        uint64        │       varchar       │     varchar      │     varchar      │    varchar     │    varchar     │      varchar       │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │      varchar      │      int8      │ varchar  │    int16     │   varchar   │    int32    │  varchar   │  varchar   │     date     │         varchar          │     date      │          varchar          │       date        │            varchar            │        uint64        │        uint64        │ int64 │ boolean  │ boolean  │
    ├──────────────────────┼─────────────────────┼──────────────────┼──────────────────┼────────────────┼────────────────┼────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼───────────────────┼────────────────┼──────────┼──────────────┼─────────────┼─────────────┼────────────┼────────────┼──────────────┼──────────────────────────┼───────────────┼───────────────────────────┼───────────────────┼───────────────────────────────┼──────────────────────┼──────────────────────┼───────┼──────────┼──────────┤
    │ 10556211587058328709 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2023 │ 15091       │        1933 │ M          │ N          │ 1933-11-15   │ T                        │ 2023-08-15    │ T                         │ 2023-09-15        │ T                             │ 10556211587058328709 │ 10556211587058328709 │     2 │ true     │ true     │
    │ 10556211587058328709 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2023 │ 15091       │        1933 │ M          │ N          │ 1933-11-15   │ T                        │ 2023-08-15    │ T                         │ 2023-09-15        │ T                             │ 10556211587058328709 │ 10556211587058328709 │     2 │ true     │ true     │
    │ 17840342579085567314 │ C44                 │ 8090/3           │ C44.65           │ NULL           │ I              │ R                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2014 │ 13076       │        1947 │ W          │ N          │ 1947-03-15   │ T                        │ 2014-02-15    │ T                         │ 2024-10-15        │ T                             │ 17840342579085567314 │ 17840342579085567314 │     2 │ true     │ true     │
    │ 17840342579085567314 │ C44                 │ 8090/3           │ C44.65           │ NULL           │ I              │ R                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2014 │ 13076       │        1947 │ W          │ N          │ 1947-03-15   │ T                        │ 2014-02-15    │ T                         │ 2024-10-15        │ T                             │ 17840342579085567314 │ 17840342579085567314 │     2 │ true     │ true     │
    │ 12823941046324386826 │ D03.5               │ 8742/2           │ C44.51           │ NULL           │ 0              │ L                  │ NULL    │ is      │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             12 │ D03      │         2021 │ 12065       │        1938 │ M          │ N          │ 1938-09-15   │ T                        │ 2021-09-15    │ T                         │ 2021-10-15        │ T                             │ 12823941046324386826 │ 12823941046324386826 │     2 │ true     │ true     │
    │ 12823941046324386826 │ D03.5               │ 8742/2           │ C44.51           │ NULL           │ 0              │ L                  │ NULL    │ is      │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             12 │ D03      │         2021 │ 12065       │        1938 │ M          │ N          │ 1938-09-15   │ T                        │ 2021-09-15    │ T                         │ 2021-10-15        │ T                             │ 12823941046324386826 │ 12823941046324386826 │     2 │ true     │ true     │
    │ 17828479518542558588 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2019 │ 09376       │        1928 │ W          │ J          │ 1928-10-15   │ T                        │ 2019-05-15    │ T                         │ 2024-08-15        │ T                             │ 17828479518542558588 │ 17828479518542558588 │     2 │ true     │ true     │
    │ 17828479518542558588 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2019 │ 09376       │        1928 │ W          │ J          │ 1928-10-15   │ T                        │ 2019-05-15    │ T                         │ 2024-08-15        │ T                             │ 17828479518542558588 │ 17828479518542558588 │     2 │ true     │ true     │
    │  6955736735644645174 │ C18.7               │ 8140/3           │ C18.7            │ NULL           │ NULL           │ T                  │ X       │ 3       │ 2       │ 0       │ X       │ 0       │ 0       │ 7                 │              3 │ C18      │         2024 │ 03252       │        1963 │ M          │ N          │ 1963-10-15   │ T                        │ 2024-01-15    │ T                         │ 2025-09-15        │ T                             │  6955736735644645174 │  6955736735644645174 │     2 │ true     │ true     │
    │  6955736735644645174 │ C18.7               │ 8140/3           │ C18.7            │ NULL           │ NULL           │ T                  │ X       │ 3       │ 2       │ 0       │ X       │ 0       │ 0       │ 7                 │              3 │ C18      │         2024 │ 03252       │        1963 │ M          │ N          │ 1963-10-15   │ T                        │ 2024-01-15    │ T                         │ 2025-09-15        │ T                             │  6955736735644645174 │  6955736735644645174 │     2 │ true     │ true     │
    │  2210913079643294951 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2013 │ 09362       │        1934 │ W          │ N          │ 1934-10-15   │ T                        │ 2013-02-15    │ T                         │ 2021-10-15        │ T                             │  2210913079643294951 │  2210913079643294951 │     2 │ true     │ true     │
    │  2210913079643294951 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2013 │ 09362       │        1934 │ W          │ N          │ 1934-10-15   │ T                        │ 2013-02-15    │ T                         │ 2021-10-15        │ T                             │  2210913079643294951 │  2210913079643294951 │     2 │ true     │ true     │
    │ 15791116088353961633 │ C34.1               │ 8140/3           │ C34.1            │ NULL           │ NULL           │ R                  │ 4       │ NULL    │ 1       │ NULL    │ 0       │ 1c      │ NULL    │ 7                 │              3 │ C34      │         2023 │ 03252       │        1945 │ W          │ J          │ 1945-06-15   │ T                        │ 2023-11-15    │ T                         │ 2024-04-15        │ T                             │ 15791116088353961633 │ 15791116088353961633 │     2 │ true     │ true     │
    │ 15791116088353961633 │ C34.1               │ 8140/3           │ C34.1            │ NULL           │ NULL           │ R                  │ 4       │ NULL    │ 1       │ NULL    │ 0       │ 1c      │ NULL    │ 7                 │              3 │ C34      │         2023 │ 03252       │        1945 │ W          │ J          │ 1945-06-15   │ T                        │ 2023-11-15    │ T                         │ 2024-04-15        │ T                             │ 15791116088353961633 │ 15791116088353961633 │     2 │ true     │ true     │
    │ 13878838999184218881 │ C44.3               │ 8070/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2014 │ 09376       │        1943 │ M          │ J          │ 1943-01-15   │ T                        │ 2014-02-15    │ T                         │ 2023-02-15        │ T                             │ 13878838999184218881 │ 13878838999184218881 │     2 │ true     │ true     │
    │ 13878838999184218881 │ C44.3               │ 8070/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2014 │ 09376       │        1943 │ M          │ J          │ 1943-01-15   │ T                        │ 2014-02-15    │ T                         │ 2023-02-15        │ T                             │ 13878838999184218881 │ 13878838999184218881 │     2 │ true     │ true     │
    │ 10937296248303210351 │ C44.5               │ 8090/3           │ C44.51           │ NULL           │ I              │ L                  │ NULL    │ 1       │ X       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2019 │ 13075       │        1935 │ M          │ N          │ 1935-01-15   │ T                        │ 2019-07-15    │ T                         │ 2024-08-15        │ T                             │ 10937296248303210351 │ 10937296248303210351 │     2 │ true     │ true     │
    │ 10937296248303210351 │ C44.5               │ 8090/3           │ C44.51           │ NULL           │ I              │ L                  │ NULL    │ 1       │ X       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2019 │ 13075       │        1935 │ M          │ N          │ 1935-01-15   │ T                        │ 2019-07-15    │ T                         │ 2024-08-15        │ T                             │ 10937296248303210351 │ 10937296248303210351 │     2 │ true     │ true     │
    │  1582236159882525374 │ C44.2               │ 8090/3           │ C44.2            │ NULL           │ NULL           │ R                  │ NULL    │ 1       │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2022 │ 09362       │        1936 │ M          │ J          │ 1936-10-15   │ T                        │ 2022-07-15    │ T                         │ 2025-02-15        │ T                             │  1582236159882525374 │  1582236159882525374 │     2 │ true     │ true     │
    │  1582236159882525374 │ C44.2               │ 8090/3           │ C44.2            │ NULL           │ NULL           │ R                  │ NULL    │ 1       │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2022 │ 09362       │        1936 │ M          │ J          │ 1936-10-15   │ T                        │ 2022-07-15    │ T                         │ 2025-02-15        │ T                             │  1582236159882525374 │  1582236159882525374 │     2 │ true     │ true     │
    │ 17852287624451487317 │ D04.7               │ 8081/2           │ C44.7            │ NULL           │ 0              │ L                  │ NULL    │ is      │ T       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ D04      │         2022 │ 13075       │        1932 │ W          │ N          │ 1932-12-15   │ T                        │ 2022-10-15    │ T                         │ 2024-10-15        │ T                             │ 17852287624451487317 │ 17852287624451487317 │     2 │ true     │ true     │
    │ 17852287624451487317 │ D04.7               │ 8081/2           │ C44.7            │ NULL           │ 0              │ L                  │ NULL    │ is      │ T       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ D04      │         2022 │ 13075       │        1932 │ W          │ N          │ 1932-12-15   │ T                        │ 2022-10-15    │ T                         │ 2024-10-15        │ T                             │ 17852287624451487317 │ 17852287624451487317 │     2 │ true     │ true     │
    │ 16619214246667432025 │ C44.5               │ 8090/3           │ C44.5            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2024 │ 15083       │        1950 │ M          │ N          │ 1950-08-15   │ T                        │ 2024-10-15    │ T                         │ 2024-10-15        │ T                             │ 16619214246667432025 │ 16619214246667432025 │     2 │ true     │ true     │
    │ 16619214246667432025 │ C44.5               │ 8090/3           │ C44.5            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2024 │ 15083       │        1950 │ M          │ N          │ 1950-08-15   │ T                        │ 2024-10-15    │ T                         │ 2024-10-15        │ T                             │ 16619214246667432025 │ 16619214246667432025 │     2 │ true     │ true     │
    │ 13849681381756537876 │ C43.7               │ 8720/3           │ C44.72           │ NULL           │ IA             │ R                  │ NULL    │ 1a      │ U       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             16 │ C43      │         2021 │ 16076       │        1967 │ W          │ N          │ 1967-09-15   │ T                        │ 2021-11-15    │ T                         │ 2023-06-15        │ T                             │ 13849681381756537876 │ 13849681381756537876 │     2 │ true     │ true     │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │ 17192023087808059916 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2021 │ 15091       │        1949 │ M          │ N          │ 1949-02-15   │ T                        │ 2021-04-15    │ T                         │ 2021-04-15        │ T                             │ 17192023087808059916 │ 17192023087808059916 │     3 │ true     │ true     │
    │ 17192023087808059916 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2021 │ 15091       │        1949 │ M          │ N          │ 1949-02-15   │ T                        │ 2021-04-15    │ T                         │ 2021-04-15        │ T                             │ 17192023087808059916 │ 17192023087808059916 │     3 │ true     │ true     │
    │ 17192023087808059916 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2021 │ 15091       │        1949 │ M          │ N          │ 1949-02-15   │ T                        │ 2021-04-15    │ T                         │ 2021-04-15        │ T                             │ 17192023087808059916 │ 17192023087808059916 │     3 │ true     │ true     │
    │  9989574425369208017 │ C61                 │ 8140/3           │ C61.9            │ NULL           │ NULL           │ T                  │ NULL    │ 2c      │ T       │ 0       │ NULL    │ NULL    │ NULL    │ 7                 │              3 │ C61      │         2021 │ 03456       │        1954 │ M          │ N          │ 1954-02-15   │ T                        │ 2021-03-15    │ T                         │ 2025-09-15        │ T                             │  9989574425369208017 │  9989574425369208017 │     2 │ true     │ true     │
    │  9989574425369208017 │ C61                 │ 8140/3           │ C61.9            │ NULL           │ NULL           │ T                  │ 1c      │ 2c      │ T       │ 0       │ 0       │ 0       │ NULL    │ 7                 │              3 │ C61      │         2021 │ 03456       │        1954 │ M          │ N          │ 1954-02-15   │ T                        │ 2021-03-15    │ T                         │ 2025-09-15        │ T                             │  9989574425369208017 │  9989574425369208017 │     2 │ true     │ true     │
    │ 15168826920044758502 │ C44.4               │ 8090/3           │ C44.43           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2022 │ 15085       │        1940 │ M          │ N          │ 1940-10-15   │ T                        │ 2022-10-15    │ T                         │ 2023-08-15        │ T                             │ 15168826920044758502 │ 15168826920044758502 │     2 │ true     │ true     │
    │ 15168826920044758502 │ C44.4               │ 8090/3           │ C44.43           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2022 │ 15085       │        1940 │ M          │ N          │ 1940-10-15   │ T                        │ 2022-10-15    │ T                         │ 2023-08-15        │ T                             │ 15168826920044758502 │ 15168826920044758502 │     2 │ true     │ true     │
    │  5062015151417309392 │ C44.3               │ 8097/3           │ C44.31           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2022 │ 15089       │        1967 │ M          │ N          │ 1967-10-15   │ T                        │ 2022-03-15    │ T                         │ 2022-06-15        │ T                             │  5062015151417309392 │  5062015151417309392 │     2 │ true     │ true     │
    │  5062015151417309392 │ C44.3               │ 8097/3           │ C44.31           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2022 │ 15089       │        1967 │ M          │ N          │ 1967-10-15   │ T                        │ 2022-03-15    │ T                         │ 2022-06-15        │ T                             │  5062015151417309392 │  5062015151417309392 │     2 │ true     │ true     │
    │  9192792963284917662 │ C44.59              │ 8091/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2023 │ 15003       │        1938 │ M          │ N          │ 1938-12-15   │ T                        │ 2023-06-15    │ T                         │ 2024-05-15        │ T                             │  9192792963284917662 │  9192792963284917662 │     2 │ true     │ true     │
    │  9192792963284917662 │ C44.59              │ 8091/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2023 │ 15003       │        1938 │ M          │ N          │ 1938-12-15   │ T                        │ 2023-06-15    │ T                         │ 2024-05-15        │ T                             │  9192792963284917662 │  9192792963284917662 │     2 │ true     │ true     │
    │   961518092213708704 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2018 │ 09375       │        1943 │ M          │ N          │ 1943-01-15   │ T                        │ 2018-03-15    │ T                         │ 2025-08-15        │ T                             │   961518092213708704 │   961518092213708704 │     2 │ true     │ true     │
    │   961518092213708704 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2018 │ 09375       │        1943 │ M          │ N          │ 1943-01-15   │ T                        │ 2018-03-15    │ T                         │ 2025-08-15        │ T                             │   961518092213708704 │   961518092213708704 │     2 │ true     │ true     │
    │ 16086906970093464510 │ C44.6               │ 8090/3           │ C44.63           │ NULL           │ I              │ L                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             15 │ C44      │         2014 │ 15003       │        1942 │ M          │ N          │ 1942-02-15   │ T                        │ 2014-02-15    │ T                         │ 2022-06-15        │ T                             │ 16086906970093464510 │ 16086906970093464510 │     2 │ true     │ true     │
    │ 16086906970093464510 │ C44.6               │ 8090/3           │ C44.63           │ NULL           │ I              │ L                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             15 │ C44      │         2014 │ 15003       │        1942 │ M          │ N          │ 1942-02-15   │ T                        │ 2014-02-15    │ T                         │ 2022-06-15        │ T                             │ 16086906970093464510 │ 16086906970093464510 │     2 │ true     │ true     │
    │ 16120336189320068209 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 9                 │             15 │ C44      │         1997 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 1997-11-15    │ T                         │ 2021-05-15        │ T                             │ 16120336189320068209 │ 16120336189320068209 │     4 │ true     │ true     │
    │ 16120336189320068209 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 9                 │             15 │ C44      │         1997 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 1997-11-15    │ T                         │ 2021-05-15        │ T                             │ 16120336189320068209 │ 16120336189320068209 │     4 │ true     │ true     │
    │ 16120336189320068209 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 9                 │             15 │ C44      │         1997 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 1997-11-15    │ T                         │ 2021-05-15        │ T                             │ 16120336189320068209 │ 16120336189320068209 │     4 │ true     │ true     │
    │ 16120336189320068209 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 9                 │             15 │ C44      │         1997 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 1997-11-15    │ T                         │ 2021-05-15        │ T                             │ 16120336189320068209 │ 16120336189320068209 │     4 │ true     │ true     │
    │  5525589996954496057 │ C44.5               │ 8091/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2010 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 2010-04-15    │ T                         │ 2021-05-15        │ T                             │  5525589996954496057 │  5525589996954496057 │     2 │ true     │ true     │
    │  5525589996954496057 │ C44.5               │ 8091/3           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2010 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 2010-04-15    │ T                         │ 2021-05-15        │ T                             │  5525589996954496057 │  5525589996954496057 │     2 │ true     │ true     │
    │ 17298275429277401776 │ C44.6               │ 8090/3           │ C44.61           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2013 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 2013-11-15    │ T                         │ 2021-05-15        │ T                             │ 17298275429277401776 │ 17298275429277401776 │     2 │ true     │ true     │
    │ 17298275429277401776 │ C44.6               │ 8090/3           │ C44.61           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             15 │ C44      │         2013 │ 15001       │        1940 │ M          │ N          │ 1940-09-15   │ T                        │ 2013-11-15    │ T                         │ 2021-05-15        │ T                             │ 17298275429277401776 │ 17298275429277401776 │     2 │ true     │ true     │
    │ 17786902993126224100 │ D03.5               │ 8742/2           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ is      │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             16 │ D03      │         2023 │ 16077       │        1959 │ W          │ N          │ 1959-06-15   │ T                        │ 2023-08-15    │ T                         │ 2023-08-15        │ T                             │ 17786902993126224100 │ 17786902993126224100 │     2 │ true     │ true     │
    │ 17786902993126224100 │ D03.5               │ 8742/2           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ is      │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             16 │ D03      │         2023 │ 16077       │        1959 │ W          │ N          │ 1959-06-15   │ T                        │ 2023-08-15    │ T                         │ 2023-08-15        │ T                             │ 17786902993126224100 │ 17786902993126224100 │     2 │ true     │ true     │
    ├──────────────────────┴─────────────────────┴──────────────────┴──────────────────┴────────────────┴────────────────┴────────────────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴───────────────────┴────────────────┴──────────┴──────────────┴─────────────┴─────────────┴────────────┴────────────┴──────────────┴──────────────────────────┴───────────────┴───────────────────────────┴───────────────────┴───────────────────────────────┴──────────────────────┴──────────────────────┴───────┴──────────┴──────────┤
    │ 823 rows (50 shown)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           33 columns │
    └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

