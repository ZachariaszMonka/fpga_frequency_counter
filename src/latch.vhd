library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity latch is	 
	
	port(	
		input : in disp;
		output : out disp;
		LE : in STD_LOGIC	
		);	   
end latch;



architecture latch of latch is
begin 
	
	process (LE)
		begin
			if LE = '1' then  
				output <= input;
			end if;	
	end process;
	
end latch; 



