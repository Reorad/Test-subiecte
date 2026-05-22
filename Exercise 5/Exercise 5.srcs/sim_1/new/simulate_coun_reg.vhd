----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2026 05:48:06 PM
-- Design Name: 
-- Module Name: simulate_coun_reg - Behavioral
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

entity simulate_coun_reg is
--  Port ( );
end simulate_coun_reg;
    
architecture Behavioral of simulate_coun_reg is
    
    component Counter_Reg is
    port( CLK : in STD_LOGIC;
          Rst : in STD_LOGIC;
          Load : in STD_LOGIC;
          Q_leds_counter : out STD_LOGIC_VECTOR(3 downto 0);
          Q_leds_Register : out STD_LOGIC_VECTOR(3 downto 0)
          );
    end component;
    
    signal CLK , RST , LOAD : STD_LOGIC :='0';
    signal Q_leds_counter, Q_leds_register : STD_LOGIC_VECTOR(3 downto 0) := (others =>'0');
    
begin
    UUT : Counter_Reg port map(
        CLK => CLK,
        RST => RST,
        LOAD => LOAD,
        Q_leds_counter => Q_leds_counter,
        Q_leds_register => Q_leds_register
        );

    process
        begin
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;    
    end process; 
   
   
    process
        begin
            RST <='1';
            Load <='0';
            wait for 10ns;
            RST <= '0';
            wait for 50ns;
            Load <='1';
            wait for 10ns;
            Load <='0';
            wait;
    end process;

end Behavioral;
