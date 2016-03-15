* To create a scheme like the real data, with a few fake values (Do not run this on the database containing the real data, as it drops the tables):
	`psql -U doosan -f test_fixture.sql`

* To create a modified version of the data inside your database (Safe to run agains real database):
	`psql -U doosan -f anonymize.sql`

* To dump the modified data:
	`pg_dump -U doosan -t t_config_alt -t t_gas_temp_alt -t t_frh_calc_alt -t t_fsh_calc_alt > doosan.sql`

* To insert the modified data into another db:
	`psql -U doosan doosan < t_config_alt.sql`, etc. Warnings can be ignored.

* To rename the tables:
	`psql -U doosan -f rename.sql`
