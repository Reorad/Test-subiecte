
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

entity Substractor_1bit is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Bin : in STD_LOGIC;
        Bout : out STD_LOGIC;
        Res : out STD_LOGIC
    );
end Substractor_1bit;

architecture Behavioral of Substractor_1bit is
    
    
begin
    process(A,B,Bin)
        variable A_aux     : STD_LOGIC_VECTOR(1 downto 0);
        variable B_aux     : STD_LOGIC_VECTOR(1 downto 0);
        variable Bin_aux   : STD_LOGIC_VECTOR(1 downto 0);
        variable Res_final : STD_LOGIC_VECTOR(1 downto 0);
    begin
        A_aux   := '0' & A;
        B_aux   := '0' & B;
        Bin_aux := '0' & Bin;
        
        Res_final := A_aux - B_aux - Bin_aux;
        
        Bout <= Res_final(1);
        Res  <= Res_final(0);
    end process;
end Behavioral;
