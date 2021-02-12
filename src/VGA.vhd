library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.my_type.all;


entity VGA is
    port(
        input      : in disp;
		CLK100MHZ  : in STD_LOGIC;
		VGA_HS 	   : out STD_LOGIC; 
		VGA_VS     : out STD_LOGIC;
		VGA_R      : out STD_LOGIC_VECTOR(3 downto 0);
        VGA_G      : out STD_LOGIC_VECTOR(3 downto 0);
        VGA_B      : out STD_LOGIC_VECTOR(3 downto 0)
    ); 
end VGA;

architecture VGA of VGA is
    
    component vga_H_counter
    port (
        clk : in STD_LOGIC;
        H : out STD_LOGIC;
        over : out STD_LOGIC;
        x : out STD_LOGIC_VECTOR(9 downto 0)
    );
    end component;
    
    component vga_V_counter
    port (
        ce : in STD_LOGIC;
        clk : in STD_LOGIC;
        V : out STD_LOGIC;
        over : out STD_LOGIC;
        y : out STD_LOGIC_VECTOR(9 downto 0)
    );
    end component;
    
    component vga_text
    port (
        clk : in STD_LOGIC;
        data : in text_line_type;
        x : in STD_LOGIC_VECTOR(9 downto 0);
        y : in STD_LOGIC_VECTOR(9 downto 0);
        B : out STD_LOGIC_VECTOR(3 downto 0);
        G : out STD_LOGIC_VECTOR(3 downto 0);
        R : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    component BCD_to_text
    port(	
        Input : in disp;
        Output : out text_line_type
    );  
    end component;
    
    component zero_delete
    port(    
        clk :  in STD_LOGIC;
        input : in disp;
        output : out disp
    );  
    end component;
   

    signal over : STD_LOGIC;
    signal x : STD_LOGIC_VECTOR(9 downto 0);
    signal y : STD_LOGIC_VECTOR(9 downto 0);
    signal buff_in : disp;
    signal buff_out : text_line_type;

begin

  U1 : vga_H_counter
  port map(
       H => VGA_HS,
       clk => CLK100MHZ,
       over => over,
       x => x
  );
  
   U2 : vga_V_counter
   port map(
        V => VGA_VS,
        clk => CLK100MHZ,
        ce => over,
        y => y
   );
   
    U3 : vga_text
    port map(
        clk => CLK100MHZ,
        data => buff_out,
        x => x,
        y => y,
        R => VGA_R,
        G => VGA_G,
        B => VGA_B
    );
    
    U4 : BCD_to_text
    port map(
        Input => buff_in,
        Output => buff_out
    );
    
    U5 : zero_delete
    port map(
        clk => CLK100MHZ,
        Input => input,
        Output => buff_in
    );
            
            

end VGA;
