		   			   
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity automat4v2 is
	port(
		CLK : in STD_LOGIC;
		CE : in STD_LOGIC;
		CLR : in STD_LOGIC;
		OUT1 : out STD_LOGIC;
		OUT2 : out STD_LOGIC;
		OUT3 : out STD_LOGIC
		);	   
end automat4v2;



architecture automat4v2 of automat4v2 is

signal buf : STD_LOGIC_vector(1 downto 0) := "00"; 
signal out_buf : STD_LOGIC_vector(2 downto 0) := "000";

begin 
	
	process (CLK, CLR)
	begin	 
		if 	CLR = '1' then
			buf <= "00";
		elsif CLK'event and CLK='1' then	
			if CE = '1' then
		   		if buf	= "11" then
					buf <= "00";
				else   
					buf <= buf + 1;
				end if;	  
			end if;
		end if;
		
		if buf = "00" then 
			out_buf(0) <= '1';
			out_buf(1) <= '0';
			out_buf(2) <= '0';
		elsif buf = "01" then 
			out_buf(0) <= '0';
			out_buf(1) <= '1';
			out_buf(2) <= '0';
		elsif buf = "10" then 
			out_buf(0) <= '0';
			out_buf(1) <= '0';
			out_buf(2) <= '1';
		else 
			out_buf(0) <= '0';
			out_buf(1) <= '0';
			out_buf(2) <= '0';
		end if;
		
		
	end process; 
	
	OUT1 <= out_buf(0);  
	OUT2 <= out_buf(1); 
	OUT3 <= out_buf(2);
	
	
end automat4v2;




