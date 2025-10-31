# <a id='toc1_'></a>[relapse](#toc0_)

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
 

**Table of contents**<a id='toc0_'></a>    
- [relapse](#toc1_)    
  - [⚙️ settings](#toc1_1_)    
  - [📆 data as of](#toc1_2_)    
  - [op](#toc1_3_)    
  - [analysis relapse categorization](#toc1_4_)    
  - [bitmask](#toc1_5_)    

<!-- vscode-jupyter-toc-config
	numbering=false
	anchor=true
	flat=false
	minLevel=1
	maxLevel=6
	/vscode-jupyter-toc-config -->
<!-- THIS CELL WILL BE REPLACED ON TOC UPDATE. DO NOT WRITE YOUR TEXT IN THIS CELL -->

    🐍 3.12.8 | 📦 pygwalker: 0.4.9.15 | 📦 pandas: 2.3.3 | 📦 numpy: 1.26.4 | 📦 duckdb: 1.4.1 | 📦 pandas-plots: 0.20.4 | 📦 connection-helper: 0.13.1


## <a id='toc1_1_'></a>[⚙️ settings](#toc0_)

## <a id='toc1_2_'></a>[📆 data as of](#toc0_)

    sqlite db file:          2025-10-20_data_clin.duckdb
    data tag:                v2.3
    last kkr data import:    2025-09-30
    sql table created:       2025-10-20 18:49:45
    doi:                     10.18444/5.03.01.0005.0021.0001
    document created:        2025-10-31 14:42:59


## <a id='toc1_3_'></a>[tum vs op](#toc0_)

    FILTER: z_dy=2020 and z_icd10_3d in ('C50') | darin 70_309 Operationen, 77_633 Tumore



    
![svg](relapse_files/output_10_0.svg)
    


## <a id='toc1_4_'></a>[analysis relapse categorization](#toc0_)
- gezählt sind Tumore
- Kategorien
  - `1_fo_relapse` - Tumore mit Rezidiv nach enger Definition
  - `2_fo_relapse_tnm` - Tumore mit Rezidiv nach erweiterter Definition
  - `3_fo_no_relapse` - Tumore mit Folgeereignis ohne o.a. Rezidiv
  - `4_no_fo` - Tumore ohne Folgeereignis
  - `9_unknown` - UNbekannt

    FILTER: z_dy=2020 and z_icd10_3d in ('C50') and upper(left(op.Lokale_Beurteilung_Residualstatus,2)) = 'R0' | darin 44_976 Tumore



    
![svg](relapse_files/output_13_0.svg)
    





<style type="text/css">
#T_09380 th {
  text-align: right;
}
#T_09380 td {
  text-align: right;
}
#T_09380_row0_col0, #T_09380_row12_col1 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.1%, transparent 0.1%);
  font-family: Courier;
}
#T_09380_row0_col1, #T_09380_row2_col1, #T_09380_row3_col1, #T_09380_row4_col1, #T_09380_row7_col1, #T_09380_row9_col1 {
  width: 10em;
  font-family: Courier;
}
#T_09380_row0_col2, #T_09380_row2_col0, #T_09380_row6_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.4%, transparent 0.4%);
  font-family: Courier;
}
#T_09380_row0_col3, #T_09380_row6_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.1%, transparent 2.1%);
  font-family: Courier;
}
#T_09380_row0_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.6%, transparent 2.6%);
  font-family: Courier;
}
#T_09380_row1_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 1.0%, transparent 1.0%);
  font-family: Courier;
}
#T_09380_row1_col1, #T_09380_row5_col1, #T_09380_row6_col1, #T_09380_row8_col1, #T_09380_row10_col1, #T_09380_row10_col3, #T_09380_row11_col1 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.0%, transparent 0.0%);
  font-family: Courier;
}
#T_09380_row1_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 11.5%, transparent 11.5%);
  font-family: Courier;
}
#T_09380_row1_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 10.9%, transparent 10.9%);
  font-family: Courier;
}
#T_09380_row1_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 23.5%, transparent 23.5%);
  font-family: Courier;
}
#T_09380_row2_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 4.5%, transparent 4.5%);
  font-family: Courier;
}
#T_09380_row2_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 3.7%, transparent 3.7%);
  font-family: Courier;
}
#T_09380_row2_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 8.6%, transparent 8.6%);
  font-family: Courier;
}
#T_09380_row3_col0, #T_09380_row8_col0, #T_09380_row8_col3, #T_09380_row11_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.2%, transparent 0.2%);
  font-family: Courier;
}
#T_09380_row3_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 3.8%, transparent 3.8%);
  font-family: Courier;
}
#T_09380_row3_col3, #T_09380_row7_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 1.8%, transparent 1.8%);
  font-family: Courier;
}
#T_09380_row3_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 5.8%, transparent 5.8%);
  font-family: Courier;
}
#T_09380_row4_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 1.3%, transparent 1.3%);
  font-family: Courier;
}
#T_09380_row4_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 12.7%, transparent 12.7%);
  font-family: Courier;
}
#T_09380_row4_col3, #T_09380_row6_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.7%, transparent 2.7%);
  font-family: Courier;
}
#T_09380_row4_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 16.7%, transparent 16.7%);
  font-family: Courier;
}
#T_09380_row5_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 1.1%, transparent 1.1%);
  font-family: Courier;
}
#T_09380_row5_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 6.8%, transparent 6.8%);
  font-family: Courier;
}
#T_09380_row5_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 9.3%, transparent 9.3%);
  font-family: Courier;
}
#T_09380_row5_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 17.2%, transparent 17.2%);
  font-family: Courier;
}
#T_09380_row6_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 5.2%, transparent 5.2%);
  font-family: Courier;
}
#T_09380_row7_col0, #T_09380_row10_col0, #T_09380_row11_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.3%, transparent 0.3%);
  font-family: Courier;
}
#T_09380_row7_col2, #T_09380_row8_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.3%, transparent 2.3%);
  font-family: Courier;
}
#T_09380_row7_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 4.4%, transparent 4.4%);
  font-family: Courier;
}
#T_09380_row8_col4, #T_09380_row11_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.8%, transparent 2.8%);
  font-family: Courier;
}
#T_09380_row9_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 0.6%, transparent 0.6%);
  font-family: Courier;
}
#T_09380_row9_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 4.2%, transparent 4.2%);
  font-family: Courier;
}
#T_09380_row9_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 1.9%, transparent 1.9%);
  font-family: Courier;
}
#T_09380_row9_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 6.7%, transparent 6.7%);
  font-family: Courier;
}
#T_09380_row10_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 3.3%, transparent 3.3%);
  font-family: Courier;
}
#T_09380_row10_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 3.6%, transparent 3.6%);
  font-family: Courier;
}
#T_09380_row11_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 2.2%, transparent 2.2%);
  font-family: Courier;
}
#T_09380_row12_col0 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 6.2%, transparent 6.2%);
  font-family: Courier;
}
#T_09380_row12_col2 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 56.8%, transparent 56.8%);
  font-family: Courier;
}
#T_09380_row12_col3 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 36.9%, transparent 36.9%);
  font-family: Courier;
}
#T_09380_row12_col4 {
  width: 10em;
  background: linear-gradient(90deg, lightblue 100.0%, transparent 100.0%);
  font-family: Courier;
}
</style>
<table id="T_09380">
  <thead>
    <tr>
      <th class="index_name level0" >categ_relapse</th>
      <th id="T_09380_level0_col0" class="col_heading level0 col0" >1_fo_relapse</th>
      <th id="T_09380_level0_col1" class="col_heading level0 col1" >2_fo_relapse_tnm</th>
      <th id="T_09380_level0_col2" class="col_heading level0 col2" >3_fo_no_relapse</th>
      <th id="T_09380_level0_col3" class="col_heading level0 col3" >4_no_fo</th>
      <th id="T_09380_level0_col4" class="col_heading level0 col4" >Total</th>
    </tr>
    <tr>
      <th class="index_name level0" >z_kkr_label</th>
      <th class="blank col0" >&nbsp;</th>
      <th class="blank col1" >&nbsp;</th>
      <th class="blank col2" >&nbsp;</th>
      <th class="blank col3" >&nbsp;</th>
      <th class="blank col4" >&nbsp;</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th id="T_09380_level0_row0" class="row_heading level0 row0" >02-HH</th>
      <td id="T_09380_row0_col0" class="data row0 col0" >64 <span style="color: grey">(0.1%) </span></td>
      <td id="T_09380_row0_col1" class="data row0 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row0_col2" class="data row0 col2" >162 <span style="color: grey">(0.4%) </span></td>
      <td id="T_09380_row0_col3" class="data row0 col3" >962 <span style="color: grey">(2.1%) </span></td>
      <td id="T_09380_row0_col4" class="data row0 col4" >1_188 <span style="color: grey">(2.6%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row1" class="row_heading level0 row1" >05-NW</th>
      <td id="T_09380_row1_col0" class="data row1 col0" >464 <span style="color: grey">(1.0%) </span></td>
      <td id="T_09380_row1_col1" class="data row1 col1" >22 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row1_col2" class="data row1 col2" >5_186 <span style="color: grey">(11.5%) </span></td>
      <td id="T_09380_row1_col3" class="data row1 col3" >4_907 <span style="color: grey">(10.9%) </span></td>
      <td id="T_09380_row1_col4" class="data row1 col4" >10_579 <span style="color: grey">(23.5%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row2" class="row_heading level0 row2" >06-HE</th>
      <td id="T_09380_row2_col0" class="data row2 col0" >195 <span style="color: grey">(0.4%) </span></td>
      <td id="T_09380_row2_col1" class="data row2 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row2_col2" class="data row2 col2" >2_005 <span style="color: grey">(4.5%) </span></td>
      <td id="T_09380_row2_col3" class="data row2 col3" >1_666 <span style="color: grey">(3.7%) </span></td>
      <td id="T_09380_row2_col4" class="data row2 col4" >3_866 <span style="color: grey">(8.6%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row3" class="row_heading level0 row3" >07-RP</th>
      <td id="T_09380_row3_col0" class="data row3 col0" >74 <span style="color: grey">(0.2%) </span></td>
      <td id="T_09380_row3_col1" class="data row3 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row3_col2" class="data row3 col2" >1_721 <span style="color: grey">(3.8%) </span></td>
      <td id="T_09380_row3_col3" class="data row3 col3" >806 <span style="color: grey">(1.8%) </span></td>
      <td id="T_09380_row3_col4" class="data row3 col4" >2_601 <span style="color: grey">(5.8%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row4" class="row_heading level0 row4" >08-BW</th>
      <td id="T_09380_row4_col0" class="data row4 col0" >588 <span style="color: grey">(1.3%) </span></td>
      <td id="T_09380_row4_col1" class="data row4 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row4_col2" class="data row4 col2" >5_707 <span style="color: grey">(12.7%) </span></td>
      <td id="T_09380_row4_col3" class="data row4 col3" >1_229 <span style="color: grey">(2.7%) </span></td>
      <td id="T_09380_row4_col4" class="data row4 col4" >7_524 <span style="color: grey">(16.7%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row5" class="row_heading level0 row5" >09-BY</th>
      <td id="T_09380_row5_col0" class="data row5 col0" >503 <span style="color: grey">(1.1%) </span></td>
      <td id="T_09380_row5_col1" class="data row5 col1" >8 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row5_col2" class="data row5 col2" >3_056 <span style="color: grey">(6.8%) </span></td>
      <td id="T_09380_row5_col3" class="data row5 col3" >4_175 <span style="color: grey">(9.3%) </span></td>
      <td id="T_09380_row5_col4" class="data row5 col4" >7_742 <span style="color: grey">(17.2%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row6" class="row_heading level0 row6" >11-BE</th>
      <td id="T_09380_row6_col0" class="data row6 col0" >163 <span style="color: grey">(0.4%) </span></td>
      <td id="T_09380_row6_col1" class="data row6 col1" >3 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row6_col2" class="data row6 col2" >1_231 <span style="color: grey">(2.7%) </span></td>
      <td id="T_09380_row6_col3" class="data row6 col3" >944 <span style="color: grey">(2.1%) </span></td>
      <td id="T_09380_row6_col4" class="data row6 col4" >2_341 <span style="color: grey">(5.2%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row7" class="row_heading level0 row7" >12-BB</th>
      <td id="T_09380_row7_col0" class="data row7 col0" >139 <span style="color: grey">(0.3%) </span></td>
      <td id="T_09380_row7_col1" class="data row7 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row7_col2" class="data row7 col2" >1_048 <span style="color: grey">(2.3%) </span></td>
      <td id="T_09380_row7_col3" class="data row7 col3" >810 <span style="color: grey">(1.8%) </span></td>
      <td id="T_09380_row7_col4" class="data row7 col4" >1_997 <span style="color: grey">(4.4%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row8" class="row_heading level0 row8" >13-MV</th>
      <td id="T_09380_row8_col0" class="data row8 col0" >109 <span style="color: grey">(0.2%) </span></td>
      <td id="T_09380_row8_col1" class="data row8 col1" >1 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row8_col2" class="data row8 col2" >1_026 <span style="color: grey">(2.3%) </span></td>
      <td id="T_09380_row8_col3" class="data row8 col3" >107 <span style="color: grey">(0.2%) </span></td>
      <td id="T_09380_row8_col4" class="data row8 col4" >1_243 <span style="color: grey">(2.8%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row9" class="row_heading level0 row9" >14-SN</th>
      <td id="T_09380_row9_col0" class="data row9 col0" >284 <span style="color: grey">(0.6%) </span></td>
      <td id="T_09380_row9_col1" class="data row9 col1" ><span style="color: grey">0 </span></td>
      <td id="T_09380_row9_col2" class="data row9 col2" >1_898 <span style="color: grey">(4.2%) </span></td>
      <td id="T_09380_row9_col3" class="data row9 col3" >846 <span style="color: grey">(1.9%) </span></td>
      <td id="T_09380_row9_col4" class="data row9 col4" >3_028 <span style="color: grey">(6.7%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row10" class="row_heading level0 row10" >15-ST</th>
      <td id="T_09380_row10_col0" class="data row10 col0" >121 <span style="color: grey">(0.3%) </span></td>
      <td id="T_09380_row10_col1" class="data row10 col1" >2 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row10_col2" class="data row10 col2" >1_494 <span style="color: grey">(3.3%) </span></td>
      <td id="T_09380_row10_col3" class="data row10 col3" >10 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row10_col4" class="data row10 col4" >1_627 <span style="color: grey">(3.6%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row11" class="row_heading level0 row11" >16-TH</th>
      <td id="T_09380_row11_col0" class="data row11 col0" >75 <span style="color: grey">(0.2%) </span></td>
      <td id="T_09380_row11_col1" class="data row11 col1" >1 <span style="color: grey">(0.0%) </span></td>
      <td id="T_09380_row11_col2" class="data row11 col2" >1_008 <span style="color: grey">(2.2%) </span></td>
      <td id="T_09380_row11_col3" class="data row11 col3" >156 <span style="color: grey">(0.3%) </span></td>
      <td id="T_09380_row11_col4" class="data row11 col4" >1_240 <span style="color: grey">(2.8%) </span></td>
    </tr>
    <tr>
      <th id="T_09380_level0_row12" class="row_heading level0 row12" >Total</th>
      <td id="T_09380_row12_col0" class="data row12 col0" >2_779 <span style="color: grey">(6.2%) </span></td>
      <td id="T_09380_row12_col1" class="data row12 col1" >37 <span style="color: grey">(0.1%) </span></td>
      <td id="T_09380_row12_col2" class="data row12 col2" >25_542 <span style="color: grey">(56.8%) </span></td>
      <td id="T_09380_row12_col3" class="data row12 col3" >16_618 <span style="color: grey">(36.9%) </span></td>
      <td id="T_09380_row12_col4" class="data row12 col4" >44_976 <span style="color: grey">(100.0%) </span></td>
    </tr>
  </tbody>
</table>




## <a id='toc1_5_'></a>[combinations](#toc0_)

    FILTER: z_dy=2020 and z_icd10_3d in ('C50') and has_rez_ges_lo_ly_fm_label != '-' | darin 3_247 Folgeereignisse



    
![svg](relapse_files/output_17_0.svg)
    



    
![svg](relapse_files/output_18_0.svg)
    

