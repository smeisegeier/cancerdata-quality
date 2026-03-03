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
  - [Datensatz](#toc1_7_)    

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

    database file:           2026-02-26_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-02-24
    sql table created:       2026-02-26 16:43:32
    doi:                     -
    document created:        2026-02-26 21:50:41
    
    database file:           2026-02-20_data_epi.duckdb
    data tag:                epi2025_beta
    sql table created:       2026-02-20 08:20:43
    doi:                     -
    document created:        2026-02-26 21:50:41


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
    


    Verteilung icd10 ausserhalb [C,D]: {None: 393}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_21_1.png)
    


    Verteilung icd10 ausserhalb [C,D]: {None: 24332}


<br>

### <a id='toc1_5_4_'></a>[⚠️ inzidenzort_missing](#toc0_)
- Variable `Inzidenzort` fehlt, oder ist unbrauchbar kodiert (_00000_, _99999_, oder Länge != 5)
> epi: die Variable GKZlk wird nachbearbeitet im workflow und weist daher keine missings auf

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_23_1.png)
    


    Verteilung inzidenzort missing oder ungültig{'99999': 11, None: 1000}


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
    


    Kombination Geschlecht - ICD10 ungültig: {'C61-W': 26, 'C62-W': 5, 'C54-M': 4, 'C56-M': 3, 'C53-M': 2, 'C52-M': 2, 'C57-M': 1, 'C63-W': 1, 'C55-M': 1, 'C60-W': 1, 'C51-M': 1, 'C58-M': 1}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_27_1.png)
    


    Kombination Geschlecht - ICD10 ungültig: {'C61-W': 3, 'C62-W': 2, 'C56-M': 1, 'C52-M': 1, 'C57-M': 1}


<br>

### <a id='toc1_5_6_'></a>[⚠️ datum_missing](#toc0_)
- `Diagnosedatum` oder `Geburtsdatum` ist leer (bzw. als Jahr 1900 kodiert)
- nicht gesetzte Angaben zum Vitalstatus sind ignoriert
> ⚠️ hier sind auch regulär übermittelte Fälle mit vollständig (`V`) geschätztem Datum enthalten

    🟧 🗄️ klin



    
![png](clin_3_check_files/output_29_1.png)
    


    Verteilung top 3 (GebDat - DiagDat): {'1900-04-01-2023-07-15': 72, '1900-04-01-2024-01-15': 59, '1900-04-01-2024-03-15': 48}


    🟧 🗄️ epi



    
![png](clin_3_check_files/output_30_1.png)
    


    Verteilung top 3 (GebDat - DiagDat): {'<NA>-': 109, '1900-08-15-1988-03-15': 6, '1900-11-15-1972-05-15': 5}


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
    │ 2020-11-15   │ 2020-11-15    │     3 │
    │ 2022-04-15   │ 2022-04-15    │     3 │
    │ 2024-05-15   │ 2024-05-15    │     3 │
    │ 2024-03-15   │ 2024-03-15    │     3 │
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
    │ 2013-09-15   │ 2013-09-15    │    11 │
    │ 2013-11-15   │ 2013-11-15    │    11 │
    │ 2013-12-15   │ 2013-12-15    │     9 │
    │ 2010-05-15   │ 2010-05-15    │     8 │
    │ 2010-12-15   │ 2010-12-15    │     8 │
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
    9_786 Fälle verteilen sich auf 4_718 Gruppen mit max 14 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 4671, False: 47}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 4265, True: 453}
    🟧 🗄️ epi
    27_646 Fälle verteilen sich auf 13_645 Gruppen mit max 31 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 13645}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 13362, True: 283}
    ┌──────────────────────┬─────────────────────┬──────────────────┬──────────────────┬────────────────┬────────────────┬────────────────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬─────────┬───────────────────┬────────────────┬──────────┬──────────────┬─────────────┬─────────────┬────────────┬────────────┬──────────────┬──────────────────────────┬───────────────┬───────────────────────────┬───────────────────┬───────────────────────────────┬──────────────────────┬──────────────────────┬───────┬──────────┬──────────┐
    │        hash2         │ Diagnose_ICD10_Code │ Morphologie_Code │ Topographie_Code │ UICC_Stadium_c │ UICC_Stadium_p │ Seitenlokalisation │   T_c   │   T_p   │ Grading │   N_p   │   N_c   │   M_c   │   M_p   │ Diagnosesicherung │ Lieferregister │ icd10_3d │ Diagnosejahr │ Inzidenzort │ Geburtsjahr │ Geschlecht │ Verstorben │ Geburtsdatum │ Geburtsdatum_Genauigkeit │ Diagnosedatum │ Diagnosedatum_Genauigkeit │ Datum_Vitalstatus │ Datum_Vitalstatus_Genauigkeit │       hash2_1        │      hash2_1_1       │  cnt  │ same_kkr │ same_pat │
    │        uint64        │       varchar       │     varchar      │     varchar      │    varchar     │    varchar     │      varchar       │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │ varchar │      varchar      │      int8      │ varchar  │    int16     │   varchar   │    int32    │  varchar   │  varchar   │     date     │         varchar          │     date      │          varchar          │       date        │            varchar            │        uint64        │        uint64        │ int64 │ boolean  │ boolean  │
    ├──────────────────────┼─────────────────────┼──────────────────┼──────────────────┼────────────────┼────────────────┼────────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼─────────┼───────────────────┼────────────────┼──────────┼──────────────┼─────────────┼─────────────┼────────────┼────────────┼──────────────┼──────────────────────────┼───────────────┼───────────────────────────┼───────────────────┼───────────────────────────────┼──────────────────────┼──────────────────────┼───────┼──────────┼──────────┤
    │ 17840342579085567314 │ C44                 │ 8090/3           │ C44.65           │ NULL           │ I              │ R                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2014 │ 13076       │        1947 │ W          │ N          │ 1947-03-15   │ T                        │ 2014-02-15    │ T                         │ 2024-10-15        │ T                             │ 17840342579085567314 │ 17840342579085567314 │     2 │ true     │ true     │
    │ 17840342579085567314 │ C44                 │ 8090/3           │ C44.65           │ NULL           │ I              │ R                  │ NULL    │ 1       │ U       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2014 │ 13076       │        1947 │ W          │ N          │ 1947-03-15   │ T                        │ 2014-02-15    │ T                         │ 2024-10-15        │ T                             │ 17840342579085567314 │ 17840342579085567314 │     2 │ true     │ true     │
    │ 10808291602251259537 │ C44.3               │ 8090/3           │ C44.31           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2015 │ 15089       │        1935 │ M          │ N          │ 1935-10-15   │ T                        │ 2015-06-15    │ T                         │ 2022-12-15        │ T                             │ 10808291602251259537 │ 10808291602251259537 │     2 │ true     │ true     │
    │ 10808291602251259537 │ C44.3               │ 8090/3           │ C44.31           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2015 │ 15089       │        1935 │ M          │ N          │ 1935-10-15   │ T                        │ 2015-06-15    │ T                         │ 2022-12-15        │ T                             │ 10808291602251259537 │ 10808291602251259537 │     2 │ true     │ true     │
    │ 17828479518542558588 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2019 │ 09376       │        1928 │ W          │ J          │ 1928-10-15   │ T                        │ 2019-05-15    │ T                         │ 2024-08-15        │ T                             │ 17828479518542558588 │ 17828479518542558588 │     2 │ true     │ true     │
    │ 17828479518542558588 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2019 │ 09376       │        1928 │ W          │ J          │ 1928-10-15   │ T                        │ 2019-05-15    │ T                         │ 2024-08-15        │ T                             │ 17828479518542558588 │ 17828479518542558588 │     2 │ true     │ true     │
    │  6955736735644645174 │ C18.7               │ 8140/3           │ C18.7            │ NULL           │ NULL           │ T                  │ X       │ 3       │ 2       │ 0       │ X       │ 0       │ 0       │ 7                 │              3 │ C18      │         2024 │ 03252       │        1963 │ M          │ N          │ 1963-10-15   │ T                        │ 2024-01-15    │ T                         │ 2025-09-15        │ T                             │  6955736735644645174 │  6955736735644645174 │     2 │ true     │ true     │
    │  6955736735644645174 │ C18.7               │ 8140/3           │ C18.7            │ NULL           │ NULL           │ T                  │ X       │ 3       │ 2       │ 0       │ X       │ 0       │ 0       │ 7                 │              3 │ C18      │         2024 │ 03252       │        1963 │ M          │ N          │ 1963-10-15   │ T                        │ 2024-01-15    │ T                         │ 2025-09-15        │ T                             │  6955736735644645174 │  6955736735644645174 │     2 │ true     │ true     │
    │ 16051131866897218622 │ C44.2               │ 8090/3           │ C44.21           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15002       │        1943 │ M          │ N          │ 1943-11-15   │ T                        │ 2022-07-15    │ T                         │ 2022-09-15        │ T                             │ 16051131866897218622 │ 16051131866897218622 │     2 │ true     │ true     │
    │ 16051131866897218622 │ C44.2               │ 8090/3           │ C44.21           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15002       │        1943 │ M          │ N          │ 1943-11-15   │ T                        │ 2022-07-15    │ T                         │ 2022-09-15        │ T                             │ 16051131866897218622 │ 16051131866897218622 │     2 │ true     │ true     │
    │  5470006345298220214 │ C44.59              │ 8091/3           │ C44.51           │ NULL           │ NULL           │ M                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2024 │ 15002       │        1954 │ W          │ N          │ 1954-06-15   │ T                        │ 2024-02-15    │ T                         │ 2024-02-15        │ T                             │  5470006345298220214 │  5470006345298220214 │     2 │ true     │ true     │
    │  5470006345298220214 │ C44.59              │ 8091/3           │ C44.51           │ NULL           │ NULL           │ M                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2024 │ 15002       │        1954 │ W          │ N          │ 1954-06-15   │ T                        │ 2024-02-15    │ T                         │ 2024-02-15        │ T                             │  5470006345298220214 │  5470006345298220214 │     2 │ true     │ true     │
    │  6878006408349744660 │ C44.6               │ 8090/3           │ C44.63           │ NULL           │ NULL           │ R                  │ NULL    │ 1       │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2019 │ 15003       │        1936 │ M          │ J          │ 1936-08-15   │ T                        │ 2019-01-15    │ T                         │ 2024-01-15        │ T                             │  6878006408349744660 │  6878006408349744660 │     2 │ true     │ true     │
    │  6878006408349744660 │ C44.6               │ 8090/3           │ C44.63           │ NULL           │ NULL           │ R                  │ NULL    │ 1       │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2019 │ 15003       │        1936 │ M          │ J          │ 1936-08-15   │ T                        │ 2019-01-15    │ T                         │ 2024-01-15        │ T                             │  6878006408349744660 │  6878006408349744660 │     2 │ true     │ true     │
    │  2210913079643294951 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2013 │ 09362       │        1934 │ W          │ N          │ 1934-10-15   │ T                        │ 2013-02-15    │ T                         │ 2021-10-15        │ T                             │  2210913079643294951 │  2210913079643294951 │     2 │ true     │ true     │
    │  2210913079643294951 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2013 │ 09362       │        1934 │ W          │ N          │ 1934-10-15   │ T                        │ 2013-02-15    │ T                         │ 2021-10-15        │ T                             │  2210913079643294951 │  2210913079643294951 │     2 │ true     │ true     │
    │   638802391294984625 │ C44.5               │ 8091/3           │ C44.51           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2020 │ 15083       │        1936 │ W          │ N          │ 1936-08-15   │ T                        │ 2020-09-15    │ T                         │ 2020-09-15        │ T                             │   638802391294984625 │   638802391294984625 │     2 │ true     │ true     │
    │   638802391294984625 │ C44.5               │ 8091/3           │ C44.51           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ X       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2020 │ 15083       │        1936 │ W          │ N          │ 1936-08-15   │ T                        │ 2020-09-15    │ T                         │ 2020-09-15        │ T                             │   638802391294984625 │   638802391294984625 │     2 │ true     │ true     │
    │ 15791116088353961633 │ C34.1               │ 8140/3           │ C34.1            │ NULL           │ NULL           │ R                  │ 4       │ NULL    │ 1       │ NULL    │ 0       │ 1c      │ NULL    │ 7                 │              3 │ C34      │         2023 │ 03252       │        1945 │ W          │ J          │ 1945-06-15   │ T                        │ 2023-11-15    │ T                         │ 2024-04-15        │ T                             │ 15791116088353961633 │ 15791116088353961633 │     2 │ true     │ true     │
    │ 15791116088353961633 │ C34.1               │ 8140/3           │ C34.1            │ NULL           │ NULL           │ R                  │ 4       │ NULL    │ 1       │ NULL    │ 0       │ 1c      │ NULL    │ 7                 │              3 │ C34      │         2023 │ 03252       │        1945 │ W          │ J          │ 1945-06-15   │ T                        │ 2023-11-15    │ T                         │ 2024-04-15        │ T                             │ 15791116088353961633 │ 15791116088353961633 │     2 │ true     │ true     │
    │ 13878838999184218881 │ C44.3               │ 8070/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2014 │ 09376       │        1943 │ M          │ J          │ 1943-01-15   │ T                        │ 2014-02-15    │ T                         │ 2023-02-15        │ T                             │ 13878838999184218881 │ 13878838999184218881 │     2 │ true     │ true     │
    │ 13878838999184218881 │ C44.3               │ 8070/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2014 │ 09376       │        1943 │ M          │ J          │ 1943-01-15   │ T                        │ 2014-02-15    │ T                         │ 2023-02-15        │ T                             │ 13878838999184218881 │ 13878838999184218881 │     2 │ true     │ true     │
    │  2447377836105950306 │ C44.5               │ 8091/3           │ C44.5            │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15084       │        1943 │ W          │ N          │ 1943-02-15   │ T                        │ 2022-05-15    │ T                         │ 2025-05-15        │ T                             │  2447377836105950306 │  2447377836105950306 │     2 │ true     │ true     │
    │  2447377836105950306 │ C44.5               │ 8091/3           │ C44.5            │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15084       │        1943 │ W          │ N          │ 1943-02-15   │ T                        │ 2022-05-15    │ T                         │ 2025-05-15        │ T                             │  2447377836105950306 │  2447377836105950306 │     2 │ true     │ true     │
    │ 10937296248303210351 │ C44.5               │ 8090/3           │ C44.51           │ NULL           │ I              │ L                  │ NULL    │ 1       │ X       │ 0       │ NULL    │ NULL    │ 0       │ 7                 │             13 │ C44      │         2019 │ 13075       │        1935 │ M          │ N          │ 1935-01-15   │ T                        │ 2019-07-15    │ T                         │ 2024-08-15        │ T                             │ 10937296248303210351 │ 10937296248303210351 │     2 │ true     │ true     │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │           ·          │   ·                 │   ·              │   ·              │  ·             │ ·              │ ·                  │  ·      │ ·       │ ·       │ ·       │  ·      │  ·      │ ·       │ ·                 │              · │  ·       │           ·  │   ·         │          ·  │ ·          │ ·          │     ·        │ ·                        │     ·         │ ·                         │     ·             │ ·                             │           ·          │           ·          │     · │  ·       │  ·       │
    │ 13232741742191291648 │ C44.4               │ 8090/3           │ C44.41           │ NULL           │ I              │ L                  │ NULL    │ 1       │ T       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             15 │ C44      │         2023 │ 15001       │        1937 │ W          │ N          │ 1937-03-15   │ T                        │ 2023-04-15    │ T                         │ 2023-08-15        │ T                             │ 13232741742191291648 │ 13232741742191291648 │     2 │ true     │ true     │
    │ 17839016885064643170 │ C44.3               │ 8090/3           │ C44.31           │ NULL           │ NULL           │ M                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15089       │        1958 │ M          │ N          │ 1958-11-15   │ T                        │ 2022-05-15    │ T                         │ 2022-06-15        │ T                             │ 17839016885064643170 │ 17839016885064643170 │     2 │ true     │ true     │
    │ 17839016885064643170 │ C44.3               │ 8090/3           │ C44.31           │ NULL           │ NULL           │ M                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15089       │        1958 │ M          │ N          │ 1958-11-15   │ T                        │ 2022-05-15    │ T                         │ 2022-06-15        │ T                             │ 17839016885064643170 │ 17839016885064643170 │     2 │ true     │ true     │
    │  7001089126551103784 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ T                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             13 │ C44      │         2024 │ 13075       │        1945 │ M          │ N          │ 1945-07-15   │ T                        │ 2024-01-15    │ T                         │ 2024-10-15        │ T                             │  7001089126551103784 │  7001089126551103784 │     2 │ true     │ true     │
    │  7001089126551103784 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ T                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             13 │ C44      │         2024 │ 13075       │        1945 │ M          │ N          │ 1945-07-15   │ T                        │ 2024-01-15    │ T                         │ 2024-10-15        │ T                             │  7001089126551103784 │  7001089126551103784 │     2 │ true     │ true     │
    │  7410274048203460807 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ I              │ M                  │ NULL    │ 1       │ X       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             15 │ C44      │         2014 │ 15003       │        1942 │ W          │ J          │ 1942-04-15   │ T                        │ 2014-07-15    │ T                         │ 2022-04-15        │ T                             │  7410274048203460807 │  7410274048203460807 │     2 │ true     │ true     │
    │  7410274048203460807 │ C44.5               │ 8090/3           │ C44.53           │ NULL           │ I              │ M                  │ NULL    │ 1       │ X       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             15 │ C44      │         2014 │ 15003       │        1942 │ W          │ J          │ 1942-04-15   │ T                        │ 2014-07-15    │ T                         │ 2022-04-15        │ T                             │  7410274048203460807 │  7410274048203460807 │     2 │ true     │ true     │
    │  5383236411603845656 │ C44.5               │ 8097/3           │ C44.5            │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2020 │ 09278       │        1956 │ M          │ N          │ 1956-02-15   │ T                        │ 2020-06-15    │ T                         │ 2020-06-15        │ T                             │  5383236411603845656 │  5383236411603845656 │     2 │ true     │ true     │
    │  5383236411603845656 │ C44.5               │ 8097/3           │ C44.5            │ NULL           │ NULL           │ U                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2020 │ 09278       │        1956 │ M          │ N          │ 1956-02-15   │ T                        │ 2020-06-15    │ T                         │ 2020-06-15        │ T                             │  5383236411603845656 │  5383236411603845656 │     2 │ true     │ true     │
    │ 18052721390284929714 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ T                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             13 │ C44      │         2024 │ 13075       │        1940 │ M          │ N          │ 1940-11-15   │ T                        │ 2024-10-15    │ T                         │ 2024-10-15        │ T                             │ 18052721390284929714 │ 18052721390284929714 │     2 │ true     │ true     │
    │ 18052721390284929714 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ T                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 7                 │             13 │ C44      │         2024 │ 13075       │        1940 │ M          │ N          │ 1940-11-15   │ T                        │ 2024-10-15    │ T                         │ 2024-10-15        │ T                             │ 18052721390284929714 │ 18052721390284929714 │     2 │ true     │ true     │
    │  6244108136172076728 │ C44.3               │ 8090/3           │ C44.33           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15088       │        1967 │ W          │ N          │ 1967-12-15   │ T                        │ 2022-08-15    │ T                         │ 2022-08-15        │ T                             │  6244108136172076728 │  6244108136172076728 │     2 │ true     │ true     │
    │  6244108136172076728 │ C44.3               │ 8090/3           │ C44.33           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2022 │ 15088       │        1967 │ W          │ N          │ 1967-12-15   │ T                        │ 2022-08-15    │ T                         │ 2022-08-15        │ T                             │  6244108136172076728 │  6244108136172076728 │     2 │ true     │ true     │
    │  6189689892157904563 │ C44.3               │ 8090/3           │ C44.33           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2023 │ 15082       │        1953 │ M          │ N          │ 1953-05-15   │ T                        │ 2023-08-15    │ T                         │ 2025-05-15        │ T                             │  6189689892157904563 │  6189689892157904563 │     2 │ true     │ true     │
    │  6189689892157904563 │ C44.3               │ 8090/3           │ C44.33           │ NULL           │ NULL           │ R                  │ NULL    │ NULL    │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2023 │ 15082       │        1953 │ M          │ N          │ 1953-05-15   │ T                        │ 2023-08-15    │ T                         │ 2025-05-15        │ T                             │  6189689892157904563 │  6189689892157904563 │     2 │ true     │ true     │
    │  9989574425369208017 │ C61                 │ 8140/3           │ C61.9            │ NULL           │ NULL           │ T                  │ 1c      │ 2c      │ T       │ 0       │ 0       │ 0       │ NULL    │ 7                 │              3 │ C61      │         2021 │ 03456       │        1954 │ M          │ N          │ 1954-02-15   │ T                        │ 2021-03-15    │ T                         │ 2025-09-15        │ T                             │  9989574425369208017 │  9989574425369208017 │     2 │ true     │ true     │
    │  9989574425369208017 │ C61                 │ 8140/3           │ C61.9            │ NULL           │ NULL           │ T                  │ NULL    │ 2c      │ T       │ 0       │ NULL    │ NULL    │ NULL    │ 7                 │              3 │ C61      │         2021 │ 03456       │        1954 │ M          │ N          │ 1954-02-15   │ T                        │ 2021-03-15    │ T                         │ 2025-09-15        │ T                             │  9989574425369208017 │  9989574425369208017 │     2 │ true     │ true     │
    │   961518092213708704 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2018 │ 09375       │        1943 │ M          │ N          │ 1943-01-15   │ T                        │ 2018-03-15    │ T                         │ 2025-08-15        │ T                             │   961518092213708704 │   961518092213708704 │     2 │ true     │ true     │
    │   961518092213708704 │ C44.3               │ 8090/3           │ C44.3            │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │              9 │ C44      │         2018 │ 09375       │        1943 │ M          │ N          │ 1943-01-15   │ T                        │ 2018-03-15    │ T                         │ 2025-08-15        │ T                             │   961518092213708704 │   961518092213708704 │     2 │ true     │ true     │
    │ 17786902993126224100 │ D03.5               │ 8742/2           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ is      │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             16 │ D03      │         2023 │ 16077       │        1959 │ W          │ N          │ 1959-06-15   │ T                        │ 2023-08-15    │ T                         │ 2023-08-15        │ T                             │ 17786902993126224100 │ 17786902993126224100 │     2 │ true     │ true     │
    │ 17786902993126224100 │ D03.5               │ 8742/2           │ C44.53           │ NULL           │ NULL           │ R                  │ NULL    │ is      │ T       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             16 │ D03      │         2023 │ 16077       │        1959 │ W          │ N          │ 1959-06-15   │ T                        │ 2023-08-15    │ T                         │ 2023-08-15        │ T                             │ 17786902993126224100 │ 17786902993126224100 │     2 │ true     │ true     │
    │ 10981937348121506341 │ C44.5               │ 8071/3           │ C44.5            │ NULL           │ I              │ M                  │ NULL    │ 1       │ 2       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             15 │ C44      │         2017 │ 15086       │        1955 │ M          │ J          │ 1955-08-15   │ T                        │ 2017-07-15    │ T                         │ 2023-09-15        │ T                             │ 10981937348121506341 │ 10981937348121506341 │     2 │ true     │ true     │
    │ 10981937348121506341 │ C44.5               │ 8071/3           │ C44.5            │ NULL           │ I              │ M                  │ NULL    │ 1       │ 2       │ 0       │ NULL    │ NULL    │ 0       │ 71                │             15 │ C44      │         2017 │ 15086       │        1955 │ M          │ J          │ 1955-08-15   │ T                        │ 2017-07-15    │ T                         │ 2023-09-15        │ T                             │ 10981937348121506341 │ 10981937348121506341 │     2 │ true     │ true     │
    │  3865409901786418165 │ C44.6               │ 8090/3           │ C44.61           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2014 │ 15091       │        1937 │ M          │ N          │ 1937-03-15   │ T                        │ 2014-07-15    │ T                         │ 2021-02-15        │ T                             │  3865409901786418165 │  3865409901786418165 │     2 │ true     │ true     │
    │  3865409901786418165 │ C44.6               │ 8090/3           │ C44.61           │ NULL           │ NULL           │ L                  │ NULL    │ NULL    │ U       │ NULL    │ NULL    │ NULL    │ NULL    │ 71                │             15 │ C44      │         2014 │ 15091       │        1937 │ M          │ N          │ 1937-03-15   │ T                        │ 2014-07-15    │ T                         │ 2021-02-15        │ T                             │  3865409901786418165 │  3865409901786418165 │     2 │ true     │ true     │
    ├──────────────────────┴─────────────────────┴──────────────────┴──────────────────┴────────────────┴────────────────┴────────────────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴─────────┴───────────────────┴────────────────┴──────────┴──────────────┴─────────────┴─────────────┴────────────┴────────────┴──────────────┴──────────────────────────┴───────────────┴───────────────────────────┴───────────────────┴───────────────────────────────┴──────────────────────┴──────────────────────┴───────┴──────────┴──────────┤
    │ 931 rows (50 shown)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           33 columns │
    └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

## <a id='toc1_7_'></a>[Datensatz](#toc0_)

    🔵 *** df: Tumor (id excluded) ***  
    🟣 shape: (4_000_795, 101)
    🟣 duplicates: 858 (0%)  
    🟠 column stats all (dtype | uniques | missings) [values]  
    - index [0, 1, 2, 3, 4,]  
    - Diagnosedatum (datetime64[us] | 722 | 0 (0%)) [1900-04-01 00:00:00, 1937-07-15 00:00:00, 1941-01-15 00:00:00, 1945-07-01 00:00:00,  
    1948-03-15 00:00:00,]  
    - Diagnosedatum_Genauigkeit (object | 3 | 0 (0%)) ['M', 'T', 'V',]  
    - Inzidenzort (object | 494 | 1_000 (0%)) ['01001', '01002', '01003', '01004', '01051',]  
    - Diagnose_ICD10_Code (object | 884 | 393 (0%)) ['<NA>', 'C00', 'C00.0', 'C00.1', 'C00.2',]  
    - Diagnose_ICD10_Version (object | 42 | 114_192 (3%)) ['10 2004 GM', '10 2006 GM', '10 2008 GM', '10 2009 GM', '10 2010 GM',]  
    - Topographie_Code (object | 709 | 28_976 (1%)) ['<NA>', 'C00.0', 'C00.1', 'C00.2', 'C00.3',]  
    - Topographie_Version (object | 4 | 128_871 (3%)) ['31', '32', '33', '<NA>',]  
    - Diagnosesicherung (object | 12 | 0 (0%)) ['0', '1', '2', '4', '5',]  
    - TNM_Auflage_c (object | 5 | 1_826_566 (46%)) ['6', '7', '8', '9', '<NA>',]  
    - y_Symbol_c (object | 2 | 4_000_396 (100%)) ['<NA>', 'y',]  
    - r_Symbol_c (object | 2 | 4_000_778 (100%)) ['<NA>', 'r',]  
    - a_Symbol_c (object | 2 | 4_000_384 (100%)) ['<NA>', 'a',]  
    - m_Symbol_c (object | 46 | 3_926_246 (98%)) ['(2)', '(4)', '(m)', '1', '10',]  
    - c_p_u_Praefix_T_c (object | 4 | 2_624_722 (66%)) ['<NA>', 'c', 'p', 'u',]  
    - T_c (object | 203 | 2_542_895 (64%)) ['0', '0(is)', '1', '1 (is)', '1 (m)',]  
    - c_p_u_Praefix_N_c (object | 4 | 2_563_338 (64%)) ['<NA>', 'c', 'p', 'u',]  
    - N_c (object | 187 | 2_474_771 (62%)) ['0', '0 (0/14)', '0 (0/16)', '0 (0/31)', '0 (0/5)',]  
    - c_p_u_Praefix_M_c (object | 4 | 2_478_701 (62%)) ['<NA>', 'c', 'p', 'u',]  
    - M_c (object | 42 | 2_400_471 (60%)) ['0', '0 (mind.)', '0(0)', '0(0/3sn)', '0(1)',]  
    - L_c (object | 4 | 3_517_348 (88%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_c (object | 5 | 3_608_203 (90%)) ['<NA>', 'V0', 'V1', 'V2', 'VX',]  
    - Pn_c (object | 4 | 3_592_783 (90%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_c (object | 6 | 3_961_577 (99%)) ['<NA>', 'S0', 'S1', 'S2', 'S3',]  
    - UICC_Stadium_c (object | 36 | 3_176_486 (79%)) ['0', '0a', '0is', '<NA>', 'I',]  
    - TNM_Auflage_p (object | 5 | 1_451_280 (36%)) ['6', '7', '8', '9', '<NA>',]  
    - y_Symbol_p (object | 2 | 3_904_112 (98%)) ['<NA>', 'y',]  
    - r_Symbol_p (object | 2 | 4_000_750 (100%)) ['<NA>', 'r',]  
    - a_Symbol_p (object | 2 | 4_000_426 (100%)) ['<NA>', 'a',]  
    - m_Symbol_p (object | 54 | 3_944_529 (99%)) ['(2)', '(5)', '(m)', '0', '1',]  
    - c_p_u_Praefix_T_p (object | 4 | 1_990_366 (50%)) ['<NA>', 'c', 'p', 'u',]  
    - T_p (object | 537 | 1_988_436 (50%)) ['0', '0 (bifokal)', '0 (is)', '0(bizentrisch)', '0(is)',]  
    - c_p_u_Praefix_N_p (object | 4 | 2_596_730 (65%)) ['<NA>', 'c', 'p', 'u',]  
    - N_p (object | 3_599 | 2_475_830 (62%)) ['(sn)1 (1/5)', '0', '0  (sn)', '0  (sn))', '0  (sn, i-)',]  
    - c_p_u_Praefix_M_p (object | 4 | 2_878_203 (72%)) ['<NA>', 'c', 'p', 'u',]  
    - M_p (object | 51 | 2_718_886 (68%)) ['0', '0(0)', '0(0/20', '0(0/9)', '0(1)',]  
    - L_p (object | 4 | 3_097_597 (77%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_p (object | 5 | 3_116_951 (78%)) ['<NA>', 'V0', 'V1', 'V2', 'VX',]  
    - Pn_p (object | 4 | 3_311_105 (83%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_p (object | 6 | 3_961_600 (99%)) ['<NA>', 'S0', 'S1', 'S2', 'S3',]  
    - UICC_Stadium_p (object | 36 | 3_076_684 (77%)) ['0', '0a', '0is', '<NA>', 'I',]  
    - Grading (object | 13 | 94_075 (2%)) ['0', '1', '2', '3', '4',]  
    - LK_befallen (Int32 | 88 | 3_206_673 (80%)) [0, 1, 2, 3, 4,]  
    - LK_untersucht (Int32 | 197 | 3_034_913 (76%)) [0, 1, 2, 3, 4,]  
    - Morphologie_Code (object | 1_400 | 94_075 (2%)) ['0000/0', '5255/3', '7432/0', '8000/0', '8000/1',]  
    - Morphologie_Version (object | 5 | 187_415 (5%)) ['31', '32', '33', '<NA>', 'bb',]  
    - Praetherapeutischer_Menopausenstatus (object | 4 | 3_716_405 (93%)) ['1', '3', '<NA>', 'U',]  
    - HormonrezeptorStatus_Oestrogen (object | 4 | 3_646_862 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - HormonrezeptorStatus_Progesteron (object | 4 | 3_649_791 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - Her2neuStatus (object | 4 | 3_637_603 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - TumorgroesseInvasiv (Int32 | 210 | 3_794_419 (95%)) [0, 1, 2, 3, 4,]  
    - TumorgroesseDCIS (Int32 | 174 | 3_900_420 (97%)) [0, 1, 2, 3, 4,]  
    - RASMutation (object | 5 | 3_926_341 (98%)) ['<NA>', 'M', 'N', 'U', 'W',]  
    - RektumAbstandAnokutanlinie (Int32 | 101 | 3_958_491 (99%)) [0, 1, 2, 3, 4,]  
    - GradPrimaer (object | 6 | 3_758_015 (94%)) ['1', '2', '3', '4', '5',]  
    - GradSekundaer (object | 6 | 3_758_033 (94%)) ['1', '2', '3', '4', '5',]  
    - ScoreErgebnis (object | 12 | 3_687_369 (92%)) ['10', '2', '3', '4', '5',]  
    - AnlassGleasonScore (object | 4 | 3_759_979 (94%)) ['<NA>', 'O', 'S', 'U',]  
    - PSA (float32 | 12_883 | 3_757_181 (94%)) [0.0, 0.009999999776482582, 0.019999999552965164, 0.029999999329447746, 0.03999999910593033,]  
    - DatumPSA (datetime64[us] | 267 | 2_829_735 (71%)) [0002-07-15 00:00:00, 0202-06-15 00:00:00, 0222-10-15 00:00:00, 0223-05-15 00:00:00,  
    1800-07-15 00:00:00,]  
    - DatumPSA_Genauigkeit (object | 3 | 2_829_735 (71%)) ['<NA>', 'T', 'V',]  
    - Tumordicke (float32 | 274 | 3_942_167 (99%)) [0.009999999776482582, 0.05000000074505806, 0.10000000149011612, 0.12999999523162842,  
    0.14000000059604645,]  
    - LDH (Int32 | 515 | 3_992_724 (100%)) [1, 2, 5, 7, 10,]  
    - Ulzeration (object | 3 | 3_963_095 (99%)) ['<NA>', 'J', 'N',]  
    - Seitenlokalisation (object | 6 | 0 (0%)) ['B', 'L', 'M', 'R', 'T',]  
    - DCN (object | 2 | 0 (0%)) ['J', 'N',]  
    - Anzahl_Tage_Diagnose_Tod (Int32 | 11_538 | 2_847_823 (71%)) [-27320, -27055, -6000, -2050, -212,]  
    - z_kkr (int8 | 16 | 0 (0%)) [1, 2, 3, 4, 5,]  
    - z_kkr_label (object | 16 | 0 (0%)) ['01-SH', '02-HH', '03-NI', '04-HB', '05-NW',]  
    - z_dy (int16 | 76 | 0 (0%)) [1900, 1937, 1941, 1945, 1948,]  
    - z_age (float64 | 2_172 | 0 (0%)) [-122.0, -121.0, -118.67, -118.25, -112.5,]  
    - z_ag05 (object | 19 | 5_781 (0%)) ['<NA>', 'a00b04', 'a05b09', 'a10b14', 'a15b19',]  
    - z_icd10 (object | 594 | 2_352 (0%)) ['<NA>', 'C00.0', 'C00.1', 'C00.2', 'C00.3',]  
    - z_icd10_3d (object | 110 | 2_352 (0%)) ['<NA>', 'C00', 'C01', 'C02', 'C03',]  
    - z_t_c_0 (object | 43 | 2_542_897 (64%)) ['0', '1', '1a', '1a1', '1a2',]  
    - z_t_c_1 (object | 9 | 2_542_897 (64%)) ['0', '1', '2', '3', '4',]  
    - z_t_p_0 (object | 43 | 1_988_439 (50%)) ['0', '1', '1a', '1a1', '1a2',]  
    - z_t_p_1 (object | 9 | 1_988_439 (50%)) ['0', '1', '2', '3', '4',]  
    - z_n_c_0 (object | 28 | 2_474_887 (62%)) ['0', '0(i+)', '0(i+)(sn)', '0(i-)', '0(i-)(sn)',]  
    - z_n_c_1 (object | 6 | 2_474_887 (62%)) ['0', '1', '2', '3', '<NA>',]  
    - z_n_p_0 (object | 28 | 2_475_836 (62%)) ['0', '0(i+)', '0(i+)(sn)', '0(i-)', '0(i-)(sn)',]  
    - z_n_p_1 (object | 6 | 2_475_836 (62%)) ['0', '1', '2', '3', '<NA>',]  
    - z_m_c_0 (object | 22 | 2_419_133 (60%)) ['0', '0(0)', '0(1)', '0(i+)', '0(i-)',]  
    - z_m_c_1 (object | 3 | 2_419_133 (60%)) ['0', '1', '<NA>',]  
    - z_m_p_0 (object | 22 | 2_753_396 (69%)) ['0', '0(0)', '0(1)', '0(i+)', '0(i-)',]  
    - z_m_p_1 (object | 3 | 2_753_396 (69%)) ['0', '1', '<NA>',]  
    - z_m_pc_1 (object | 3 | 1_645_050 (41%)) ['0', '1', '<NA>',]  
    - z_is_dco (bool | 2 | 0 (0%)) [False, True,]  
    - z_last_tum_status (object | 11 | 2_762_752 (69%)) ['<NA>', 'B - klinische Besserung des Zustandes', 'D - divergentes Geschehen',  
    'K - keine Änderung', 'P - Progression',]  
    - z_tum_op_count (int16 | 25 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_st_count (int16 | 38 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_sy_count (int16 | 27 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_fo_count (int16 | 36 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_first_treatment (object | 4 | 1_760_307 (44%)) ['<NA>', 'op', 'st', 'sy',]  
    - z_first_treatment_after_days (Int32 | 2_061 | 1_760_307 (44%)) [0, 1, 2, 3, 4,]  
    - z_event_order (object | 17_283 | 1_525_884 (38%)) ['<NA>', 'fo', 'fo-op', 'fo-op-fo', 'fo-op-fo-op',]  
    - z_events (object | 16 | 0 (0%)) ['-', 'fo', 'op', 'op|fo', 'op|st',]  
    - z_class_hpv (object | 4 | 3_954_738 (99%)) ['<NA>', 'N', 'P', 'U',]  
    - z_tum_order (int8 | 47 | 0 (0%)) [1, 2, 3, 4, 5,]  
    - z_sex (object | 5 | 0 (0%)) ['D', 'M', 'U', 'W', 'X',]  
    - z_period_diag_death_day (Int32 | 11_524 | 2_819_985 (70%)) [0, 1, 2, 3, 4,]  
    - z_period_diag_psa_day (Int32 | 508 | 3_792_365 (95%)) [-3623, -3592, -3561, -3530, -3502,]  
    
    🟠 column stats numeric  
    
    column (n = 4_000_795)       |     notnull      |   min    | lower  |    q25    |  median   |   mean    |    q75    |  upper  |    max     |    std    |   cv   
    -----------------------------+------------------+----------+--------+-----------+-----------+-----------+-----------+---------+------------+-----------+--------
    LK_befallen                  |    794_122 (19%) |        0 |      0 |     0.000 |     0.000 |     0.915 |     0.000 |       0 |        722 |     3.077 |   3.361
    LK_untersucht                |    965_882 (24%) |        0 |      0 |     1.000 |     5.000 |    10.622 |    17.000 |      41 |      2_319 |    13.664 |   1.286
    TumorgroesseInvasiv          |     206_376 (5%) |        0 |      0 |     9.000 |    15.000 |    19.635 |    25.000 |      49 |        999 |    19.202 |   0.978
    TumorgroesseDCIS             |     100_375 (2%) |        0 |      0 |     0.000 |     0.000 |    10.944 |    15.000 |      37 |        999 |    20.476 |   1.871
    RektumAbstandAnokutanlinie   |      42_304 (1%) |        0 |      0 |     5.000 |     9.000 |    11.292 |    14.000 |      27 |        930 |    16.997 |   1.505
    PSA                          |     243_614 (6%) |    0.000 |  0.000 |     5.630 |     8.730 |    90.411 |    18.000 |  36.550 | 99_999.000 |   742.986 |   8.218
    Tumordicke                   |      58_628 (1%) |    0.010 |  0.010 |     0.400 |     0.900 |     1.951 |     2.200 |   4.900 |     99.000 |     3.516 |   1.802
    LDH                          |       8_071 (0%) |        1 |     85 |   173.000 |   198.000 |   223.747 |   232.000 |     320 |      5_756 |   207.203 |   0.926
    Anzahl_Tage_Diagnose_Tod     |  1_152_972 (28%) |  -27_320 |   -212 |    52.000 |   259.000 |   653.841 |   707.000 |   1_689 |     30_590 | 1_271.971 |   1.945
    z_kkr                        | 4_000_795 (100%) |        1 |      1 |     5.000 |     8.000 |     7.758 |    10.000 |      16 |         16 |     3.915 |   0.505
    z_dy                         | 4_000_795 (100%) |     1900 |   2018 | 2_021.000 | 2_022.000 | 2_021.180 | 2_023.000 |    2026 |       2026 |     5.621 |   0.003
    z_age                        | 4_000_795 (100%) | -122.000 | 30.250 |    59.670 |    70.000 |    68.008 |    79.330 | 108.500 |    125.250 |    15.272 |   0.225
    z_tum_op_count               | 4_000_795 (100%) |        0 |      0 |     0.000 |     0.000 |     0.521 |     1.000 |       2 |         43 |     0.747 |   1.432
    z_tum_st_count               | 4_000_795 (100%) |        0 |      0 |     0.000 |     0.000 |     0.172 |     0.000 |       0 |        148 |     0.536 |   3.105
    z_tum_sy_count               | 4_000_795 (100%) |        0 |      0 |     0.000 |     0.000 |     0.394 |     0.000 |       0 |         57 |     0.913 |   2.319
    z_tum_fo_count               | 4_000_795 (100%) |        0 |      0 |     0.000 |     0.000 |     0.819 |     1.000 |       2 |         37 |     1.904 |   2.324
    z_first_treatment_after_days |  2_240_488 (56%) |        0 |      0 |     0.000 |    22.000 |    47.342 |    48.000 |     120 |      3_575 |   113.915 |   2.406
    z_tum_order                  | 4_000_795 (100%) |        1 |      1 |     1.000 |     1.000 |     1.217 |     1.000 |       1 |         47 |     0.733 |   0.602
    z_period_diag_death_day      |  1_180_810 (29%) |        0 |      0 |    53.000 |   258.000 |   646.624 |   701.000 |   1_673 |     30_590 | 1_258.329 |   1.946
    z_period_diag_psa_day        |     208_430 (5%) |   -3_623 |      0 |     0.000 |     0.000 |    -8.359 |     0.000 |       0 |      3_410 |   112.530 | -13.462
    
    
    🟠 sample 3 rows  




```python

```


```python
    ┌─────────────────────┬──────────────────────┬─────────────┬───┬─────────┬──────────────────────┬──────────────────────┐
    │    Diagnosedatum    │ Diagnosedatum_Gena…  │ Inzidenzort │ … │  z_sex  │ z_period_diag_deat…  │ z_period_diag_psa_…  │
    │      timestamp      │       varchar        │   varchar   │   │ varchar │        int32         │        int32         │
    ├─────────────────────┼──────────────────────┼─────────────┼───┼─────────┼──────────────────────┼──────────────────────┤
    │ 2022-06-15 00:00:00 │ T                    │ 06439       │ … │ M       │                  127 │                 NULL │
    │ 2021-09-15 00:00:00 │ T                    │ 14625       │ … │ W       │                 NULL │                 NULL │
    │ 2024-08-15 00:00:00 │ T                    │ 09277       │ … │ W       │                 NULL │                 NULL │
    ├─────────────────────┴──────────────────────┴─────────────┴───┴─────────┴──────────────────────┴──────────────────────┤
    │ 3 rows                                                                                         101 columns (6 shown) │
    └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
```

![svg](clin_3_check_files/output_56_4.svg)
    


    Error in callback <function flush_figures at 0x4ae841b20> (for post_execute), with arguments args (),kwargs {}:



    ---------------------------------------------------------------------------


    KeyboardInterrupt                         Traceback (most recent call last)


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib_inline/backend_inline.py:126, in flush_figures()


        123 if InlineBackend.instance().close_figures:


        124     # ignore the tracking, just draw and close all figures


        125     try:


    --> 126         return show(True)


        127     except Exception as e:


        128         # safely show traceback if in IPython, else raise


        129         ip = get_ipython()


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib_inline/backend_inline.py:90, in show(close, block)


         88 try:


         89     for figure_manager in Gcf.get_all_fig_managers():


    ---> 90         display(


         91             figure_manager.canvas.figure,


         92             metadata=_fetch_figure_metadata(figure_manager.canvas.figure),


         93         )


         94 finally:


         95     show._to_draw = []


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/IPython/core/display_functions.py:278, in display(include, exclude, metadata, transient, display_id, raw, clear, *objs, **kwargs)


        276     publish_display_data(data=obj, metadata=metadata, **kwargs)


        277 else:


    --> 278     format_dict, md_dict = format(obj, include=include, exclude=exclude)


        279     if not format_dict:


        280         # nothing to display (e.g. _ipython_display_ took over)


        281         continue


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/IPython/core/formatters.py:238, in DisplayFormatter.format(self, obj, include, exclude)


        236 md = None


        237 try:


    --> 238     data = formatter(obj)


        239 except:


        240     # FIXME: log the exception


        241     raise


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/decorator.py:235, in decorate.<locals>.fun(*args, **kw)


        233 if not kwsyntax:


        234     args, kw = fix(args, kw, sig)


    --> 235 return caller(func, *(extras + args), **kw)


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/IPython/core/formatters.py:282, in catch_format_error(method, self, *args, **kwargs)


        280 """show traceback on failed format call"""


        281 try:


    --> 282     r = method(self, *args, **kwargs)


        283 except NotImplementedError:


        284     # don't warn on NotImplementedErrors


        285     return self._check_return(None, args[0])


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/IPython/core/formatters.py:402, in BaseFormatter.__call__(self, obj)


        400     pass


        401 else:


    --> 402     return printer(obj)


        403 # Finally look for special method names


        404 method = get_real_method(obj, self.print_method)


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/IPython/core/pylabtools.py:170, in print_figure(fig, fmt, bbox_inches, base64, **kwargs)


        167     from matplotlib.backend_bases import FigureCanvasBase


        168     FigureCanvasBase(fig)


    --> 170 fig.canvas.print_figure(bytes_io, **kw)


        171 data = bytes_io.getvalue()


        172 if fmt == 'svg':


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/backend_bases.py:2157, in FigureCanvasBase.print_figure(self, filename, dpi, facecolor, edgecolor, orientation, format, bbox_inches, pad_inches, bbox_extra_artists, backend, **kwargs)


       2154     # we do this instead of `self.figure.draw_without_rendering`


       2155     # so that we can inject the orientation


       2156     with getattr(renderer, "_draw_disabled", nullcontext)():


    -> 2157         self.figure.draw(renderer)


       2158 if bbox_inches:


       2159     if bbox_inches == "tight":


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/artist.py:94, in _finalize_rasterization.<locals>.draw_wrapper(artist, renderer, *args, **kwargs)


         92 @wraps(draw)


         93 def draw_wrapper(artist, renderer, *args, **kwargs):


    ---> 94     result = draw(artist, renderer, *args, **kwargs)


         95     if renderer._rasterizing:


         96         renderer.stop_rasterizing()


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/artist.py:71, in allow_rasterization.<locals>.draw_wrapper(artist, renderer)


         68     if artist.get_agg_filter() is not None:


         69         renderer.start_filter()


    ---> 71     return draw(artist, renderer)


         72 finally:


         73     if artist.get_agg_filter() is not None:


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/figure.py:3257, in Figure.draw(self, renderer)


       3254             # ValueError can occur when resizing a window.


       3256     self.patch.draw(renderer)


    -> 3257     mimage._draw_list_compositing_images(


       3258         renderer, self, artists, self.suppressComposite)


       3260     renderer.close_group('figure')


       3261 finally:


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:134, in _draw_list_compositing_images(renderer, parent, artists, suppress_composite)


        132 if not_composite or not has_images:


        133     for a in artists:


    --> 134         a.draw(renderer)


        135 else:


        136     # Composite any adjacent images together


        137     image_group = []


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/artist.py:71, in allow_rasterization.<locals>.draw_wrapper(artist, renderer)


         68     if artist.get_agg_filter() is not None:


         69         renderer.start_filter()


    ---> 71     return draw(artist, renderer)


         72 finally:


         73     if artist.get_agg_filter() is not None:


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/axes/_base.py:3226, in _AxesBase.draw(self, renderer)


       3223 if artists_rasterized:


       3224     _draw_rasterized(self.get_figure(root=True), artists_rasterized, renderer)


    -> 3226 mimage._draw_list_compositing_images(


       3227     renderer, self, artists, self.get_figure(root=True).suppressComposite)


       3229 renderer.close_group('axes')


       3230 self.stale = False


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:134, in _draw_list_compositing_images(renderer, parent, artists, suppress_composite)


        132 if not_composite or not has_images:


        133     for a in artists:


    --> 134         a.draw(renderer)


        135 else:


        136     # Composite any adjacent images together


        137     image_group = []


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/artist.py:71, in allow_rasterization.<locals>.draw_wrapper(artist, renderer)


         68     if artist.get_agg_filter() is not None:


         69         renderer.start_filter()


    ---> 71     return draw(artist, renderer)


         72 finally:


         73     if artist.get_agg_filter() is not None:


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:609, in _ImageBase.draw(self, renderer)


        607         renderer.draw_image(gc, l, b, im, trans)


        608 else:


    --> 609     im, l, b, trans = self.make_image(


        610         renderer, renderer.get_image_magnification())


        611     if im is not None:


        612         renderer.draw_image(gc, l, b, im)


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:912, in AxesImage.make_image(self, renderer, magnification, unsampled)


        909 transformed_bbox = TransformedBbox(bbox, trans)


        910 clip = ((self.get_clip_box() or self.axes.bbox) if self.get_clip_on()


        911         else self.get_figure(root=True).bbox)


    --> 912 return self._make_image(self._A, bbox, transformed_bbox, clip,


        913                         magnification, unsampled=unsampled)


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:511, in _ImageBase._make_image(self, A, in_bbox, out_bbox, clip_bbox, magnification, unsampled, round_to_pixel_border)


        508     else:


        509         output_alpha = _resample(  # resample alpha channel


        510             self, A[..., 3], out_shape, t)


    --> 511     output = _resample(  # resample rgb channels


        512         self, _rgb_to_rgba(A[..., :3]), out_shape, t)


        513 elif np.ndim(alpha) > 0:  # Array alpha


        514     # user-specified array alpha overrides the existing alpha channel


        515     output_alpha = _resample(self, alpha, out_shape, t)


    


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/matplotlib/image.py:163, in _resample(image_obj, data, out_shape, transform, resample, alpha)


        159                 a.draw(renderer)


        160         flush_images()


    --> 163 def _resample(


        164         image_obj, data, out_shape, transform, *, resample=None, alpha=1):


        165     """


        166     Convenience wrapper around `._image.resample` to resample *data* to


        167     *out_shape* (with a third dimension if *data* is RGBA) that takes care of


        168     allocating the output array and fetching the relevant properties from the


        169     Image object *image_obj*.


        170     """


        171     # AGG can only handle coordinates smaller than 24-bit signed integers,


        172     # so raise errors if the input data is larger than _image.resample can


        173     # handle.


    


    KeyboardInterrupt: 

