library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;
use work.my_type.all;
library freq_counter;


entity TOP is	 
	
	port(
	   CLK100MHZ : in STD_LOGIC;
       input : in STD_LOGIC;
       UART_TX : out STD_LOGIC;
       VGA_HS : out STD_LOGIC;
       VGA_VS : out STD_LOGIC;
       AN : out STD_LOGIC_VECTOR(7 downto 0);
       SEG : out STD_LOGIC_VECTOR(6 downto 0);
       VGA_B : out STD_LOGIC_VECTOR(3 downto 0);
       VGA_G : out STD_LOGIC_VECTOR(3 downto 0);
       VGA_R : out STD_LOGIC_VECTOR(3 downto 0)		
	);	   
end TOP;



architecture TOP of TOP is 
        
        component automat
        port (
            CE : in STD_LOGIC;
            CLK : in STD_LOGIC;
            CLR : in STD_LOGIC;
            CLR_OUT : out STD_LOGIC;
            EN_OUT : out STD_LOGIC;
            LATCH_OUT : out STD_LOGIC
        );
        end component;
        
        component conversion
        port (
            Input : in disp;
            clk : in STD_LOGIC;
            latch : in STD_LOGIC;
            output : out disp
        );
        end component;
        
        
        
        component counter8xbcd
        port (
            CE : in STD_LOGIC;
            CLR : in STD_LOGIC;
            input : in STD_LOGIC;
            output : out disp
        );
        end component;
        
        component display
        port (
            CLK100MHZ : in STD_LOGIC;
            Input : in disp;
            AN : out STD_LOGIC_VECTOR(7 downto 0);
            SEG : out STD_LOGIC_VECTOR(6 downto 0)
        );
        end component;
        
        component D_flipflop
        port (
            D : in disp;
            clk : in STD_LOGIC;
            output : out disp
        );
        end component;
        
        component UART
        port (
            clk : in STD_LOGIC;
            input : in disp;
            trigger : in STD_LOGIC;
            output : out STD_LOGIC
        );
        end component;
        
        component VGA
        port (
            input      : in disp;
            CLK100MHZ  : in STD_LOGIC;
            VGA_HS     : out STD_LOGIC; 
            VGA_VS     : out STD_LOGIC;
            VGA_R      : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_G      : out STD_LOGIC_VECTOR(3 downto 0);
            VGA_B      : out STD_LOGIC_VECTOR(3 downto 0)
        );
        end component;
    
    constant VCC_CONSTANT   : STD_LOGIC := '1';
    constant GND_CONSTANT   : STD_LOGIC := '0'; 
    signal VCC : STD_LOGIC;
    signal GND : STD_LOGIC;
      
    signal before_latch : disp;
    signal after_latch : disp;
    signal output_data : disp;
    signal trigger_latch : STD_LOGIC;
    signal trigger_clear : STD_LOGIC;
    signal EN_out : STD_LOGIC;


begin 
	
	GND <= GND_CONSTANT;
    VCC <= VCC_CONSTANT;
	
    U1 : automat
    port map(
        CE => VCC,
        CLK => CLK100MHZ,
        CLR => GND,
        CLR_OUT => trigger_clear,
        EN_OUT => EN_out,
        LATCH_OUT => trigger_latch
    );
	
    U2 : counter8xbcd
    port map(
        CE => EN_out,
        CLR => trigger_clear,
        input => input,
        output => before_latch
    );

    U3 : D_flipflop
    port map(
        D => before_latch,
        clk => trigger_latch,
        output => after_latch
    );

    U4 : conversion
    port map(
        Input => after_latch,
        clk => CLK100MHZ,
        latch => trigger_latch,
        output => output_data
    );
	
    U5 : display
    port map(
       AN => AN,
       CLK100MHZ => CLK100MHZ,
       Input => output_data,
       SEG => SEG
    );
 
    U6 : UART
    port map(
        clk => CLK100MHZ,
        input => output_data,
        output => UART_TX,
        trigger => trigger_latch
    );
	
    U7 : VGA
    port map(
        CLK100MHZ => CLK100MHZ,
        input => output_data,
        VGA_HS => VGA_HS,
        VGA_VS => VGA_VS,
        VGA_R => VGA_R,
        VGA_G => VGA_G,
        VGA_B => VGA_B
    );

	
end TOP; 

