library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity add_BDC is	 
	
	port(	  
	clk :  in STD_LOGIC;
		inputA : in disp;
		inputB : in disp;
		output : out disp
		);	   
end add_BDC;



architecture add_BDC of add_BDC is	
 	 
signal buff : disp;
begin 
	
	process(clk) 
		variable c: std_logic_vector(4 downto 0) := "00000";	   
		variable buff_A: std_logic_vector(4 downto 0) := "00000";	  
		variable buff_B: std_logic_vector(4 downto 0) := "00000";	
		variable buff_OUT: std_logic_vector(4 downto 0) := "00000";	
	begin
			 
		for index in 0 to 7 loop 
			buff_A := "0" & inputA(index);
			buff_B := "0" & inputB(index);
			if (buff_A + buff_B + c) < 10 then
				buff_OUT := buff_A + buff_B + c;
				buff(index) <= buff_OUT(3 downto 0); 
				c := "00000";
			else  
				buff_OUT := buff_A + buff_B + c - 10;
				buff(index) <= buff_OUT(3 downto 0); 
				c := "00001";
			end if;
		end loop;
	end process;
	
	output <= buff;
end add_BDC; 



