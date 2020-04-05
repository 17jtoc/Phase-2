LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg0 IS
PORT(
	D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	clr, clk, enable, BAout : IN STD_LOGIC;
	output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY;

ARCHITECTURE behavioural OF reg0 IS
BEGIN
	PROCESS(D, clr, clk, enable, BAout)
	BEGIN
		IF clr = '0' or BAout = '1' THEN
			output <= x"00000000";
		ELSIF clk'event and clk='1' THEN
			IF enable = '1' THEN
				output <= D;
			ELSE
				output <= x"00000000";
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;