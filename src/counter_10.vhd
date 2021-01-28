library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;


entity counter_10 is
	port(
		CLR : in STD_LOGIC;			            -- clear signal 
		CLK : in STD_LOGIC;			            -- clock 	   
		CE	: in STD_LOGIC;		
		OVER : out STD_LOGIC; 
		
		Q : out STD_LOGIC_VECTOR(3 downto 0)	-- outputs 
		);
end counter_10;


architecture counter_10 of counter_10 is
	
begin
	process (CLK)
		variable over_buff: STD_LOGIC := '0'; 
		variable Q_INT: STD_LOGIC_VECTOR(3 downto 0) := "0000";
	begin
		
		if CLR='1' then	 
			Q_INT := "0000";  
		else
			if CLK'event and CLK='1' and CE='1' then 
				if Q_INT < 9 then
					Q_INT := Q_INT+1; 
					
				else
					Q_INT := "0000";  
					
					over_buff := '1';
				end if;
			end if;	
		end if;
				
		if Q_INT = 5 then
			over_buff := '0';
	
		end if;	
		
		
		OVER <= over_buff; 
		
		Q <= Q_INT;	
		
		
	end process; 
	

	
	
	
end counter_10;

