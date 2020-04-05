LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg_z IS
	PORT (
			D				:	IN STD_LOGIC_VECTOR(63 DOWNTO 0);
			lo				:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			hi				:	OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
			);
END REG_Z;

ARCHITECTURE behavioral OF reg_z IS
BEGIN
	REGISTER_ONE:
	
	lo <= D(31 DOWNTO 0);
	
	hi <= D(63 DOWNTO 32);
	
END behavioral;