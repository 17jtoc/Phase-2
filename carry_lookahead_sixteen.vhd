LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY carry_lookahead_sixteen IS
	PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(15 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(15 downto 0)
	);
END carry_lookahead_sixteen;

ARCHITECTURE behavioral OF carry_lookahead_sixteen IS

COMPONENT carry_lookahead_one
PORT(
	A, B, C : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC);
END COMPONENT;

SIGNAL G, P, S	: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL C : STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN
	
	C(0) <= CIn;
	CLA_0 : carry_lookahead_one PORT MAP(A(0),B(0),C(0),G(0),P(0),S(0));
	C(1) <= G(0) OR (P(0) AND C(0));
	CLA_1 : carry_lookahead_one PORT MAP(A(1),B(1),C(1),G(1),P(1),S(1));
	C(2) <= G(1) OR (P(1) AND C(1));
	CLA_2 : carry_lookahead_one PORT MAP(A(2),B(2),C(2),G(2),P(2),S(2));
	C(3) <= G(2) OR (P(2) AND C(2));
	CLA_3 : carry_lookahead_one PORT MAP(A(3),B(3),C(3),G(3),P(3),S(3));
	C(4) <= G(3) OR (P(3) AND C(3));
	CLA_4 : carry_lookahead_one PORT MAP(A(4),B(4),C(4),G(4),P(4),S(4));
	C(5) <= G(4) OR (P(4) AND C(4));
	CLA_5 : carry_lookahead_one PORT MAP(A(5),B(5),C(5),G(5),P(5),S(5));
	C(6) <= G(5) OR (P(5) AND C(5));
	CLA_6 : carry_lookahead_one PORT MAP(A(6),B(6),C(6),G(6),P(6),S(6));
	C(7) <= G(6) OR (P(6) AND C(6));
	CLA_7 : carry_lookahead_one PORT MAP(A(7),B(7),C(7),G(7),P(7),S(7));
	C(8) <= G(7) OR (P(7) AND C(7));
	CLA_8 : carry_lookahead_one PORT MAP(A(8),B(8),C(8),G(8),P(8),S(8));
	C(9) <= G(8) OR (P(8) AND C(8));
	CLA_9 : carry_lookahead_one PORT MAP(A(9),B(9),C(9),G(9),P(9),S(9));
	C(10) <= G(9) OR (P(9) AND C(9));
	CLA_10 : carry_lookahead_one PORT MAP(A(10),B(10),C(10),G(10),P(10),S(10));
	C(11) <= G(10) OR (P(10) AND C(10));
	CLA_11 : carry_lookahead_one PORT MAP(A(11),B(11),C(11),G(11),P(11),S(11));
	C(12) <= G(11) OR (P(11) AND C(11));
	CLA_12 : carry_lookahead_one PORT MAP(A(12),B(12),C(12),G(12),P(12),S(12));
	C(13) <= G(12) OR (P(12) AND C(12));
	CLA_13 : carry_lookahead_one PORT MAP(A(13),B(13),C(13),G(13),P(13),S(13));
	C(14) <= G(13) OR (P(13) AND C(13));
	CLA_14 : carry_lookahead_one PORT MAP(A(14),B(14),C(14),G(14),P(14),S(14));
	C(15) <= G(14) OR (P(14) AND C(14));
	CLA_15 : carry_lookahead_one PORT MAP(A(15),B(15),C(15),G(15),P(15),S(15));
	
	COut <= G(15) OR (P(15) AND C(15));
	GOut <= G(15) 
	OR (P(15) AND G(14)) 
	OR (P(15) AND P(14) AND G(13)) 
	OR (P(15) AND P(14) AND P(13) AND G(12)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND G(11)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND G(10)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND G(9))
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND G(8)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND G(7)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND G(6)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND G(5)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND G(4)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND G(3)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND G(2)) 
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND G(1))
	OR (P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND G(0));
	POut <= P(15) AND P(14) AND P(13) AND P(12) AND P(11) AND P(10) AND P(9) AND P(8) AND P(7) AND P(6) AND P(5) AND P(4) AND P(3) AND P(2) AND P(1) AND P(0);
	SOut <= S;
	
	
END behavioral;
	
