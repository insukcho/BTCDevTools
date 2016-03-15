DROP FUNCTION IF EXISTS alter_temperature(timestamp, real);
DROP FUNCTION IF EXISTS to_minutes_since_inception(timestamp);

CREATE FUNCTION to_minutes_since_inception(timestamp) RETURNS real
	AS $$ SELECT CAST(EXTRACT(EPOCH FROM($1 - '2016-03-21 10:00:00'::timestamp))/60 AS real) $$
	LANGUAGE SQL;

CREATE FUNCTION alter_temperature(timestamp, real) RETURNS real
	AS $$ SELECT CAST($2 + sin(pi() * to_minutes_since_inception($1) / 15) AS real) $$
	LANGUAGE SQL;

DROP TABLE IF EXISTS t_config_alt, t_gas_temp_alt;

CREATE TABLE t_config_alt (i_div, i_type, i_att1)
	AS SELECT i_div, i_type, (i_att1::float + 10)::character varying(100) FROM t_config;

CREATE TABLE t_gas_temp_alt (d_timestamp, n_mw, n_frh_inlet, n_fsh_inlet, n_ltrh_inlet, n_eco2_inlet)
	AS SELECT d_timestamp, n_mw + 1, alter_temperature(d_timestamp, n_frh_inlet), n_fsh_inlet, n_ltrh_inlet, n_eco2_inlet FROM t_gas_temp;