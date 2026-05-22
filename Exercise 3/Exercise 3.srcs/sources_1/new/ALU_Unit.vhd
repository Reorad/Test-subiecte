
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_Unit is
    port( A: in STD_LOGIC_VECTOR (3 downto 0);
          B : in STD_LOGIC_VECTOR (3 downto 0);
          Sel : in STD_LOGIC_VECTOR(1 downto 0);
          Ouptut_Alu : out STD_LOGIC_VECTOR (3 downto 0)
          );
          
end ALU_Unit;

architecture Behavioral of ALU_Unit is
    
    component Mux_4_4 is
    port ( Input_1 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_2 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_3 : in STD_LOGIC_VECTOR(3 downto 0);
           Input_4 : in STD_LOGIC_VECTOR(3 downto 0);
           Sel : in STD_LOGIC_VECTOR(1 downto 0);
           O : out STD_LOGIC_VECTOR(3 downto 0) );
    end component;

    signal O_Xor : STD_LOGIC_VECTOR (3 downto 0);
    signal O_And : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal O_OR : STD_LOGIC_VECTOR (3 DOWNTO 0);
    signal O_NAND : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
    
    O_xor <= A xor B;
    O_and <= A and B;
    O_or <= A or B;
    O_nand <= A nand B;
    
    Component_ALu_output :  Mux_4_4 port map(
           Input_1 =>  O_And,
           Input_2 =>  O_OR,
           Input_3 => O_NAND,
           Input_4 => O_Xor,
           Sel => Sel,
           O =>  Ouptut_Alu
           );
            

end Behavioral;
