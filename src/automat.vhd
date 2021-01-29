
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity automat is
	port(
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		CLR : in STD_LOGIC;
		CLR_OUT : out STD_LOGIC;
		LATCH_OUT : out STD_LOGIC;
		EN_OUT : out STD_LOGIC
		);	   
end automat;



architecture automat of automat is

signal DIVIDER: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; 	

constant divide_factor: integer := 2500002;		
												
	  	
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

LATCH_OUT <= '1' when DIVIDER = (divide_factor-1) and CE = '1' else '0';
CLR_OUT <= '1' when DIVIDER = 0 and CE = '1' else '0';
EN_OUT <= '1' when not(DIVIDER = 0 or DIVIDER =(divide_factor-1)) and CE = '1' else '0';
	
	
end automat;




