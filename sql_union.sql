
with messages_union AS (
SELECT * FROM `mospoke_spokecodb.message`
UNION ALL
SELECT * FROM `mospoke_spokefldb.message`
UNION ALL
SELECT * FROM `mospoke_spokegadb.message`
UNION ALL
SELECT * FROM `mospoke_spokeladb.message`
UNION ALL
SELECT * FROM `mospoke_spokefldb.message`
UNION ALL
SELECT * FROM `mospoke_spokemadb.message`
UNION ALL
SELECT * FROM `mospoke_spokemedb.message`
UNION ALL
SELECT * FROM `mospoke_spokemidb.message`
UNION ALL
SELECT * FROM `mospoke_spokemndb.message`
UNION ALL
SELECT * FROM `mospoke_spokemodb.message`
UNION ALL
SELECT * FROM `mospoke_spokencdb.message`
UNION ALL
SELECT * FROM `mospoke_spokenmdb.message`
UNION ALL
SELECT * FROM `mospoke_spokenvdb.message`
UNION ALL
SELECT * FROM `mospoke_spokenydb.message`
UNION ALL
SELECT * FROM `mospoke_spokeohdb.message`
UNION ALL
SELECT * FROM `mospoke_spokeordb.message`
UNION ALL
SELECT * FROM `mospoke_spokesvdb.message`
UNION ALL
SELECT * FROM `mospoke_spoketndb.message`
UNION ALL
SELECT * FROM `mospoke_spokevadb.message`
UNION ALL
SELECT * FROM `mospoke_spokewidb.message`
),

received as (
SELECT count(*) as from_contact
FROM messages_union
where error_code is null and is_from_contact = true
),
sent as (
SELECT count(*) as to_contact
FROM messages_union
where error_code is null and is_from_contact = false
)
select from_contact, to_contact, from_contact/to_contact as contact_rate
FROM received, sent
