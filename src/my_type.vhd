library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

   
package my_type is
	Type disp is ARRAY (7 downto 0) of STD_logic_vector(3 downto 0);	  
	Type disp_4_type is ARRAY (3 downto 0) of disp;	
	Type disp_8_type is ARRAY (7 downto 0) of disp;	
end my_type;  

