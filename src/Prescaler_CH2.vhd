
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity Prescaler_CH2 is
	port(
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		CLR : in STD_LOGIC;
		CEO : out STD_LOGIC
		);	   
end Prescaler_CH2;



architecture Prescaler_CH2 of Prescaler_CH2 is

signal DIVIDER: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; 	

constant divide_factor: integer := 10000;			
												

begin 
	process (CLK, CLR)
	begin
		if CLR = '1' then
			DIVIDER <= (others => '0');
		elsif CLK'event and CLK = '1' then
			if CE = '1' then
				if DIVIDER = (divide_factor-1) then
					DIVIDER <= (others => '0');
				else
					DIVIDER <= DIVIDER + 1;
				end if;
			end if;
		end if;
	end process;

CEO <= '1' when DIVIDER = (divide_factor-1) and CE = '1' else '0';
	
end Prescaler_CH2;




