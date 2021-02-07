library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity vga_H_counter is	 
	
	port(	
		clk  : in STD_LOGIC;	 
		H 	 : out STD_LOGIC; 
		x 	 : out STD_LOGIC_VECTOR(9 downto 0);
		over : out STD_LOGIC
		);	   
end vga_H_counter;



architecture vga_H_counter of vga_H_counter is		 

constant Ts		: integer := 800*4;	
constant Tfp	: integer := 16*4;	
constant Tpw	: integer := 96*4;
constant Tbp	: integer := 48*4;
constant Tdisp	: integer := 640*4;

begin 
		
	process (clk) 
	variable DIVIDER: std_logic_vector(15 downto 0) := "0000000000000000"; 	
	variable x_buff: std_logic_vector(15 downto 0) := "0000000000000000"; 
	
	begin
		if clk'event and clk = '1' then
			if DIVIDER = (Ts-1) then
				DIVIDER := (others => '0');
			else
				DIVIDER := DIVIDER + 1;
			end if;	
			if DIVIDER >Tfp AND DIVIDER < Tfp+Tpw then
				H <= '0';
			else  
				H <= '1';
			end if;	
			if DIVIDER = 1 then --Tpw
			  	over <= '1';
			else  
				over <= '0';
			end if;
			if DIVIDER >Tfp+Tpw+Tbp AND DIVIDER < Ts then	--Tdisp
				x_buff := DIVIDER - (Tfp+Tpw+Tbp);	 
				x <= x_buff(11 downto 2);  
			else 
				x <= "0000000000";
			end if;
			
		end if;
	end process;
	



	
end vga_H_counter; 



