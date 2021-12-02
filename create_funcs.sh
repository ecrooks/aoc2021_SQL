su - db2inst1 -c "db2 connect to aocdb; db2 -td@ -vf /database/sql_aoc/day01_part1_setup.sql |tee day01_part1_setup.sql.out; db2 connect reset"
su - db2inst1 -c "db2 connect to aocdb; db2 -td@ -vf /database/sql_aoc/day02_part1_setup.sql |tee day02_part1_setup.sql.out; db2 connect reset"
su - db2inst1 -c "db2 connect to aocdb; db2 -td@ -vf /database/sql_aoc/day02_part2_sp.sql |tee day02_part2_sp.sql.out; db2 connect reset"
