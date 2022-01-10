-- users statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.users'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.users t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- admins statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.admins'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.admins t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- courses statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.courses'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.courses t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- enrolled_courses statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.enrolled_courses'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.enrolled_courses t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- activities statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.activities'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.activities t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- questions statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.questions'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.questions t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);
-- answers statistiscs
SELECT l.metric,
    l.nr AS bytes,
    CASE
        WHEN is_size THEN pg_size_pretty(nr)
    END AS bytes_pretty,
    CASE
        WHEN is_size THEN nr / NULLIF(x.ct, 0)
    END AS bytes_per_row
FROM (
        SELECT min(tableoid) AS tbl -- = 'public.answers'::regclass::oid
,
            count(*) AS ct,
            sum(length(t::text)) AS txt_len -- length in characters
        FROM public.answers t -- provide table name *once*
    ) x
    CROSS JOIN LATERAL (
        VALUES (
                true,
                'core_relation_size',
                pg_relation_size(tbl)
            ),
            (
                true,
                'visibility_map',
                pg_relation_size(tbl, 'vm')
            ),
            (
                true,
                'free_space_map',
                pg_relation_size(tbl, 'fsm')
            ),
            (
                true,
                'table_size_incl_toast',
                pg_table_size(tbl)
            ),
            (
                true,
                'indexes_size',
                pg_indexes_size(tbl)
            ),
            (
                true,
                'total_size_incl_toast_and_indexes',
                pg_total_relation_size(tbl)
            ),
            (
                true,
                'live_rows_in_text_representation',
                txt_len
            ),
            (false, '------------------------------', NULL),
            (false, 'row_count', ct),
            (
                false,
                'live_tuples',
                pg_stat_get_live_tuples(tbl)
            ),
            (
                false,
                'dead_tuples',
                pg_stat_get_dead_tuples(tbl)
            )
    ) l(is_size, metric, nr);