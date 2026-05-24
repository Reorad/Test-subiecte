----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2026 05:54:16 PM
-- Design Name: 
-- Module Name: Top_lvl_ROM_CNT - Behavioral
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

entity Top_lvl_ROM_CNT is
    port(CLK : in STD_LOGIC;
         RST : in STD_LOGIC;
         Q_out_rom : out STD_LOGIC_VECTOR(3 downto 0) 
         );
end Top_lvl_ROM_CNT;

architecture Behavioral of Top_lvl_ROM_CNT is
    
    component bit_3counter is
    port( CLK : in STD_LOGIC;
          RST : in STD_LOGIC;
          Q_out : out STD_LOGIC_VECTOR(2 downto 0)
          );
    end component;

    component ROM is
    port(
        Add : in STD_LOGIC_VECTOR(2 downto 0);
        Memory_out : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end component;
    
    signal Q_cnt_int : STD_LOGIC_VECTOR(2 downto 0);

begin
    CNT : bit_3counter port map(
        CLK => CLK,
        RST => RST,
        Q_out => Q_cnt_int
    );
    
    Rom_a : ROM port map(
        Add => Q_cnt_int,
        Memory_out => Q_out_rom
    );
    
end Behavioral;
