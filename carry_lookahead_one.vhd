LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY carry_lookahead_one IS
	PORT(
	A, B, C : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC
	);
END carry_lookahead_one;

ARCHITECTURE behavioral OF carry_lookahead_one IS
BEGIN

	G <= A AND B;
	P <= A OR B;
	S <= C XOR (A XOR B);
	
END behavioral;
	