
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

entity ALU_4bits is
    port( A : in STD_LOGIC_VECTOR(3 downto 0);
          B : in STD_LOGIC_VECTOR(3 downto 0);
          Sel : in STD_LOGIC_VECTOR(1 downto 0);
          Output_Alu : out STD_LOGIC_VECTOR(3 downto 0)
          );
end ALU_4bits;

architecture Behavioral of ALU_4bits is
    
begin
    
    process(A,B,Sel)
        begin
            case Sel is
                when "00" => Output_Alu <= A+B; -- 
                when "01" => Output_Alu <= A AND B; --
                when "10" => Output_Alu <= A OR B;
                when "11" => Output_Alu <= "00" & A(3 downto 2);
                when others => Output_Alu <= (others => 'Z');
            end case;
    end process;

end Behavioral;
