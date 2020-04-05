LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;


ENTITY mdr IS
	PORT(
			CLR,CLK,WRT	:	IN STD_LOGIC;
			D	:	IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q	:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END mdr;

ARCHITECTURE behavioral OF mdr IS
BEGIN
	MDR:
	PROCESS(CLR,CLK,WRT,D)
	BEGIN
		IF CLR = '1' THEN
				Q <= x"00000000";
		ELSIF (rising_edge(CLK) AND WRT = '1') THEN
				Q <= D;
		END IF;
	END PROCESS;
END behavioral;
			
