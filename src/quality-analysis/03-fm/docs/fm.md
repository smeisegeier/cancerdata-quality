# fernmetastasen

    🐍 3.12.8 | 📦 pygwalker: 0.4.9.15 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.1 | 📦 pandas-plots: 0.21.2 | 📦 connection-helper: 0.13.1


## dataset
- filter
  - `z_dy` 2020-2022
- metrics
  - tum, pat, fm

<br>

    Anzahl Patienten: 2_735_152
    Anzahl Tumoren: 3_241_401
    Anzahl FM: 490_363
    🗄️ fm-items,M1,2020-2022	3_420_093, 9
    	("fm_localisation, z_tum_id, z_pat_id, z_kkr_label, z_dy, z_icd10_3d, z_m_pc_1, M_p, FernmetastaseId")
    ┌─────────────────┬──────────────────────┬──────────────────────┬─────────────┬───────┬────────────┬──────────┬─────────┬───────────────────────┐
    │ fm_localisation │       z_tum_id       │       z_pat_id       │ z_kkr_label │ z_dy  │ z_icd10_3d │ z_m_pc_1 │   M_p   │    FernmetastaseId    │
    │     varchar     │       varchar        │       varchar        │   varchar   │ int16 │  varchar   │ varchar  │ varchar │        varchar        │
    ├─────────────────┼──────────────────────┼──────────────────────┼─────────────┼───────┼────────────┼──────────┼─────────┼───────────────────────┤
    │ Knochen         │ 0e7ba901-8512-4346…  │ 8f5caf75-376e-4044…  │ 09-BY       │  2022 │ C61        │ 1        │ NULL    │ 8f186640-b9af-455a-…  │
    │ Knochen         │ 217996f8-225c-4467…  │ acd8bf72-ffb8-431a…  │ 07-RP       │  2022 │ C61        │ 1        │ NULL    │ 4bcb8c2f-c2ee-4f5f-…  │
    │ Knochen         │ 0056084c-9e0a-44a5…  │ 6f150053-7cba-4246…  │ 06-HE       │  2020 │ C61        │ 1        │ NULL    │ 78c6dd09-a12a-434d-…  │
    └─────────────────┴──────────────────────┴──────────────────────┴─────────────┴───────┴────────────┴──────────┴─────────┴───────────────────────┘
    


## 🕹️ interactive

## M1 vs has_fm
- `M1`: either M_c or M_p
- `has_fm`: any FM is assigned to tumor?

### share of M1 in all tumors
- 10% of all tumors have `M1` (273k)


    
![svg](fm_files/output_11_0.svg)
    


### share of has_fm in M1
- 10% of `M1` have no FM assigned


    
![svg](fm_files/output_13_0.svg)
    



    
![svg](fm_files/output_14_0.svg)
    

