
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit12_register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Load_val : in STD_LOGIC_VECTOR(11 downto 0);
          Q_out : out STD_LOGIC_VECTOR(11 downto 0)
          );
end bit12_register;

architecture Behavioral of bit12_register is
    
    component bit4_register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Load_val : in STD_LOGIC_VECTOR(3 downto 0);
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal Q_int_out_reg1 : STD_LOGIC_VECTOR(3 downto 0);
    signal Q_int_out_reg2 : STD_LOGIC_VECTOR(3 downto 0);
    signal Q_int_out_reg3 : STD_LOGIC_VECTOR(3 downto 0);

    
begin
    
    Reg1 : bit4_register port map(
        CLK => CLK,
        RST => RST,
        Load => Load,
        S_in => S_in,
        Load_val => Load_val(3 downto 0),
        Q_out => Q_int_out_reg1
    );
    
    Reg2 : bit4_register port map(
        CLK => CLK,
        RST => RST,
        Load => Load,
        S_in => Q_int_out_reg1(3),
        Load_val => Load_val(7 downto 4),
        Q_out => Q_int_out_reg2
    );
    
    Reg3 : bit4_register port map(
        CLK => CLK,
        RST => RST,
        Load => Load,
        S_in => Q_int_out_reg2(3),
        Load_val => Load_val(11 downto 8),
        Q_out => Q_int_out_reg3
    );
    
    Q_out <= Q_int_out_reg3 & Q_int_out_reg2 & Q_int_out_reg1;

end Behavioral;
