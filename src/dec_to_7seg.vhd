library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity dec_to_7seg is
	port(
		DEC : in STD_logic_vector(3 DOWNTO 0);
		SEG : out STD_logic_vector(6 DOWNTO 0)								   	
		);
end dec_to_7seg; 

architecture dec_to_7seg of dec_to_7seg is 

signal buffer_out: std_logic_vector(6 downto 0);

begin	
	
	--buffer_out(6 downto 0) <= DEC(2 downto 0) & DEC(3 downto 0); 
	
	with DEC(3 downto 0) select
	buffer_out	 <= "1000000" when "0000",
					"1111001" when "0001",
					"0100100" when "0010",
					"0110000" when "0011",
					"0011001" when "0100",
					"0010010" when "0101",
					"0000010" when "0110",
					"1111000" when "0111",
					"0000000" when "1000",
					"0010000" when "1001",
					"1111111" when others;
	
	SEG <= buffer_out;
	
end dec_to_7seg;