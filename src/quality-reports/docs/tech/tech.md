# <a id='toc1_'></a>[Technische Prüfungen in klinischen und epi Daten](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [Technische Prüfungen in klinischen und epi Daten](#toc1_)    
  - [Hintergrund](#toc1_1_)    
  - [⚙️ settings](#toc1_2_)    
  - [Datenstand ⏱️](#toc1_3_)    
    - [klinisch](#toc1_3_1_)    
    - [epi](#toc1_3_2_)    
  - [Anteil Mehrfachtumore](#toc1_4_)    
  - [Plausibilitätsprüfungen](#toc1_5_)    
    - [✅ 01-SH](#toc1_5_1_)    
    - [✅ 02-HH](#toc1_5_2_)    
    - [✅ 03-NI](#toc1_5_3_)    
    - [✅ 04-HB](#toc1_5_4_)    
    - [⚠️ 05-NW](#toc1_5_5_)    
    - [✅ 06-HE](#toc1_5_6_)    
    - [✅ 07-RP](#toc1_5_7_)    
    - [✅ 08-BW](#toc1_5_8_)    
    - [✅ 09-BY](#toc1_5_9_)    
    - [✅ 10-SL](#toc1_5_10_)    
    - [✅ 11-GKR (ehemals)](#toc1_5_11_)    
  - [Qualitätsprüfungen](#toc1_6_)    
    - [⚠️ geschlecht_missing](#toc1_6_1_)    
    - [✅ verstorben_missing](#toc1_6_2_)    
    - [⚠️ diagnose_missing](#toc1_6_3_)    
    - [⚠️ diagnose_defekt](#toc1_6_4_)    
    - [⚠️ inzidenzort_missing](#toc1_6_5_)    
    - [✅ geschlecht_icd_konflikt](#toc1_6_6_)    
    - [⚠️ datum_missing](#toc1_6_7_)    
    - [✅ datum_fehlerhaft](#toc1_6_8_)    
    - [nach hat_todesursache bei Nicht-Verstorbenen](#toc1_6_9_)    
  - [⚠️ Duplikate](#toc1_7_)    
    - [Echte Duplikate](#toc1_7_1_)    
    - [Duplikatverdacht](#toc1_7_2_)    
      - [Verteilung nach Inzidenzort](#toc1_7_2_1_)    
      - [Verteilung nach Diagnosejahr](#toc1_7_2_2_)    
      - [Verteilung nach ICD10](#toc1_7_2_3_)    
      - [Verteilung der Gruppen mit gleichen Merkmalen](#toc1_7_2_4_)    
      - [Beispiel Duplikatverdacht bei klinischen Daten](#toc1_7_2_5_)    
  - [Datensatz](#toc1_8_)    
    - [epi](#toc1_8_1_)    
    - [klin](#toc1_8_2_)    

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

<!-- ## <a id='toc1_2_'></a>[Zusammenfassung ⚖️](#toc0_)
- [fehlendes Geschlecht](#toc1_4_1_) tritt nicht auf in den klinischen Daten, in den epi Daten überwiegend in `06-HE`
- für [fehlende Diagnose](#toc1_4_3_) bei den klinischen Daten gibt es einige wenige Fälle in `13-MV` und `16-TH`. Für die epi Daten ist eine Bewertung schwierig aufgrund der vielfältigen Bearbeitungsschritte nach Lieferung
- fehlender Inzidenzort tritt in den klinischen Daten nur in `13-MV` auf. Bei den epi Daten wird diese Variable bei missings auto-korrigiert 
- Widerspruch zwischen Geschlecht und Diagnose ist in den klinischen Daten eine Randerscheinung, in den epi Daten treten diese Kombinationen inzwischen nicht mehr auf
- fehlende Datumsangaben sind in den klinischen Daten in etwa proportional zur Registergrösse, bei den epi Daten überwiegend in `10-SL`
- [echte Duplikate](#toc1_5_1_) (gleiches set an Merkmalen und gleiche ID) für klinische Daten kommen ausschliesslich aus `09-BY`, bleiben aber Randfälle
- [Duplikatverdachtsfälle](#toc1_5_2_) sind deutlich weniger auffällig als letztes Jahr. Diese verteilen sich hauptsächlich auf `11-BE`, `09-BY` und `03-NI`, was möglicherweise an lokalen Häufungen von Fällen mit gleichem Inzidenzort liegt -->

<br>

## <a id='toc1_2_'></a>[⚙️ settings](#toc0_)

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.5.0 | 📦 pandas-plots: 2.0.3


<br>

## <a id='toc1_3_'></a>[Datenstand ⏱️](#toc0_)

### <a id='toc1_3_1_'></a>[klinisch](#toc0_)

    database file:           2026-05-12_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-04-18
    sql table created:       2026-05-12 16:38:32
    doi:                     -
    document created:        2026-05-18 08:37:31



<br>

### <a id='toc1_3_2_'></a>[epi](#toc0_)

    database file:           2026-05-13_data_epi.duckdb
    data tag:                epi2025_1
    sql table created:       2026-05-13 09:31:01
    doi:                     10.18444/5.03.01.0005.0022.0001
    document created:        2026-05-18 08:37:31


    
    aktuellster batch               426
    aktuellstes Diagnosejahr 📆     (2024)



<br>

## <a id='toc1_4_'></a>[Anteil Mehrfachtumore](#toc0_)
- Metrik: Anteil Tumore mit `A_Mehrfachmeldung` **(Werte sind in % angegeben)**
- markierte Mehrfachtumore werden vom ZfKD ausgeschlossen

> 💡 **ZfKD**
> 
> für `13-NI`,`14-SN` und `15-ST` ermittelt das ZfKD sichtbar erhöhte Anteile an Mehrfachtumoren für DJ seit Beginn der klin. Registrierung



```
    n = 17_758_787                     (100.0%) ██████████████████████████████
    └ [DJ 2010-2024]:   n = 11_720_684  (66.0%) ░░░░░░░░░░░███████████████████
    └ [nur gültige BL]: n = 11_711_456  (65.9%) ░░░░░░░░░░░███████████████████
```

<details>
<summary>filter-sql</summary>

```sql
z_dy between 2010 and 2024
and GKZbl::tinyint <= 16
```

</details>


    
    



    
<img alt="png" src="tech_files/output_16_5.png">
    


<br>

## <a id='toc1_5_'></a>[Plausibilitätsprüfungen](#toc0_)
**Filter**
- **es ist jeweils nur das aktuellste DJ berücksichtigt (aktuell `epi2025`: 2024, zum Vergleich `epi2024`: 2023)**

Die Tabellen sind zur besseren Lesbarkeit nun aufgeteilt nach den Plausibilitätsprüfungen ([Liste als pdf](./docs/tech/Plausibilitätsprüfungen_Liste.pdf), [Details als pdf](./docs/tech/Plausibilitätsprüfungen_Details.pdf))
- `A`: Fälle ausgeschlossen
- `B`: Fälle markiert
- `C`: Fälle (auto) korrigiert

Spalten
- `cnt_epi2024`: Absolute Fallzahl der checks für das in diesem Datensatz höchste DJ (2023)
- `cnt_now`: Absolute Fallzahl der checks für das im aktuellen Datensatz höchsten DJ (2024)
- `pct_epi2024`: Anteil Fallzahl der checks an allen Fällen für das in diesem Datensatz höchste DJ (2023)
- `pct_now`: Anteil Fallzahl der checks an allen Fällen für das im aktuellen Datensatz höchste DJ (2024)
- _(Absolute Fallzahlen = nach Abzug der A-Prüfungen)_

Die markierten Fälle können im übermittelten Datensatz geprüft werden, Beispiel: 
<details>
    <summary>click</summary>

```sql
    select * 
    from Tumor4 
    where IARC like '%A_Mehrfach%'
```

</details>

<br>

### <a id='toc1_5_1_'></a>[✅ 01-SH](#toc0_)
- `B_TOD_Ja_Aber_Kein_SJ`: 0 -> 4%
- alle Fälle wurden korrigiert laut `C_TOD=1_korrigiert_aufgrund_Sterbeangaben`


<img alt="png" src="tech_files/output_20_1.png" width="55%">
    



<img alt="png" src="tech_files/output_20_3.png" width="55%">
    



<img alt="png" src="tech_files/output_20_5.png" width="55%">
    



<br>

### <a id='toc1_5_2_'></a>[✅ 02-HH](#toc0_)


<img alt="png" src="tech_files/output_22_1.png" width="55%">
    



<img alt="png" src="tech_files/output_22_3.png" width="55%">
    



<img alt="png" src="tech_files/output_22_5.png" width="55%">
    



<br>

### <a id='toc1_5_3_'></a>[✅ 03-NI](#toc0_)


<img alt="png" src="tech_files/output_24_1.png" width="55%">
    



<img alt="png" src="tech_files/output_24_3.png" width="55%">
    



<img alt="png" src="tech_files/output_24_5.png" width="55%">
    



<br>

### <a id='toc1_5_4_'></a>[✅ 04-HB](#toc0_)


<img alt="png" src="tech_files/output_26_1.png" width="55%">
    



<img alt="png" src="tech_files/output_26_3.png" width="55%">
    



<img alt="png" src="tech_files/output_26_5.png" width="55%">
    



<br>

### <a id='toc1_5_5_'></a>[⚠️ 05-NW](#toc0_)
- unverändert hohe werte bei `A_EKRNR_GKZ_unplausibel`


<img alt="png" src="tech_files/output_28_1.png" width="55%">
    



<img alt="png" src="tech_files/output_28_3.png" width="55%">
    



<img alt="png" src="tech_files/output_28_5.png" width="55%">
    




<br>

### <a id='toc1_5_6_'></a>[✅ 06-HE](#toc0_)


<img alt="png" src="tech_files/output_30_1.png" width="55%">
    



<img alt="png" src="tech_files/output_30_3.png" width="55%">
    



<img alt="png" src="tech_files/output_30_5.png" width="55%">
    




<br>

### <a id='toc1_5_7_'></a>[✅ 07-RP](#toc0_)


<img alt="png" src="tech_files/output_32_1.png" width="55%">
    



<img alt="png" src="tech_files/output_32_3.png" width="55%">
    



<img alt="png" src="tech_files/output_32_5.png" width="55%">
    



<br>

### <a id='toc1_5_8_'></a>[✅ 08-BW](#toc0_)


<img alt="png" src="tech_files/output_34_1.png" width="55%">
    



<img alt="png" src="tech_files/output_34_3.png" width="55%">
    



<img alt="png" src="tech_files/output_34_5.png" width="55%">
    



<br>

### <a id='toc1_5_9_'></a>[✅ 09-BY](#toc0_)


<img alt="png" src="tech_files/output_36_1.png" width="55%">
    



<img alt="png" src="tech_files/output_36_3.png" width="55%">
    



<img alt="png" src="tech_files/output_36_5.png" width="55%">
    




<br>

### <a id='toc1_5_10_'></a>[✅ 10-SL](#toc0_)
- `A_Mehrfachmeldung` leicht erhöht mit ~4%


<img alt="png" src="tech_files/output_38_1.png" width="55%">
    



<img alt="png" src="tech_files/output_38_3.png" width="55%">
    



<img alt="png" src="tech_files/output_38_5.png" width="55%">
    



<br>

### <a id='toc1_5_11_'></a>[✅ 11-GKR (ehemals)](#toc0_)


<img alt="png" src="tech_files/output_40_1.png" width="55%">
    



<img alt="png" src="tech_files/output_40_3.png" width="55%">
    



<img alt="png" src="tech_files/output_40_5.png" width="55%">
    


<div style="page-break-after: always;"></div>


<br>

## <a id='toc1_6_'></a>[Qualitätsprüfungen](#toc0_)
- kein Filter, die Prüfungen wirken auf den gesamten Datenbestand
- zur Darstellung wird eine heatmap verwendet, dem maximalen Wert je Prüfung wird die kräftigste Farbe zugewiesen. Aus diesem relativ gesetzten Farbton ist nicht ableitbar, wie schwerwiegend die Fallzahl ist
- bei **epi** Daten
  - für die NBL wird nur `11-GKR_alt` ausgegeben, also der archivierte GKR Bestand vor DJ2020
  - Daten > 2020 werden aus den klinischen Daten generiert
  - Treffer für NBL > 2020 sind also **nicht** enthalten

<br>

### <a id='toc1_6_1_'></a>[⚠️ geschlecht_missing](#toc0_)
- Variable `Geschlecht` / `SEX` missing

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_48_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_49_1.png">
    


<br>

### <a id='toc1_6_2_'></a>[✅ verstorben_missing](#toc0_)
- Variable `Verstorben` / `TOD` missing

>Die Variable `TOD` wird in den epi Daten imputiert, kann also dort auch nicht fehlen

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_51_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_52_1.png">
    


<br>

### <a id='toc1_6_3_'></a>[⚠️ diagnose_missing](#toc0_)
- Diagnosecode leer (entweder `null` oder `''`)

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_54_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_55_1.png">
    



<br>

### <a id='toc1_6_4_'></a>[⚠️ diagnose_defekt](#toc0_)
- Diagnosecode ist **nich leer**, aber ausserhalb des ZfKD Diagnosebandes

> ⚠️ epi: In den ABC Prüfungen der epi Daten wird getestet, ob ein Diagnosecode leer ist oder ausserhalb des "Diagnosebandes" des ZfKD (konkret: `A_ICD10_keineAuswertung[54]`). Der Test ist auch im Datenbericht der epi Daten sichtbar, dort wird allerdings nur das letzte DJ herangezogen, um auf die aktuelle Entwicklung zu fokussieren.

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_57_1.png">
    



    ---------------------------------------------------------------------------

    BinderException                           Traceback (most recent call last)

    Cell In[65], line 1
    ----> 1 show_missing(db_epi.filter("IARC like '%A_ICD10_keineAuswertung%' and ifnull(ICDGM10_02,'') != ''"),caption="epi", var="diagnose_defect")


    BinderException: Binder Error: Referenced column "ICDGM10_02" not found in FROM clause!
    Candidate bindings: "ICDGM10", "ICDGM10_1", "ICDT10", "DIG", "GDIMP"


<br>

### <a id='toc1_6_5_'></a>[⚠️ inzidenzort_missing](#toc0_)
- Variable `Inzidenzort` fehlt, oder ist unbrauchbar kodiert (_00000_, _99999_, oder Länge != 5)
> epi: die Variable GKZlk wird nachbearbeitet im workflow und weist daher keine missings auf

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_61_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_62_1.png">
    


<br>

### <a id='toc1_6_6_'></a>[✅ geschlecht_icd_konflikt](#toc0_)
- Widerspruch zwischen Geschlecht und Diagnose, eines der Kombinationen:
  - männlich und `['C51','C52','C53','C54','C55','C56','C57','C58']`
  - weiblich und `['C60','C61','C62','C63']`

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_64_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_65_1.png">
    


<br>

### <a id='toc1_6_7_'></a>[⚠️ datum_missing](#toc0_)
- `Diagnosedatum` oder `Geburtsdatum` ist leer (bzw. als Jahr 1900 kodiert)
- nicht gesetzte Angaben zum Vitalstatus sind ignoriert
> ⚠️ hier sind auch regulär übermittelte Fälle mit vollständig (`V`) geschätztem Datum enthalten

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_67_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_68_1.png">
    


<br>

### <a id='toc1_6_8_'></a>[✅ datum_fehlerhaft](#toc0_)
- `Diagnose` vor `Geburt`
- beide nicht missing

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_70_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_71_1.png">
    



<br>

### <a id='toc1_6_9_'></a>[nach hat_todesursache bei Nicht-Verstorbenen](#toc0_)
- gezählt werden **Personen**
- **Filter: `Verstorben` = N**


    
<img alt="png" src="tech_files/output_73_0.png">
    



<br>

## <a id='toc1_7_'></a>[⚠️ Duplikate](#toc0_)

- Echte Duplikate stellen Fälle **mit gleicher Id und gleichem hash-wert dar**
- Duplikat-Verdacht: Duplikate **mit gleicher Id**, **aber ohne inhaltliche Gleichheit** sind häufiger, stellen aber lediglich eine Folge der Id Vergabe im GTDS Verbund dar. Da in der Verarbeitung eine zufällige `uuid` vergeben wird entstehen hier auch keine Kollisionen

<br/>


<br>

### <a id='toc1_7_1_'></a>[Echte Duplikate](#toc0_)
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
    
        z_icd10,
        Morphologie_Code,
        Topographie_Code,
        Geburtsdatum,
        Diagnosedatum,
        z_sex,
        Verstorben,
        Inzidenzort,
        Seitenlokalisation,
        Grading,
        Diagnosesicherung,
        T_p,
        N_p,
        M_p
    


    Echte Duplikate (gleiche Tumor_ID UND gleicher Inhalt/hash):



    
<img alt="png" src="tech_files/output_77_1.png">
    



    
<img alt="png" src="tech_files/output_78_0.png">
    


<br>

### <a id='toc1_7_2_'></a>[Duplikatverdacht](#toc0_)
- die originale `Tumor_ID` wird hier ignoriert
- es wird für alle Tumorfälle geprüft, ob es Fälle mit gleicher Kombination verschiedener Merkmale gibt
- Verdachtsfälle mit gleicher Kombination aus verschiedenen Registern und Patienten sind möglich
- die Übereinstimmungswahrscheinlichkeit steigt deutlich, wenn mehr Merkmale leer sind

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_80_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_81_1.png">
    


<br>

#### <a id='toc1_7_2_1_'></a>[Verteilung nach Inzidenzort](#toc0_)

    🟧 🗄️ klin



    
<img alt="svg" src="tech_files/output_83_1.svg">
    


    🟧 🗄️ epi



    
<img alt="svg" src="tech_files/output_84_1.svg">
    


<br>

#### <a id='toc1_7_2_2_'></a>[Verteilung nach Diagnosejahr](#toc0_)

    🟧 🗄️ klin



    
<img alt="svg" src="tech_files/output_86_1.svg">
    


    🟧 🗄️ epi



    
<img alt="svg" src="tech_files/output_87_1.svg">
    


<br>

#### <a id='toc1_7_2_3_'></a>[Verteilung nach ICD10](#toc0_)

    🟧 🗄️ klin



    
<img alt="svg" src="tech_files/output_89_1.svg">
    


    🟧 🗄️ epi



    
<img alt="svg" src="tech_files/output_90_1.svg">
    


<br>

#### <a id='toc1_7_2_4_'></a>[Verteilung der Gruppen mit gleichen Merkmalen](#toc0_)
- "_Gruppe_" = >1 Verdachtsfälle mit gleichen Merkmalen
- verwendete Metriken (jeweils aufgetragen: `is_equal` = "alle Fälle in der Gruppe haben den gleichen Wert")
> es gibt wenige Gruppen, in denen die Duplikate aus verschiedenen kkr stammen  
> in den meisten Gruppen stammen die Duplikate nicht von einem einzelnen Patienten  

    🟧 🗄️ klin
    10_170 Fälle verteilen sich auf 4_909 Gruppen mit max 14 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 4853, False: 56}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 4445, True: 464}


    🟧 🗄️ epi
    69_517 Fälle verteilen sich auf 34_202 Gruppen mit max 31 Fällen in einer Gruppe
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: REGISTER {True: 23536, False: 10666}
    Anzahl Gruppen, in denen alle Fälle das gleiche Merkmal aufweisen: PATIENTID {False: 32773, True: 1429}



<br>

#### <a id='toc1_7_2_5_'></a>[Beispiel Duplikatverdacht bei klinischen Daten](#toc0_)


```
    ┌──────────────────────┬───────────────┬───────────────────────────┬─────────────┬─────────────────────┬────────────────────────┬──────────────────┬─────────────────────┬───────────────────┬───────────────┬────────────┬────────────┬────────────┬────────────┬───────────────────┬─────────┬───────────────────┬─────────┬───────────────────┬─────────┬─────────┬─────────┬─────────┬─────────┬────────────────┬───────────────┬────────────┬────────────┬────────────┬────────────┬───────────────────┬─────────┬───────────────────┬─────────┬───────────────────┬─────────┬─────────┬─────────┬─────────┬─────────┬────────────────┬─────────┬─────────────┬───────────────┬──────────────────┬─────────────────────┬──────────────────────────────────────┬────────────────────────────────┬──────────────────────────────────┬───────────────┬─────────────────────┬──────────────────┬─────────────┬────────────────────────────┬─────────────┬───────────────┬───────────────┬────────────────────┬───────┬──────────┬──────────────────────┬────────────┬───────┬────────────┬────────────────────┬─────────┬──────────────────────────┬───────┬─────────────┬───────┬────────┬─────────┬─────────┬────────────┬──────────┬──────────────────────────────┬────────────────┬────────────────┬────────────────┬────────────────┬───────────────────┬──────────────────────────────┬───────────────┬──────────┬─────────────┬─────────────┬─────────┬─────────────────────────┬───────────────────────┬────────────┬──────────────┬──────────────────────────┬───────────────────┬───────────────────────────────┬───────┬──────────┬──────────┐
    │        hash2         │ Diagnosedatum │ Diagnosedatum_Genauigkeit │ Inzidenzort │ Diagnose_ICD10_Code │ Diagnose_ICD10_Version │ Topographie_Code │ Topographie_Version │ Diagnosesicherung │ TNM_Auflage_c │ y_Symbol_c │ r_Symbol_c │ a_Symbol_c │ m_Symbol_c │ c_p_u_Praefix_T_c │   T_c   │ c_p_u_Praefix_N_c │   N_c   │ c_p_u_Praefix_M_c │   M_c   │   L_c   │   V_c   │  Pn_c   │   S_c   │ UICC_Stadium_c │ TNM_Auflage_p │ y_Symbol_p │ r_Symbol_p │ a_Symbol_p │ m_Symbol_p │ c_p_u_Praefix_T_p │   T_p   │ c_p_u_Praefix_N_p │   N_p   │ c_p_u_Praefix_M_p │   M_p   │   L_p   │   V_p   │  Pn_p   │   S_p   │ UICC_Stadium_p │ Grading │ LK_befallen │ LK_untersucht │ Morphologie_Code │ Morphologie_Version │ Praetherapeutischer_Menopausenstatus │ HormonrezeptorStatus_Oestrogen │ HormonrezeptorStatus_Progesteron │ Her2neuStatus │ TumorgroesseInvasiv │ TumorgroesseDCIS │ RASMutation │ RektumAbstandAnokutanlinie │ GradPrimaer │ GradSekundaer │ ScoreErgebnis │ AnlassGleasonScore │  PSA  │ DatumPSA │ DatumPSA_Genauigkeit │ Tumordicke │  LDH  │ Ulzeration │ Seitenlokalisation │   DCN   │ Anzahl_Tage_Diagnose_Tod │ z_kkr │ z_kkr_label │ z_dy  │ z_age  │ z_ag05  │ z_icd10 │ z_icd10_3d │ z_is_dco │      z_last_tum_status       │ z_tum_op_count │ z_tum_st_count │ z_tum_sy_count │ z_tum_fo_count │ z_first_treatment │ z_first_treatment_after_days │ z_event_order │ z_events │ z_class_hpv │ z_tum_order │  z_sex  │ z_period_diag_death_day │ z_period_diag_psa_day │ Verstorben │ Geburtsdatum │ Geburtsdatum_Genauigkeit │ Datum_Vitalstatus │ Datum_Vitalstatus_Genauigkeit │  cnt  │ same_kkr │ same_pat │
    ├──────────────────────┼───────────────┼───────────────────────────┼─────────────┼─────────────────────┼────────────────────────┼──────────────────┼─────────────────────┼───────────────────┼───────────────┼────────────┼────────────┼────────────┼────────────┼───────────────────┼─────────┼───────────────────┼─────────┼───────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┼────────────────┼───────────────┼────────────┼────────────┼────────────┼────────────┼───────────────────┼─────────┼───────────────────┼─────────┼───────────────────┼─────────┼─────────┼─────────┼─────────┼─────────┼────────────────┼─────────┼─────────────┼───────────────┼──────────────────┼─────────────────────┼──────────────────────────────────────┼────────────────────────────────┼──────────────────────────────────┼───────────────┼─────────────────────┼──────────────────┼─────────────┼────────────────────────────┼─────────────┼───────────────┼───────────────┼────────────────────┼───────┼──────────┼──────────────────────┼────────────┼───────┼────────────┼────────────────────┼─────────┼──────────────────────────┼───────┼─────────────┼───────┼────────┼─────────┼─────────┼────────────┼──────────┼──────────────────────────────┼────────────────┼────────────────┼────────────────┼────────────────┼───────────────────┼──────────────────────────────┼───────────────┼──────────┼─────────────┼─────────────┼─────────┼─────────────────────────┼───────────────────────┼────────────┼──────────────┼──────────────────────────┼───────────────────┼───────────────────────────────┼───────┼──────────┼──────────┤
    │ 18058701358738449118 │ 2022-02-15    │ T                         │ 13075       │ C44.3               │ 10 2022 GM             │ C44.3            │ 33                  │ 7                 │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ 8             │ NULL       │ NULL       │ NULL       │ NULL       │ p                 │ 1       │ c                 │ 0       │ c                 │ 0       │ L0      │ V0      │ NULL    │ NULL    │ I              │ 2       │        NULL │          NULL │ 8071/3           │ 33                  │ NULL                                 │ NULL                           │ NULL                             │ NULL          │                NULL │             NULL │ NULL        │                       NULL │ NULL        │ NULL          │ NULL          │ NULL               │  NULL │ NULL     │ NULL                 │       NULL │  NULL │ NULL       │ R                  │ N       │                     NULL │    13 │ 13-MV       │  2022 │  82.58 │ a80b84  │ C44.3   │ C44        │ false    │ NULL                         │              1 │              0 │              0 │              0 │ op                │                            0 │ op            │ op       │ NULL        │           8 │ W       │                    NULL │                  NULL │ N          │ 1939-07-15   │ T                        │ 2022-06-15        │ T                             │     3 │ true     │ true     │
    │ 18058701358738449118 │ 2022-02-15    │ T                         │ 13075       │ C44.3               │ 10 2022 GM             │ C44.3            │ 33                  │ 7                 │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ 8             │ NULL       │ NULL       │ NULL       │ NULL       │ p                 │ 1       │ c                 │ 0       │ c                 │ 0       │ L0      │ V0      │ NULL    │ NULL    │ I              │ 2       │        NULL │          NULL │ 8071/3           │ 33                  │ NULL                                 │ NULL                           │ NULL                             │ NULL          │                NULL │             NULL │ NULL        │                       NULL │ NULL        │ NULL          │ NULL          │ NULL               │  NULL │ NULL     │ NULL                 │       NULL │  NULL │ NULL       │ R                  │ N       │                     NULL │    13 │ 13-MV       │  2022 │  82.58 │ a80b84  │ C44.3   │ C44        │ false    │ NULL                         │              1 │              0 │              0 │              0 │ op                │                            0 │ op            │ op       │ NULL        │           5 │ W       │                    NULL │                  NULL │ N          │ 1939-07-15   │ T                        │ 2022-06-15        │ T                             │     3 │ true     │ true     │
    │ 18058701358738449118 │ 2022-02-15    │ T                         │ 13075       │ C44.3               │ 10 2022 GM             │ C44.3            │ 33                  │ 7                 │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ 8             │ NULL       │ NULL       │ NULL       │ NULL       │ p                 │ 1       │ c                 │ 0       │ c                 │ 0       │ L0      │ V0      │ NULL    │ NULL    │ I              │ 2       │        NULL │          NULL │ 8071/3           │ 33                  │ NULL                                 │ NULL                           │ NULL                             │ NULL          │                NULL │             NULL │ NULL        │                       NULL │ NULL        │ NULL          │ NULL          │ NULL               │  NULL │ NULL     │ NULL                 │       NULL │  NULL │ NULL       │ R                  │ N       │                     NULL │    13 │ 13-MV       │  2022 │  82.58 │ a80b84  │ C44.3   │ C44        │ false    │ NULL                         │              1 │              0 │              0 │              0 │ op                │                            0 │ op            │ op       │ NULL        │           3 │ W       │                    NULL │                  NULL │ N          │ 1939-07-15   │ T                        │ 2022-06-15        │ T                             │     3 │ true     │ true     │
    │          ·           │     ·         │ ·                         │   ·         │   ·                 │     ·                  │   ·              │ ·                   │ ·                 │  ·            │  ·         │  ·         │  ·         │  ·         │  ·                │  ·      │  ·                │  ·      │  ·                │  ·      │  ·      │  ·      │  ·      │  ·      │  ·             │ ·             │  ·         │  ·         │  ·         │  ·         │ ·                 │ ·       │ ·                 │ ·       │ ·                 │ ·       │ ·       │ ·       │  ·      │  ·      │ ·              │ ·       │          ·  │            ·  │   ·              │ ·                   │  ·                                   │  ·                             │  ·                               │  ·            │                  ·  │               ·  │  ·          │                         ·  │  ·          │  ·            │  ·            │  ·                 │    ·  │  ·       │  ·                   │         ·  │    ·  │  ·         │ ·                  │ ·       │                       ·  │     · │   ·         │    ·  │    ·   │   ·     │   ·     │  ·         │   ·      │  ·                           │              · │              · │              · │              · │ ·                 │                            · │ ·             │ ·        │  ·          │           · │ ·       │                      ·  │                    ·  │ ·          │     ·        │ ·                        │     ·             │ ·                             │     · │  ·       │  ·       │
    │          ·           │     ·         │ ·                         │   ·         │   ·                 │     ·                  │   ·              │ ·                   │ ·                 │  ·            │  ·         │  ·         │  ·         │  ·         │  ·                │  ·      │  ·                │  ·      │  ·                │  ·      │  ·      │  ·      │  ·      │  ·      │  ·             │ ·             │  ·         │  ·         │  ·         │  ·         │ ·                 │ ·       │ ·                 │ ·       │ ·                 │ ·       │ ·       │ ·       │  ·      │  ·      │ ·              │ ·       │          ·  │            ·  │   ·              │ ·                   │  ·                                   │  ·                             │  ·                               │  ·            │                  ·  │               ·  │  ·          │                         ·  │  ·          │  ·            │  ·            │  ·                 │    ·  │  ·       │  ·                   │         ·  │    ·  │  ·         │ ·                  │ ·       │                       ·  │     · │   ·         │    ·  │    ·   │   ·     │   ·     │  ·         │   ·      │  ·                           │              · │              · │              · │              · │ ·                 │                            · │ ·             │ ·        │  ·          │           · │ ·       │                      ·  │                    ·  │ ·          │     ·        │ ·                        │     ·             │ ·                             │     · │  ·       │  ·       │
    │          ·           │     ·         │ ·                         │   ·         │   ·                 │     ·                  │   ·              │ ·                   │ ·                 │  ·            │  ·         │  ·         │  ·         │  ·         │  ·                │  ·      │  ·                │  ·      │  ·                │  ·      │  ·      │  ·      │  ·      │  ·      │  ·             │ ·             │  ·         │  ·         │  ·         │  ·         │ ·                 │ ·       │ ·                 │ ·       │ ·                 │ ·       │ ·       │ ·       │  ·      │  ·      │ ·              │ ·       │          ·  │            ·  │   ·              │ ·                   │  ·                                   │  ·                             │  ·                               │  ·            │                  ·  │               ·  │  ·          │                         ·  │  ·          │  ·            │  ·            │  ·                 │    ·  │  ·       │  ·                   │         ·  │    ·  │  ·         │ ·                  │ ·       │                       ·  │     · │   ·         │    ·  │    ·   │   ·     │   ·     │  ·         │   ·      │  ·                           │              · │              · │              · │              · │ ·                 │                            · │ ·             │ ·        │  ·          │           · │ ·       │                      ·  │                    ·  │ ·          │     ·        │ ·                        │     ·             │ ·                             │     · │  ·       │  ·       │
    │ 14976922600554885008 │ 2014-07-15    │ T                         │ 15091       │ C44.6               │ 10 2014 GM             │ C44.61           │ 33                  │ 71                │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ U       │        NULL │          NULL │ 8090/3           │ 31                  │ NULL                                 │ NULL                           │ NULL                             │ NULL          │                NULL │             NULL │ NULL        │                       NULL │ NULL        │ NULL          │ NULL          │ NULL               │  NULL │ NULL     │ NULL                 │       NULL │  NULL │ NULL       │ L                  │ N       │                     NULL │    15 │ 15-ST       │  2014 │  77.33 │ a75b79  │ C44.6   │ C44        │ false    │ V - Vollremission (complete) │              2 │              0 │              0 │              1 │ op                │                            0 │ op-fo         │ op|fo    │ NULL        │           8 │ M       │                    NULL │                  NULL │ N          │ 1937-03-15   │ T                        │ 2021-02-15        │ T                             │     2 │ true     │ true     │
    │ 14976922600554885008 │ 2014-07-15    │ T                         │ 15091       │ C44.6               │ 10 2014 GM             │ C44.61           │ 33                  │ 71                │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ NULL          │ NULL       │ NULL       │ NULL       │ NULL       │ NULL              │ NULL    │ NULL              │ NULL    │ NULL              │ NULL    │ NULL    │ NULL    │ NULL    │ NULL    │ NULL           │ U       │        NULL │          NULL │ 8090/3           │ 31                  │ NULL                                 │ NULL                           │ NULL                             │ NULL          │                NULL │             NULL │ NULL        │                       NULL │ NULL        │ NULL          │ NULL          │ NULL               │  NULL │ NULL     │ NULL                 │       NULL │  NULL │ NULL       │ L                  │ N       │                     NULL │    15 │ 15-ST       │  2014 │  77.33 │ a75b79  │ C44.6   │ C44        │ false    │ NULL                         │              2 │              0 │              0 │              0 │ op                │                            0 │ op            │ op       │ NULL        │           3 │ M       │                    NULL │                  NULL │ N          │ 1937-03-15   │ T                        │ 2021-02-15        │ T                             │     2 │ true     │ true     │
    └──────────────────────┴───────────────┴───────────────────────────┴─────────────┴─────────────────────┴────────────────────────┴──────────────────┴─────────────────────┴───────────────────┴───────────────┴────────────┴────────────┴────────────┴────────────┴───────────────────┴─────────┴───────────────────┴─────────┴───────────────────┴─────────┴─────────┴─────────┴─────────┴─────────┴────────────────┴───────────────┴────────────┴────────────┴────────────┴────────────┴───────────────────┴─────────┴───────────────────┴─────────┴───────────────────┴─────────┴─────────┴─────────┴─────────┴─────────┴────────────────┴─────────┴─────────────┴───────────────┴──────────────────┴─────────────────────┴──────────────────────────────────────┴────────────────────────────────┴──────────────────────────────────┴───────────────┴─────────────────────┴──────────────────┴─────────────┴────────────────────────────┴─────────────┴───────────────┴───────────────┴────────────────────┴───────┴──────────┴──────────────────────┴────────────┴───────┴────────────┴────────────────────┴─────────┴──────────────────────────┴───────┴─────────────┴───────┴────────┴─────────┴─────────┴────────────┴──────────┴──────────────────────────────┴────────────────┴────────────────┴────────────────┴────────────────┴───────────────────┴──────────────────────────────┴───────────────┴──────────┴─────────────┴─────────────┴─────────┴─────────────────────────┴───────────────────────┴────────────┴──────────────┴──────────────────────────┴───────────────────┴───────────────────────────────┴───────┴──────────┴──────────┘
```

      953 rows (5 shown)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          97 columns
    



<br>

## <a id='toc1_8_'></a>[Datensatz](#toc0_)

### <a id='toc1_8_1_'></a>[epi](#toc0_)

    🔵 *** df: Tumor (id excluded) ***  
    🟣 shape: (1_000, 50)
    🟣 duplicates: 0 (0%)  
    🟠 column stats all (dtype | uniques | missings) [values]  
    - index [0, 1, 2, 3, 4,]  
    - GLOBALPATID (object | 982 | 0 (0%)) ['010000002132', '010000004272', '010000007782', '010000018611', '010000018649',]  
    - GLOBALID (object | 1_000 | 0 (0%)) ['010000000001', '010000000002', '010000000003', '010000000004', '010000000005',]  
    - EKRNR (object | 1 | 0 (0%)) ['01',]  
    - SEX (int8 | 2 | 0 (0%)) [1, 2,]  
    - GDIMP (datetime64[us] | 471 | 0 (0%)) [1920-02-15 00:00:00, 1920-07-15 00:00:00, 1922-09-15 00:00:00, 1924-02-15 00:00:00,  
    1924-12-15 00:00:00,]  
    - GKZlk (object | 15 | 0 (0%)) ['01001', '01002', '01003', '01004', '01051',]  
    - GKZrb (object | 1 | 0 (0%)) ['010',]  
    - GKZbl (object | 1 | 0 (0%)) ['01',]  
    - DALTIMP (float64 | 487 | 0 (0%)) [3.75, 5.83333, 20.75, 21.1667, 22.0833,]  
    - ALTGRP (object | 16 | 0 (0%)) ['a00b04', 'a05b09', 'a20b24', 'a25b29', 'a30b34',]  
    - ICDGM10 (object | 170 | 0 (0%)) ['C069', 'C098', 'C111', 'C158', 'C159',]  
    - ICDGM10_02 (object | 174 | 0 (0%)) ['C06.9', 'C09.8', 'C11.1', 'C15.8', 'C15.9',]  
    - ICDGM10_03 (object | 174 | 0 (0%)) ['C069', 'C098', 'C111', 'C158', 'C159',]  
    - HISC (object | 122 | 0 (0%)) ['8000', '8004', '8010', '8013', '8020',]  
    - HISC_02 (object | 133 | 0 (0%)) ['8000/1', '8000/3', '8004/3', '8010/2', '8010/3',]  
    - HISC_03 (object | 122 | 0 (0%)) ['8000', '8004', '8010', '8013', '8020',]  
    - DIG (int16 | 3 | 0 (0%)) [1, 2, 3,]  
    - DIG_03 (int16 | 3 | 0 (0%)) [1, 2, 3,]  
    - ICDO3 (object | 115 | 0 (0%)) ['C069', 'C079', 'C098', 'C111', 'C158',]  
    - ICDO3_02 (object | 115 | 0 (0%)) ['C06.9', 'C07.9', 'C09.8', 'C11.1', 'C15.8',]  
    - ICDO3_03 (object | 115 | 0 (0%)) ['C069', 'C079', 'C098', 'C111', 'C158',]  
    - LOKS (object | 5 | 167 (17%)) ['1', '2', '3', '4', '<NA>',]  
    - DDIMP (datetime64[us] | 59 | 0 (0%)) [1998-07-15 00:00:00, 1999-07-15 00:00:00, 2000-07-15 00:00:00, 2001-07-15 00:00:00,  
    2004-07-15 00:00:00,]  
    - DJ (int16 | 15 | 0 (0%)) [1998, 1999, 2000, 2001, 2004,]  
    - TUMID (Int8 | 6 | 1 (0%)) [1, 2, 3, 4, 5,]  
    - TUMID2 (Int8 | 5 | 473 (47%)) [1, 2, 3, 4, <NA>,]  
    - TUMID3 (Int8 | 5 | 485 (48%)) [1, 2, 3, 4, <NA>,]  
    - DSICH (Int32 | 8 | 119 (12%)) [1, 2, 3, 4, 5,]  
    - DCO (int32 | 2 | 0 (0%)) [1, 2,]  
    - TNMAUFL (int32 | 4 | 0 (0%)) [5, 6, 7, 8,]  
    - TNMTKURZ (object | 21 | 306 (31%)) ['0', '1', '1a', '1b', '1b1',]  
    - TNMNKURZ (object | 11 | 309 (31%)) ['0', '1', '1a', '1b', '2',]  
    - TNMMKURZ (object | 6 | 554 (55%)) ['0', '1', '1a', '1b', '1c',]  
    - UICC (object | 5 | 820 (82%)) ['<NA>', 'I', 'II', 'III', 'IV',]  
    - TOD (int32 | 2 | 0 (0%)) [1, 2,]  
    - SDIMP (datetime64[us] | 84 | 604 (60%)) [2010-02-15 00:00:00, 2017-01-15 00:00:00, 2018-02-15 00:00:00, 2018-03-15 00:00:00,  
    2018-04-15 00:00:00,]  
    - ICDT10 (object | 126 | 596 (60%)) ['<NA>', 'A411', 'A419', 'C049', 'C069',]  
    - ICDTAUFL (object | 1 | 0 (0%)) ['10',]  
    - GRAD (Int16 | 7 | 660 (66%)) [1, 2, 3, 4, 5,]  
    - TNMTC (object | 1 | 1_000 (100%)) ['<NA>',]  
    - TNMNC (object | 1 | 1_000 (100%)) ['<NA>',]  
    - TNMMC (object | 1 | 1_000 (100%)) ['<NA>',]  
    - TNMPT (object | 3 | 354 (35%)) ['1', '2', '<NA>',]  
    - TNMPN (object | 3 | 450 (45%)) ['1', '2', '<NA>',]  
    - TNMPM (object | 3 | 736 (74%)) ['1', '2', '<NA>',]  
    - AUT (object | 1 | 1_000 (100%)) ['<NA>',]  
    - IARC (object | 11 | 948 (95%)) [' | A_Mehrfachmeldung', ' | B_DALT_HISC_ICD10_unplausibel', ' | B_DSICH_HISC_unplausibel',  
    ' | B_GRAD_HISC_unplausibel', ' | B_HISC_ICDO3_unplausibel',]  
    - ZTYP (Int16 | 3 | 986 (99%)) [5, 6, <NA>,]  
    - is_deleted (int8 | 2 | 0 (0%)) [0, 1,]  
    - CREATED (datetime64[us] | 1 | 0 (0%)) [2026-05-13 09:31:01,]  
    
    🟠 column stats numeric  
    
    column (n = 1_000) |   notnull    |  min  | lower  |    q25    |  median   |   mean    |    q75    | upper  |  max   |  std   |   cv  
    -------------------+--------------+-------+--------+-----------+-----------+-----------+-----------+--------+--------+--------+-------
    SEX                | 1_000 (100%) |     1 |      1 |     1.000 |     1.000 |     1.466 |     2.000 |      2 |      2 |  0.499 |  0.340
    DALTIMP            | 1_000 (100%) | 3.750 | 34.417 |    61.500 |    72.792 |    69.640 |    79.750 | 97.583 | 97.583 | 14.176 |  0.204
    DIG                | 1_000 (100%) |     1 |      3 |     3.000 |     3.000 |     2.812 |     3.000 |      3 |      3 |  0.421 |  0.150
    DIG_03             | 1_000 (100%) |     1 |      3 |     3.000 |     3.000 |     2.813 |     3.000 |      3 |      3 |  0.420 |  0.149
    DJ                 | 1_000 (100%) |  1998 |   2015 | 2_018.000 | 2_018.000 | 2_018.551 | 2_020.000 |   2020 |   2020 |  1.691 |  0.001
    TUMID              |    999 (99%) |     1 |      1 |     1.000 |     1.000 |     1.372 |     2.000 |      3 |      5 |  0.662 |  0.482
    TUMID2             |    527 (52%) |     1 |      1 |     1.000 |     1.000 |     1.154 |     1.000 |      1 |      4 |  0.424 |  0.367
    TUMID3             |    515 (51%) |     1 |      1 |     1.000 |     1.000 |     1.146 |     1.000 |      1 |      4 |  0.414 |  0.361
    DSICH              |    881 (88%) |     1 |      7 |     7.000 |     7.000 |     6.856 |     7.000 |      7 |      7 |  0.738 |  0.108
    DCO                | 1_000 (100%) |     1 |      2 |     2.000 |     2.000 |     1.998 |     2.000 |      2 |      2 |  0.045 |  0.022
    TNMAUFL            | 1_000 (100%) |     5 |      8 |     8.000 |     8.000 |     7.937 |     8.000 |      8 |      8 |  0.292 |  0.037
    TOD                | 1_000 (100%) |     1 |      1 |     1.000 |     2.000 |     1.596 |     2.000 |      2 |      2 |  0.491 |  0.308
    GRAD               |    340 (34%) |     1 |      1 |     2.000 |     2.000 |     2.282 |     3.000 |      4 |      7 |  1.049 |  0.460
    ZTYP               |      14 (1%) |     5 |      6 |     6.000 |     6.000 |     5.929 |     6.000 |      6 |      6 |  0.267 |  0.045
    is_deleted         | 1_000 (100%) |     0 |      0 |     0.000 |     0.000 |     0.001 |     0.000 |      0 |      1 |  0.032 | 31.623
    
    
    🟠 sample 3 rows  




```

```


```
    ┌──────────────┬──────────────┬─────────┬──────┬───┬─────────┬───────┬────────────┬─────────────────────┐
    │ GLOBALPATID  │   GLOBALID   │  EKRNR  │ SEX  │ … │  IARC   │ ZTYP  │ is_deleted │       CREATED       │
    ├──────────────┼──────────────┼─────────┼──────┼───┼─────────┼───────┼────────────┼─────────────────────┤
    │ 010000571113 │ 010000000001 │ 01      │    1 │ … │ NULL    │  NULL │          0 │ 2026-05-13 09:31:01 │
    │ 010000566613 │ 010000000002 │ 01      │    1 │ … │ NULL    │  NULL │          0 │ 2026-05-13 09:31:01 │
    │ 010000297333 │ 010000000003 │ 01      │    1 │ … │ NULL    │  NULL │          0 │ 2026-05-13 09:31:01 │
    └──────────────┴──────────────┴─────────┴──────┴───┴─────────┴───────┴────────────┴─────────────────────┘
```

      3 rows                                                                           50 columns (8 shown)
    



    
<img alt="svg" src="tech_files/output_99_4.svg">
    



    
<img alt="png" src="tech_files/output_99_5.png">
    



<br>

### <a id='toc1_8_2_'></a>[klin](#toc0_)

    🔵 *** df: Tumor (id excluded) ***  
    🟣 shape: (1_000, 101)
    🟣 duplicates: 0 (0%)  
    🟠 column stats all (dtype | uniques | missings) [values]  
    - index [0, 1, 2, 3, 4,]  
    - Diagnosedatum (datetime64[us] | 147 | 0 (0%)) [1900-04-01 00:00:00, 1982-07-01 00:00:00, 1994-01-15 00:00:00, 1997-04-15 00:00:00,  
    1998-05-15 00:00:00,]  
    - Diagnosedatum_Genauigkeit (object | 3 | 0 (0%)) ['M', 'T', 'V',]  
    - Inzidenzort (object | 280 | 0 (0%)) ['01001', '01002', '01003', '01051', '01053',]  
    - Diagnose_ICD10_Code (object | 216 | 0 (0%)) ['C00.1', 'C01', 'C02.1', 'C02.2', 'C02.9',]  
    - Diagnose_ICD10_Version (object | 15 | 21 (2%)) ['10 2013 GM', '10 2014 GM', '10 2015 GM', '10 2016 GM', '10 2017 GM',]  
    - Topographie_Code (object | 187 | 0 (0%)) ['C00.1', 'C01.9', 'C02.0', 'C02.1', 'C02.2',]  
    - Topographie_Version (object | 4 | 26 (3%)) ['31', '32', '33', '<NA>',]  
    - Diagnosesicherung (object | 9 | 0 (0%)) ['0', '1', '2', '5', '6',]  
    - TNM_Auflage_c (object | 4 | 618 (62%)) ['6', '7', '8', '<NA>',]  
    - y_Symbol_c (object | 1 | 1_000 (100%)) ['<NA>',]  
    - r_Symbol_c (object | 1 | 1_000 (100%)) ['<NA>',]  
    - a_Symbol_c (object | 1 | 1_000 (100%)) ['<NA>',]  
    - m_Symbol_c (object | 3 | 994 (99%)) ['2', '<NA>', 'm',]  
    - c_p_u_Praefix_T_c (object | 4 | 675 (68%)) ['<NA>', 'c', 'p', 'u',]  
    - T_c (object | 27 | 619 (62%)) ['0', '1', '1B', '1C', '1a',]  
    - c_p_u_Praefix_N_c (object | 4 | 696 (70%)) ['<NA>', 'c', 'p', 'u',]  
    - N_c (object | 14 | 643 (64%)) ['0', '0(sn)', '1', '1a', '2',]  
    - c_p_u_Praefix_M_c (object | 3 | 700 (70%)) ['<NA>', 'c', 'p',]  
    - M_c (object | 9 | 646 (65%)) ['0', '1', '1A', '1C', '1a',]  
    - L_c (object | 4 | 931 (93%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_c (object | 4 | 944 (94%)) ['<NA>', 'V0', 'V1', 'VX',]  
    - Pn_c (object | 4 | 953 (95%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_c (object | 2 | 994 (99%)) ['<NA>', 'SX',]  
    - UICC_Stadium_c (object | 22 | 742 (74%)) ['0', '0a', '<NA>', 'I', 'IA',]  
    - TNM_Auflage_p (object | 4 | 505 (50%)) ['6', '7', '8', '<NA>',]  
    - y_Symbol_p (object | 2 | 964 (96%)) ['<NA>', 'y',]  
    - r_Symbol_p (object | 1 | 1_000 (100%)) ['<NA>',]  
    - a_Symbol_p (object | 1 | 1_000 (100%)) ['<NA>',]  
    - m_Symbol_p (object | 6 | 986 (99%)) ['2', '3', '4', '5', '<NA>',]  
    - c_p_u_Praefix_T_p (object | 2 | 497 (50%)) ['<NA>', 'p',]  
    - T_p (object | 35 | 497 (50%)) ['0', '1', '1(is)', '1A1', '1a',]  
    - c_p_u_Praefix_N_p (object | 3 | 623 (62%)) ['<NA>', 'c', 'p',]  
    - N_p (object | 33 | 581 (58%)) ['0', '0 (0/3, sn, i-)', '0 (0/43)', '0 (0/6, sn, i-)', '0(0/16)',]  
    - c_p_u_Praefix_M_p (object | 3 | 671 (67%)) ['<NA>', 'c', 'p',]  
    - M_p (object | 7 | 614 (61%)) ['0', '1', '1a', '1b', '1c',]  
    - L_p (object | 4 | 703 (70%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_p (object | 4 | 712 (71%)) ['<NA>', 'V0', 'V1', 'VX',]  
    - Pn_p (object | 4 | 784 (78%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_p (object | 4 | 980 (98%)) ['<NA>', 'S0', 'S1', 'SX',]  
    - UICC_Stadium_p (object | 22 | 709 (71%)) ['0', '0a', '0is', '<NA>', 'I',]  
    - Grading (object | 12 | 0 (0%)) ['0', '1', '2', '3', '4',]  
    - LK_befallen (Int32 | 15 | 868 (87%)) [0, 1, 2, 3, 4,]  
    - LK_untersucht (Int32 | 41 | 819 (82%)) [0, 1, 2, 3, 4,]  
    - Morphologie_Code (object | 159 | 0 (0%)) ['8000/0', '8000/1', '8000/3', '8010/2', '8010/3',]  
    - Morphologie_Version (object | 5 | 28 (3%)) ['31', '32', '33', '<NA>', 'bb',]  
    - Praetherapeutischer_Menopausenstatus (object | 4 | 895 (90%)) ['1', '3', '<NA>', 'U',]  
    - HormonrezeptorStatus_Oestrogen (object | 4 | 864 (86%)) ['<NA>', 'N', 'P', 'U',]  
    - HormonrezeptorStatus_Progesteron (object | 4 | 865 (86%)) ['<NA>', 'N', 'P', 'U',]  
    - Her2neuStatus (object | 4 | 853 (85%)) ['<NA>', 'N', 'P', 'U',]  
    - TumorgroesseInvasiv (Int32 | 28 | 931 (93%)) [0, 6, 7, 8, 9,]  
    - TumorgroesseDCIS (Int32 | 20 | 962 (96%)) [0, 5, 6, 10, 13,]  
    - RASMutation (object | 1 | 1_000 (100%)) ['<NA>',]  
    - RektumAbstandAnokutanlinie (Int32 | 1 | 1_000 (100%)) [<NA>,]  
    - GradPrimaer (object | 1 | 1_000 (100%)) ['<NA>',]  
    - GradSekundaer (object | 1 | 1_000 (100%)) ['<NA>',]  
    - ScoreErgebnis (object | 1 | 1_000 (100%)) ['<NA>',]  
    - AnlassGleasonScore (object | 1 | 1_000 (100%)) ['<NA>',]  
    - PSA (float32 | 1 | 1_000 (100%)) [nan,]  
    - DatumPSA (datetime64[us] | 1 | 1_000 (100%)) [NaT,]  
    - DatumPSA_Genauigkeit (object | 1 | 1_000 (100%)) ['<NA>',]  
    - Tumordicke (float32 | 1 | 1_000 (100%)) [nan,]  
    - LDH (Int32 | 1 | 1_000 (100%)) [<NA>,]  
    - Ulzeration (object | 1 | 1_000 (100%)) ['<NA>',]  
    - Seitenlokalisation (object | 6 | 0 (0%)) ['B', 'L', 'M', 'R', 'T',]  
    - DCN (object | 2 | 0 (0%)) ['J', 'N',]  
    - Anzahl_Tage_Diagnose_Tod (Int32 | 252 | 699 (70%)) [0, 1, 2, 3, 4,]  
    - z_kkr (int8 | 15 | 0 (0%)) [1, 2, 3, 4, 6,]  
    - z_kkr_label (object | 15 | 0 (0%)) ['01-SH', '02-HH', '03-NI', '04-HB', '06-HE',]  
    - z_dy (int16 | 31 | 0 (0%)) [1900, 1982, 1994, 1997, 1998,]  
    - z_age (float64 | 522 | 0 (0%)) [-66.67, -37.92, 4.5, 5.08, 19.42,]  
    - z_ag05 (object | 18 | 2 (0%)) ['<NA>', 'a00b04', 'a05b09', 'a15b19', 'a20b24',]  
    - z_icd10 (object | 205 | 0 (0%)) ['C00.1', 'C01', 'C02.1', 'C02.2', 'C02.9',]  
    - z_icd10_3d (object | 86 | 0 (0%)) ['C00', 'C01', 'C02', 'C03', 'C04',]  
    - z_t_c_0 (object | 23 | 619 (62%)) ['0', '1', '1a', '1a1', '1b',]  
    - z_t_c_1 (object | 9 | 619 (62%)) ['0', '1', '2', '3', '4',]  
    - z_t_p_0 (object | 24 | 497 (50%)) ['0', '1', '1a', '1a1', '1b',]  
    - z_t_p_1 (object | 9 | 497 (50%)) ['0', '1', '2', '3', '4',]  
    - z_n_c_0 (object | 13 | 643 (64%)) ['0', '0(sn)', '1', '1a', '2',]  
    - z_n_c_1 (object | 6 | 643 (64%)) ['0', '1', '2', '3', '<NA>',]  
    - z_n_p_0 (object | 19 | 581 (58%)) ['0', '0(i-)', '0(i-)(sn)', '0(sn)', '1',]  
    - z_n_p_1 (object | 6 | 581 (58%)) ['0', '1', '2', '3', '<NA>',]  
    - z_m_c_0 (object | 6 | 651 (65%)) ['0', '1', '1a', '1b', '1c',]  
    - z_m_c_1 (object | 3 | 651 (65%)) ['0', '1', '<NA>',]  
    - z_m_p_0 (object | 6 | 618 (62%)) ['0', '1', '1a', '1b', '1c',]  
    - z_m_p_1 (object | 3 | 618 (62%)) ['0', '1', '<NA>',]  
    - z_m_pc_1 (object | 3 | 418 (42%)) ['0', '1', '<NA>',]  
    - z_is_dco (bool | 2 | 0 (0%)) [False, True,]  
    - z_last_tum_status (object | 11 | 682 (68%)) ['<NA>', 'B - klinische Besserung des Zustandes', 'D - divergentes Geschehen',  
    'K - keine Änderung', 'P - Progression',]  
    - z_tum_op_count (int16 | 9 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_st_count (int16 | 4 | 0 (0%)) [0, 1, 2, 3,]  
    - z_tum_sy_count (int16 | 9 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_fo_count (int16 | 16 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_first_treatment (object | 4 | 410 (41%)) ['<NA>', 'op', 'st', 'sy',]  
    - z_first_treatment_after_days (Int32 | 127 | 410 (41%)) [0, 1, 2, 3, 4,]  
    - z_event_order (object | 115 | 355 (36%)) ['<NA>', 'fo', 'fo-op', 'fo-op-fo', 'fo-op-fo-op-fo',]  
    - z_events (object | 16 | 0 (0%)) ['-', 'fo', 'op', 'op|fo', 'op|st',]  
    - z_class_hpv (object | 4 | 985 (98%)) ['<NA>', 'N', 'P', 'U',]  
    - z_tum_order (int8 | 14 | 0 (0%)) [1, 2, 3, 4, 5,]  
    - z_sex (object | 2 | 0 (0%)) ['M', 'W',]  
    - z_period_diag_death_day (Int32 | 253 | 695 (70%)) [0, 1, 2, 3, 4,]  
    - z_period_diag_psa_day (Int32 | 1 | 1_000 (100%)) [<NA>,]  
    
    🟠 column stats numeric  
    
    column (n = 1_000)           |   notnull    |   min   | lower  |    q25    |  median   |   mean    |    q75    | upper  |  max   |    std    |  cv  
    -----------------------------+--------------+---------+--------+-----------+-----------+-----------+-----------+--------+--------+-----------+------
    LK_befallen                  |    132 (13%) |       0 |      0 |     0.000 |     0.000 |     1.326 |     1.000 |      2 |     28 |     3.403 | 2.567
    LK_untersucht                |    181 (18%) |       0 |      0 |     2.000 |     7.000 |    12.232 |    19.000 |     42 |     72 |    12.806 | 1.047
    TumorgroesseInvasiv          |      69 (6%) |       0 |      0 |     9.000 |    14.000 |    16.739 |    20.000 |     35 |     60 |    13.571 | 0.811
    TumorgroesseDCIS             |      38 (3%) |       0 |      0 |     0.000 |     5.500 |    14.421 |    20.750 |     45 |     70 |    18.862 | 1.308
    RektumAbstandAnokutanlinie   |       0 (0%) |     N/A |    N/A |       N/A |       N/A |       N/A |       N/A |    N/A |    N/A |       N/A |   N/A
    PSA                          |       0 (0%) |     N/A |    N/A |       N/A |       N/A |       N/A |       N/A |    N/A |    N/A |       N/A |   N/A
    Tumordicke                   |       0 (0%) |     N/A |    N/A |       N/A |       N/A |       N/A |       N/A |    N/A |    N/A |       N/A |   N/A
    LDH                          |       0 (0%) |     N/A |    N/A |       N/A |       N/A |       N/A |       N/A |    N/A |    N/A |       N/A |   N/A
    Anzahl_Tage_Diagnose_Tod     |    301 (30%) |       0 |      0 |    91.000 |   357.000 |   912.907 |   854.000 |  1_963 | 14_444 | 1_672.229 | 1.832
    z_kkr                        | 1_000 (100%) |       1 |      1 |     6.000 |     9.000 |     8.737 |    12.000 |     16 |     16 |     4.236 | 0.485
    z_dy                         | 1_000 (100%) |    1900 |   2016 | 2_020.000 | 2_022.000 | 2_020.746 | 2_023.000 |   2025 |   2025 |     6.628 | 0.003
    z_age                        | 1_000 (100%) | -66.670 | 27.000 |    57.750 |    68.830 |    66.499 |    78.440 | 98.750 | 98.750 |    16.391 | 0.246
    z_tum_op_count               | 1_000 (100%) |       0 |      0 |     0.000 |     0.000 |     0.577 |     1.000 |      2 |     12 |     0.863 | 1.496
    z_tum_st_count               | 1_000 (100%) |       0 |      0 |     0.000 |     0.000 |     0.185 |     0.000 |      0 |      3 |     0.428 | 2.312
    z_tum_sy_count               | 1_000 (100%) |       0 |      0 |     0.000 |     0.000 |     0.446 |     0.000 |      0 |      8 |     1.024 | 2.295
    z_tum_fo_count               | 1_000 (100%) |       0 |      0 |     0.000 |     0.000 |     0.846 |     1.000 |      2 |     15 |     1.929 | 2.280
    z_first_treatment_after_days |    590 (59%) |       0 |      0 |     0.000 |    19.500 |    41.768 |    38.750 |     96 |  1_524 |   112.497 | 2.693
    z_tum_order                  | 1_000 (100%) |       1 |      1 |     1.000 |     1.000 |     1.339 |     1.000 |      1 |     20 |     1.372 | 1.025
    z_period_diag_death_day      |    305 (30%) |       0 |      0 |    89.000 |   357.000 |   906.682 |   854.000 |  1_963 | 14_444 | 1_662.839 | 1.834
    z_period_diag_psa_day        |       0 (0%) |     N/A |    N/A |       N/A |       N/A |       N/A |       N/A |    N/A |    N/A |       N/A |   N/A
    
    
    🟠 sample 3 rows  




```

```


```
    ┌─────────────────────┬──────────────────────┬─────────────┬───┬─────────┬──────────────────────┬──────────────────────┐
    │    Diagnosedatum    │ Diagnosedatum_Genau… │ Inzidenzort │ … │  z_sex  │ z_period_diag_death… │ z_period_diag_psa_d… │
    ├─────────────────────┼──────────────────────┼─────────────┼───┼─────────┼──────────────────────┼──────────────────────┤
    │ 2022-07-15 00:00:00 │ T                    │ 08116       │ … │ W       │                 NULL │                 NULL │
    │ 2021-02-15 00:00:00 │ T                    │ 01060       │ … │ W       │                 1173 │                 NULL │
    │ 2021-12-15 00:00:00 │ T                    │ 03356       │ … │ W       │                 NULL │                 NULL │
    └─────────────────────┴──────────────────────┴─────────────┴───┴─────────┴──────────────────────┴──────────────────────┘
```

      3 rows                                                                                         101 columns (6 shown)
    



    ---------------------------------------------------------------------------

    ValueError                                Traceback (most recent call last)

    Cell In[68], line 1
    ----> 1 tbl.describe_df(
          2     Tumor.project("* not similar to '(?i)(?:.*(id$|hash))'").limit(1000).to_df(),
          3     "Tumor (id excluded)",
          4     fig_cols=4,
          5     top_n_chars_in_columns=20,
          6     top_n_chars_in_index=10,
          7     use_missing=True,
          8 )


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/pandas_plots/tbl/describe_df.py:259, in describe_df(df, caption, use_plot, use_columns, use_missing, renderer, fig_cols, fig_offset, fig_rowheight, fig_width, sort_mode, top_n_uniques, top_n_chars_in_index, top_n_chars_in_columns, missing_figsize, dupl_cols)
        252         _cut = lambda s: (
        253             s[:top_n_chars_in_index] + ".."
        254             if len(s) > top_n_chars_in_index
        255             else s[:top_n_chars_in_index]
        256         )
        257         x = [_cut(item) for item in x]
    --> 259     figsub = px.bar(
        260         x=x,
        261         y=y,
        262     )
        263 # * grid position
        264 _row = math.floor((i) / fig_cols) + 1


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/plotly/express/_chart_types.py:381, in bar(data_frame, x, y, color, pattern_shape, facet_row, facet_col, facet_col_wrap, facet_row_spacing, facet_col_spacing, hover_name, hover_data, custom_data, text, base, error_x, error_x_minus, error_y, error_y_minus, animation_frame, animation_group, category_orders, labels, color_discrete_sequence, color_discrete_map, color_continuous_scale, pattern_shape_sequence, pattern_shape_map, range_color, color_continuous_midpoint, opacity, orientation, barmode, log_x, log_y, range_x, range_y, text_auto, title, subtitle, template, width, height)
        332 def bar(
        333     data_frame=None,
        334     x=None,
       (...)    375     height=None,
        376 ) -> go.Figure:
        377     """
        378     In a bar plot, each row of `data_frame` is represented as a rectangular
        379     mark.
        380     """
    --> 381     return make_figure(
        382         args=locals(),
        383         constructor=go.Bar,
        384         trace_patch=dict(textposition="auto"),
        385         layout_patch=dict(barmode=barmode),
        386     )


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/plotly/express/_core.py:2511, in make_figure(args, constructor, trace_patch, layout_patch)
       2508 layout_patch = layout_patch or {}
       2509 apply_default_cascade(args, constructor=constructor)
    -> 2511 args = build_dataframe(args, constructor)
       2512 if constructor in [go.Treemap, go.Sunburst, go.Icicle] and args["path"] is not None:
       2513     args = process_dataframe_hierarchy(args)


    File ~/repos/github/cancerdata-quality/.venv/lib/python3.12/site-packages/plotly/express/_core.py:1639, in build_dataframe(args, constructor)
       1637 if constructor in cartesians:
       1638     if wide_x and wide_y:
    -> 1639         raise ValueError(
       1640             "Cannot accept list of column references or list of columns for both `x` and `y`."
       1641         )
       1642     if df_provided and no_x and no_y:
       1643         wide_mode = True


    ValueError: Cannot accept list of column references or list of columns for both `x` and `y`.

