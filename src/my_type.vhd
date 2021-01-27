library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

   
package my_type is
	Type disp is ARRAY (7 downto 0) of STD_logic_vector(3 downto 0);	  
end my_type;