
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Level_CNT_ROM is
    port( CLK : in STD_LOGIC;
          Up : in STD_LOGIC;
          Down : in STD_LOGIC;
          RST : in STD_LOGIC;
          Data_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
end Top_Level_CNT_ROM;

architecture Behavioral of Top_Level_CNT_ROM is
    
    component bit2_up_dwn_counter is
    port( CLK : in STD_LOGIC;
          Up : in STD_LOGIC;
          Down : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(1 downto 0)
          );
    end component;
    
    component ROM is
    port (Add : in STD_LOGIC_VECTOR(1 downto 0);
          Mem_out : out STD_LOGIC_VECTOR(15 downto 0)
          );
    end component;

    
    signal Int_cnt : STD_LOGIC_VECTOR(1 downto 0);
    
begin
    
    count : bit2_up_dwn_counter port map(
        CLK => CLK,
        Up => Up,
        Down => Down,
        RST => RST,
        Q_out => Int_cnt
    );
    
    Rom_a : ROM port map( 
         Add => Int_cnt,
         Mem_out => Data_out 
         );

end Behavioral;
