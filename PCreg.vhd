LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.all;

ENTITY PCreg IS
	PORT (CLR,CLK,WRT,INC	:	IN STD_LOGIC;
			D				:	IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q				:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END PCreg;

ARCHITECTURE behavioral OF PCreg IS
BEGIN
	PC_REG:
	PROCESS(CLR,CLK,WRT,D,INC)
	BEGIN
		IF CLR = '1' THEN
				Q <= x"00000000";
		ELSIF (WRT = '1') THEN
				Q <= D;
				IF INC = '1' THEN
					Q <= D + "00000000000000000000000000000100";
				END IF;
		END IF;
		
		
		
	END PROCESS;
END behavioral;