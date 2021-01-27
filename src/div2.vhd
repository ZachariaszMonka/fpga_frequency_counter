			   
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity div2 is
	port(
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		CLR : in STD_LOGIC;
		OUTf : out STD_LOGIC
		);	   
end div2;



architecture div2 of div2 is

signal OUTl : STD_LOGIC := '0';

begin 
	
	process (CLK, CLR)
	begin	 
		if 	CLR = '1' then
			OUTl <= '0';
		elsif CLK'event and CLK='1'  then  
			if CE = '1' then
		   		if OUTl	= '1' then
					OUTl <= '0';
				else   
					OUTl <= '1';
				end if;			 
			end if;
		end if;
	end process; 
	
	OUTf <= OUTl;
	
end div2;




