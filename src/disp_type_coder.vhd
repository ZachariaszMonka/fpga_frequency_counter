							   library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity disp_type_coder is	 
	
	port(	
		inp0 : in STD_Logic_vector(3 downto 0);	 
		inp1 : in STD_Logic_vector(3 downto 0);
		inp2 : in STD_Logic_vector(3 downto 0);
		inp3 : in STD_Logic_vector(3 downto 0);
		inp4 : in STD_Logic_vector(3 downto 0);
		inp5 : in STD_Logic_vector(3 downto 0);
		inp6 : in STD_Logic_vector(3 downto 0);
		inp7 : in STD_Logic_vector(3 downto 0);
		output : out disp
		);	   
end disp_type_coder;



architecture disp_type_coder of disp_type_coder is
begin 
	 
	output(7) <= inp7;
	output(6) <= inp6;
	output(5) <= inp5;
	output(4) <= inp4;
	output(3) <= inp3;
	output(2) <= inp2;
	output(1) <= inp1;
	output(0) <= inp0;
	
end disp_type_coder; 



