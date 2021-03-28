----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 13:22:21
-- Design Name: 
-- Module Name: td_d_latch - Behavioral
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

entity td_d_latch is
--  Port ( );
end td_d_latch;

architecture Behavioral of td_d_latch is
 signal s_en    :std_logic;
 signal s_arst  :std_logic;
 signal s_d     :std_logic;
 signal s_q     :std_logic;
 signal s_q_bar :std_logic;
begin

uut_d_latch : entity work.d_latch
port map(
  en         => s_en,   
  arst       => s_arst, 
  d          => s_d,    
  q          => s_q,    
  q_bar      => s_q_bar

);     

p_reset_gen : process
begin
    s_arst <= '0';
    wait for 53 ns;
    
    --reset activated
    s_arst <= '1';
    wait for 5 ns;
    
    --reset deactivated
    s_arst <= '0';
    wait for 108 ns;
    s_arst <= '1';
    wait;
end process p_reset_gen;

p_stimulus : process
begin
    report "Stimulus process started" severity note;
    s_en <= '0';
    s_d <= '0';
    
    --d sequence
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    --/d sequence
    s_en <= '1';
    
    wait for 3 ns;
    assert(s_q = '0' and s_q_bar = '1');
    
    --d sequence
    wait for 7 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_en <= '0';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    --/d sequence
    
    wait for 3 ns;
    assert(s_q = '1' and s_q_bar = '0');
    
    --d sequence
    wait for 7 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    --/d sequence
    s_en <='1';
    
    wait for 3 ns;
    assert(s_q = '0' and s_q_bar = '1');
    
    --d sequence
    wait for 7 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    s_d <= '1';
    wait for 10 ns;
    s_d <= '0';
    wait for 10 ns;
    --/d sequence
    
   
    
    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;

end Behavioral;
