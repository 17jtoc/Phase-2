LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY opcode_register IS
	PORT (CLR,CLK,WRT	:	IN STD_LOGIC;
			D				:	IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q				:	OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END opcode_register;

ARCHITECTURE behavioral OF opcode_register IS
BEGIN
	OPCODE_REG:
	PROCESS(CLR,CLK,WRT,D)
	BEGIN
		IF CLR = '1' THEN
				Q <= x"0";
		ELSIF (rising_edge(CLK) AND WRT = '1') THEN
				Q <= D(3 DOWNTO 0);
		END IF;
	END PROCESS;
END behavioral;