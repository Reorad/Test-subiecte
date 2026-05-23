
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_test is
--  Port ( );
end RAM_test;

architecture Behavioral of RAM_test is
    
    component RAM is
    generic ( ADD : natural := 6;
              ADD_Lenght : natural := 16 );
    port( CLK : in STD_LOGIC;
          WE : in STD_LOGIC;
          RST : in STD_LOGIC;
          Add_in : in STD_LOGIC_VECTOR(ADD-1 downto 0);
          Memory_in : in STD_LOGIC_VECTOR(ADD_Lenght - 1 downto 0);
          Data_out : out STD_LOGIC_VECTOR(ADD_Lenght - 1 downto 0)
          );
    end component;
    
    constant ADD : natural := 6;
    constant ADD_lengh : natural := 16;
    
    signal Index_add : natural := 2**(ADD) - 1;
    signal Value : natural := 2**(ADD+1) ;
    
    
    signal CLK : STD_LOGIC;
    signal We : STD_LOGIC;
    signal RST : STD_LOGIC;
    signal Data_out : STD_LOGIC_VECTOR(ADD_lengh - 1 downto 0);
    signal Add_in : STD_LOGIC_VECTOR(ADD - 1 downto 0 );
    signal Memory_in : STD_LOGIC_VECTOR(ADD_lengh - 1 downto 0);

    
    
    begin
    UUT : RAM 
        generic map(ADD,ADD_lengh)
        port map(
            CLK => CLK,
            WE => We,
            RST => RST,
            Add_in => Add_in,
            Memory_in => Memory_in,
            Data_out => Data_out
        );

    process
      begin
        CLK <= '1';
        wait for 5ns;
        CLK <= '0';
        wait for 5ns;
    end process;
    
    -- RAM memory out -- 
    process
        begin
            WE <= '0';
            RST <= '1';
            wait for 10ns;
            RST <= '0';
            WE <= '1';
            for i in 63 downto 0 loop
                if(i mod 2 = 1 ) then
                    Memory_in <= STD_LOGIC_VECTOR(to_unsigned(Value,ADD_lengh));
                    Add_in <= STD_LOGIC_VECTOR(to_unsigned(i,ADD));
                    Value <= Value - 1;
                end if;
                wait for 10ns;
            end loop;
            
            WE <= '0';
            wait for 20 ns;
            
            for i in 63 downto 0 loop
                Add_in <= STD_LOGIC_VECTOR(to_unsigned(i,ADD));
                wait for 10ns;
            end loop;
            
            wait;
    end process;
    
end Behavioral;
