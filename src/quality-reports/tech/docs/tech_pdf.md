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
