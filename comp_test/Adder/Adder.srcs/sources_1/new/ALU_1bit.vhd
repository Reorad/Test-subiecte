----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2026 02:00:52 PM
-- Design Name: 
-- Module Name: ALU_1bit - Behavioral
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

entity ALU_1bit is
    port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Bin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Bout : out STD_LOGIC;
           Res_out_SUB : out STD_LOGIC;
           Res_out_ADD : out STD_LOGIC
           );
end ALU_1bit;

architecture Behavioral of ALU_1bit is
    
    component Substractor_1bit is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Bin : in STD_LOGIC;
        Bout : out STD_LOGIC;
        Res : out STD_LOGIC
    );
    end component;
    
    component Adder_1bit is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Cin : in STD_LOGIC;
        Cout : out STD_LOGIC;
        Res : out STD_LOGIC
    );
    end component;
    
begin
    
    Add : Adder_1bit port map(
        A=>A,
        B=>B,
        Cin=> Cin,
        Cout => Cout,
        Res => Res_out_ADD
        );
        
    Sub : Substractor_1bit port map(
        A=>A,
        B=>B,
        Bin => Bin,
        Bout => Bout,
        Res => Res_out_SUB
    
    );

end Behavioral;
