
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_lvl is
    port ( Up_btn_clk : in STD_LOGIC;
           RST : in STD_LOGIC;
           Down_btn_clk : in STD_LOGIC ;
           Res_out : out STD_LOGIC_VECTOR(3 downto 0);
           Carry_out : out STD_LOGIC
           );
end Top_lvl;

architecture Behavioral of Top_lvl is
    
    component Adder_4bit is
    port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC;
           Res : out STD_LOGIC_VECTOR(3 downto 0)
           );
    end component;

    component Up_counter4bit is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;

    component Diwn_counter4bit is
    port(
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    signal A_itn : STD_LOGIC_VECTOR(3 downto 0);
    signal B_itn : STD_LOGIC_VECTOR(3 downto 0);
    
begin
    
    Up_cnt : Up_counter4bit port map(
        CLK => Up_btn_clk,
        RST => RST,
        Q_out => A_itn  
    );
    
    Dwn_cnt : Diwn_counter4bit port map(
        CLK => Down_btn_clk,
        RST => RST,
        Q_out => B_itn  
    );
    
    ADD : Adder_4bit port map(
        A => A_itn,
        B => B_itn,
        Res => Res_out,
        Cout => Carry_out 
    );
    
end Behavioral;
