
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Data_leds : out STD_LOGIC_VECTOR(3 downto 0);
          Anodes : out STD_LOGIC_VECTOR(3 downto 0);
          Cathodes : out STD_LOGIC_VECTOR(7 downto 0)
          );
end Top_Level;

architecture Behavioral of Top_Level is
    
    component Clk_div is
    generic ( period : natural := 1000 );
    port(
        CLk : in STD_LOGIC;
        RST : in STD_LOGIC;
        Clk_out : out STD_LOGIC
    ); 
    end component;
    
    component Shift_reg is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component Conv_bin is
    port ( Data_in : in STD_LOGIC;
           Data_out : out STD_LOGIC_VECTOR(3 downto 0)
           );
    end component;

    component ssd_driver is
    Port ( Rst : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Data: in STD_LOGIC_VECTOR (15 downto 0);
           Cathodes : out STD_LOGIC_VECTOR (7 downto 0);
           Anodes : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component segment7b is
    Port ( DataIn : in STD_LOGIC_VECTOR (3 downto 0);
           SegOut : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    
    signal Q_out_aux : STD_LOGIC_VECTOR(3 downto 0);
    signal CLK_1sec : STD_LOGIC :='0';
begin

    Data_leds <= Q_out_aux;
    
    clko : Clk_div
        generic map(1000)
        port map(
        CLK => CLK,
        RST => RST,
        Clk_out => CLK_1sec
    );

     Shifter : Shift_reg port map(
         CLK => CLK_1sec,
         RST => RST,
         S_in => S_in,
         Q_out => Q_out_aux 
         );
         
     Seg7_out :  segment7b port map(
        DataIn => Q_out_aux, 
        SegOut => Cathodes
     );
         
     Anodes <= not x"1"; -- Activates left most digit -- for 8 anodes not x"01" - 1111 1110 Left most anode 
      
end Behavioral;
