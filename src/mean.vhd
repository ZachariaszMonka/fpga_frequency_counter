library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use work.my_type.all; 
library freq_counter;



entity mean is	 
	
	port(
		clk : in STD_LOGIC;	
		latch : in STD_LOGIC;
		input : in disp;
		output : out disp
		);	   
end mean;



architecture mean of mean is 

	component add_BDC
	port (
		clk : in STD_LOGIC;
		inputA : in disp;
		inputB : in disp;
		output : out disp
	);
	end component;

	component D_flipflop
	port (
		D : in disp;
		clk : in STD_LOGIC;
		output : out disp
	);
	end component;
	
	
	signal buff_data : disp_4_type;	 
	signal add_01 : disp;
	signal add_23 : disp;
	
begin 
	
	process (clk)
		variable Q_INT: STD_LOGIC_VECTOR(1 downto 0) := "00";
	begin
		if clk'event and clk='1' and latch ='1' then 
					Q_INT := Q_INT + 1; 
		end if;
		
		case Q_INT is 
			when "00" => buff_data(0) <= input;			
			when "01" => buff_data(1) <= input;
			when "10" => buff_data(2) <= input;
			when others  => buff_data(3) <= input;	
		end case;
		
			
	end process;
	
	U1 : add_BDC
	port map(
	   clk => clk,
	   inputA => buff_data(0),
	   inputB => buff_data(1),
	   output => add_01
	); 
	
	U2 : add_BDC
	port map(
		clk => clk,
		inputA => buff_data(2),
		inputB => buff_data(3),
		output => add_23
	);	
	
	U3 : add_BDC
	port map(
	   clk => clk,
	   inputA => add_01,
	   inputB => add_23,
	   output => output
	);
	
	
	
	
end mean; 


