----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.03.2021 21:34:49
-- Design Name: 
-- Module Name: tb_top2 - Behavioral
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

entity tb_top2 is
--  Port ( );
end tb_top2;





architecture testbench of tb_top2 is

    signal s_LED :STD_LOGIC_VECTOR(8 - 1 downto 0);-- Local signals
    signal s_SW       : std_logic_vector(4 - 1 downto 0);
    

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_comparator_2bit : entity work.top2
        port map(
            LED => s_LED,
            SW => s_SW
            
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

      s_SW <= "0000"; wait for 100 ns;
      s_SW <= "0001"; wait for 100 ns;
      s_SW <= "0010"; wait for 100 ns;
      s_SW <= "0011"; wait for 100 ns;
      s_SW <= "0100"; wait for 100 ns;
      s_SW <= "0101"; wait for 100 ns;
      s_SW <= "0110"; wait for 100 ns;
      s_SW <= "0111"; wait for 100 ns;
      s_SW <= "1000"; wait for 100 ns;
      s_SW <= "1001"; wait for 100 ns;
      s_SW <= "1010"; wait for 100 ns;
      s_SW <= "1011"; wait for 100 ns;
      s_SW <= "1100"; wait for 100 ns;
      s_SW <= "1101"; wait for 100 ns;
      s_SW <= "1110"; wait for 100 ns;
      s_SW <= "1111"; wait for 100 ns;
        
  
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;