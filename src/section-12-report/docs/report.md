# <a id='toc1_'></a>[# §12 Bericht](#toc0_)

**Table of contents**<a id='toc0_'></a>    
- [# §12 Bericht](#toc1_)    
  - [⚙️ settings](#toc1_1_)    
  - [Bericht](#toc1_2_)    
    - [Aktualität](#toc1_2_1_)    
    - [Fallzahlen](#toc1_2_2_)    
    - [Vollständigkeit](#toc1_2_3_)    
      - [Personenangaben](#toc1_2_3_1_)    
      - [Grading](#toc1_2_3_2_)    
      - [TNM-T](#toc1_2_3_3_)    
        - [alle](#toc1_2_3_3_1_)    
        - [nur op](#toc1_2_3_3_2_)    
      - [weitere Tumorangaben](#toc1_2_3_4_)    
      - [Organmodule - Mamma](#toc1_2_3_5_)    
        - [Organmodule - Prostata](#toc1_2_3_5_1_)    
        - [Organmodule - Melanom](#toc1_2_3_5_2_)    
      - [Organmodule - Darm](#toc1_2_3_6_)    
      - [Verteilung Diagnosesicherung](#toc1_2_3_7_)    
      - [T Stadium](#toc1_2_3_8_)    
    - [Therapie](#toc1_2_4_)    
      - [Anteil Fälle ohne Therapie 1](#toc1_2_4_1_)    
      - [Anteil Fälle ohne Therapie 2](#toc1_2_4_2_)    
      - [Anteil Fälle ohne Therapie 3](#toc1_2_4_3_)    
      - [ops wenn op](#toc1_2_4_4_)    
      - [op wenn op erwartet](#toc1_2_4_5_)    
        - [C50](#toc1_2_4_5_1_)    
        - [C43](#toc1_2_4_5_2_)    
        - [C18-C20](#toc1_2_4_5_3_)    
        - [C62](#toc1_2_4_5_4_)    
      - [st wenn st erwartet](#toc1_2_4_6_)    
      - [sy wenn sy erwartet](#toc1_2_4_7_)    
      - [Anteil Fälle ohne R-Status nach OP wenn hohe Relevanz des R-Status](#toc1_2_4_8_)    
      - [Anteil Rezidive](#toc1_2_4_9_)    
        - [C50](#toc1_2_4_9_1_)    
        - [C18-C20](#toc1_2_4_9_2_)    
    - [date periods](#toc1_2_5_)    
      - [Anzahl Tage Diagnose Tod](#toc1_2_5_1_)    
      - [Anzahl Tage Diagnose OP](#toc1_2_5_2_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

## <a id='toc1_1_'></a>[⚙️ settings](#toc0_)

    🐍 3.12.8 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.4 | 📦 pandas-plots: 1.2.2 | 📦 connection-helper: 0.13.3


    database file:           2025-11-11_data_clin.duckdb
    data tag:                v2.3
    last kkr data import:    2025-09-30
    sql table created:       2025-11-11 11:52:01
    doi:                     10.18444/5.03.01.0005.0021.0002
    document created:        2026-02-16 12:53:15


## <a id='toc1_2_'></a>[Bericht](#toc0_)

### <a id='toc1_2_1_'></a>[Aktualität](#toc0_)
- `kkr` = Klinisches Krebsregister
- `Lieferdatum` = Datum der letzten Übermittlung durch die KKR
- `Diagnosemonat` = letzter Diagnosemonat in den Daten
- `Lieferdatum` ist über das Jahr 2025 verteilt, Grund sind Nachlieferungen von einigen KKR

> einige KKR haben bereits (wenige) aktuelle Fälle in der Lieferung (z.B. `06-HE` mit Fällen aus `2025-04`)


    
![png](report_files/output_11_0.png)
    


### <a id='toc1_2_2_'></a>[Fallzahlen](#toc0_)
- in den Darstellungen sind keine Filter angewendet, solange nicht explizit angegeben
- aufgespannt sind die Fallzahlen für Lieferregister und Elementknoten
- kein Filter, "Altfälle" (DJ < 2020) sind also enthalten
- die `%` Werte sowie die farbigen Datenbalken zeigen das relative Gewicht jedes KKR an "D gesamt" (`Total` Zeile)
- Erklärung für einige Elementknoten: (_cnt = count/Fallzahl)
  - `weitere_diag_cnt` = Weitere Klassifikation im Elementknoten "Diagnose"
  - `weitere_folge_cnt` = Weitere Klassifikation im Elementknoten "Folgeereignis"
  - `fm_folge_cnt`= Fernmetastasen im Elementknoten "Folgeereignis"
  - `fm_diag_cnt` = Fernmetastasen im Elementknoten "Diagnose"
  - `tnm_folge_cnt` = TNM im Elementknoten "Folgeereignis"

> inzwischen liegen fast alle Elemente flächendeckend vor. Ausnahmen sind `Applikationsart`, `Folgeereignisse`, `Protokolle` / `Substanzen`
>
> an den 3,2 Mio Tumorfällen in der Lieferung hat `05-NW` den höchsten Anteil
>
> an der Verteilung bei den Tumorfällen können andere Anteile gemessen werden: so ist `08-BW` bei den Folgeereignissen deutlich überrepräsentiert (30% bei Folgeereignissen ggü. 11% bei Tumoren)
>
> einige KKR liefern pro Strahlentherapie genau eine Teilbestrahlung (erkennbar an den gleichen Werten bei diesen Elementen)


    
![png](report_files/output_14_0.png)
    



    
![png](report_files/output_15_0.png)
    


### <a id='toc1_2_3_'></a>[Vollständigkeit](#toc0_)

- es sind folgende Schwellwerte angezeigt:
  - 🟩 0% bis <5%
  - 🟨 5% bis <100%
  - 🟥 bei 100%
- **Filter: `DJ` 2020-2023** Weitere Filter sind extra aufgeführt
- dargestellt sind Variablen aus dem Schema in folgender Notation: `[Elementknoten]Variablenname`
- **Missings**
  - die graumelierte `0` kennzeichnet einen leeren Wert (=keine missings), 0% entsteht durch Rundung von kleinen Werten
- **Unbekannt** Kodierungen
    -  Grading: (U, T)
    -  Morphologie_Code: 8000-8011, 9590, 9591, 9800, 9801, 8050
    -  Lokalisation_Code: C26, C39, C76, C80,  C14.0, C57.9, C63.9, C68.9, C72.9, C75.9
    -  Diagnose_ICD10_Code: ('C80','C80.0', 'C80.1', 'C80.9', 'C79.9')
    -  Diagnosesicherung: 9
    -  Intention, Seite_Zielgebiet, Seitenlokalisation: U
    -  Datum_Genauigkeit: ('M','V')
    -  alles anderen: ('U', 'X', 'VX', 'SX', 'okk')

#### <a id='toc1_2_3_1_'></a>[Personenangaben](#toc0_)

> Personenangaben liegen komplett vollständig vor
>
> `Datum_Vitalstatus` ist in einigen Fällen geschätzt (bis zu 4% on `16-TH`), Geburtsdatum hingegen sehr selten (Datum 1900 ist nicht berücksichtigt)


    
![png](report_files/output_19_0.png)
    



    
![png](report_files/output_20_0.png)
    


#### <a id='toc1_2_3_2_'></a>[Grading](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10`: C00-C33, C50-C57, C60-C68, `Morphologie`: 8010-8576**


    
![svg](report_files/output_22_0.svg)
    


#### <a id='toc1_2_3_3_'></a>[TNM-T](#toc0_)

##### <a id='toc1_2_3_3_1_'></a>[alle](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10`: C00-C75 außer: C26, C39, C55, C14.0, C57.9, C63.9, C68.9, `Morphologie`: 8010-8790**


    
![svg](report_files/output_25_0.svg)
    


##### <a id='toc1_2_3_3_2_'></a>[nur op](#toc0_)
- **Filter: wie oben, aber nur mit dokumentiertem OPS aus Kapitel 5**


    
![svg](report_files/output_27_0.svg)
    


#### <a id='toc1_2_3_4_'></a>[weitere Tumorangaben](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` kein C44**
> `Diagnosesicherung` ist komplett bzw. überwiegend vollständig, weist jedoch viele Unbekannt Kodierungen auf


    
![png](report_files/output_29_0.png)
    



    
![png](report_files/output_29_1.png)
    


    Filter: 
        z_dy between 2020 and 2023
        and not z_is_dco
        and z_icd10_3d not in ('C44','D04')
    



    
![svg](report_files/output_30_1.svg)
    


#### <a id='toc1_2_3_5_'></a>[Organmodule - Mamma](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C50**
> keine Angaben aus `02-HH` übermittelt (gilt für alle Organmodule)


    
![png](report_files/output_32_0.png)
    



    
![png](report_files/output_32_1.png)
    


##### <a id='toc1_2_3_5_1_'></a>[Organmodule - Prostata](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C61**


    
![png](report_files/output_34_0.png)
    



    
![png](report_files/output_34_1.png)
    


##### <a id='toc1_2_3_5_2_'></a>[Organmodule - Melanom](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C43**


    
![png](report_files/output_36_0.png)
    



    
![png](report_files/output_36_1.png)
    


#### <a id='toc1_2_3_6_'></a>[Organmodule - Darm](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10` = C18, C19, C20**


    
![png](report_files/output_38_0.png)
    



    
![png](report_files/output_38_1.png)
    


#### <a id='toc1_2_3_7_'></a>[Verteilung Diagnosesicherung](#toc0_)
- **Filter: `DJ` 2020-2023**

> keine DCO Kodierungen in `03-NI`, `13-MV`, `15-ST`, `16-TH`  
>
> `>20%` Unbekannt in `10-SL`


    
![svg](report_files/output_40_0.svg)
    


#### <a id='toc1_2_3_8_'></a>[T Stadium](#toc0_)
- **Filter: `DJ` 2020-2023, `DCO` = N, `ICD10`: C00-C75 außer: C26, C39, C55, C14.0, C57.9, C63.9, C68.9, `Morphologie`: 8010-8790**
- Kategorien
  - `1_t_cp` - cT und pT sind vorhanden und nicht `X`
  - `2_t_c`- cT ist vorhanden und nicht `X`, pT ist leer
  - `3_t_p`- pT ist vorhanden und nicht `X`, cT ist leer
  - `4_no_t`- beide leer


    
![svg](report_files/output_42_0.svg)
    






```python
    ┌─────────┬────────────┐
    │   T_p   │ count(T_p) │
    │ varchar │   int64    │
    ├─────────┼────────────┤
    │ X(is)   │         13 │
    │ X       │      13427 │
    └─────────┴────────────┘
```

![svg](report_files/output_44_0.svg)
    


### <a id='toc1_2_4_'></a>[Therapie](#toc0_)

#### <a id='toc1_2_4_1_'></a>[Anteil Fälle ohne Therapie 1](#toc0_)

- **Filter: `DJ` = 2020-2023, `DCO` = N, `ICD10` nur solide Tumoren** (_solide Tumoren_ schliesst folgende Diagnosen _aus_: C44, C70-C72, C76-C97, alle D)
- ein Wert von bspw. 0.68 ist zu interpretieren als: _"68% aller Tumorfälle im KKR haben keine zugeordneten OP Angaben, die restlichen 32% mindestens eine."_
- `treat_missing_per_tum` stellt den Anteil Fälle dar, bei denen keinerlei Therapieangabe (OP, ST, SYST) vorliegt
- in der Darstellung sind die Max/Min Werte pro Kennzahl mit 🟥/🟩 markiert (kleiner ist besser)
> 💡 `ZfKD`: _aus `st_missing_per_tum` lässt sich ablesen, dass ~23% der Tumoren deutschlandweit mind. eine ST zugeordnet ist (Total: 1 - 0.77 = 0.23). Das entspricht in etwa der Annahme von 30% Anteil von Strahlentherapien an primären Diagnosen_

    Filter: z_dy between 2020 and 2023 and not z_is_dco and --sql
        z_icd10_3d not in ('C44', 'C76', 'C77', 'C78', 'C79')
        and left(z_icd10_3d,1) = 'C'
        and right(z_icd10_3d, 2)::int8 <= 80
    



    
![png](report_files/output_47_1.png)
    


#### <a id='toc1_2_4_2_'></a>[Anteil Fälle ohne Therapie 2](#toc0_)

- **Filter: `DJ` = 2020-2023 (1. Halbjahr), `DCO` = N, kein `C44` / `D04`, keine D Diagnosen**

    Filter: 
        not z_is_dco
        and z_icd10_3d not in ('C44','D04')
        and Diagnosedatum between '2020-01-01' and '2023-06-30'
        and left(z_icd10_3d,1) in ('C')
        and ifnull(z_period_diag_death_day,181) >= 180
    



    
![svg](report_files/output_49_1.svg)
    


#### <a id='toc1_2_4_3_'></a>[Anteil Fälle ohne Therapie 3](#toc0_)

    Filter: 
        not z_is_dco
        and z_icd10_3d not in ('C44','D04')
        and Diagnosedatum between '2020-01-01' and '2023-06-30'
        and left(z_icd10_3d,1) in ('C')
        and ifnull(z_m_pc_1,'') <> '1'
        and ifnull(z_period_diag_death_day,181) >= 180
        and z_age < 80
    



    
![svg](report_files/output_51_1.svg)
    


#### <a id='toc1_2_4_4_'></a>[ops wenn op](#toc0_)
- **Filter: `DJ` = 2020-2023**


    
![svg](report_files/output_53_0.svg)
    


#### <a id='toc1_2_4_5_'></a>[op wenn op erwartet](#toc0_)
- kategorien
  - `1_op`: mind. eine OPS im definierten Bereich (3Steller, organspezifisch) ist dokumentiert
  - `2_no_op_but_tp`: keine OPS, aber pT 1-4 ist dokumentiert
  - `3_rest`: keine der zuvor genannten Merkmale trifft zu




```python
    counts: rows
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [C50]:                             n = 339_929  (10.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░███
    └ [2020-2023]:                       n = 316_685   (9.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine M1]:                        n = 295_287   (9.1%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine Verstorbenen < 180 Tage]:   n = 283_195   (8.7%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [unter 80 Jahre]:                  n = 237_448   (7.3%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
```

    "z_icd10_3d = 'C50'\nand z_dy between 2020 and 2023\nand ifnull(z_m_pc_1,'') <> '1'\nand ifnull(z_period_diag_death_day,181) >= 180\nand z_age < 80"



##### <a id='toc1_2_4_5_1_'></a>[C50](#toc0_)

    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d = 'C50'



    
![svg](report_files/output_57_1.svg)
    


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d = 'C50' and z_age < 80



    
![svg](report_files/output_58_1.svg)
    



    
![svg](report_files/output_59_0.svg)
    


##### <a id='toc1_2_4_5_2_'></a>[C43](#toc0_)

    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d = 'C43'



    
![svg](report_files/output_61_1.svg)
    



    
![svg](report_files/output_62_0.svg)
    


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d = 'C43' and z_age < 80



    
![svg](report_files/output_63_1.svg)
    


##### <a id='toc1_2_4_5_3_'></a>[C18-C20](#toc0_)

    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d in ('C18', 'C19', 'C20')



    
![svg](report_files/output_65_1.svg)
    



    
![svg](report_files/output_66_0.svg)
    


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d in ('C18', 'C19', 'C20') and z_age < 80



    
![svg](report_files/output_67_1.svg)
    


##### <a id='toc1_2_4_5_4_'></a>[C62](#toc0_)

    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d in ('C62')



    
![svg](report_files/output_69_1.svg)
    


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and z_dy between 2020 and 2023 and z_icd10_3d in ('C62') and z_age < 80



    
![svg](report_files/output_70_1.svg)
    


#### <a id='toc1_2_4_6_'></a>[st wenn st erwartet](#toc0_)



```python
    counts: distinct z_tum_id
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [C50]:                             n = 339_929  (10.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░███
    └ [2020-2023.07]:                    n = 278_699   (8.6%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine M1]:                        n = 259_569   (8.0%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [keine Verstorbenen < 180 Tage]:   n = 248_991   (7.7%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░██
    └ [OPS: BET]:                        n = 143_832   (4.4%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
```

    Filter:
     z_icd10_3d = 'C50'
    and Diagnosedatum between '2020-01-01' and '2023-06-30'
    and ifnull(z_m_pc_1,'') <> '1'
    and ifnull(z_period_diag_death_day,181) >= 180
    and left(Code,5) in ('5-870')


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and Diagnosedatum between '2020-01-01' and '2023-06-30' and left(Code,5) in ('5-870') and z_icd10_3d = 'C50'



    
![svg](report_files/output_73_1.svg)
    


#### <a id='toc1_2_4_7_'></a>[sy wenn sy erwartet](#toc0_)



```python
    counts: rows
    ---
    n = 3_241_401                                                      (100.0%) ██████████████████████████████
    └ [2020-2023.07]:                                    n = 2_633_644  (81.3%) ░░░░░░████████████████████████
    └ [not z_is_dco]:                                    n = 2_547_636  (78.6%) ░░░░░░░███████████████████████
    └ [keine M1]:                                        n = 2_305_215  (71.1%) ░░░░░░░░░█████████████████████
    └ [keine Verstorbenen < 180 Tage]:                   n = 2_132_064  (65.8%) ░░░░░░░░░░░███████████████████
    └ [z_icd10 in ('C91.0', 'C92.0', 'C83.3', 'C82.4')]:    n = 27_653   (0.9%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

    "Diagnosedatum between '2020-01-01' and '2023-06-30'\nand not z_is_dco\nand ifnull(z_m_pc_1,'') <> '1'\nand ifnull(z_period_diag_death_day,181) >= 180\nand z_icd10 in ('C91.0', 'C92.0', 'C83.3', 'C82.4')"



    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and Diagnosedatum between '2020-01-01' and '2023-06-30' and left(Code,5) in ('5-870') and z_icd10_3d = 'C50'



    
![svg](report_files/output_76_1.svg)
    


    Filter: ifnull(z_period_diag_death_day,181) >= 180 and ifnull(z_m_pc_1,'') <> '1' and Diagnosedatum between '2020-01-01' and '2023-06-30' and left(Code,5) in ('5-870') and z_icd10_3d = 'C50'



    
![svg](report_files/output_77_1.svg)
    


#### <a id='toc1_2_4_8_'></a>[Anteil Fälle ohne R-Status nach OP wenn hohe Relevanz des R-Status](#toc0_)
- gezählt sind nun Tumore, nicht mehr OP
- `r_status`
  - `1_R0`: wenn >= 1 OP zum Tumor dokumentiert is mit `R0`
  - `2_R1_R2`: wenn kein `R0` dokumentiert, aber >= 1 OP mit `R1` oder `R2`
  - `3_NA_U_RX`: wenn beides nicht zutrifft (Feld ist leer, `U` oder `RX`)

    z_dy between 2020 and 2023 and z_icd10_3d = 'C50' and z_tum_op_count > 0



    
![svg](report_files/output_80_0.svg)
    



    
![png](report_files/output_80_1.png)
    


#### <a id='toc1_2_4_9_'></a>[Anteil Rezidive](#toc0_)

##### <a id='toc1_2_4_9_1_'></a>[C50](#toc0_)



```python
    counts: distinct z_tum_id
    ---
    n = 3_241_401                                    (100.0%) ██████████████████████████████
    └ [2020-2021]:                     n = 1_495_715  (46.1%) ░░░░░░░░░░░░░░░░░█████████████
    └ [keine M1]:                      n = 1_355_097  (41.8%) ░░░░░░░░░░░░░░░░░░████████████
    └ [C50]:                             n = 146_979   (4.5%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█
    └ [R0]:                               n = 89_812   (2.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
    └ [keine Verstorbenen < 180 Tage]:    n = 89_461   (2.8%) ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

    "z_dy between 2020 and 2021\nand ifnull(z_m_pc_1,'') <> '1'\nand z_icd10_3d = 'C50'\nand upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0'\nand ifnull(z_period_diag_death_day,181) >= 180"



    Filter: z_dy between 2020 and 2021 and ifnull(z_m_pc_1,'') <> '1' and upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0' and ifnull(z_period_diag_death_day,181) >= 180 and z_icd10_3d = 'C50'



    
![svg](report_files/output_85_1.svg)
    


    n = 89_461



    
![png](report_files/output_86_1.png)
    


##### <a id='toc1_2_4_9_2_'></a>[C18-C20](#toc0_)

    Filter: z_dy between 2020 and 2021 and ifnull(z_m_pc_1,'') <> '1' and upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0' and ifnull(z_period_diag_death_day,181) >= 180 and z_icd10_3d in ('C18','C19','C20')



    
![svg](report_files/output_88_1.svg)
    


    n = 46_861 | n(true) = 4_778



    
![png](report_files/output_89_1.png)
    


### <a id='toc1_2_5_'></a>[date periods](#toc0_)

#### <a id='toc1_2_5_1_'></a>[Anzahl Tage Diagnose Tod](#toc0_)


    
![png](report_files/output_92_0.png)
    



    
![png](report_files/output_92_1.png)
    


    
    column (n = 2_989_092)   |    present    |   min   | lower |  q25  | median |  mean  |  q75   | upper |  max  |  std   |  cv 
    -------------------------+---------------+---------+-------+-------+--------+--------+--------+-------+-------+--------+-----
    Anzahl_Tage_Diagnose_Tod | 807_950 (27%) | -27_320 |  -212 | 41.00 | 198.00 | 330.51 | 509.00 | 1_211 | 2_043 | 368.03 | 1.11
    
    
    item (n = 2_989_092) |  count  |   min   | lower |  q25  | median |  mean  |  q75   | upper |  max  |  std   |  cv 
    ---------------------+---------+---------+-------+-------+--------+--------+--------+-------+-------+--------+-----
    01-SH                |  40_150 |       0 |     0 | 29.00 | 193.00 | 336.30 | 527.00 | 1_274 | 1_783 | 381.00 | 1.13
    02-HH                |  17_898 |       0 |     0 | 34.00 | 163.00 | 301.57 | 456.00 | 1_089 | 1_784 | 350.78 | 1.16
    03-NI                |  62_000 |       0 |     0 | 72.00 | 238.00 | 354.04 | 529.00 | 1_214 | 1_752 | 352.65 | 1.00
    04-HB                |   7_806 |       0 |     0 | 25.00 | 145.00 | 287.97 | 451.00 | 1_089 | 1_688 | 339.30 | 1.18
    05-NW                | 230_941 |       0 |     0 | 28.00 | 187.00 | 333.87 | 523.00 | 1_265 | 1_847 | 383.06 | 1.15
    06-HE                |  47_132 |       0 |     0 | 74.00 | 244.00 | 361.28 | 542.00 | 1_244 | 1_885 | 358.23 | 0.99
    07-RP                |  25_580 |       0 |     0 | 57.00 | 197.00 | 309.62 | 463.00 | 1_072 | 1_857 | 324.37 | 1.05
    08-BW                | 112_990 |       0 |     0 | 57.00 | 245.00 | 375.67 | 579.00 | 1_362 | 2_043 | 391.48 | 1.04
    09-BY                |  98_333 |       0 |     0 | 22.00 | 162.00 | 289.89 | 453.00 | 1_099 | 1_751 | 334.38 | 1.15
    10-SL                |   2_724 |       0 |     0 |  0.00 |   0.00 |  36.19 |   8.00 |    20 | 1_309 | 120.67 | 3.33
    11-BE                |  34_190 |       0 |     0 | 19.00 | 132.00 | 267.95 | 410.00 |   996 | 1_790 | 326.35 | 1.22
    12-BB                |  29_755 |       0 |     0 | 26.00 | 145.00 | 275.85 | 414.00 |   996 | 1_819 | 330.76 | 1.20
    13-MV                |  19_682 | -27_320 |  -212 | 77.00 | 244.00 | 357.95 | 540.00 | 1_234 | 1_729 | 454.01 | 1.27
    14-SN                |  52_785 |       0 |     0 | 78.00 | 257.00 | 380.17 | 580.00 | 1_333 | 1_765 | 370.31 | 0.97
    15-ST                |  16_602 |       0 |     0 | 14.00 |  95.00 | 208.39 | 306.00 |   744 | 1_756 | 270.35 | 1.30
    16-TH                |   9_382 |       0 |     0 | 52.00 | 188.00 | 308.18 | 449.00 | 1_043 | 1_756 | 332.87 | 1.08
    





    
![svg](report_files/output_93_0.svg)
    



#### <a id='toc1_2_5_2_'></a>[Anzahl Tage Diagnose OP](#toc0_)


```python
    ┌──────────────────────────────────────┬───────────┬───────────────────────────────────┬─────────────────────────┬────────────┬──────────────────────┬──────────────────────────────────────┬───────┬──────────────────────┬────────────┐
    │                 OPId                 │ Intention │ Lokale_Beurteilung_Residualstatus │ Anzahl_Tage_Diagnose_OP │  Datum_OP  │ Datum_OP_Genauigkeit │               z_tum_id               │ z_kkr │ z_period_diag_op_day │ z_op_order │
    │               varchar                │  varchar  │              varchar              │          int32          │    date    │       varchar        │               varchar                │ int8  │        int32         │   int64    │
    ├──────────────────────────────────────┼───────────┼───────────────────────────────────┼─────────────────────────┼────────────┼──────────────────────┼──────────────────────────────────────┼───────┼──────────────────────┼────────────┤
    │ a0bad9a1-945f-486e-b087-eeec8c8b1365 │ K         │ R0                                │                      99 │ 2021-07-15 │ T                    │ 0005427c-84cb-4170-8f63-14a1d457be15 │     7 │                   99 │          1 │
    └──────────────────────────────────────┴───────────┴───────────────────────────────────┴─────────────────────────┴────────────┴──────────────────────┴──────────────────────────────────────┴───────┴──────────────────────┴────────────┘
```


```python
    ┌───────┬─────────┬─────────┬─────────┐
    │ code  │  name   │   kkr   │ system  │
    │ int64 │ varchar │ varchar │ varchar │
    ├───────┼─────────┼─────────┼─────────┤
    │     0 │ D       │ Total   │ NULL    │
    └───────┴─────────┴─────────┴─────────┘
![png](report_files/output_97_0.png)
![png](report_files/output_97_1.png)
    column (n = 1_322_937)  |     present     | min  | lower | q25  | median | mean  |  q75  | upper |  max  |  std   |  cv 
    ------------------------+-----------------+------+-------+------+--------+-------+-------+-------+-------+--------+-----
    Anzahl_Tage_Diagnose_OP | 1_303_981 (98%) | -304 |   -34 | 0.00 |  19.00 | 47.29 | 49.00 |   122 | 4_835 | 101.45 | 2.15
    item (n = 1_322_937) |  count  | min  | lower | q25  | median | mean  |  q75  | upper |  max  |  std   |  cv 
    ---------------------+---------+------+-------+------+--------+-------+-------+-------+-------+--------+-----
    01-SH                |  44_153 |    0 |     0 | 0.00 |  20.00 | 39.21 | 46.00 |   115 | 1_498 |  59.89 | 1.53
    02-HH                |  26_897 |    0 |     0 | 0.00 |  15.00 | 45.91 | 42.00 |   105 | 2_204 | 107.70 | 2.35
    03-NI                |  92_380 |    0 |     0 | 0.00 |  22.00 | 47.08 | 55.00 |   137 | 1_635 |  76.37 | 1.62
    04-HB                |   9_001 |    0 |     0 | 3.00 |  25.00 | 42.04 | 49.00 |   118 |   384 |  57.03 | 1.36
    05-NW                | 257_291 |    0 |     0 | 1.00 |  23.00 | 58.11 | 54.00 |   133 | 1_812 | 124.40 | 2.14
    06-HE                |  74_588 |    0 |     0 | 0.00 |  21.00 | 47.33 | 49.00 |   122 | 3_448 | 103.79 | 2.19
    07-RP                |  48_914 |    0 |     0 | 0.00 |  20.00 | 43.81 | 45.00 |   112 | 1_649 |  88.96 | 2.03
    08-BW                | 166_886 |    0 |     0 | 0.00 |  22.00 | 53.24 | 54.00 |   135 | 1_967 | 112.39 | 2.11
    09-BY                | 180_625 |    0 |     0 | 0.00 |  16.00 | 44.60 | 48.00 |   120 | 4_835 |  91.13 | 2.04
    10-SL                |  15_891 |    0 |     0 | 0.00 |  13.00 | 35.94 | 38.00 |    95 | 1_080 |  65.85 | 1.83
    11-BE                |  56_440 |    0 |     0 | 0.00 |  21.00 | 47.53 | 52.00 |   130 | 1_599 |  90.75 | 1.91
    12-BB                |  49_240 |    0 |     0 | 0.00 |  20.00 | 47.31 | 50.00 |   125 | 1_724 |  93.37 | 1.97
    13-MV                |  58_272 | -304 |   -34 | 0.00 |   1.00 | 35.16 | 35.00 |    87 | 2_333 |  91.32 | 2.60
    14-SN                |  95_912 |    0 |     0 | 0.00 |  16.00 | 46.77 | 50.00 |   125 | 1_680 |  96.65 | 2.07
    15-ST                |  71_448 |    0 |     0 | 0.00 |   7.00 | 35.93 | 37.00 |    92 | 3_656 |  94.47 | 2.63
    16-TH                |  56_043 |    0 |     0 | 0.00 |   0.00 | 30.77 | 27.00 |    67 | 2_899 |  98.49 | 3.20
```

