LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY negate IS
	PORT(
	A : IN STD_LOGIC_VECTOR(31 downto 0);
	B : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END negate;

ARCHITECTURE behavioral OF negate IS

SIGNAL N	: STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN
	NEGATE:
	PROCESS(A)
	BEGIN
	
		B <= (NOT A) + "00000000000000000000000000000001";
		
	END PROCESS;
END behavioral;
	
