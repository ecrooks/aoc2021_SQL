su - db2inst1 -c "db2 connect to testdb; db2 -td@ -vf /database/sql_aoc/day01_part1_setup.sql |tee day01_part1_setup.sql.out; db2 connect reset"
