LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY bidirectional_bus IS
	PORT(
	bmzero, bmone, bmtwo, bmthree, bmfour, bmfive, bmsix, bmseven, bmeight, bmnine, bmten, bmeleven, bmtwelve, bmthirteen, bmfourteen, bmfifteen,
	bmHI, bmLO, bmZHIGH, bmZLOW, bmPC, bmMDR, bmIP, cSE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	eIN : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	bmOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END bidirectional_bus;

ARCHITECTURE behavioral OF bidirectional_bus IS
BEGIN
	BUSMUX:
	PROCESS(bmzero, bmone, bmtwo, bmthree, bmfour, bmfive, bmsix, bmseven, bmeight, bmnine, bmten, bmeleven, bmtwelve, bmthirteen, bmfourteen, bmfifteen,
	bmHI, bmLO, bmZHIGH, bmZLOW, bmPC, bmMDR, bmIP, cSE, eIN)
	BEGIN
		CASE eIN IS
			when "00000" => bmOUT <= bmzero;
			when "00001" => bmOUT <= bmone;
			when "00010" => bmOUT <= bmtwo;
			when "00011" => bmOUT <= bmthree;
			when "00100" => bmOUT <= bmfour;
			when "00101" => bmOUT <= bmfive;
			when "00110" => bmOUT <= bmsix;
			when "00111" => bmOUT <= bmseven;
			when "01000" => bmOUT <= bmeight;
			when "01001" => bmOUT <= bmnine;
			when "01010" => bmOUT <= bmten;
			when "01011" => bmOUT <= bmeleven;
			when "01100" => bmOUT <= bmtwelve;
			when "01101" => bmOUT <= bmthirteen;
			when "01110" => bmOUT <= bmfourteen;
			when "01111" => bmOUT <= bmfifteen;
			when "10000" => bmOUT <= bmHI;
			when "10001" => bmOUT <= bmLO;
			when "10010" => bmOUT <= bmZHIGH;
			when "10011" => bmOUT <= bmZLOW;
			when "10100" => bmOUT <= bmPC;
			when "10101" => bmOUT <= bmMDR;
			when "10110" => bmOUT <= bmIP;
			when "10111" => bmOUT <= cSE;
			when 	others =>
			
		END CASE;
	END PROCESS;
END behavioral;
		
			