							   library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity disp_type_decoder is	 
	
	port(	
		outp0 : out STD_Logic_vector(3 downto 0);	 
		outp1 : out STD_Logic_vector(3 downto 0);
		outp2 : out STD_Logic_vector(3 downto 0);
		outp3 : out STD_Logic_vector(3 downto 0);
		outp4 : out STD_Logic_vector(3 downto 0);
		outp5 : out STD_Logic_vector(3 downto 0);
		outp6 : out STD_Logic_vector(3 downto 0);
		outp7 : out STD_Logic_vector(3 downto 0);
		input : in disp
		);	   
end disp_type_decoder;



architecture disp_type_decoder of disp_type_decoder is
begin 

	outp7 <= input(7);	 
	outp6 <= input(6);
	outp5 <= input(5);
	outp4 <= input(4);
	outp3 <= input(3);
	outp2 <= input(2);
	outp1 <= input(1);
	outp0 <= input(0);
	
	
end disp_type_decoder; 



