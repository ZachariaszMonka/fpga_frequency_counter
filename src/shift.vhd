library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;

entity shift is	 
	
	port(	
		input : in disp;
		output : out disp
		);	   
end shift;



architecture shift of shift is
begin 
	output(0)<="0000";
	output(1)<=input(0);
	output(2)<=input(1);
	output(3)<=input(2);
	output(4)<=input(3);
	output(5)<=input(4);
	output(6)<=input(5);
	output(7)<=input(6); 	
	
	
end shift; 



