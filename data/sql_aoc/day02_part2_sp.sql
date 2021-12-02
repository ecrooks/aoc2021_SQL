create or replace procedure db2inst1.sp_aoc_day02_part2 ( INOUT v_position INT 
							, INOUT v_depth INT
							, INOUT v_aim INT
							, OUT v_ans INT ) 
	not deterministic
	language sql
	reads sql data
BEGIN
	-- declare variables
	declare v_aim int;
	-- set isolation level
	set current isolation = UR;
	--set staring values
	set v_position = coalesce(v_position,0);
	set v_aim = coalesce(v_aim,0);
	set v_depth = coalesce(v_depth,0);
	-- query table and process row by row
	for for_routine as c_aoc_day02_data cursor for
		select direction, units from aoc_day02 order by seq
	do
		if direction = 'forward' THEN
			set v_position = v_position + units;
			set v_depth = v_depth + (v_aim * units);
		end if;
		if direction = 'down' THEN
			set v_aim = v_aim + units;
		end if;
		if direction = 'up' THEN
			set v_aim = v_aim - units;
		end if;
	end for;
	set v_ans = v_position * v_depth;
END @
