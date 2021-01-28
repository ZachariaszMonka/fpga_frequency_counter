library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity D_flipflop is	 
	
	port(	
		D : in disp;
		output : out disp;
		clk : in STD_LOGIC	
		);	   
end D_flipflop;



architecture D_flipflop of D_flipflop is
begin 
	
	process (clk)
		begin 
			if clk'event and clk='1' then  
				output <= D;
			end if;	
	end process;
	
end D_flipflop; 



