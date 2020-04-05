LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY con_ff IS
	PORT(		
		busin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		IR : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		con_out: OUT STD_LOGIC
	);
END con_ff;

ARCHITECTURE behavioural OF con_ff IS
BEGIN
PROCESS(busin, IR) BEGIN
	--beq 0
	IF IR = "00" THEN
		IF busin = x"00000000" THEN
			con_out <= '1';
		ELSE con_out <='0';
		END IF;
	--bne 0
	ELSIF IR = "01" THEN
		IF busin = x"00000000" THEN
			con_out <= '0';
		ELSE con_out <='1';
		END IF;
	--bge 0	
	ELSIF IR = "10" THEN
		IF busin < x"80000000" THEN
			con_out <= '1';
		ELSE con_out <='0';
		END IF;
	--blt 0
	ELSIF IR = "11" THEN
		IF busin < x"80000000" THEN
			con_out <= '0';
		ELSE con_out <='1';
		END IF;
	END IF;
	--con_out = 1, branch
END PROCESS;
END ARCHITECTURE;