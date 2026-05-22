
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu_4bits_RAM is
    port( ADD : in STD_LOGIC_VECTOR(2 downto 0);
          RST : in STD_LOGIC;
          CLK : in STD_LOGIC;
          A : in STD_LOGIC_VECTOR(3 downto 0);
          B : in STD_LOGIC_VECTOR(3 downto 0);
          SEL : in STD_LOGIC_VECTOR(1 downto 0);
          We : in STD_LOGIC;
          -- 
          Mem_out : out STD_LOGIC_VECTOR(3 downto 0)
          );
end Alu_4bits_RAM;

architecture Behavioral of Alu_4bits_RAM is

    component RAM is
    port(
        Add : in STD_LOGIC_VECTOR(2 downto 0);
        Data_in : STD_LOGIC_VECTOR(3 downto 0);
        WE : in STD_LOGIC;
        CLK : in STD_LOGIC;
        RST : in STD_LOGIC;
        Data_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    component ALU_4bits is
    port( A : in STD_LOGIC_VECTOR(3 downto 0);
          B : in STD_LOGIC_VECTOR(3 downto 0);
          Sel : in STD_LOGIC_VECTOR(1 downto 0);
          Output_Alu : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal Output_ex : STD_LOGIC_VECTOR(3 downto 0);
    
begin
     
     Alu : ALU_4bits port map(
        A => A,
        B => B,
        Sel => Sel,
        Output_Alu => Output_ex 
        ); 
    
    RAM_A : RAM port map(
        Add => ADD,
        RST => RST,
        CLK => CLK,
        Data_in => Output_ex,
        WE => We,
        Data_out => Mem_out
    );
    
end Behavioral;
