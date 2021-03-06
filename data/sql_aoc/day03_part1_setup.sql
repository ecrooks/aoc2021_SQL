drop table aoc_day03;
create table aoc_day03 (
	seq int generated by default as identity primary key
	, bin_num char(12) not null
	, char_1 int generated always as (SUBSTR(bin_num,1,1))
	, char_2 int generated always as (SUBSTR(bin_num,2,1))
	, char_3 int generated always as (SUBSTR(bin_num,3,1))
	, char_4 int generated always as (SUBSTR(bin_num,4,1))
	, char_5 int generated always as (SUBSTR(bin_num,5,1))
	, char_6 int generated always as (SUBSTR(bin_num,6,1))
	, char_7 int generated always as (SUBSTR(bin_num,7,1))
	, char_8 int generated always as (SUBSTR(bin_num,8,1))
	, char_9 int generated always as (SUBSTR(bin_num,9,1))
	, char_10 int generated always as (SUBSTR(bin_num,10,1))
	, char_11 int generated always as (SUBSTR(bin_num,11,1))
	, char_12 int generated always as (SUBSTR(bin_num,12,1))
);
