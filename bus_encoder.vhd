LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bus_encoder IS
	PORT(
	zeror, oner, twor, threer, fourr, fiver, sixr, sevenr, eightr, niner, tenr, elevenr, twelver, thirteenr, fourteenr, fifteenr,
	hiOUT, loOUT, zhighOUT, zlowOUT, pcOUT, mdrOUT, ipOUT, cOUT : IN STD_LOGIC;
	eOUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END bus_encoder;

ARCHITECTURE behavioral OF bus_encoder IS
BEGIN
	BUS_ENCODER:
	PROCESS(zeror, oner, twor, threer, fourr, fiver, sixr, sevenr, eightr, niner, tenr, elevenr, twelver, thirteenr, fourteenr, fifteenr,
	hiOUT, loOUT, zhighOUT, zlowOUT, pcOUT, mdrOUT, ipOUT, cOUT)
	variable input : STD_LOGIC_VECTOR(23 DOWNTO 0);
	BEGIN
		input := (zeror, oner, twor, threer, fourr, fiver, sixr, sevenr, eightr, niner, tenr, elevenr, twelver, thirteenr, fourteenr, fifteenr,
		hiOUT, loOUT, zhighOUT, zlowOUT, pcOUT, mdrOUT, ipOUT, cOUT);
		CASE input IS
			when "100000000000000000000000" => eOUT <= "00000";
			when "010000000000000000000000" => eOUT <= "00001";
			when "001000000000000000000000" => eOUT <= "00010";
			when "000100000000000000000000" => eOUT <= "00011";
			when "000010000000000000000000" => eOUT <= "00100";
			when "000001000000000000000000" => eOUT <= "00101";
			when "000000100000000000000000" => eOUT <= "00110";
			when "000000010000000000000000" => eOUT <= "00111";
			when "000000001000000000000000" => eOUT <= "01000";
			when "000000000100000000000000" => eOUT <= "01001";
			when "000000000010000000000000" => eOUT <= "01010";
			when "000000000001000000000000" => eOUT <= "01011";
			when "000000000000100000000000" => eOUT <= "01100";
			when "000000000000010000000000" => eOUT <= "01101";
			when "000000000000001000000000" => eOUT <= "01110";
			when "000000000000000100000000" => eOUT <= "01111";
			when "000000000000000010000000" => eOUT <= "10000";
			when "000000000000000001000000" => eOUT <= "10001";
			when "000000000000000000100000" => eOUT <= "10010";
			when "000000000000000000010000" => eOUT <= "10011";
			when "000000000000000000001000" => eOUT <= "10100";
			when "000000000000000000000100" => eOUT <= "10101";
			when "000000000000000000000010" => eOUT <= "10110";
			when "000000000000000000000001" => eOUT <= "10111";
			when others 						  => eOUT <= "11111";
			
			END CASE;
	END PROCESS;
END behavioral;
		
	
	