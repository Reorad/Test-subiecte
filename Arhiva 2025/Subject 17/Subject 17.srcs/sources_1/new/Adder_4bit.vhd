
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_4bit is
    port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC;
           Res : out STD_LOGIC_VECTOR(3 downto 0)
           );
end Adder_4bit;

architecture Behavioral of Adder_4bit is
    
begin
    process(A,B)
        variable A_var : STD_LOGIC_VECTOR(4 downto 0);
        variable B_var : STD_LOGIC_VECTOR(4 downto 0);
        variable Res_var : STD_LOGIC_VECTOR(4 downto 0);
        begin
            A_var := '0' & A;
            B_var := '0' & B;
            Res_var := A_var + B_var;
            Res <= Res_var(3 downto 0);
            Cout <= Res_var(4); 
    end process;
        

end Behavioral;
