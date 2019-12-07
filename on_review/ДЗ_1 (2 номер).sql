-- В таблицу выносятся rat_id и rating_record_id, но rat_id не имеет смысла, а rating_record_id так и не был прокомментирован
DROP TABLE if exists rat_info
;
CREATE TABLE rat_info AS
SELECT distinct  agency_id, rat_industry, rat_type, horizon, scale_typer, currency, backed_flag,rating_record_id, rat_id
FROM public.actions GROUP BY agency_id, rat_industry, rat_type, horizon, scale_typer, currency, backed_flag,rating_record_id, rat_id;
ALTER TABLE rat_info ADD PRIMARY KEY (rating_record_id)

DROP TABLE if exists info_comp
;
CREATE TABLE info_comp AS
SELECT ent_name, okpo, ogrn, inn,  finst
-- PR: отношение "ratings_task" не существует (видимо, имелось в виду actions)
FROM ratings_task GROUP BY ent_name, okpo, ogrn, inn,  finst;
ALTER TABLE info_comp ADD PRIMARY KEY (ent_name)
