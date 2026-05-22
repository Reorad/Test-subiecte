
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
    port( RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Leds_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Top_Level;
    
    
    
architecture Behavioral of Top_Level is

    component ROM is
    port( Add_port : in STD_LOGIC_VECTOR(3 downto 0);
          Rom_data_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    component CLK_Divider is
    generic( Period : natural := 2000 );
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Clk_slow : out STD_LOGIC
          );
    end component;
    
    component bit4counter is
    port( RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal Q_count : STD_LOGIC_VECTOR(3 downto 0);
    signal Clk_1mhz : STD_LOGIC;
begin
    ROM_comp : ROM port map(
        Add_port => Q_count,
        Rom_data_out => Leds_out 
    );
    
    Clk_div : CLK_Divider generic map (1000) port map (
            CLK => CLK,
            RST => RST,
            Clk_slow => Clk_1mhz 
        );
        
    Counter : bit4counter port map(
        RST => RST,
        CLK => Clk_1mhz ,
        Q_out => Q_count
    );
    
    
end Behavioral;
