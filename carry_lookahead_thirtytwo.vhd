LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

ENTITY carry_lookahead_thirtytwo IS
	PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(31 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END carry_lookahead_thirtytwo;

ARCHITECTURE behavioral OF carry_lookahead_thirtytwo IS

COMPONENT carry_lookahead_one
PORT(
	A, B, CIn : IN STD_LOGIC;
	G, P, S : OUT STD_LOGIC);
END COMPONENT;

COMPONENT carry_lookahead_sixteen
PORT(
	CIn 		: IN STD_LOGIC;
	A, B	: IN STD_LOGIC_VECTOR(15 downto 0);
	GOut, POut, COut : OUT STD_LOGIC;
	SOut		: OUT STD_LOGIC_VECTOR(15 downto 0));
END COMPONENT;

SIGNAL G, P	: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL S : STD_LOGIC_VECTOR(31 DOWNTO 0);


BEGIN
	
	C(0) <= CIn;
	
	CLA16_1 : carry_lookahead_sixteen PORT MAP(C(0),A(15 downto 0),B(15 downto 0),G(0),P(0),C(1),S(15 downto 0));
	CLA16_2 : carry_lookahead_sixteen PORT MAP(C(1),A(31 downto 16),B(31 downto 16),G(1),P(1),C(2),S(31 downto 16));
	
	COut <= C(2);
	GOut <= G(1) OR (P(1) AND G(0));
	POut <= P(1) AND P(0);
	SOut <= S;
	
END behavioral;
	