library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity BCD_to_text is	 
	
	port(	
		clk  : in STD_LOGIC;	
		Input : in disp;
		Output : out text_screen_type
		);	   
end BCD_to_text;

	   

architecture BCD_to_text of BCD_to_text is		 



begin 
		
	process (clk) 
	variable out_buff: text_screen_type;	
	variable line_buff: text_line_type;
	begin
		if clk'event and clk = '1' then	   
			
		
			out_buff(0) := line_buff;
			
			
		end if;
	end process;
	
end BCD_to_text; 

 