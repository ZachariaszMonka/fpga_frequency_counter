library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity D_flipflop is	 
	
	port(	
		input : in disp;
		output : out disp;
		D : in STD_LOGIC	
		);	   
end D_flipflop;



architecture D_flipflop of D_flipflop is
begin 
	
	process (D)
		begin 
			if D'event and D='1' then  
				output <= input;
			end if;	
	end process;
	
end D_flipflop; 



