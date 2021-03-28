----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 17:39:58
-- Design Name: 
-- Module Name: t_ff_rst - Behavioral
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

entity t_ff_rst is
  Port ( 
clk :   in STD_LOGIC; 
rst:  in STD_LOGIC; 
t:     in STD_LOGIC;
q:     out STD_LOGIC;
q_bar: out STD_LOGIC);
end t_ff_rst;

architecture Behavioral of t_ff_rst is
    signal x: std_logic;
begin

p_t_ff_rst : process (clk,rst)
   begin
       if rst='1' then
            x<='0';
       elsif rising_edge(clk) then
            if t='0' then
                x<=x;
            elsif t='1' then
                x<=not(x);
            end if;
       end if;
                       
end process p_t_ff_rst;
q<=x;
q_bar<=not(x);
end Behavioral;
