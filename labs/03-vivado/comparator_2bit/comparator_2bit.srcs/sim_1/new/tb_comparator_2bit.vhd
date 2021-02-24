----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.02.2021 19:48:39
-- Design Name: 
-- Module Name: tb_comparator_2bit - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_comparator_2bit is
    -- Entity of testbench is always empty
end entity tb_comparator_2bit;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_comparator_2bit is

    -- Local signals
    signal s_a       : std_logic_vector(2 - 1 downto 0);
    signal s_b       : std_logic_vector(2 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_2bit entity (Unit Under Test)
    uut_comparator_2bit : entity work.comparator_2bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_b <= "00"; s_a <= "00"; wait for 100 ns;
        s_b <= "00"; s_a <= "01"; wait for 100 ns;
        s_b <= "00"; s_a <= "10"; wait for 100 ns;
        s_b <= "00"; s_a <= "11"; wait for 100 ns;
        s_b <= "01"; s_a <= "00"; wait for 100 ns;
        s_b <= "01"; s_a <= "01"; wait for 100 ns;
        s_b <= "01"; s_a <= "10"; wait for 100 ns;
        s_b <= "01"; s_a <= "11"; wait for 100 ns;
        s_b <= "10"; s_a <= "00"; wait for 100 ns;
        s_b <= "10"; s_a <= "01"; wait for 100 ns;
        s_b <= "10"; s_a <= "10"; wait for 100 ns;
        s_b <= "10"; s_a <= "11"; wait for 100 ns;
        s_b <= "11"; s_a <= "00"; wait for 100 ns;
        s_b <= "11"; s_a <= "01"; wait for 100 ns;
        s_b <= "11"; s_a <= "10"; wait for 100 ns;
        s_b <= "11"; s_a <= "11"; wait for 100 ns;
        -- Expected output
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        -- If false, then report an error
        report "Test failed for input combination: 00, 00" severity error;
        
        
        -- WRITE OTHER TESTS HERE


        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
