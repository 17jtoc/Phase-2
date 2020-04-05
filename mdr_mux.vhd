LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY mdr_mux IS
	PORT(
		bmOUT, mdataIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		RD : IN STD_LOGIC;
		mdOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END mdr_mux;

ARCHITECTURE behavioral OF mdr_mux IS
BEGIN
	MDR_MUX:
	PROCESS(bmOUT, mdataIN, RD)
	BEGIN
		IF RD = '1' THEN
			mdOUT <= mdataIN;
		ELSE
			mdOUT <= bmOUT;
		END IF;
	END PROCESS;
END behavioral;
			

