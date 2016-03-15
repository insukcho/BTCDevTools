DROP TABLE IF EXISTS t_config, t_frh_calc, t_fsh_calc, t_gas_temp;

CREATE TABLE IF NOT EXISTS t_config (
	i_div character varying(30),
	i_type character varying(30),
	i_att1 character varying(100)
);

CREATE TABLE IF NOT EXISTS t_frh_calc (
	i_div character varying(30),
	d_timestamp timestamp,
	i_tube_no numeric,
	n_mw real,
	n_att1 real,
	n_att2 real,
	n_att3 real,
	n_att4 real,
	n_att5 real,
	n_att6 real,
	n_att7 real,
	n_att8 real,
	n_att9 real,
	n_att10 real,
	n_att11 real,
	n_att12 real,
	n_att13 real,
	n_att14 real,
	n_att15 real,
	n_att16 real,
	n_att17 real,
	n_att18 real,
	n_att19 real,
	n_att20 real,
	n_att21 real,
	n_att22 real,
	n_att23 real
);

CREATE TABLE IF NOT EXISTS t_fsh_calc (
	i_div character varying(30),
	d_timestamp timestamp,
	i_tube_no numeric,
	n_mw real,
	n_att1 real,
	n_att2 real,
	n_att3 real,
	n_att4 real,
	n_att5 real,
	n_att6 real,
	n_att7 real,
	n_att8 real,
	n_att9 real,
	n_att10 real,
	n_att11 real,
	n_att12 real,
	n_att13 real,
	n_att14 real,
	n_att15 real,
	n_att16 real,
	n_att17 real,
	n_att18 real,
	n_att19 real,
	n_att20 real,
	n_att21 real,
	n_att22 real,
	n_att23 real,
	n_att24 real,
	n_att25 real,
	n_att26 real,
	n_att27 real,
	n_att28 real,
	n_att29 real,
	n_att30 real,
	n_att31 real,
	n_att32 real,
	n_att33 real,
	n_att34 real,
	n_att35 real,
	n_att36 real,
	n_att37 real,
	n_att38 real,
	n_att39 real,
	n_att40 real,
	n_att41 real,
	n_att42 real,
	n_att43 real,
	n_att44 real,
	n_att45 real,
	n_att46 real,
	n_att47 real
);

CREATE TABLE IF NOT EXISTS t_gas_temp (
	d_timestamp timestamp,
	n_mw real,
	n_frh_inlet real,
	n_fsh_inlet real,
	n_ltrh_inlet real,
	n_eco2_inlet real
);

INSERT INTO t_config
	(i_div, i_type, i_att1) VALUES
	('F.S.H', 'Limit Line', '637');

INSERT INTO t_gas_temp
	(d_timestamp, n_mw, n_frh_inlet, n_fsh_inlet, n_ltrh_inlet, n_eco2_inlet) VALUES
	('2016-03-01 00:00:00', 497, 1037.1, 932.2, 801.5, 570.9);

INSERT INTO t_frh_calc
	(i_div, d_timestamp, i_tube_no, n_mw, n_att1, n_att2, n_att3, n_att4, n_att5, n_att6, n_att7, n_att8, n_att9, n_att10, n_att11, n_att12, n_att13, n_att14, n_att15, n_att16, n_att17, n_att18, n_att19, n_att20, n_att21, n_att22, n_att23) VALUES
	('F.R.H_3', '2016-03-01 00:00:00', 1, 497, 690, 691,  692,    693,    694,    695,    696,    697,    698,    699,     700,     701,     702,     703,     704,     705,     706,     707,     708,     709,     710,     711,     712),
	('F.R.H_5', '2016-03-01 00:00:00', 1, 497, 590, 591,  592,    593,    594,    595,    596,    597,    598,    599,     600,     601,     602,     603,     604,     605,     606,     607,     608,     609,     610,     611,     612);

INSERT INTO t_fsh_calc
	(i_div, d_timestamp, i_tube_no, n_mw, n_att1, n_att2, n_att3, n_att4, n_att5, n_att6, n_att7, n_att8, n_att9, n_att10, n_att11, n_att12, n_att13, n_att14, n_att15, n_att16, n_att17, n_att18, n_att19, n_att20, n_att21, n_att22, n_att23, n_att24, n_att25, n_att26, n_att27, n_att28, n_att29, n_att30, n_att31, n_att32, n_att33, n_att34, n_att35, n_att36, n_att37, n_att38, n_att39, n_att40, n_att41, n_att42, n_att43, n_att44, n_att45, n_att46, n_att47) VALUES
	('F.S.H_3', '2016-03-01 00:00:00', 1, 497, 690, 691,  692,    693,    694,    695,    696,    697,    698,    699,     700,     701,     702,     703,     704,     705,     706,     707,     708,     709,     710,     711,     712,     713,     714,     715,     716,     717,     718,     719,     720,     721,     722,     723,     724,     725,     726,     727,     728,     729,     730,     731,     732,     733,     734,     735,     736),
	('F.S.H_5', '2016-03-01 00:00:00', 1, 497, 590, 591,  592,    593,    594,    595,    596,    597,    598,    599,     600,     601,     602,     603,     604,     605,     606,     607,     608,     609,     610,     611,     612,     613,     614,     615,     616,     617,     618,     619,     620,     621,     622,     623,     624,     625,     626,     627,     628,     629,     630,     631,     632,     633,     634,     635,     636);
