LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;

ENTITY address_decoder IS
PORT(
ione : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
address : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
);
END ENTITY;

Architecture behavioural OF address_decoder IS
BEGIN

address(8 DOWNTO 0) <= ione(8 DOWNTO 0);

END Architecture;