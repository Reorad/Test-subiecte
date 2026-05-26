
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

entity Adder_1bit is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        Cout : out STD_LOGIC;
        Res : out STD_LOGIC
    );
end Adder_1bit;

architecture Behavioral of Adder_1bit is
    
    
    
begin
    process(A,B,Cin)
        variable A_aux     : STD_LOGIC_VECTOR(1 downto 0);
        variable B_aux     : STD_LOGIC_VECTOR(1 downto 0);
        variable Cin_aux   : STD_LOGIC_VECTOR(1 downto 0);
        variable Res_final : STD_LOGIC_VECTOR(1 downto 0);
    begin
        A_aux   := '0' & A;
        B_aux   := '0' & B;
        Cin_aux := '0' & Cin;
        
        Res_final := A_aux + B_aux + Cin_aux;
        
        Cout <= Res_final(1);
        Res  <= Res_final(0);
    end process;
end Behavioral;
