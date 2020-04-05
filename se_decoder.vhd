LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY se_decoder IS
PORT(
ione : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
itwo : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
zero,one,two,three,four,five,six,seven,eight,nine,ten,eleven,twelve,thirteen,fourteen,fifteen : OUT STD_LOGIC;
zero_out,one_out,two_out,three_out,four_out,five_out,six_out,seven_out,eight_out,nine_out,ten_out,eleven_out,twelve_out,thirteen_out,fourteen_out,fifteen_out : OUT STD_LOGIC
);
END ENTITY;

Architecture behavioural OF se_decoder IS
BEGIN

zero <= ione(0);
one <= ione(1);
two <= ione(2);
three <= ione(3);
four <= ione(4);
five <= ione(5);
six <= ione(6);
seven <= ione(7);
eight <= ione(8);
nine <= ione(9);
ten <= ione(10);
eleven <= ione(11);
twelve <= ione(12);
thirteen <= ione(13);
fourteen <= ione(14);
fifteen <= ione(15);

zero_out <= itwo(0);
one_out <= itwo(1);
two_out <= itwo(2);
three_out <= itwo(3);
four_out <= itwo(4);
five_out <= itwo(5);
six_out <= itwo(6);
seven_out <= itwo(7);
eight_out <= itwo(8);
nine_out <= itwo(9);
ten_out <= itwo(10);
eleven_out <= itwo(11);
twelve_out <= itwo(12);
thirteen_out <= itwo(13);
fourteen_out <= itwo(14);
fifteen_out <= itwo(15);


END Architecture;