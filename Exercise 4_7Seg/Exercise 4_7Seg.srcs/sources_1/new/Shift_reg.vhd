
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift_reg is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Shift_reg;

architecture Behavioral of Shift_reg is
    
    component D_FF is
    port( CLK : in STD_LOGIC;
          D : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC );
    end component;
    
    signal Q_aux : STD_LOGIC_VECTOR(3 downto 0) := (others => '0') ;
    
begin
    
    D1 : D_FF port map(
            CLK => CLK,
            RST => RST,
            D => S_in ,
            Q_out => Q_aux(0)
            );
    D2 : D_FF port map(
            CLK => CLK,
            RST => RST,
            D => Q_aux(0) ,
            Q_out => Q_aux(1)
            );
     D3 : D_FF port map(
            CLK => CLK,
            RST => RST,
            D => Q_aux(1) ,
            Q_out => Q_aux(2)
            );
     D4 : D_FF port map(
            CLK => CLK,
            RST => RST,
            D => Q_aux(2) ,
            Q_out => Q_aux(3)
            );
      Q_out <= Q_aux;
end Behavioral;
