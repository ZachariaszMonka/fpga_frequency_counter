library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity vga_text is	 
	
	port(	
		clk  : in STD_LOGIC;
		data : in text_screen_type;
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
	begin
		if clk'event and clk = '1' then	   
			if x = 0 or y = 0 then
				R <= "0000";
				G <= "0000";
				B <= "0000";
			else
				if (x > 1 and x < 100) and (y > 1 and y < 100) then
					R <= "1111";
					G <= "0000";
					B <= "0000";  
				elsif(x > 1 and x < 100) and (y > 380 and y < 480) then 
					R <= "0000";
					G <= "1111";
					B <= "0000"; 
				elsif(x > 540 and x < 640) and (y > 1 and y < 100) then 
					R <= "0000";
					G <= "0000";
					B <= "1111";
				elsif(x > 540 and x < 640) and (y > 380 and y < 480) then 
					R <= "1111";
					G <= "1111";
					B <= "1111";
				else
					R <= "0000";
					G <= "0000";
					B <= "0000";
				end if;	 
			end if;
		end if;
	end process;
	
end vga_text; 

 