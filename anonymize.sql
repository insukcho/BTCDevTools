CREATE TABLE t_config_alt (i_div, i_type, i_att1) AS SELECT i_div, i_type, (i_att1::float + 10)::character varying(100) FROM t_config;