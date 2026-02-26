    CREATE OR REPLACE MACRO mem.fx_check_if_unknown(in_column, in_alias) AS
        CASE
            -- specific rules
            WHEN in_alias = 'Inzidenzort' THEN
                case when in_column::text in ('00000','99999') then 1 else 0 end
        
            WHEN in_alias = 'Grading' THEN
                CASE
                    WHEN in_column::text IN ('U', 'T') THEN 1
                    ELSE 0
                END
            WHEN in_alias = 'Morphologie_Code' THEN
                CASE
                -- 8000-8011, 9590, 9591, 9800, 9801, 8050
                    WHEN (
                            LEFT(in_column::text, 4)::smallint BETWEEN 8000 AND 8011 OR
                            LEFT(in_column::text, 4) in ('9590', '9591', '9800', '9801', '8050')
                        )
                        THEN 1
                    ELSE 0
                END
            
            when in_alias = 'Topographie_Code' THEN
                CASE
                    WHEN (
                            left(in_column::text, 3) in ('C26', 'C39', 'C76', 'C80')
                            or in_column::text in ('C14.0', 'C57.9', 'C63.9', 'C68.9', 'C72.9', 'C75.9')
                    )
                    then 1 else 0
                END
            
            WHEN in_alias = 'Diagnosesicherung' THEN
                CASE
                    WHEN in_column::text IN ('9') THEN 1
                    ELSE 0
                END
            WHEN in_alias = 'Intention' THEN
                CASE
                    WHEN in_column::text IN ('X') THEN 1
                    ELSE 0
                END
            WHEN in_alias = 'Seite_Zielgebiet' THEN
                CASE
                    WHEN in_column::text IN ('U') THEN 1
                    ELSE 0
                END
            WHEN in_alias = 'Seitenlokalisation' THEN
                CASE
                    WHEN in_column::text IN ('U') THEN 1
                    ELSE 0
                END
            WHEN in_alias ilike '%_genauigkeit' THEN
                CASE
                    WHEN in_column::text IN ('M','V') THEN 1
                    ELSE 0
                END
            WHEN in_alias = 'Diagnose_ICD10_Code' THEN
                CASE
                    WHEN in_column::text IN ('C80','C80.0', 'C80.1', 'C80.9', 'C79.9') THEN 1
                    ELSE 0
                END

            WHEN in_alias = 'Lokalisation_Code' THEN
                -- C26, C39, C76, C80,  C14.0, C57.9, C63.9, C68.9, C72.9, C75.9
                CASE WHEN (
                    left(in_column::text, 3) in ('C26', 'C39', 'C76', 'C80') or
                    in_column::text IN ('C14.0', 'C57.9', 'C63.9', 'C68.9', 'C72.9', 'C75.9')
                )
                    THEN 1
                    ELSE 0
                END

            WHEN LEFT(in_alias::text, 5) = 'c_p_u' THEN 0

            WHEN in_alias ilike '%datum%' THEN
                case when year(in_column::date) <= 1900 then 1 else 0 end

            -- general rule
            WHEN in_column::text IN ('U', 'X', 'VX', 'SX', 'okk') THEN 1
        ELSE 0
    END;
