
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Counter_Reg is
    port( CLK : in STD_LOGIC;
          Rst : in STD_LOGIC;
          Load : in STD_LOGIC;
          Q_leds_counter : out STD_LOGIC_VECTOR(3 downto 0);
          Q_leds_Register : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Counter_Reg;

architecture Behavioral of Counter_Reg is

    component Registere is
    port(
        Load : in STD_LOGIC;
        CLK : in STD_LOGIC;
        Q_in : in STD_LOGIC_VECTOR(3 downto 0);
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component Counter_4bit is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    signal Q_int : STD_LOGIC_VECTOR(3 downto 0);
    signal Load_latch : STD_LOGIC := '0';
begin
    
    
    Counter : Counter_4bit port map(
        CLK => CLK,
        RST => RST,
        Q_out => Q_int
    );
    
    Q_leds_counter <= Q_int;
    
    Reg_out : Registere port map(
        Load => Load,
        CLK => CLK,
        RST => RST,
        Q_in => Q_int,
        Q_out => Q_leds_Register
    );

end Behavioral;
