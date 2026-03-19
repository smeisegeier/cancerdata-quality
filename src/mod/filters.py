import os

DY_MAX = int(os.environ.get("DY_MAX", "2024"))  # default 2024, override via env

FILTERS_DY = (f"z_dy between 2020 and {DY_MAX}", f"DJ 2020-{DY_MAX}")
FILTERS_DY_MAX = (f"z_dy = {DY_MAX}", f"DJ {DY_MAX}")
FILTERS_DY_DELAY = (f"Diagnosedatum between '2020-01-01' and '{DY_MAX}-06-30'", f"DJ 2020-{DY_MAX} ohne letzte 6m")
FILTERS_NO_DCO = ("not z_is_dco", "keine DCO")
FILTERS_C = ("left(z_icd10_3d,1) = 'C'", "ICD10 nur C")
FILTERS_NO_C44 = ("z_icd10_3d not in ('C44','D04')", "keine C44,D04")

FILTERS_SOLID = (
    """--sql
    z_icd10_3d not in ('C44')
    and left(z_icd10_3d,1) = 'C'
    and right(z_icd10_3d, 2)::int8 <= 75
""",
    "nur solide Tumore",
)

FILTERS_NO_SOLID = (f"not ({FILTERS_SOLID[0]})", "nur nicht-solide Tumore")

FILTERS_C50 = ("z_icd10_3d = 'C50'", "ICD10 C50")
FILTERS_C18C20 = ("z_icd10_3d in ('C18', 'C19', 'C20')", "ICD10 C18-C20")
FILTERS_VALID = ("is_deleted = 0", "keine gelöschten Fälle")

FILTERS_NO_M1 = ("ifnull(z_m_pc_1,'') <> '1'", "kein M1")
FILTERS_M0 = ("z_m_pc_1 = '0'", "nur M0")
FILTERS_HAS_TREAT = (("z_tum_op_count+z_tum_sy_count+z_tum_st_count > 0", "Tumor hat Therapie"))
FILTERS_HAS_OP = ("z_tum_op_count > 0", "Tumor hat OP")
FILTERS_R0 = ("upper(left(Lokale_Beurteilung_Residualstatus,2)) = 'R0'", "Residualstatus R0")
# FILTERS_HAS_TREAT = ("""--sql
#     ifnull(z_first_treatment,'') <> ''
#     and z_first_treatment_after_days >= 0
#     """, "Tumore mit Behandlung")

FILTERS_GRAD = (
    """--sql
    (
        left(z_icd10_3d, 1) ='C' and
        (
            right(z_icd10_3d, 2)::int8 between 00 and 33
            or right(z_icd10_3d, 2)::int8 between 50 and 57
            or right(z_icd10_3d, 2)::int8 between 63 and 68
            or right(z_icd10_3d, 2)::int8 = 60
        )
        and left(Morphologie_Code,4)::int between 8010 and 8576
    )""",
    "nur gradingrelevante Tumore",
)

FILTERS_TNM = (
    """--sql
    (
        left(z_icd10_3d, 1) ='C' and
        (
            right(z_icd10_3d, 2)::int8 between 00 and 43
            or right(z_icd10_3d, 2)::int8 between 45 and 69
            or right(z_icd10_3d, 2)::int8 between 73 and 74
        )
        and left(Morphologie_Code,4)::int between 8010 and 8790
        and z_icd10_3d not in ('C26', 'C39', 'C55')
        and z_icd10 not in ('C14.0', 'C57.9', 'C63.9')
    )""",
    "nur tnm-relevante Tumore",
)

FILTERS_SYSTEM = (
    """--sql
    (
        (left(z_icd10_3d,1) = 'C' and right(z_icd10_3d, 2)::int8 between 81 and 96)
        OR (left(z_icd10_3d,1) = 'D' and right(z_icd10_3d, 2)::int8 between 45 and 47)
    )""",
    "nur systemische Tumore",
)

FILTERS_INSITU = (
    """--sql
    z_icd10_3d in ('D00', 'D01', 'D02', 'D03', 'D05', 'D06', 'D07', 'D08', 'D09')
""",
    "nur insitu Tumore",
)

FILTERS_NO_180D_DEAD = ("ifnull(z_period_diag_death_day,181) >= 180", "keine Verstorbenen < 180 Tage")
FILTERS_AGE_LT_80 = ("z_age < 80", "unter 80")
FILTERS_OPS_C50 = ("left(Code,4) in ('5-87', '5-88')", "nur OPS C50")
FILTERS_OPS_C18C20 = ("left(Code,4) in ('5-45', '5-46', '5-47', '5-48')", "nur OPS C18C20")
FILTERS_OPS_C62 = ("left(Code,4) in ('5-62')", "nur OPS für C62")
FILTERS_OPS_C43 = ("left(Code,4) in ('5-89', '5-91')", "nur OPS C43")
FILTERS_BET = ("left(Code,5) in ('5-870')", "nur OPS für BET")

FILTERS_TOPO = (
    """--sql
    left(Topographie_Code::text, 3) in ('C26', 'C39', 'C76', 'C80')
    or Topographie_Code::text in ('C14.0', 'C57.9', 'C63.9', 'C68.9', 'C72.9', 'C75.9')
""",
    "nur Topographie-relevant",
)

FILTERS_TP = ("z_t_p_1 in ('1','2','3','4')", "t_p = 1-4")
FILTERS_OP_LT_180D = (
    "z_tum_id in (select distinct z_tum_id from OP where z_period_diag_op_day < 180)",
    "Tumor hat OP < 180d nach Diagnose",
)
