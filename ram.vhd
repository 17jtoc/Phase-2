LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ram IS
	PORT(		
		address: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		clock : IN STD_LOGIC;
		datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		readin : IN STD_LOGIC;
		writein : IN STD_LOGIC;
		dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END ram;

ARCHITECTURE behavioural OF ram IS
	type ram_type is array (0 to (2**8)-1) of std_logic_vector(31 DOWNTO 0);
	signal mem : ram_type;
	signal read_add : STD_LOGIC_VECTOR(8 DOWNTO 0);
	
BEGIN
	RamProc: PROCESS(clock) IS
	BEGIN
		IF rising_edge(clock) THEN
			IF writein = '1' THEN
				mem(to_integer(unsigned(address)))<=datain;
			END IF;
			IF readin = '1' THEN
				dataout <= mem(to_integer(unsigned(address)));
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE;