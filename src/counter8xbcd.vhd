library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.my_type.all;
library freq_counter;

entity counter8xbcd is
  port(
       CE : in STD_LOGIC;
       CLR : in STD_LOGIC;
       input : in STD_LOGIC;
       output : out disp
  );
end counter8xbcd;

architecture counter8xbcd of counter8xbcd is


component counter_10
  port (
       CE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       OVER : out STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component disp_type_coder
  port (
       inp0 : in STD_LOGIC_VECTOR(3 downto 0);
       inp1 : in STD_LOGIC_VECTOR(3 downto 0);
       inp2 : in STD_LOGIC_VECTOR(3 downto 0);
       inp3 : in STD_LOGIC_VECTOR(3 downto 0);
       inp4 : in STD_LOGIC_VECTOR(3 downto 0);
       inp5 : in STD_LOGIC_VECTOR(3 downto 0);
       inp6 : in STD_LOGIC_VECTOR(3 downto 0);
       inp7 : in STD_LOGIC_VECTOR(3 downto 0);
       output : out disp
  );
end component;

signal CE_counter : STD_LOGIC;
signal NET471 : STD_LOGIC;
signal NET496 : STD_LOGIC;
signal NET521 : STD_LOGIC;
signal NET546 : STD_LOGIC;
signal NET571 : STD_LOGIC;
signal NET66 : STD_LOGIC;
signal NET80 : STD_LOGIC;
signal NET90 : STD_LOGIC;
signal BUS152 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS154 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS663 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS671 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS679 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS687 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS695 : STD_LOGIC_VECTOR(3 downto 0);
signal BUS703 : STD_LOGIC_VECTOR(3 downto 0);

begin

U1 : counter_10
  port map(
       CE => CE_counter,
       CLK => input,
       CLR => CLR,
       OVER => NET66,
       Q => BUS152
  );

U10 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET471,
       CLR => CLR,
       OVER => NET496,
       Q => BUS679
  );

U11 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET496,
       CLR => CLR,
       OVER => NET521,
       Q => BUS687
  );

U12 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET521,
       CLR => CLR,
       OVER => NET546,
       Q => BUS695
  );

U13 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET546,
       CLR => CLR,
       OVER => NET571,
       Q => BUS703
  );

U2 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET66,
       CLR => CLR,
       OVER => NET80,
       Q => BUS154
  );

U3 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET80,
       CLR => CLR,
       OVER => NET90,
       Q => BUS663
  );

U6 : disp_type_coder
  port map(
       inp0 => BUS152,
       inp1 => BUS154,
       inp2 => BUS663,
       inp3 => BUS671,
       inp4 => BUS679,
       inp5 => BUS687,
       inp6 => BUS695,
       inp7 => BUS703,
       output => output
  );

U9 : counter_10
  port map(
       CE => CE_counter,
       CLK => NET90,
       CLR => CLR,
       OVER => NET471,
       Q => BUS671
  );



	CE_counter <= CE;


end counter8xbcd;
