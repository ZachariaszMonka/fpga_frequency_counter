library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity BCD_to_text is	 
	
	port(	
		Input : in disp;
		Output : out text_line_type
		);	   
end BCD_to_text;

	   

architecture BCD_to_text of BCD_to_text is		 


    signal buff : text_line_type;
begin 
		
	buff(0) <= Input(7);
	buff(1) <= Input(6);
	buff(2) <= Input(5);
	buff(3) <= Input(4);
	buff(4) <= Input(3);
	buff(5) <= Input(2);
	buff(6) <= Input(1);
	buff(7) <= Input(0);
	buff(8) <= "1011"; --H		
	buff(9) <= "1100"; --z
	buff(10) <= "0000";	
	buff(11) <= "0000";	
	buff(12) <= "0000";	
	buff(13) <= "0000";	
	buff(14) <= "0000";	
	buff(15) <= "0000";	
	buff(16) <= "0000";	
	buff(17) <= "0000";	
	buff(18) <= "0000";	
	buff(19) <= "0000";	
	
	Output <= buff;
	
end BCD_to_text; 

 