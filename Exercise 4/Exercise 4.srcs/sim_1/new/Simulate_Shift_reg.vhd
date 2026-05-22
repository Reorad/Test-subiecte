----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 12:44:20 PM
-- Design Name: 
-- Module Name: Simulate_Shift_reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Simulate_Shift_reg is
--  Port ( );
end Simulate_Shift_reg;

architecture Behavioral of Simulate_Shift_reg is
    
    component Shift_reg is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          S_in : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    signal CLK , RST, S_in : STD_LOGIC ;
    signal Q_out : STD_LOGIC_VECTOR(3 downto 0);
begin
    
    UUT : Shift_reg port map(
    
        CLK => CLK,
        RST => RST,
        S_in => S_in,
        Q_out => Q_out
    );

    process
        begin   
            CLK <='0';
            wait for 5ns;
            CLK <= '1';
            wait for 5ns;
    end process;
    
    process 
        begin
            RST <='1';
            wait for 10ns;
            RST <= '0';
            S_in <= '1';
            wait for 10ns;
            S_in <='0';
            wait;
    end process;

end Behavioral;
