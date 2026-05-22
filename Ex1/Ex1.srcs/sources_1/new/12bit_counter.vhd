
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit12_counter is
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
end bit12_counter;

architecture structural of bit12_counter is
    
    
    component bit4_counter is
    port( En_count : in STD_LOGIC;
          Dir_count : in STD_LOGIC;
          Load_value : in STD_LOGIC_VECTOR(3 downto 0);
          Clk : in STD_LOGIC;
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          Cin : in STD_LOGIC;
          Bin : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Bout : out STD_LOGIC;
          Q_state : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal Cout_cnt_1 , Bout_cnt_1 : STD_LOGIC;
    signal Cout_cnt_2 , Bout_cnt_2 : STD_LOGIC;
    
begin
    
    Counter_1 : bit4_counter port map(
        En_count => En_count,
        Dir_count => Dir_sw,
        Load_value => Load_value(3 downto 0),
        CLK => CLK,
        RST => RST,
        Load => Load,
        Cin => '1',
        Bin => '1',
        Cout => Cout_cnt_1,
        Bout => Bout_cnt_1,
        Q_state => Q_out(3 downto 0)    
    );
    Counter_2 : bit4_counter port map(
        En_count => En_count,
        Dir_count => Dir_sw,
        Load_value => Load_value(7 downto 4),
        CLK => CLK,
        RST => RST,
        Load => Load,
        Cin => Cout_cnt_1,
        Bin => Bout_cnt_1,
        Cout => Cout_cnt_2,
        Bout => Bout_cnt_2,
        Q_state => Q_out(7 downto 4)    
    );
    Counter_3 : bit4_counter port map(
        En_count => En_count,
        Dir_count => Dir_sw,
        Load_value => Load_value(11 downto 8),
        CLK => CLK,
        RST => RST,
        Load => Load,
        Cin => Cout_cnt_2,
        Bin => Bout_cnt_2,
        Cout => Cout,
        Bout => Bout,
        Q_state => Q_out(11 downto 8)    
    );

end structural;
