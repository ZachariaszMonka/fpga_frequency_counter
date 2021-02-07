library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity vga_V_counter is	 
	
	port(	
		clk  : in STD_LOGIC;
	    ce   : in STD_LOGIC;
		V 	 : out STD_LOGIC; 
		y 	 : out STD_LOGIC_VECTOR(9 downto 0);
		over : out STD_LOGIC
		);	   
end vga_V_counter;



architecture vga_V_counter of vga_V_counter is		 

constant Ts		: integer := 512;	
constant Tfp	: integer := 10;	
constant Tpw	: integer := 2;
constant Tbp	: integer := 29;
constant Tdisp	: integer := 480;

begin 
		
	process (clk) 
	variable DIVIDER: std_logic_vector(15 downto 0) := "0000000000000000"; 	
	variable y_buff: std_logic_vector(15 downto 0) := "0000000000000000"; 
	
	begin
		if clk'event and clk = '1' then	 
			if ce = '1' then
				if DIVIDER = (Ts-1) then
					DIVIDER := (others => '0');
				else
					DIVIDER := DIVIDER + 1;
				end if;	
				if DIVIDER >Tfp AND DIVIDER < Tfp+Tpw then
					V <= '0';
				else  
					V <= '1';
				end if;	
				if DIVIDER = 1 then --Tpw
				  	over <= '1';
				else  
					over <= '0';
				end if;
				if DIVIDER >Tfp+Tpw+Tbp AND DIVIDER < Ts then	--Tdisp
					y_buff := DIVIDER - (Tfp+Tpw+Tbp);	 
					y <= y_buff(9 downto 0); 
				else 					    
					y <= "0000000000";
				end if;
			end if;
		end if;
	end process;
	
	
end vga_V_counter; 

 