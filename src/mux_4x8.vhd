												   													library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity mux_4x8 is
	port(	  
		ENABLE: in STD_logic;
		SEL : in STD_logic_vector(3 DOWNTO 0);
		IN0 : in STD_logic_vector(3 DOWNTO 0);
		IN1 : in STD_logic_vector(3 DOWNTO 0);
		IN2 : in STD_logic_vector(3 DOWNTO 0);
		IN3 : in STD_logic_vector(3 DOWNTO 0);
		IN4 : in STD_logic_vector(3 DOWNTO 0);
		IN5 : in STD_logic_vector(3 DOWNTO 0);
		IN6 : in STD_logic_vector(3 DOWNTO 0);
		IN7 : in STD_logic_vector(3 DOWNTO 0);
		
		OUTPUT : out STD_logic_vector(3 DOWNTO 0)
		);
end mux_4x8; 

architecture mux_4x8 of mux_4x8 is 

signal buffer_out: std_logic_vector(3 downto 0);

begin	
		
	with SEL(3 downto 0) select
	buffer_out	 <= IN0 when "0000",
					IN1 when "0001",
					IN2 when "0010",
					IN3 when "0011",
					IN4 when "0100",
					IN5 when "0101",
					IN6 when "0110",
					IN7 when "0111",
					"0000" when others;
	process(ENABLE,buffer_out) 
	begin
		if ENABLE = '1' then
			OUTPUT <= buffer_out;
		else
			OUTPUT <= "1111";
		end if;
	end process;
	
end mux_4x8;