library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.my_type.all;
library freq_counter;

entity display is
  port(
       CLK100MHZ : in STD_LOGIC;
       Input : in disp;
       AN : out STD_LOGIC_VECTOR(7 downto 0);
       SEG : out STD_LOGIC_VECTOR(6 downto 0)
  );
end display;

architecture display of display is

component counter_10
  port (
       CE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       OVER : out STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component dec_to_7seg
  port (
       DEC : in STD_LOGIC_VECTOR(3 downto 0);
       SEG : out STD_LOGIC_VECTOR(6 downto 0)
  );
end component;
component dec_to_onehot
  port (
       DEC : in STD_LOGIC_VECTOR(3 downto 0);
       ONEHOT : out STD_LOGIC_VECTOR(7 downto 0);
       nONEHOT : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component disp_type_decoder
  port (
       input : in disp;
       outp0 : out STD_LOGIC_VECTOR(3 downto 0);
       outp1 : out STD_LOGIC_VECTOR(3 downto 0);
       outp2 : out STD_LOGIC_VECTOR(3 downto 0);
       outp3 : out STD_LOGIC_VECTOR(3 downto 0);
       outp4 : out STD_LOGIC_VECTOR(3 downto 0);
       outp5 : out STD_LOGIC_VECTOR(3 downto 0);
       outp6 : out STD_LOGIC_VECTOR(3 downto 0);
       outp7 : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component mux_4x8
  port (
       ENABLE : in STD_LOGIC;
       IN0 : in STD_LOGIC_VECTOR(3 downto 0);
       IN1 : in STD_LOGIC_VECTOR(3 downto 0);
       IN2 : in STD_LOGIC_VECTOR(3 downto 0);
       IN3 : in STD_LOGIC_VECTOR(3 downto 0);
       IN4 : in STD_LOGIC_VECTOR(3 downto 0);
       IN5 : in STD_LOGIC_VECTOR(3 downto 0);
       IN6 : in STD_LOGIC_VECTOR(3 downto 0);
       IN7 : in STD_LOGIC_VECTOR(3 downto 0);
       SEL : in STD_LOGIC_VECTOR(3 downto 0);
       OUTPUT : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component Prescaler_CH2
  port (
       CE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       CEO : out STD_LOGIC
  );
end component;
component zero_delete
  port (
       clk : in STD_LOGIC;
       input : in disp;
       output : out disp
  );
end component;


constant VCC_CONSTANT   : STD_LOGIC := '1';
constant GND_CONSTANT   : STD_LOGIC := '0';



signal GND : STD_LOGIC;
signal over : STD_LOGIC;
signal CE : STD_LOGIC;
signal VCC : STD_LOGIC;
signal without_zero : disp; 
signal seg_dec : STD_LOGIC_VECTOR(3 downto 0);
signal sel : STD_LOGIC_VECTOR(3 downto 0);
signal nc : STD_LOGIC_VECTOR(7 downto 0);
signal IN0 : STD_LOGIC_VECTOR(3 downto 0);
signal IN1 : STD_LOGIC_VECTOR(3 downto 0);
signal IN2 : STD_LOGIC_VECTOR(3 downto 0);
signal IN3 : STD_LOGIC_VECTOR(3 downto 0);
signal IN4 : STD_LOGIC_VECTOR(3 downto 0);
signal IN5 : STD_LOGIC_VECTOR(3 downto 0);
signal IN6 : STD_LOGIC_VECTOR(3 downto 0);
signal IN7 : STD_LOGIC_VECTOR(3 downto 0);

begin

U1 : dec_to_7seg
  port map(
       DEC => seg_dec,
       SEG => SEG
  );

U2 : counter_10
  port map(
       CE => CE,
       CLK => CLK100MHZ,
       CLR => GND,
       OVER => over,
       Q => sel
  );

U3 : dec_to_onehot
  port map(
       DEC => sel,
       ONEHOT => nc,
       nONEHOT => AN
  );

U4 : Prescaler_CH2
  port map(
       CE => VCC,
       CEO => CE,
       CLK => CLK100MHZ,
       CLR => GND
  );

U5 : mux_4x8
  port map(
       ENABLE => VCC,
       IN0 => IN0,
       IN1 => IN1,
       IN2 => IN2,
       IN3 => IN3,
       IN4 => IN4,
       IN5 => IN5,
       IN6 => IN6,
       IN7 => IN7,
       OUTPUT => seg_dec,
       SEL => sel
  );

U6 : zero_delete
  port map(
       clk => CLK100MHZ,
       input => Input,
       output => without_zero
  );

U7 : disp_type_decoder
  port map(
       input => without_zero,
       outp0 => IN0,
       outp1 => IN1,
       outp2 => IN2,
       outp3 => IN3,
       outp4 => IN4,
       outp5 => IN5,
       outp6 => IN6,
       outp7 => IN7
  );


GND <= GND_CONSTANT;
VCC <= VCC_CONSTANT;

end display;
