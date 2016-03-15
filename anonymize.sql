DROP FUNCTION IF EXISTS alter_temperature(timestamp, real);
DROP FUNCTION IF EXISTS to_minutes_since_inception(timestamp);

CREATE FUNCTION to_minutes_since_inception(timestamp) RETURNS real
	AS $$ SELECT CAST(EXTRACT(EPOCH FROM($1 - '2016-03-21 10:00:00'::timestamp))/60 AS real) $$
	LANGUAGE SQL;

CREATE FUNCTION alter_temperature(timestamp, real) RETURNS real
	AS $$ SELECT CAST(
		$2 +
		sin(pi() * to_minutes_since_inception($1) / 15) +
		3 * sin(pi() * to_minutes_since_inception($1) / 120) +
		3 * sin(pi() * to_minutes_since_inception($1) / 300) +
		4 * sin(pi() * to_minutes_since_inception($1) / 1000)
	AS real) $$
	LANGUAGE SQL;

DROP TABLE IF EXISTS t_config_alt, t_gas_temp_alt;

CREATE TABLE t_config_alt (i_div, i_type, i_att1)
	AS SELECT i_div, i_type, (i_att1::float + 10)::character varying(100) FROM t_config;

CREATE TABLE t_gas_temp_alt (d_timestamp, n_mw, n_frh_inlet, n_fsh_inlet, n_ltrh_inlet, n_eco2_inlet)
	AS SELECT
		d_timestamp,
		n_mw + 1,
		alter_temperature(d_timestamp, n_frh_inlet),
		alter_temperature(d_timestamp, n_fsh_inlet),
		alter_temperature(d_timestamp, n_ltrh_inlet),
		alter_temperature(d_timestamp, n_eco2_inlet)
	FROM t_gas_temp;

CREATE TABLE t_frh_calc_alt (i_div, d_timestamp, i_tube_no, n_mw, n_att1, n_att2, n_att3, n_att4, n_att5, n_att6, n_att7, n_att8, n_att9, n_att10, n_att11, n_att12, n_att13, n_att14, n_att15, n_att16, n_att17, n_att18, n_att19, n_att20, n_att21, n_att22, n_att23)
	AS SELECT
		i_div,
		d_timestamp,
		i_tube_no,
		n_mw + 1,
		alter_temperature(d_timestamp, n_att1),
		alter_temperature(d_timestamp, n_att2),
		alter_temperature(d_timestamp, n_att3),
		alter_temperature(d_timestamp, n_att4),
		alter_temperature(d_timestamp, n_att5),
		alter_temperature(d_timestamp, n_att6),
		alter_temperature(d_timestamp, n_att7),
		alter_temperature(d_timestamp, n_att8),
		alter_temperature(d_timestamp, n_att9),
		alter_temperature(d_timestamp, n_att10),
		alter_temperature(d_timestamp, n_att11),
		alter_temperature(d_timestamp, n_att12),
		alter_temperature(d_timestamp, n_att13),
		alter_temperature(d_timestamp, n_att14),
		alter_temperature(d_timestamp, n_att15),
		alter_temperature(d_timestamp, n_att16),
		alter_temperature(d_timestamp, n_att17),
		alter_temperature(d_timestamp, n_att18),
		alter_temperature(d_timestamp, n_att19),
		alter_temperature(d_timestamp, n_att20),
		alter_temperature(d_timestamp, n_att21),
		alter_temperature(d_timestamp, n_att22),
		alter_temperature(d_timestamp, n_att23)
	FROM t_frh_calc;

CREATE TABLE t_fsh_calc_alt (i_div, d_timestamp, i_tube_no, n_mw, n_att1, n_att2, n_att3, n_att4, n_att5, n_att6, n_att7, n_att8, n_att9, n_att10, n_att11, n_att12, n_att13, n_att14, n_att15, n_att16, n_att17, n_att18, n_att19, n_att20, n_att21, n_att22, n_att23, n_att24, n_att25, n_att26, n_att27, n_att28, n_att29, n_att30, n_att31, n_att32, n_att33, n_att34, n_att35, n_att36, n_att37, n_att38, n_att39, n_att40, n_att41, n_att42, n_att43, n_att44, n_att45, n_att46, n_att47)
	AS SELECT
		i_div,
		d_timestamp,
		i_tube_no,
		n_mw + 1,
		alter_temperature(d_timestamp, n_att1),
		alter_temperature(d_timestamp, n_att2),
		alter_temperature(d_timestamp, n_att3),
		alter_temperature(d_timestamp, n_att4),
		alter_temperature(d_timestamp, n_att5),
		alter_temperature(d_timestamp, n_att6),
		alter_temperature(d_timestamp, n_att7),
		alter_temperature(d_timestamp, n_att8),
		alter_temperature(d_timestamp, n_att9),
		alter_temperature(d_timestamp, n_att10),
		alter_temperature(d_timestamp, n_att11),
		alter_temperature(d_timestamp, n_att12),
		alter_temperature(d_timestamp, n_att13),
		alter_temperature(d_timestamp, n_att14),
		alter_temperature(d_timestamp, n_att15),
		alter_temperature(d_timestamp, n_att16),
		alter_temperature(d_timestamp, n_att17),
		alter_temperature(d_timestamp, n_att18),
		alter_temperature(d_timestamp, n_att19),
		alter_temperature(d_timestamp, n_att20),
		alter_temperature(d_timestamp, n_att21),
		alter_temperature(d_timestamp, n_att22),
		alter_temperature(d_timestamp, n_att23),
		alter_temperature(d_timestamp, n_att24),
		alter_temperature(d_timestamp, n_att25),
		alter_temperature(d_timestamp, n_att26),
		alter_temperature(d_timestamp, n_att27),
		alter_temperature(d_timestamp, n_att28),
		alter_temperature(d_timestamp, n_att29),
		alter_temperature(d_timestamp, n_att30),
		alter_temperature(d_timestamp, n_att31),
		alter_temperature(d_timestamp, n_att32),
		alter_temperature(d_timestamp, n_att33),
		alter_temperature(d_timestamp, n_att34),
		alter_temperature(d_timestamp, n_att35),
		alter_temperature(d_timestamp, n_att36),
		alter_temperature(d_timestamp, n_att37),
		alter_temperature(d_timestamp, n_att38),
		alter_temperature(d_timestamp, n_att39),
		alter_temperature(d_timestamp, n_att40),
		alter_temperature(d_timestamp, n_att41),
		alter_temperature(d_timestamp, n_att42),
		alter_temperature(d_timestamp, n_att43),
		alter_temperature(d_timestamp, n_att44),
		alter_temperature(d_timestamp, n_att45),
		alter_temperature(d_timestamp, n_att46),
		alter_temperature(d_timestamp, n_att47)
	FROM t_fsh_calc;
