----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:41:59 11/13/2022 
-- Design Name: 
-- Module Name:    D-Flipflop - Design 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Dflipflop is
    Port ( D : in  STD_LOGIC;
			  clk : in STD_LOGIC;
           Q : out  STD_LOGIC);	  
end Dflipflop;
architecture Design of DFlipflop is
	
begin
	Q <= D when clk = '1';
end Design;

