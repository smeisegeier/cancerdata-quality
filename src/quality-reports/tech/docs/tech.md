# <a id='toc1_'></a>[Technische Prüfungen in klinischen und epi Daten](#toc0_)

**Inhalt**<a id='toc0_'></a>    
- [Technische Prüfungen in klinischen und epi Daten](#toc1_)    
  - [Hintergrund](#toc1_1_)    
  - [⚙️ settings](#toc1_2_)    
  - [Datenstand ⏱️](#toc1_3_)    
    - [klinisch](#toc1_3_1_)    
    - [epi](#toc1_3_2_)    
  - [Anteil Mehrfachtumore in epi Daten](#toc1_4_)    
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
    - [⚠️ diagnose_ausserhalb](#toc1_6_4_)    
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
      - [Beispiel Duplikatverdacht bei epi Daten](#toc1_7_2_5_)    
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

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.5.0 | 📦 pandas-plots: 2.0.7


<br>

## <a id='toc1_3_'></a>[Datenstand ⏱️](#toc0_)

### <a id='toc1_3_1_'></a>[klinisch](#toc0_)

    database file:           2026-05-12_data_clin.duckdb
    data tag:                v2.4
    last kkr data import:    2026-04-18
    sql table created:       2026-05-12 16:38:32
    doi:                     10.18444/5.03.01.0005.0021.0003
    document created:        2026-05-27 17:15:29



<br>

### <a id='toc1_3_2_'></a>[epi](#toc0_)

    database file:           2026-05-13_data_epi.duckdb
    data tag:                epi2025_1
    sql table created:       2026-05-13 09:31:01
    doi:                     10.18444/5.03.01.0005.0022.0001
    document created:        2026-05-27 17:15:29


    
    aktuellster batch               426
    aktuellstes Diagnosejahr 📆     (2024)



<br>

## <a id='toc1_4_'></a>[Anteil Mehrfachtumore in epi Daten](#toc0_)
- Metrik: Anteil Tumore mit `A_Mehrfachmeldung` **(Werte sind in % angegeben)**
- markierte Mehrfachtumore werden vom ZfKD ausgeschlossen
- ❗ Daten ab 2020 in den NBL sind aus klin Daten übernommen

> 💡 **ZfKD**
> 
> für `13-NI`,`14-SN` und `15-ST` ermittelt das ZfKD sichtbar erhöhte Anteile an Mehrfachtumoren für DJ seit Beginn der klin. Registrierung



```
    n = 17_758_787                     (100.0%) 
    └ [DJ 2010-2024]:   n = 11_720_684  (66.0%) 
    └ [nur gültige BL]: n = 11_711_456  (65.9%)
```

<img alt="png" src="tech_files/output_16_3.png">
    


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

### <a id='toc1_6_4_'></a>[⚠️ diagnose_ausserhalb](#toc0_)
- Diagnosecode ist **nicht leer**, aber ausserhalb des ZfKD Diagnosebandes

> ⚠️ epi: In den ABC Prüfungen der epi Daten wird getestet, ob ein Diagnosecode leer ist oder ausserhalb des "Diagnosebandes" des ZfKD (konkret: `A_ICD10_keineAuswertung[54]`). Der Test ist auch im Datenbericht der epi Daten sichtbar, dort wird allerdings nur das letzte DJ herangezogen, um auf die aktuelle Entwicklung zu fokussieren.

    🟧 🗄️ klin



    
<img alt="png" src="tech_files/output_57_1.png">
    


    🟧 🗄️ epi



    
<img alt="png" src="tech_files/output_58_1.png">
    


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

- Echte Duplikate stellen Fälle **mit gleicher Id und gleichem hash-wert** dar
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

#### <a id='toc1_7_2_5_'></a>[Beispiel Duplikatverdacht bei epi Daten](#toc0_)


    
<img alt="png" src="tech_files/output_95_0.png">
    



<br>

## <a id='toc1_8_'></a>[Datensatz](#toc0_)


    An exception has occurred, use %tb to see the full traceback.


    SystemExit: 1




<br>

### <a id='toc1_8_1_'></a>[epi](#toc0_)

    🔵 *** df: Tumor (id excluded) ***  
    🟣 shape: (17_758_787, 50)
    🟣 duplicates: 0 (0%)  
    🟠 column stats all (dtype | uniques | missings) [values]  
    - index [0, 1, 2, 3, 4,]  
    - GLOBALPATID (object | 15_146_405 | 0 (0%)) ['010000000001', '010000000002', '010000000003', '010000000004', '010000000005',]  
    - GLOBALID (object | 17_758_787 | 0 (0%)) ['010000000001', '010000000002', '010000000003', '010000000004', '010000000005',]  
    - EKRNR (object | 11 | 0 (0%)) ['01', '02', '03', '04', '05',]  
    - SEX (Int8 | 3 | 2_388 (0%)) [1, 2, <NA>,]  
    - GDIMP (datetime64[us] | 1_770 | 237 (0%)) [1875-06-15 00:00:00, 1875-12-15 00:00:00, 1876-04-15 00:00:00, 1876-07-15 00:00:00,  
    1876-12-15 00:00:00,]  
    - GKZlk (object | 445 | 0 (0%)) ['01001', '01002', '01003', '01004', '01051',]  
    - GKZrb (object | 46 | 10_515 (0%)) ['01 ', '010', '020', '03 ', '030',]  
    - GKZbl (object | 30 | 0 (0%)) ['01', '02', '03', '04', '05',]  
    - DALTIMP (float64 | 1_802 | 237 (0%)) [-103.25, -99.8333, -90.0833, -87.5833, -82.4167,]  
    - ALTGRP (object | 19 | 1_107 (0%)) ['<NA>', 'a00b04', 'a05b09', 'a10b14', 'a15b19',]  
    - ICDGM10 (object | 560 | 37_016 (0%)) ['<NA>', 'C000', 'C001', 'C002', 'C003',]  
    - ICDGM10_02 (object | 2_036 | 7 (0%)) ['140.0', '140.1', '140.3', '140.4', '140.5',]  
    - ICDGM10_03 (object | 907 | 306_115 (2%)) ['<NA>', 'C00', 'C000', 'C001', 'C002',]  
    - HISC (object | 785 | 314 (0%)) ['8000', '8001', '8002', '8003', '8004',]  
    - HISC_02 (object | 2_332 | 320_808 (2%)) ['0000/0', '8000', '8000/0', '8000/1', '8000/2',]  
    - HISC_03 (object | 878 | 0 (0%)) ['-999', '0', '8000', '8001', '8002',]  
    - DIG (Int16 | 7 | 298 (0%)) [0, 1, 2, 3, 6,]  
    - DIG_03 (int16 | 7 | 0 (0%)) [-999, 0, 1, 2, 3,]  
    - ICDO3 (object | 331 | 115 (0%)) ['<NA>', 'C000', 'C001', 'C002', 'C003',]  
    - ICDO3_02 (object | 1_042 | 317_914 (2%)) ['<NA>', 'C0 . ', 'C00.0', 'C00.1', 'C00.2',]  
    - ICDO3_03 (object | 364 | 0 (0%)) ['-999', 'C0 ', 'C000', 'C001', 'C002',]  
    - LOKS (object | 6 | 5_785_979 (33%)) ['1', '2', '3', '4', '5',]  
    - DDIMP (datetime64[us] | 676 | 172 (0%)) [1900-04-15 00:00:00, 1967-07-15 00:00:00, 1970-01-15 00:00:00, 1970-02-15 00:00:00,  
    1970-03-15 00:00:00,]  
    - DJ (Int16 | 60 | 111 (0%)) [1900, 1967, 1970, 1971, 1972,]  
    - TUMID (Int8 | 13 | 138_458 (1%)) [0, 1, 2, 3, 4,]  
    - TUMID2 (Int8 | 10 | 5_258_916 (30%)) [1, 2, 3, 4, 5,]  
    - TUMID3 (Int8 | 9 | 5_552_844 (31%)) [1, 2, 3, 4, 5,]  
    - DSICH (Int32 | 10 | 1_029_114 (6%)) [0, 1, 2, 3, 4,]  
    - DCO (int32 | 2 | 0 (0%)) [1, 2,]  
    - TNMAUFL (Int32 | 8 | 107 (0%)) [2, 4, 5, 6, 7,]  
    - TNMTKURZ (object | 366 | 6_650_034 (37%)) ['"1(2', '"1b(m', '"1c(3', '"2(3', '"2(4',]  
    - TNMNKURZ (object | 2_881 | 8_020_262 (45%)) ['"0(0/22', '"0(0/33', '"0(0/38', '"0(0/40', '"0(0/43',]  
    - TNMMKURZ (object | 59 | 7_416_660 (42%)) ['0', '0(0)', '0(0/20', '0(0/9)', '0(1)',]  
    - UICC (object | 5 | 12_093_083 (68%)) ['<NA>', 'I', 'II', 'III', 'IV',]  
    - TOD (int32 | 2 | 0 (0%)) [1, 2,]  
    - SDIMP (datetime64[us] | 663 | 8_746_059 (49%)) [1900-04-15 00:00:00, 1967-07-15 00:00:00, 1970-01-15 00:00:00, 1970-02-15 00:00:00,  
    1970-03-15 00:00:00,]  
    - ICDT10 (object | 7_143 | 10_318_676 (58%)) ['-', '0000', '010', '011', '0110',]  
    - ICDTAUFL (object | 17 | 12_490_108 (70%)) ['10', '109', '112', '113', '114',]  
    - GRAD (Int16 | 8 | 9_672_439 (54%)) [1, 2, 3, 4, 5,]  
    - TNMTC (object | 8 | 16_633_400 (94%)) ['2)"', '<NA>', 'C1', 'C2', 'C3',]  
    - TNMNC (object | 25 | 17_490_098 (98%)) ['"', '0', '0(SN)', '0/1"', '0/1S"',]  
    - TNMMC (object | 7 | 17_510_672 (99%)) ['0', '<NA>', 'C1', 'C2', 'C3',]  
    - TNMPT (object | 3 | 10_037_642 (57%)) ['1', '2', '<NA>',]  
    - TNMPN (object | 4 | 11_381_539 (64%)) ['1', '2', '999', '<NA>',]  
    - TNMPM (object | 4 | 10_278_229 (58%)) ['1', '2', '999', '<NA>',]  
    - AUT (object | 3 | 15_686_691 (88%)) ['1', '2', '<NA>',]  
    - IARC (object | 873 | 15_688_367 (88%)) [' | A_Datuemer>MaxJahr', ' | A_Datuemer>MaxJahr | A_EKRNR_GKZ_unplausibel',  
    ' | A_Datuemer>MaxJahr | A_EKRNR_GKZ_unplausibel | B_GRAD_HISC_unplausibel',  
    ' | A_Datuemer>MaxJahr | A_EKRNR_GKZ_unplausibel | C_LOKS_korrigiert',  
    ' | A_Datuemer>MaxJahr | B_DALT_HISC_ICD10_unplausibel',]  
    - ZTYP (Int16 | 5 | 17_596_584 (99%)) [5, 6, 7, 8, <NA>,]  
    - is_deleted (int8 | 2 | 0 (0%)) [0, 1,]  
    - CREATED (datetime64[us] | 1 | 0 (0%)) [2026-05-13 09:31:01,]  
    
    🟠 column stats numeric  
    
    column (n = 17_758_787) |      notnull      |   min    | lower  |    q25    |  median   |   mean    |    q75    |  upper  |   max   |   std   |   cv  
    ------------------------+-------------------+----------+--------+-----------+-----------+-----------+-----------+---------+---------+---------+-------
    SEX                     |  17_756_399 (99%) |        1 |      1 |     1.000 |     1.000 |     1.489 |     2.000 |       2 |       2 |   0.500 |  0.336
    DALTIMP                 |  17_758_550 (99%) | -103.250 | 31.333 |    59.667 |    70.000 |    67.969 |    78.583 | 106.917 | 125.500 |  14.657 |  0.216
    DIG                     |  17_758_489 (99%) |        0 |      3 |     3.000 |     3.000 |     2.861 |     3.000 |       3 |       9 |   0.445 |  0.156
    DIG_03                  | 17_758_787 (100%) |     -999 |      3 |     3.000 |     3.000 |   -15.238 |     3.000 |       3 |       9 | 133.434 | -8.757
    DJ                      |  17_758_676 (99%) |     1900 |   1989 | 2_007.000 | 2_014.000 | 2_012.632 | 2_019.000 |    2026 |    2026 |   8.307 |  0.004
    TUMID                   |  17_620_329 (99%) |        0 |      1 |     1.000 |     1.000 |     1.162 |     1.000 |       1 |      11 |   0.443 |  0.381
    TUMID2                  |  12_499_871 (70%) |        1 |      1 |     1.000 |     1.000 |     1.098 |     1.000 |       1 |       9 |   0.327 |  0.298
    TUMID3                  |  12_205_943 (68%) |        1 |      1 |     1.000 |     1.000 |     1.093 |     1.000 |       1 |       8 |   0.318 |  0.291
    DSICH                   |  16_729_673 (94%) |        0 |      7 |     7.000 |     7.000 |     6.514 |     7.000 |       7 |       8 |   1.338 |  0.205
    DCO                     | 17_758_787 (100%) |        1 |      2 |     2.000 |     2.000 |     1.918 |     2.000 |       2 |       2 |   0.274 |  0.143
    TNMAUFL                 |  17_758_680 (99%) |        2 |      4 |     6.000 |     7.000 |     6.899 |     8.000 |       9 |       9 |   1.015 |  0.147
    TOD                     | 17_758_787 (100%) |        1 |      1 |     1.000 |     1.000 |     1.492 |     2.000 |       2 |       2 |   0.500 |  0.335
    GRAD                    |   8_086_348 (45%) |        1 |      1 |     2.000 |     2.000 |     2.356 |     3.000 |       4 |       7 |   1.111 |  0.471
    ZTYP                    |      162_203 (0%) |        5 |      6 |     6.000 |     6.000 |     5.909 |     6.000 |       6 |       8 |   0.297 |  0.050
    is_deleted              | 17_758_787 (100%) |        0 |      0 |     0.000 |     0.000 |     0.041 |     0.000 |       0 |       1 |   0.197 |  4.863
    
    
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
    



    
<img alt="svg" src="tech_files/output_100_4.svg">
    



    
<img alt="png" src="tech_files/output_100_5.png">
    



<br>

### <a id='toc1_8_2_'></a>[klin](#toc0_)

    🔵 *** df: Tumor (id excluded) ***  
    🟣 shape: (4_062_856, 101)
    🟣 duplicates: 871 (0%)  
    🟠 column stats all (dtype | uniques | missings) [values]  
    - index [0, 1, 2, 3, 4,]  
    - Diagnosedatum (datetime64[us] | 723 | 0 (0%)) [1900-04-01 00:00:00, 1937-07-15 00:00:00, 1941-01-15 00:00:00, 1945-07-01 00:00:00,  
    1948-03-15 00:00:00,]  
    - Diagnosedatum_Genauigkeit (object | 3 | 0 (0%)) ['M', 'T', 'V',]  
    - Inzidenzort (object | 495 | 183 (0%)) ['01001', '01002', '01003', '01004', '01051',]  
    - Diagnose_ICD10_Code (object | 888 | 482 (0%)) ['<NA>', 'C00', 'C00.0', 'C00.1', 'C00.2',]  
    - Diagnose_ICD10_Version (object | 27 | 85_396 (2%)) ['10 2004 GM', '10 2005 GM', '10 2006 GM', '10 2008 GM', '10 2009 GM',]  
    - Topographie_Code (object | 709 | 29_133 (1%)) ['<NA>', 'C00.0', 'C00.1', 'C00.2', 'C00.3',]  
    - Topographie_Version (object | 4 | 128_967 (3%)) ['31', '32', '33', '<NA>',]  
    - Diagnosesicherung (object | 12 | 0 (0%)) ['0', '1', '2', '4', '5',]  
    - TNM_Auflage_c (object | 5 | 1_777_523 (44%)) ['6', '7', '8', '9', '<NA>',]  
    - y_Symbol_c (object | 2 | 4_061_170 (100%)) ['<NA>', 'y',]  
    - r_Symbol_c (object | 2 | 4_062_840 (100%)) ['<NA>', 'r',]  
    - a_Symbol_c (object | 2 | 4_062_381 (100%)) ['<NA>', 'a',]  
    - m_Symbol_c (object | 44 | 3_983_927 (98%)) ['(m)', '0', '1', '10', '108',]  
    - c_p_u_Praefix_T_c (object | 4 | 2_699_287 (66%)) ['<NA>', 'c', 'p', 'u',]  
    - T_c (object | 213 | 2_501_324 (62%)) ['0', '0(is)', '1', '1 (is)', '1 (m)',]  
    - c_p_u_Praefix_N_c (object | 4 | 2_629_182 (65%)) ['<NA>', 'c', 'p', 'u',]  
    - N_c (object | 195 | 2_441_308 (60%)) ['+', '0', '0 (0/14)', '0 (0/16)', '0 (0/31)',]  
    - c_p_u_Praefix_M_c (object | 4 | 2_551_763 (63%)) ['<NA>', 'c', 'p', 'u',]  
    - M_c (object | 45 | 2_369_803 (58%)) ['0', '0 (mind.)', '0(0)', '0(0/3sn)', '0(1)',]  
    - L_c (object | 4 | 3_526_092 (87%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_c (object | 5 | 3_617_355 (89%)) ['<NA>', 'V0', 'V1', 'V2', 'VX',]  
    - Pn_c (object | 4 | 3_614_373 (89%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_c (object | 6 | 4_022_985 (99%)) ['<NA>', 'S0', 'S1', 'S2', 'S3',]  
    - UICC_Stadium_c (object | 36 | 3_174_176 (78%)) ['0', '0a', '0is', '<NA>', 'I',]  
    - TNM_Auflage_p (object | 5 | 1_555_895 (38%)) ['6', '7', '8', '9', '<NA>',]  
    - y_Symbol_p (object | 2 | 3_964_175 (98%)) ['<NA>', 'y',]  
    - r_Symbol_p (object | 2 | 4_062_813 (100%)) ['<NA>', 'r',]  
    - a_Symbol_p (object | 2 | 4_062_480 (100%)) ['<NA>', 'a',]  
    - m_Symbol_p (object | 53 | 4_005_552 (99%)) ['(2)', '(5)', '(m)', '0', '1',]  
    - c_p_u_Praefix_T_p (object | 4 | 2_095_432 (52%)) ['<NA>', 'c', 'p', 'u',]  
    - T_p (object | 562 | 2_093_497 (52%)) ['0', '0 (bifokal)', '0 (is)', '0(DCIS)', '0(bizentrisch)',]  
    - c_p_u_Praefix_N_p (object | 4 | 2_695_918 (66%)) ['<NA>', 'c', 'p', 'u',]  
    - N_p (object | 3_694 | 2_581_190 (64%)) ['0', '0  (sn)', '0  (sn))', '0  (sn, i-)', '0 (-i)',]  
    - c_p_u_Praefix_M_p (object | 4 | 2_987_068 (74%)) ['<NA>', 'c', 'p', 'u',]  
    - M_p (object | 52 | 2_826_246 (70%)) ['0', '0(0)', '0(0/20', '0(0/9)', '0(1)',]  
    - L_p (object | 4 | 3_141_710 (77%)) ['<NA>', 'L0', 'L1', 'LX',]  
    - V_p (object | 5 | 3_161_220 (78%)) ['<NA>', 'V0', 'V1', 'V2', 'VX',]  
    - Pn_p (object | 4 | 3_360_612 (83%)) ['<NA>', 'Pn0', 'Pn1', 'PnX',]  
    - S_p (object | 6 | 4_023_422 (99%)) ['<NA>', 'S0', 'S1', 'S2', 'S3',]  
    - UICC_Stadium_p (object | 36 | 3_158_584 (78%)) ['0', '0a', '0is', '<NA>', 'I',]  
    - Grading (object | 13 | 94_387 (2%)) ['0', '1', '2', '3', '4',]  
    - LK_befallen (Int32 | 88 | 3_262_737 (80%)) [0, 1, 2, 3, 4,]  
    - LK_untersucht (Int32 | 197 | 3_088_600 (76%)) [0, 1, 2, 3, 4,]  
    - Morphologie_Code (object | 1_401 | 94_387 (2%)) ['0000/0', '5255/3', '7432/0', '8000/0', '8000/1',]  
    - Morphologie_Version (object | 5 | 188_295 (5%)) ['31', '32', '33', '<NA>', 'bb',]  
    - Praetherapeutischer_Menopausenstatus (object | 4 | 3_775_123 (93%)) ['1', '3', '<NA>', 'U',]  
    - HormonrezeptorStatus_Oestrogen (object | 4 | 3_704_793 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - HormonrezeptorStatus_Progesteron (object | 4 | 3_707_736 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - Her2neuStatus (object | 4 | 3_695_913 (91%)) ['<NA>', 'N', 'P', 'U',]  
    - TumorgroesseInvasiv (Int32 | 211 | 3_854_180 (95%)) [0, 1, 2, 3, 4,]  
    - TumorgroesseDCIS (Int32 | 174 | 3_961_718 (98%)) [0, 1, 2, 3, 4,]  
    - RASMutation (object | 5 | 3_987_833 (98%)) ['<NA>', 'M', 'N', 'U', 'W',]  
    - RektumAbstandAnokutanlinie (Int32 | 101 | 4_020_045 (99%)) [0, 1, 2, 3, 4,]  
    - GradPrimaer (object | 6 | 3_816_197 (94%)) ['1', '2', '3', '4', '5',]  
    - GradSekundaer (object | 6 | 3_816_214 (94%)) ['1', '2', '3', '4', '5',]  
    - ScoreErgebnis (object | 12 | 3_745_551 (92%)) ['10', '2', '3', '4', '5',]  
    - AnlassGleasonScore (object | 4 | 3_818_355 (94%)) ['<NA>', 'O', 'S', 'U',]  
    - PSA (float32 | 12_956 | 3_815_447 (94%)) [0.0, 0.009999999776482582, 0.019999999552965164, 0.029999999329447746, 0.03999999910593033,]  
    - DatumPSA (datetime64[us] | 273 | 2_887_990 (71%)) [0002-07-15 00:00:00, 0202-06-15 00:00:00, 0202-12-15 00:00:00, 0210-08-15 00:00:00,  
    0221-07-15 00:00:00,]  
    - DatumPSA_Genauigkeit (object | 3 | 2_887_990 (71%)) ['<NA>', 'T', 'V',]  
    - Tumordicke (float32 | 286 | 4_003_801 (99%)) [0.009999999776482582, 0.05000000074505806, 0.10000000149011612, 0.12999999523162842,  
    0.14000000059604645,]  
    - LDH (Int32 | 515 | 4_054_773 (100%)) [1, 2, 5, 7, 10,]  
    - Ulzeration (object | 3 | 4_024_740 (99%)) ['<NA>', 'J', 'N',]  
    - Seitenlokalisation (object | 6 | 0 (0%)) ['B', 'L', 'M', 'R', 'T',]  
    - DCN (object | 2 | 0 (0%)) ['J', 'N',]  
    - Anzahl_Tage_Diagnose_Tod (Int32 | 11_571 | 2_894_405 (71%)) [-7324, -6000, -2433, -2344, -347,]  
    - z_kkr (int8 | 16 | 0 (0%)) [1, 2, 3, 4, 5,]  
    - z_kkr_label (object | 16 | 0 (0%)) ['01-SH', '02-HH', '03-NI', '04-HB', '05-NW',]  
    - z_dy (int16 | 77 | 0 (0%)) [1900, 1937, 1941, 1945, 1948,]  
    - z_age (float64 | 2_178 | 0 (0%)) [-122.0, -121.0, -118.67, -118.25, -112.5,]  
    - z_ag05 (object | 19 | 5_811 (0%)) ['<NA>', 'a00b04', 'a05b09', 'a10b14', 'a15b19',]  
    - z_icd10 (object | 594 | 2_444 (0%)) ['<NA>', 'C00.0', 'C00.1', 'C00.2', 'C00.3',]  
    - z_icd10_3d (object | 110 | 2_444 (0%)) ['<NA>', 'C00', 'C01', 'C02', 'C03',]  
    - z_t_c_0 (object | 43 | 2_501_327 (62%)) ['0', '1', '1a', '1a1', '1a2',]  
    - z_t_c_1 (object | 9 | 2_501_327 (62%)) ['0', '1', '2', '3', '4',]  
    - z_t_p_0 (object | 43 | 2_093_499 (52%)) ['0', '1', '1a', '1a1', '1a2',]  
    - z_t_p_1 (object | 9 | 2_093_499 (52%)) ['0', '1', '2', '3', '4',]  
    - z_n_c_0 (object | 29 | 2_441_655 (60%)) ['0', '0(i+)', '0(i+)(sn)', '0(i-)', '0(i-)(sn)',]  
    - z_n_c_1 (object | 6 | 2_441_655 (60%)) ['0', '1', '2', '3', '<NA>',]  
    - z_n_p_0 (object | 29 | 2_581_195 (64%)) ['0', '0(i+)', '0(i+)(sn)', '0(i-)', '0(i-)(sn)',]  
    - z_n_p_1 (object | 6 | 2_581_195 (64%)) ['0', '1', '2', '3', '<NA>',]  
    - z_m_c_0 (object | 22 | 2_388_689 (59%)) ['0', '0(0)', '0(1)', '0(i+)', '0(i-)',]  
    - z_m_c_1 (object | 3 | 2_388_689 (59%)) ['0', '1', '<NA>',]  
    - z_m_p_0 (object | 22 | 2_861_041 (70%)) ['0', '0(0)', '0(1)', '0(i+)', '0(i-)',]  
    - z_m_p_1 (object | 3 | 2_861_041 (70%)) ['0', '1', '<NA>',]  
    - z_m_pc_1 (object | 3 | 1_666_315 (41%)) ['0', '1', '<NA>',]  
    - z_is_dco (bool | 2 | 0 (0%)) [False, True,]  
    - z_last_tum_status (object | 11 | 2_787_054 (69%)) ['<NA>', 'B - klinische Besserung des Zustandes', 'D - divergentes Geschehen',  
    'K - keine Änderung', 'P - Progression',]  
    - z_tum_op_count (int16 | 25 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_st_count (int16 | 40 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_sy_count (int16 | 27 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_tum_fo_count (int16 | 38 | 0 (0%)) [0, 1, 2, 3, 4,]  
    - z_first_treatment (object | 4 | 1_785_043 (44%)) ['<NA>', 'op', 'st', 'sy',]  
    - z_first_treatment_after_days (Int32 | 2_092 | 1_785_043 (44%)) [0, 1, 2, 3, 4,]  
    - z_event_order (object | 17_695 | 1_542_034 (38%)) ['<NA>', 'fo', 'fo-op', 'fo-op-fo', 'fo-op-fo-op',]  
    - z_events (object | 16 | 0 (0%)) ['-', 'fo', 'op', 'op|fo', 'op|st',]  
    - z_class_hpv (object | 4 | 4_015_933 (99%)) ['<NA>', 'N', 'P', 'U',]  
    - z_tum_order (int8 | 49 | 0 (0%)) [1, 2, 3, 4, 5,]  
    - z_sex (object | 5 | 0 (0%)) ['D', 'M', 'U', 'W', 'X',]  
    - z_period_diag_death_day (Int32 | 11_559 | 2_862_033 (70%)) [0, 1, 2, 3, 4,]  
    - z_period_diag_psa_day (Int32 | 509 | 3_850_626 (95%)) [-3623, -3592, -3561, -3530, -3502,]  
    
    🟠 column stats numeric  
    
    column (n = 4_062_856)       |     notnull      |   min    | lower  |    q25    |  median   |   mean    |    q75    |  upper  |    max     |    std    |   cv   
    -----------------------------+------------------+----------+--------+-----------+-----------+-----------+-----------+---------+------------+-----------+--------
    LK_befallen                  |    800_119 (19%) |        0 |      0 |     0.000 |     0.000 |     0.918 |     0.000 |       0 |        722 |     3.078 |   3.354
    LK_untersucht                |    974_256 (23%) |        0 |      0 |     1.000 |     5.000 |    10.636 |    17.000 |      41 |      2_319 |    13.656 |   1.284
    TumorgroesseInvasiv          |     208_676 (5%) |        0 |      0 |     9.000 |    15.000 |    19.617 |    25.000 |      49 |        999 |    19.210 |   0.979
    TumorgroesseDCIS             |     101_138 (2%) |        0 |      0 |     0.000 |     0.000 |    10.968 |    15.000 |      37 |        999 |    20.488 |   1.868
    RektumAbstandAnokutanlinie   |      42_811 (1%) |        0 |      0 |     5.000 |     9.000 |    11.289 |    14.000 |      27 |        930 |    16.996 |   1.506
    PSA                          |     247_409 (6%) |    0.000 |  0.000 |     5.630 |     8.740 |    90.354 |    18.000 |  36.550 | 99_999.000 |   741.810 |   8.210
    Tumordicke                   |      59_055 (1%) |    0.010 |  0.010 |     0.400 |     0.900 |     1.950 |     2.200 |   4.900 |     99.000 |     3.516 |   1.804
    LDH                          |       8_083 (0%) |        1 |     85 |   173.000 |   198.000 |   223.739 |   232.000 |     320 |      5_756 |   207.009 |   0.925
    Anzahl_Tage_Diagnose_Tod     |  1_168_451 (28%) |   -7_324 |   -347 |    53.000 |   262.000 |   660.850 |   714.000 |   1_705 |     30_590 | 1_280.215 |   1.937
    z_kkr                        | 4_062_856 (100%) |        1 |      1 |     5.000 |     8.000 |     7.806 |    10.000 |      16 |         16 |     3.918 |   0.502
    z_dy                         | 4_062_856 (100%) |     1900 |   2018 | 2_021.000 | 2_022.000 | 2_021.201 | 2_023.000 |    2026 |       2026 |     5.614 |   0.003
    z_age                        | 4_062_856 (100%) | -122.000 | 30.250 |    59.670 |    70.000 |    68.026 |    79.330 | 108.500 |    983.330 |    15.271 |   0.224
    z_tum_op_count               | 4_062_856 (100%) |        0 |      0 |     0.000 |     0.000 |     0.522 |     1.000 |       2 |         43 |     0.747 |   1.431
    z_tum_st_count               | 4_062_856 (100%) |        0 |      0 |     0.000 |     0.000 |     0.173 |     0.000 |       0 |        148 |     0.536 |   3.100
    z_tum_sy_count               | 4_062_856 (100%) |        0 |      0 |     0.000 |     0.000 |     0.395 |     0.000 |       0 |         57 |     0.915 |   2.319
    z_tum_fo_count               | 4_062_856 (100%) |        0 |      0 |     0.000 |     0.000 |     0.842 |     1.000 |       2 |         43 |     1.945 |   2.311
    z_first_treatment_after_days |  2_277_813 (56%) |        0 |      0 |     0.000 |    22.000 |    47.588 |    48.000 |     120 |      3_554 |   114.987 |   2.416
    z_tum_order                  | 4_062_856 (100%) |        1 |      1 |     1.000 |     1.000 |     1.220 |     1.000 |       1 |         49 |     0.740 |   0.606
    z_period_diag_death_day      |  1_200_823 (29%) |        0 |      0 |    54.000 |   261.000 |   653.261 |   709.000 |   1_691 |     30_590 | 1_265.148 |   1.937
    z_period_diag_psa_day        |     212_230 (5%) |   -3_623 |      0 |     0.000 |     0.000 |    -8.359 |     0.000 |       0 |      3_410 |   112.193 | -13.422
    
    
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
    



    
<img alt="svg" src="tech_files/output_102_4.svg">
    



    
<img alt="png" src="tech_files/output_102_5.png">
    

