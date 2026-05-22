----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/20/2026 02:51:19 PM
-- Design Name: 
-- Module Name: simulate_12bit - Behavioral
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

entity simulate_12bit is
--  Port ( );
end simulate_12bit;

architecture Behavioral of simulate_12bit is
    
    component bit12_counter is
    port( Load_value : STD_LOGIC_VECTOR(11 downto 0);
          RST : in STD_LOGIC;
          Load : in STD_LOGIC;
          CLK : in STD_LOGIC;
          Dir_sw : in STD_LOGIC;
          En_count : in STD_LOGIC;
          Cout : out STD_LOGIC;
          Bout : out STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(11 downto 0)
          );
    end component;
    signal RST, CLK, DIR_Sw, Cout, Bout , Load, En_cnt : STD_LOGIC;
    signal Load_value, Q_out : STD_LOGIC_VECTOR(11 downto 0);
    
    
begin
    UUT : bit12_counter port map(
        Load_value => Load_value,
        RST => RST,
        Load => Load,
        CLK => CLK,
        Dir_sw => Dir_sw,
        En_count => En_cnt,
        Cout => Cout,
        Bout => Bout,
        Q_out => Q_out
    );
    -- CLK process --
    process
        begin
            CLK <='1';
            wait for 5ns;
            CLK <='0';
            wait for 5ns;
           
    end process;
    -- Counter test --
    process
        begin
            RST <='1';
            En_cnt <= '1';
            Dir_sw <='1';
            Load <='0';
            wait for 10ns;
            RST <='0';
            wait for 10ns;
            Load <='1';
            Dir_sw <='0';
            Load_value <= "0000" & "0000" & "0000";
            wait for 10ns;
            Load <='0';
            wait for 100ns;
            Load <='1';
            Dir_sw <='1';
            Load_value <= "1111" & "1111" & "1111";
            wait for 10ns;
            Load <='0';
            En_cnt <= '0';
            wait for 10ns;
            Dir_sw <='0'; 
            wait for 10ns;
            En_cnt <= '1';  
            Dir_sw <='1';
            wait for 100ns;
            En_cnt <='0';
            
    end process;
    
    
end Behavioral;
