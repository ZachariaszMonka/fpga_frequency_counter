												 									 library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity UART is	 
	
	port(	
		input : in disp;
		trigger : in STD_LOGIC;
		clk : in STD_LOGIC;
		output : out STD_LOGIC
		);	   
end UART;



architecture UART of UART is 
signal DIVIDER: std_logic_vector(31 downto 0) := "00000000000000000000000000000000"; 	
constant divide_factor: integer := 10417;			

begin 	
		 
	
	process(clk)  
	variable tx_buff: std_logic_vector(0 to 99); 
	variable digit: std_logic_vector(3 downto 0); 
	begin	   
		if (clk'event and clk ='1')then	 
			if(trigger = '1') then
				for digit_index in 0 to 7 loop --prepare tx buffer
					digit := input(digit_index);
					tx_buff(0 + (digit_index * 10)) := '0'; --START
					tx_buff(1 + (digit_index * 10)) := '0'; --MSB 
					tx_buff(2 + (digit_index * 10)) := '0'; --ASCII zero
					tx_buff(3 + (digit_index * 10)) := '1';	--ASCII zero
					tx_buff(4 + (digit_index * 10)) := '1';	--ASCII zero
					tx_buff(5 + (digit_index * 10)) := digit(3);
					tx_buff(6 + (digit_index * 10)) := digit(2);
					tx_buff(7 + (digit_index * 10)) := digit(1);
					tx_buff(8 + (digit_index * 10)) := digit(0); --LSB
					tx_buff(9 + (digit_index * 10)) := '1'; --STOP								
				end loop; 
				tx_buff(80) := '0';	--START
				tx_buff(81 to 88) := "00001101"; --CR	
				tx_buff(89) := '1';	--STOP
				tx_buff(89) := '0'; --START
				tx_buff(91 to 98) := "00001010"; --LF
				tx_buff(89) := '1';	--STOP
				
			end if;
			
				
			if DIVIDER = (divide_factor-1) then
				DIVIDER <= (others => '0');	
				output <= tx_buff(0); --tx data 
				tx_buff := tx_buff(1 to 99) & '1';
			else
				DIVIDER <= DIVIDER + 1;
			end if;
		
		
			
			
			
				
				
			
		end if;
	end process;
		
	
	
end UART; 



