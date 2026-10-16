
select
    *,
    case when op_cnt > 0 then 0 else 1 end as op_missing,
    case when st_cnt > 0 then 0 else 1 end as st_missing,
    case when syst_cnt > 0 then 0 else 1 end as syst_missing,
    case when folge_cnt > 0 then 0 else 1 end as folge_missing,
    case when (op_cnt = 0 and st_cnt = 0 and syst_cnt = 0) then 1 else 0 end as thera_missing

    from
    (select 
        t.z_tum_id,
        z_pat_id,
        t.z_kkr,
        t.z_kkr_label as kkr,
        l.system,
        t.z_dy,
        t.z_icd10,
        t.z_icd10_3d,
        t.Diagnosesicherung,
        left(t.Inzidenzort,2)::tinyint as bl,
        Diagnosedatum,
        z_period_diag_death_day,
        z_m_pc_1,
        z_age,

        z_is_dco,
        z_tum_op_count as op_cnt,
        case when ops_cnt is null then 0 else ops_cnt end as ops_cnt,
        z_tum_st_count as st_cnt,
        z_tum_sy_count as syst_cnt,
        case when bestr_cnt is null then 0 else bestr_cnt end as bestr_cnt,
        z_tum_fo_count as folge_cnt,
        case when app_cnt is null then 0 else app_cnt end as app_cnt,
        case when diag_weitere_cnt is null then 0 else diag_weitere_cnt end as diag_weitere_cnt,
        case when folge_weitere_cnt is null then 0 else folge_weitere_cnt end as folge_weitere_cnt,
        case when folge_fm_cnt is null then 0 else folge_fm_cnt end as folge_fm_cnt,
        case when diag_fm_cnt is null then 0 else diag_fm_cnt end as diag_fm_cnt,
        case when proto_cnt is null then 0 else proto_cnt end as proto_cnt,
        case when subst_cnt is null then 0 else subst_cnt end as subst_cnt,
        case when folge_tnm_cnt is null then 0 else folge_tnm_cnt end as folge_tnm_cnt

        from Tumor t
        join Patient p on p.oBDS_RKIPatientId = t.oBDS_RKIPatientId
        left join dim_lieferregister l on cast(l.code as int) = cast(t.z_kkr as int)
        left join dim_icd10_3d icd on icd.code = t.z_icd10_3d
        left join (SELECT z_tum_id, count(*) as ops_cnt FROM OPS GROUP BY z_tum_id) ops on ops.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as bestr_cnt FROM Bestrahlung GROUP BY z_tum_id) bestr on bestr.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as app_cnt FROM Applikationsart GROUP BY z_tum_id) app on app.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as subst_cnt FROM Substanz GROUP BY z_tum_id) subst on subst.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as proto_cnt FROM Protokoll GROUP BY z_tum_id) proto on proto.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as diag_fm_cnt FROM Diagnose_Fernmetastase GROUP BY z_tum_id) fm_diag on fm_diag.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as folge_fm_cnt FROM Folgeereignis_Fernmetastase GROUP BY z_tum_id) fm_folge on fm_folge.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as diag_weitere_cnt FROM Diagnose_WeitereKlassifikation GROUP BY z_tum_id) weitere_diag on weitere_diag.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as folge_weitere_cnt FROM Folgeereignis_WeitereKlassifikation GROUP BY z_tum_id) weitere_folge on weitere_folge.z_tum_id = t.oBDS_RKIPatientTumorId
        left join (SELECT z_tum_id, count(*) as folge_tnm_cnt FROM Folgeereignis_TNM GROUP BY z_tum_id) tnm_folge on tnm_folge.z_tum_id = t.oBDS_RKIPatientTumorId
    )
