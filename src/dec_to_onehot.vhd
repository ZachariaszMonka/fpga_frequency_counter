													library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity dec_to_onehot is
	port(
		DEC : in STD_logic_vector(3 DOWNTO 0);
		ONEHOT : out STD_logic_vector(7 DOWNTO 0);
		nONEHOT : out STD_logic_vector(7 DOWNTO 0)
		);
end dec_to_onehot; 

architecture dec_to_onehot of dec_to_onehot is 

signal buffer_out: std_logic_vector(7 downto 0);

begin	
		
	with DEC(3 downto 0) select
	buffer_out	 <= "00000001" when "0000",
					"00000010" when "0001",
					"00000100" when "0010",
					"00001000" when "0011",
					"00010000" when "0100",
					"00100000" when "0101",
					"01000000" when "0110",
					"10000000" when "0111",
					"00000000" when others;
	
	ONEHOT <= buffer_out;
	nONEHOT <= NOT(buffer_out);
end dec_to_onehot;