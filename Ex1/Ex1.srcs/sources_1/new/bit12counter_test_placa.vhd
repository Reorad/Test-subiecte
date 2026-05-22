
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bit12counter_test_placa is
    port( 
          Load_value : in STD_LOGIC_VECTOR(11 downto 0);
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Dir_sw : in STD_LOGIC;
          En_count : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Bout : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(11 downto 0)
          );
    
end bit12counter_test_placa;

architecture Behavioral of bit12counter_test_placa is
    
    component bit12_counter is
    port( Load_value : in STD_LOGIC_VECTOR(11 downto 0);
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Dir_sw : in STD_LOGIC;
          En_count : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Bout : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(11 downto 0)
          );
    end component;
    
    component Clk_divider is
    generic ( Perioada : Natural := 1000) ;
    port( RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Clk_out : out STD_LOGIC
          );
    end component;
    
    signal CLK_slow : STD_LOGIC;
    
begin
    
    Sec_half : Clk_divider generic map(500) port map(
        Rst => RST,
        clk => clk,
        Clk_out => CLK_slow 
        );
    
    Counter : bit12_counter port map(
        Load_value => Load_value ,
          RST => RST,
          Load => Load,
         CLK => CLK_slow ,
          Dir_sw => Dir_sw , 
          En_count => En_count , 
          Cout => Cout , 
          Bout => Bout ,
          Q_out => Q_out
    );

end Behavioral;
