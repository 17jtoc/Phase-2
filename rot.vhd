LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL; 
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL; 


ENTITY rotate IS
	PORT(
		input : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		direction : IN STD_LOGIC;
		distance : IN STD_LOGIC_VECTOR(4 downto 0);
		output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END rotate;

ARCHITECTURE behavioural OF rotate IS

BEGIN
	PROCESS(input,direction)
	variable dis : STD_LOGIC_VECTOR(4 DOWNTO 0);
	variable store : STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable storea: STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable storeb: STD_LOGIC;
	BEGIN
		dis := distance;
		store := input;
		IF direction = '0' THEN
			FOR i IN 0 TO 31 LOOP
			IF dis(4 DOWNTO 0) = "00000" THEN
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0);
				ELSE
					storea(31 DOWNTO 1) := store(30 DOWNTO 0);
					storeb := store(31);
					store := storea(31 DOWNTO 1)  & storeb;
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0) - '1';
				END IF;
			END LOOP;
		ELSIF direction = '1' THEN
			FOR i IN 0 TO 31 LOOP
			IF dis(4 DOWNTO 0) = "00000" THEN
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0);
				ELSE
					storea(30 DOWNTO 0) := store(31 DOWNTO 1);
					storeb := store(0);
					store := storeb & storea(30 DOWNTO 0);
					dis(4 DOWNTO 0) := dis(4 DOWNTO 0) - '1';
				END IF;
			END LOOP;
		END IF;
		output<=store(31 DOWNTO 0);
	END PROCESS;
END ARCHITECTURE behavioural;