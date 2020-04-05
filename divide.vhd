LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

ENTITY divide IS
	PORT(
	dividend, divisor : IN STD_LOGIC_VECTOR(31 downto 0);
	Output 	  : OUT STD_LOGIC_VECTOR(31 downto 0);
	rOut 	  : OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END divide;

ARCHITECTURE behavioral OF divide IS



BEGIN
	PROCESS(dividend,divisor)
	variable A : STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable M : STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable Q : STD_LOGIC_VECTOR(31 DOWNTO 0);
	variable Res : STD_LOGIC_VECTOR(31 DOWNTO 0); 
	
		BEGIN
			
			A := "00000000000000000000000000000000";
			M := divisor;
			Q := dividend;
			
			
			FOR n IN 0 TO 31 LOOP
				A := A(30 DOWNTO 0) & Q(31);
				Q := Q(30 DOWNTO 0) & '0';
				Res := A;
				A := A - M;
				
				if A(31) = '0' then
					Q(0) := '1';
					
				else
					Q(0) := '0';
					A := Res;
				end if;
					
				
			END LOOP;
			
			Output <= Q;
			rOut <= A;
			
		END PROCESS;
	
END behavioral;
	
