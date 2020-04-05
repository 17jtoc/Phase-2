LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY booth_multiplier IS
	PORT(
	Q, B : IN STD_LOGIC_VECTOR(31 downto 0);
	C 	  : OUT STD_LOGIC_VECTOR(63 downto 0)
	);
END booth_multiplier;

ARCHITECTURE behavioral OF booth_multiplier IS



BEGIN
	PROCESS(Q,B)
	variable result : STD_LOGIC_VECTOR(64 DOWNTO 0);
		BEGIN
			
			result(64 downto 33) := X"00000000";
			result(32 downto 1) := Q;
			result(0) := '0';
			
			
			FOR n IN 0 TO 31 LOOP
				
				IF (result(1 downto 0) = "01") THEN
					result(64 downto 33) := result(64 downto 33) + B;
				ELSIF (result(1 downto 0) = "10") THEN
					result(64 downto 33) := result(64 downto 33) - B;
				END IF;
				
				result(63 downto 0) := result(64 downto 1);
			END LOOP;
			
			C <= result(64 downto 1);
		END PROCESS;
	
END behavioral;
	
