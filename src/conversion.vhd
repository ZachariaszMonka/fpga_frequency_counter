library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.my_type.all;
library freq_counter;

entity conversion is
  port(
       clk : in STD_LOGIC;
       latch : in STD_LOGIC;
       Input : in disp;
       output : out disp
  );
end conversion;

architecture conversion of conversion is

component dominant
  port (
       clk : in STD_LOGIC;
       input : in disp;
       latch : in STD_LOGIC;
       output : out disp
  );
end component;
component mean
  port (
       clk : in STD_LOGIC;
       input : in disp;
       latch : in STD_LOGIC;
       output : out disp
  );
end component;
component shift
  port (
       input : in disp;
       output : out disp
  );
end component;

signal clock : STD_LOGIC;
signal buff1 : disp;
signal buff2 : disp;

begin

U1 : shift
  port map(
       input => input,
       output => buff1
  );

U2 : mean
  port map(
       clk => clock,
       input => buff1,
       latch => latch,
       output => buff2
  );

U3 : dominant
  port map(
       clk => clock,
       input => buff2,
       latch => latch,
       output => output
  );


	clock <= clk;

end conversion;
