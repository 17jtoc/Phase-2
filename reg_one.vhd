LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_one IS
	PORT (CLR,CLK,WRT	:	IN STD_LOGIC;
			D				:	IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q				:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END REG_ONE;

ARCHITECTURE behavioral OF reg_one IS
BEGIN
	REGISTER_ONE:
	PROCESS(CLR,CLK,WRT,D)
	BEGIN
		IF CLR = '1' THEN
				Q <= x"00000000";
		ELSIF (rising_edge(CLK) AND WRT = '1') THEN
				Q <= D;
		END IF;
	END PROCESS;
END behavioral;