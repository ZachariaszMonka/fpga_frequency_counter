library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;


entity parallel_to_serial is
	port(
		CLR : in STD_LOGIC;			           
		CLK : in STD_LOGIC;			             	   
		CE	: in STD_LOGIC;		
		data_out : out STD_LOGIC;  
		data_in  : in  STD_LOGIC_VECTOR(7 downto 0)	 
		);
end parallel_to_serial;


architecture parallel_to_serial of parallel_to_serial is
	signal parity: STD_LOGIC;
	
begin
	process (CLK,CLR)
		variable Q_INT: STD_LOGIC_VECTOR(3 downto 0) := "0000";	
	 	
	begin
		
		if CLR='1' then	 
			Q_INT := "0000";  
		else
			if CLK'event and CLK='1' and CE='1' then 
				Q_INT := Q_INT+1; 
			end if;	
		end if;
		
	end process; 
	parity <= data_in(1) xor data_in(0); --TODO
	
   with Q_INT select
   data_out <=
   				'0' when "0000",--start bit
		data_in(0)	when "0001", 
		data_in(1)	when "0010",
		data_in(2)	when "0011",
		data_in(3)	when "0100",
		data_in(4)	when "0101",
		data_in(5)	when "0110",
		data_in(6)	when "0111",	
		data_in(7)	when "1000",
		parity		when "1001",
		'0' 		when "1010",--stop bit
		'1' 		when others;		--idle

end parallel_to_serial;

