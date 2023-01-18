--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:16:21 11/14/2022
-- Design Name:   
-- Module Name:   /home/ise/ISE/ENGG2410_MON_Lab6_Group13/Sequence_finder_TestBench.vhd
-- Project Name:  ENGG2410_MON_Lab6_Group13
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sequence_finder_Design_for_TestBench
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sequence_finder_TestBench IS
END Sequence_finder_TestBench;
 
ARCHITECTURE behavior OF Sequence_finder_TestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sequence_finder_Design_for_TestBench
    PORT(
         X : IN  std_logic;
         Clk : IN  std_logic;
         reset : IN  std_logic;
         A : OUT  std_logic_vector(3 downto 0);
         Z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal X_tb : std_logic := '0';
   signal Clk_tb : std_logic := '0';
   signal reset_tb : std_logic := '0';

 	--Outputs
   signal A : std_logic_vector(3 downto 0);
   signal Z_tb : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sequence_finder_Design_for_TestBench PORT MAP (
          X => X_tb,
          Clk => Clk_tb,
          reset => reset_tb,
          A => A,
          Z => Z_tb
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk_tb <= '0';
		wait for Clk_period/2;
		Clk_tb <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
	tb : process
	constant halfperiod : time:= 20 ns;
   begin		
		
		X_tb <= '1';
		assert(Z_tb = '0')
		report ("Failed for '1'") severity error;
		wait for halfperiod;
		assert (Z_tb = '0')
		report ("Failed for '1'") severity error;
		wait for halfperiod;
		
		X_tb <= '1';
		assert(Z_tb = '0')
		report ("Failed for '11'") severity error;
		wait for halfperiod;
		assert (Z_tb = '0')
		report ("Failed for '11'") severity error;
		wait for halfperiod;
		
		X_tb <= '0';
		assert(Z_tb = '0')
		report ("Failed for '110'") severity error;
		wait for halfperiod;
		assert (Z_tb = '0')
		report ("Failed for '110'") severity error;
		wait for halfperiod;
		
		X_tb <= '1';
		assert(Z_tb = '0')
		report ("Failed for '1101'") severity error;
		wait for halfperiod;
		assert (Z_tb = '1')
		report ("Failed for '1101'") severity error;
		wait for halfperiod;
   end process;

END;
