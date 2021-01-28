library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity zero_delete is	 
	
	port(	
		clk :  in STD_LOGIC;
		input : in disp;
		output : out disp
		);	   
end zero_delete;



architecture zero_delete of zero_delete is	  
signal buff : disp;
begin 

	process (clk)	
	begin 	 
		buff(0) <= input(0);
		for index in 1 to 7 loop   	
			buff(index) <= "1111";
			for index2 in 1 to 7 loop
				if (index <= index2) and not(input(index2)= "0000") then 
					buff(index) <= input(index);  
				end if;
			end loop;
		end loop;
	end process; 
	
	output <= buff;
	
end zero_delete; 



