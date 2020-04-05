LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY select_encode IS
PORT(
IR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
Gra, Grb, Grc, Rin, Rout, BAout : IN STD_LOGIC;
R0in, R0out: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
C_sign_extended : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
);
END ENTITY;

Architecture behavioural OF select_encode IS
	signal Graout, Grbout, Grcout, gr_or : STD_LOGIC_VECTOR(3 DOWNTO 0);
	signal decode : STD_LOGIC_VECTOR(15 DOWNTO 0);
	signal temp1, temp2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
BEGIN
PROCESS(IR, Gra, Grb, Grc, Rin, Rout, Baout, Graout, Grbout, Grcout, gr_or, decode, temp1, temp2)
BEGIN
	FOR i IN 0 TO 3 Loop
		Graout(i) <= Gra and IR(23+i);
		Grbout(i) <= Grb and IR(19+i);
		Grcout(i) <= Grc and IR(15+i);
	END LOOP;
	FOR i IN 0 TO 3 LOOP
		gr_or(i) <= (Graout(i) or GrbOut(i)) or Grcout(i);
	END LOOP;
	temp1 <= IR;

	IF temp1(18) = '1' THEN
		temp2 <= "11111111111111" & IR(17 DOWNTO 0);
	ELSE
		temp2 <= "00000000000000" & IR(17 DOWNTO 0);
	END IF;
	
	C_sign_extended <= temp2;
	
	case gr_or is
		when "0000" =>
			decode <= "0000000000000001";
		when "0001" =>
			decode <= "0000000000000010";
		when "0010" =>
			decode <= "0000000000000100";
		when "0011" =>
			decode <= "0000000000001000";
		when "0100" =>
			decode <= "0000000000010000";
		when "0101" =>
			decode <= "0000000000100000";
		when "0110" =>
			decode <= "0000000001000000";
		when "0111" =>
			decode <= "0000000010000000";
		when "1000" =>
			decode <= "0000000100000000";
		when "1001" =>
			decode <= "0000001000000000";
		when "1010" =>
			decode <= "0000010000000000";
		when "1011" =>
			decode <= "0000100000000000";
		when "1100" =>
			decode <= "0001000000000000";
		when "1101" =>
			decode <= "0010000000000000";
		when "1110" =>
			decode <= "0100000000000000";
		when "1111" =>
			decode <= "1000000000000000";
		when others =>
			decode <= "0000000000000000";
	end case;
	
	FOR i IN 0 To 15 LOOP
		R0in(i) <= decode(i) and Rin;
		R0out(i) <= decode(i) and (Rout or BAout);
	END LOOP;
END PROCESS;
END Architecture;