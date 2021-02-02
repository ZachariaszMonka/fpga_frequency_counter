library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.numeric_std.ALL;
use work.my_type.all; 	
library freq_counter;



entity dominant is	 
	
	port(
		clk : in STD_LOGIC;	
		latch : in STD_LOGIC;
		input : in disp;
		output : out disp
		);	   
end dominant;



architecture dominant of dominant is 

	
	component D_flipflop
	port (
		D : in disp;
		clk : in STD_LOGIC;
		output : out disp
	);
	end component;
	
	
	signal buff_data : disp_8_type;	 

begin 
	
	process (clk)
		variable index: STD_LOGIC_VECTOR(2 downto 0) := "000"; --8 elements	
		variable index_intiger: integer := 0; 
		
		type int_array is array(7 downto 0)of integer;
		variable quantity: int_array; 
		
		variable max_val: integer := 0;	 
		--variable output_v: disp;
	begin
		
		if clk'event and clk='1' and latch ='1' then 
			--load data
			index := index + 1; 
			index_intiger := to_integer(unsigned(index));
			buff_data(index_intiger) <= input;
			
			--counting the quantity
			for index_A in 0 to 7 loop 
				quantity(index_A) := 0;
				for index_B in 0 to 7 loop 	
				 	if buff_data(index_A) = buff_data(index_B) then 
						quantity(index_A) := quantity(index_A) + 1; 
					end if;
				end loop;	
			end loop;
			--check max	valiu  
			max_val := 0;
			for index_C in 0 to 7 loop 
				if quantity(index_C) >= max_val then
					max_val := quantity(index_C); 
					output <= buff_data(index_C);
				end if;
			end loop;
		end if;	  
	
	end process;
	

	
end dominant; 


