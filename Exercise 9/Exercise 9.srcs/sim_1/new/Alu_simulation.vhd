
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu_simulation is
--  Port ( );
end Alu_simulation;

architecture Behavioral of Alu_simulation is
    
    component Alu_4bits_RAM is
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
    end component;
    
    signal A, B , MEM_out : STD_LOGIC_VECTOR(3 downto 0);
    signal RST, CLK, We : STD_LOGIC;
    signal SEL : STD_LOGIC_VECTOR(1 downto 0);
    signal ADD : STD_LOGIC_VECTOR(2 downto 0);
    
begin
    
    UUT : Alu_4bits_RAM port map(
          ADD => ADD,
          RST => RST,
          CLK => CLK,
          A => A,
          B => B,
          SEL => SEL,
          We => WE,
          Mem_out => MEM_OUT
    );

    process
        begin
        CLK <= '0';
        wait for 5ns;
        CLK <= '1';
        wait for 5ns;
     end process;
     
     process
        begin
            RST <= '1';
            WE <= '0';
            wait for 10ns;
            RST <= '0';
            wait for 10ns;
            A <= "1000";
            SEL <="01"; -- AND
            B <= "1100" ;
            WE <= '1';
            Add <="100"; -- AT adress 4 should be 1000
            wait for 10 ns;
            Sel <="00";
            A <= "0001";
            B <= "1110"; 
            Add <= "001"; -- At adress 1 should be 1111
            wait for 10ns;
            We <='0';
            wait for 10ns;
            A <= "1111";
            B <= "1111";
            Sel <= "10"; -- or wont write at adress 001 
            wait for 10ns; 
            wait ;
        
     end process;      

end Behavioral;
