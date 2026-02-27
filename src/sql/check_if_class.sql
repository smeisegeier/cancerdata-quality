    CREATE OR REPLACE MACRO mem.fx_check_if_class(in_column) AS
        case
            when regexp_matches(in_column::text, 'arbor', 'i') then 'ann_arbor'
            when regexp_matches(in_column::text, 'uicc', 'i') then 'uicc'
            --when regexp_matches(in_column::text, 'who|gehirn|brain', 'i') then 'brain' # 60k
            when regexp_matches(in_column::text, 'tnm', 'i') then 'tnm'
            when regexp_matches(in_column::text, 'psa', 'i') then 'psa'
            when regexp_matches(in_column::text, 'breslow', 'i') then 'breslow'
            when regexp_matches(in_column::text, 'clark', 'i') then 'clark'
            when regexp_matches(in_column::text, 'gleason', 'i') then 'gleason'
            when regexp_matches(in_column::text, 'gehirn|brain|zns|gliom|id-h|1p19q|astrocytoma|glioblastoma|meningioma|koos|knosp|who.*(gehirn|brain|zns|hirn)', 'i') then 'brain'
            when regexp_matches(in_column::text, 'p16|hpv|pap', 'i') then 'hpv'
            when regexp_matches(in_column::text, 'epstein|isup|grade group', 'i') then 'isup_grade_group'
            when regexp_matches(in_column::text, 'hep', 'i') then 'hep' -- M+(HEP) for colorectal cancer
            when regexp_matches(in_column::text, 'ki67|ki-67', 'i') then 'ki67'
            -- 1. Hormone Receptor Label (ER/PR)
            when regexp_matches(in_column::text, 'pgr|strogen|rezeptor|receptor|er %', 'i') then 'hormone_receptor'
            -- 2. HER2 Label
            when regexp_matches(in_column::text, 'her-2|her2|erbb2', 'i') then 'her2'

            when regexp_matches(in_column::text, 'siewert|aeg', 'i') then 'siewert_aeg_type'
            when regexp_matches(in_column::text, 'dukes', 'i') then 'dukes_stage'
            when regexp_matches(in_column::text, 'lauren', 'i') then 'lauren_histotype'

            when regexp_matches(in_column::text, 'binet|rai', 'i') then 'cll_staging'
            when regexp_matches(in_column::text, 'durie|salmon|iss|myeloma', 'i') then 'myeloma_staging'
            when regexp_matches(in_column::text, 'eln|fab|leukämie|leukemia', 'i') then 'leukemia_grading'
            when regexp_matches(in_column::text, 'who', 'i') then 'who'

            else null
        end;
