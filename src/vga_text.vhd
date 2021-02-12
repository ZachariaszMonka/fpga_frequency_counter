library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;
use IEEE.numeric_std.ALL;
use work.my_type.all;
use work.my_font.all;
library freq_counter;

entity vga_text is	 
	
	port(	
		clk  : in STD_LOGIC;
		data : in text_line_type;
		x 	 : in STD_LOGIC_VECTOR(9 downto 0);
		y 	 : in STD_LOGIC_VECTOR(9 downto 0);
		R 	 : out STD_LOGIC_VECTOR(3 downto 0);
		G 	 : out STD_LOGIC_VECTOR(3 downto 0);
		B 	 : out STD_LOGIC_VECTOR(3 downto 0)
		);	   
end vga_text;


architecture vga_text of vga_text is		 


begin 
		
	process (clk) 
	variable sign: integer := 0;	 
	variable sign_in_text: integer := 0;
	variable blok_in_sign_X: integer := 0; 
	variable blok_in_sign_Y: integer := 0;	 

	
	begin		
		
		if clk'event and clk = '1' then	   
			if x = 0 or y = 0 then
				R <= "0000";
				G <= "0000";
				B <= "0000";
			else   
				if y(9 downto 6) = "0000" then -- first text line
					--	which sign 
					sign_in_text := to_integer(unsigned(x(9 downto 6))); 
					sign := to_integer(unsigned(data(sign_in_text))); --TODO this and BCD to TEXT 
                    
				
					--  which group pixel in sign
					blok_in_sign_X := to_integer(unsigned(x(5 downto 2)));
					blok_in_sign_Y := to_integer(unsigned(y(5 downto 2)));
					
					
					--  compare with table
					if font_table(sign)(blok_in_sign_Y)(blok_in_sign_X) = '1' then
						R <= "0000";
						G <= "1111";
						B <= "0000";
					else
						R <= "0000";
						G <= "0000";
						B <= "0000";
					end if;
			
					
				end if;
			end if;
		end if;
	end process;
	
end vga_text;