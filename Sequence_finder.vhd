----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:00:48 11/13/2022 
-- Design Name: 
-- Module Name:    Sequence_finder - Behavioral 
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

entity Sequence_finder is
    Port ( X : in  STD_LOGIC;
           button : in  STD_LOGIC;
			  Clk : in STD_LOGIC;
			  reset : in STD_LOGIC;
			  A : out STD_LOGIC_VECTOR (3 downto 0);
           Z : out  STD_LOGIC);
			  type statetype is (state0, state1, state2, state3, state4);
			  signal presentstate, nextstate: statetype:= state0;
end Sequence_finder;

architecture Behavioral of Sequence_finder is

	component dbounce is
		Port (push_bt : in  STD_LOGIC;
            cclk : in  STD_LOGIC;
            debounce_out : out  STD_LOGIC);
	end component;
			signal SystemCLK : STD_LOGIC;
begin
	DB: dbounce
	port map(button, Clk, SystemCLK);
	
	output_process: process(presentstate) is
	begin
		case presentstate is
			when state4 => 
			Z <= '1';
			A <= "1101";
			when state3 =>
			Z <= '0';
			A <= "1100";
			when state2 =>
			Z <= '0';
			A <= "1110";
			when state1 =>
			Z <= '0';
			A <= "1010";
			when state0 => 
			Z <= '0';
			A <= "0010";
			end case;
		end process output_process;
		
	nextstate_process: process(nextstate, X) is
	begin 
		case presentstate is 
		when state0 =>
		if X = '1' then
			nextstate <= state1;
		else 
			nextstate <= state0;
		end if;
		
		when state1 => 
		if X = '1' then 
			nextstate <= state2;
		else
			nextstate <= state0;
		end if;
		
		when state2 => 
		if X = '1' then
			nextstate <= state2;
		else 
			nextstate <= state3;
		end if;
		
		when state3 => 
		if X = '1' then
			nextstate <= state4;
		else
			nextstate <= state0;
		end if;
		
		when state4 => 
		if X = '1' then
			nextstate <=  state2;
		else
			nextstate <= state0;
		end if;
		end case;
		end process nextstate_process;
		
		clk_process: process is
		begin
			wait until (rising_edge(SystemCLK));
			if reset = '1' then 
				presentstate <= state0;
			else
				presentstate <= nextstate;
			end if;
		end process clk_process;
end Behavioral;

