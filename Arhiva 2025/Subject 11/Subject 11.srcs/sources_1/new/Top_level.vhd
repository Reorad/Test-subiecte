
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_level is
    port (  CLK : in STD_LOGIC;
            RST : in STD_LOGIC;
            S_in : in STD_LOGIC;
            Q_leds_cnt_out : out STD_LOGIC_VECTOR(3 downto 0);
            Q_leds_reg_out : out STD_LOGIC_VECTOR(3 downto 0)
            );
end Top_level;

architecture Behavioral of Top_level is
    
    component Counter is
    port(
        En : in STD_LOGIC;
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Seq_count : out STD_LOGIC_VECTOR(3 downto 0)    
    );
    end component;
    
    component Shift_Register is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    component Detect_component is
    port( A : in STD_LOGIC_VECTOR(3 downto 0);
          En : out STD_LOGIC
          );
    end component;
    
    signal Q_reg_int : STD_LOGIC_VECTOR(3 downto 0);
    signal En_int : STD_LOGIC;
begin
    
    Shifter : Shift_Register port map(
        CLK => CLK,
        RST => RST,
        S_in => S_in,
        Q_out => Q_reg_int
    );
    
    Detect : Detect_component port map(
        A => Q_reg_int,
        En => En_int
    );
    
    Cnt : Counter port map(
        En => En_int,
        CLK => CLK,
        RST => RST,
        Seq_count => Q_leds_cnt_out
    );
    
    Q_leds_reg_out <= Q_reg_int;
    
end Behavioral;
