CREATE OR REPLACE FUNCTION REVERSE(INSTR VARCHAR(4000))
  RETURNS VARCHAR(4000) SPECIFIC REVERSE
   DETERMINISTIC NO EXTERNAL ACTION CONTAINS SQL
 RETURN WITH rec(pos, res) AS (VALUES (1, CAST('' AS VARCHAR(4000)))
                               UNION ALL
                               SELECT pos + 1, SUBSTR(INSTR, pos , 1) || res 
                                 FROM rec 
                                 WHERE pos <= LENGTH(INSTR) 
                                   AND pos < 5000)
        SELECT res FROM rec WHERE pos > LENGTH(INSTR)@
drop function bin_to_int@
create function bin_to_int (IN bin_str varchar(50))
    returns  bigint
    language sql
    begin
      declare ans bigint;
      declare digit_num, digit_max smallint;
      declare this_digit char(1);

      set digit_num = 1;
      set ans = 0;
      set digit_max = length(bin_str);
      set bin_str=reverse(bin_str);
      while digit_num <= digit_max
      do
	set this_digit=substr(bin_str,digit_num,1);
	if this_digit != 0 and this_digit != 1 then
          signal sqlstate '75001'
          set message_text = 'Non binary digit in input string';
        end if;
	set ans=ans+this_digit*power(2,digit_num-1);
	set digit_num=digit_num+1;
      end while;
    return ans;
end@
