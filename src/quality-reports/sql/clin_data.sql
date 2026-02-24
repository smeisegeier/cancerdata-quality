
select
    *,
    case when op_cnt > 0 then 0 else 1 end as op_missing,
    -- case when ops_cnt > 0 then 0 else 1 end as ops_missing,
    case when st_cnt > 0 then 0 else 1 end as st_missing,
    case when syst_cnt > 0 then 0 else 1 end as syst_missing,
    case when folge_cnt > 0 then 0 else 1 end as folge_missing,
    -- case when bestr_cnt > 0 then 0 else 1 end as bestr_missing,
    -- case when app_cnt > 0 then 0 else 1 end as app_missing,
    -- case when subst_cnt > 0 then 0 else 1 end as subst_missing,
    -- case when proto_cnt > 0 then 0 else 1 end as proto_missing,
    -- case when fm_diag_cnt > 0 then 0 else 1 end as fm_diag_missing,
    -- case when fm_folge_cnt > 0 then 0 else 1 end as fm_folge_missing,
    -- case when fm_diag_cnt > 0 then 0 else 1 end as fm_diag_missing,
    -- case when weitere_diag_cnt > 0 then 0 else 1 end as weitere_diag_missing,
    -- case when weitere_folge_cnt > 0 then 0 else 1 end as weitere_folge_missing,
    -- case when tnm_folge_cnt > 0 then 0 else 1 end as tnm_folge_missing,
    case when (op_cnt = 0 and st_cnt = 0 and syst_cnt = 0) then 1 else 0 end as thera_missing

    from
    (select 
        -- cast(t.z_kkr as int) as kkr_int,
        t.z_tum_id as tum_id,
        p.oBDS_RKIPatientId as pat_id,
        t.z_kkr_label as kkr,
        l.system,
        t.z_dy,
        t.Diagnose_ICD10_Code as icd10,
        SUBSTR(t.Diagnose_ICD10_Code,1,3) as icd10_3d,
        t.Diagnosesicherung as dsich,
        SUBSTR(t.Inzidenzort,1,2)as bl,
        -- case when ifnull(t.Diagnosesicherung,'') = 0 then 1 else 0 end as dco,
        z_is_dco,
        -- case when op_cnt is null then 0 else op_cnt end as op_cnt,
        z_tum_op_count as op_cnt,
        case when ops_cnt is null then 0 else ops_cnt end as ops_cnt,
        -- case when st_cnt is null then 0 else st_cnt end as st_cnt,
        z_tum_st_count as st_cnt,
        -- case when syst_cnt is null then 0 else syst_cnt end as syst_cnt,
        z_tum_sy_count as syst_cnt,
        case when bestr_cnt is null then 0 else bestr_cnt end as bestr_cnt,
        -- case when folge_cnt is null then 0 else folge_cnt end as folge_cnt,
        z_tum_fo_count as folge_cnt,
        case when app_cnt is null then 0 else app_cnt end as app_cnt,
        case when weitere_diag_cnt is null then 0 else weitere_diag_cnt end as weitere_diag_cnt,
        case when weitere_folge_cnt is null then 0 else weitere_folge_cnt end as weitere_folge_cnt,
        case when fm_folge_cnt is null then 0 else fm_folge_cnt end as fm_folge_cnt,
        case when fm_diag_cnt is null then 0 else fm_diag_cnt end as fm_diag_cnt,
        case when proto_cnt is null then 0 else proto_cnt end as proto_cnt,
        case when subst_cnt is null then 0 else subst_cnt end as subst_cnt,
        case when tnm_folge_cnt is null then 0 else tnm_folge_cnt end as tnm_folge_cnt

        from Tumor t
        join Patient p on p.oBDS_RKIPatientId = t.oBDS_RKIPatientId
        left join dim_lieferregister l on cast(l.code as int) = cast(t.z_kkr as int)
        -- left join (SELECT z_tum_id, count(*) as op_cnt FROM OP GROUP BY z_tum_id) op on op.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as ops_cnt FROM OPS GROUP BY z_tum_id) ops on ops.z_tum_id = t.oBDS_RKIPatientTumorId
        -- left join (SELECT z_tum_id, count(*) as folge_cnt FROM Folgeereignis GROUP BY z_tum_id) folge on folge.z_tum_id = t.oBDS_RKIPatientTumorId
        -- left join (SELECT z_tum_id, count(*) as st_cnt FROM ST GROUP BY z_tum_id) st on st.z_tum_id = t.oBDS_RKIPatientTumorId
        -- left join (SELECT z_tum_id, count(*) as syst_cnt FROM SYST GROUP BY z_tum_id) syst on syst.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as bestr_cnt FROM Bestrahlung GROUP BY z_tum_id) bestr on bestr.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as app_cnt FROM Applikationsart GROUP BY z_tum_id) app on app.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as subst_cnt FROM Substanz GROUP BY z_tum_id) subst on subst.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as proto_cnt FROM Protokoll GROUP BY z_tum_id) proto on proto.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as fm_diag_cnt FROM Diagnose_Fernmetastase GROUP BY z_tum_id) fm_diag on fm_diag.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as fm_folge_cnt FROM Folgeereignis_Fernmetastase GROUP BY z_tum_id) fm_folge on fm_folge.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as weitere_diag_cnt FROM Diagnose_WeitereKlassifikation GROUP BY z_tum_id) weitere_diag on weitere_diag.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as weitere_folge_cnt FROM Folgeereignis_WeitereKlassifikation GROUP BY z_tum_id) weitere_folge on weitere_folge.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as tnm_folge_cnt FROM Folgeereignis_TNM GROUP BY z_tum_id) tnm_folge on tnm_folge.z_tum_id = t.oBDS_RKIPatientTumorId
    )
