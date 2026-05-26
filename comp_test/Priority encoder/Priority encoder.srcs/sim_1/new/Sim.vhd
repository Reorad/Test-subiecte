----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2026 03:20:31 PM
-- Design Name: 
-- Module Name: Sim - Behavioral
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

entity Sim is
--  Port ( );
end Sim;

architecture Behavioral of Sim is
    
    component Top_level_cnt is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         En : in STD_LOGIC;
         Cout : out STD_LOGIC;
         Q : out STD_LOGIC_VECTOR(11 downto 0)
    );
    end component;
    
    signal CLK, RST,En, Cout: STD_LOGIC;
    signal Q : STD_LOGIC_VECTOR(11 downto 0);
    
begin
    uut : Top_level_cnt port map(
        CLK => CLK,
        RST => RST,
        En => En,
        Cout => Cout,
        Q => Q
    );
    process
        begin
            CLK<='1';
            wait for 5ns;
            CLK <='0';
            wait for 5ns;
    end process;
    
    process
        begin
            RST <='1';
            EN <='1';
            wait for 10ns;
            RST <='0';
            wait for 10ns;
            
            wait for 30ns;
            En <='0';
            wait for 50ns;
            En <='1';
            wait for 10ns;
            wait ;
    end process;
end Behavioral;
