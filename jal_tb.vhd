-- proc_tb.vhd file: proc.vhd
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

--entity declaration--
ENTITY jal_tb IS
END jal_tb;

--architecture of testbench with the signal names--
ARCHITECTURE jal_tb_arch OF jal_tb IS
		SIGNAL clk_tb, zero_clr_tb, one_clr_tb :  STD_LOGIC;
		SIGNAL two_clr_tb, three_clr_tb, hi_in_tb :  STD_LOGIC;
		SIGNAL lo_in_tb, zhi_in_tb, zlo_in_tb :  STD_LOGIC;
		SIGNAL pc_in_tb, mdr_in_tb, ip_in_tb :  STD_LOGIC;
		SIGNAL cse_in_tb, four_clr_tb, five_clr_tb :  STD_LOGIC;
		SIGNAL six_clr_tb, seven_clr_tb, eight_clr_tb :  STD_LOGIC;
		SIGNAL nine_clr_tb, ten_clr_tb, eleven_clr_tb :  STD_LOGIC;
		SIGNAL twelve_clr_tb, thirteen_clr_tb, fourteen_clr_tb :  STD_LOGIC;
		SIGNAL fifteen_clr_tb, hi_clr_tb, hi_wrt_tb :  STD_LOGIC;
		SIGNAL lo_clr_tb, lo_wrt_tb, zhi_clr_tb :  STD_LOGIC;
		SIGNAL zhi_wrt_tb, zlo_clr_tb, zlo_wrt_tb :  STD_LOGIC;
		SIGNAL pc_clr_tb, pc_wrt_tb, pc_inc_tb :  STD_LOGIC;
		SIGNAL mdr_clr_tb, mdr_wrt_tb, cse_clr_tb :  STD_LOGIC;
		SIGNAL cse_wrt_tb, mar_clr_tb, mar_wrt_tb :  STD_LOGIC;
		SIGNAL rd_tb, y_clr_tb, y_wrt_tb :  STD_LOGIC;
		SIGNAL opcode_clr_tb, opcode_wrt_tb, input_clr_tb :  STD_LOGIC;
		SIGNAL input_wrt_tb, ram_rd_tb, ram_wrt_tb :  STD_LOGIC;
		SIGNAL gra_in_tb, grb_in_tb, grc_in_tb :  STD_LOGIC;
		SIGNAL rout_tb, ba_out_tb, rinto_tb :  STD_LOGIC;
		
		SIGNAL output_wrt_tb, output_clr_tb : STD_LOGIC;
		SIGNAL output_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
		
		SIGNAL input_tb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL ir_in_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL bm_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL c_sign_extended_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL five_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL four_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL mdr_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL opcode_out_tb : STD_LOGIC_VECTOR(3 DOWNTO 0);
		SIGNAL pc_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL ram_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL rhi_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL rlo_out_tb: STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL two_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL y_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL z_out_tb : STD_LOGIC_VECTOR(63 DOWNTO 0);
		SIGNAL r15_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL zhi_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		SIGNAL zlo_out_tb : STD_LOGIC_VECTOR(31 DOWNTO 0);
		

		
		TYPE State IS (default, InitPCa, InitPCb, LoadRega, LoadRegb, T0, T1, T2, T3, T4);
		SIGNAL Present_state: State := default;
	
--component instantiation--
COMPONENT proc
	PORT
	(
		clk, zero_clr, one_clr, two_clr, three_clr :  IN  STD_LOGIC;
		hi_in, lo_in, zhi_in, zlo_in, pc_in :  IN  STD_LOGIC;
		mdr_in, ip_in, cse_in, four_clr, five_clr :  IN  STD_LOGIC;
		six_clr, seven_clr, eight_clr, nine_clr :  IN  STD_LOGIC;
		ten_clr, eleven_clr, twelve_clr, thirteen_clr :  IN  STD_LOGIC;
		fourteen_clr, fifteen_clr, hi_clr :  IN  STD_LOGIC;
		hi_wrt, lo_clr, lo_wrt, zhi_clr, zhi_wrt :  IN  STD_LOGIC;
		zlo_clr, zlo_wrt, pc_clr, pc_wrt :  IN  STD_LOGIC;
		pc_inc, mdr_clr, mdr_wrt, cse_clr :  IN  STD_LOGIC;
		cse_wrt, mar_clr, mar_wrt, rd :  IN  STD_LOGIC;
		y_clr, y_wrt, opcode_clr, opcode_wrt :  IN  STD_LOGIC;
		input_clr, input_wrt, ram_rd :  IN  STD_LOGIC;
		ram_wrt, gra_in, grb_in, grc_in :  IN  STD_LOGIC;
		rout, ba_out, rinto :  IN  STD_LOGIC;
		output_wrt :  IN  STD_LOGIC;
		output_clr :  IN  STD_LOGIC;
		output :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		r15_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		input :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ir_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		bm_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		c_sign_extended_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		five_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		four_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mdr_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		opcode_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		pc_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ram_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rhi_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rlo_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		two_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		y_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		z_out :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0);
		zhi_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		zlo_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
		
	);
END COMPONENT;

BEGIN
	DUT1 : proc
	
--port mapping: between DUT and testbench--
PORT MAP(
		clk => clk_tb,
		zero_clr => zero_clr_tb,
		one_clr => one_clr_tb,
		two_clr => two_clr_tb,
		three_clr => three_clr_tb,
		hi_in => hi_in_tb,
		lo_in => lo_in_tb,
		zhi_in => zhi_in_tb,
		zlo_in => zlo_in_tb,
		pc_in => pc_in_tb,
		mdr_in => mdr_in_tb,
		ip_in => ip_in_tb,
		cse_in => cse_in_tb,
		four_clr => four_clr_tb,
		five_clr => five_clr_tb,
		six_clr => six_clr_tb, 
		seven_clr => seven_clr_tb,
		eight_clr => eight_clr_tb,
		nine_clr => nine_clr_tb,
		ten_clr => ten_clr_tb,
		eleven_clr => eleven_clr_tb,
		twelve_clr => twelve_clr_tb,
		thirteen_clr => thirteen_clr_tb,
		fourteen_clr => fourteen_clr_tb,
		fifteen_clr => fifteen_clr_tb,
		hi_clr => hi_clr_tb,
		hi_wrt => hi_wrt_tb,
		lo_clr => lo_clr_tb,
		lo_wrt => lo_wrt_tb,
		zhi_clr => zhi_clr_tb,
		zhi_wrt => zhi_wrt_tb,
		zlo_clr => zlo_clr_tb,
		zlo_wrt => zlo_wrt_tb,
		pc_clr => pc_clr_tb,
		pc_wrt => pc_wrt_tb,
		pc_inc => pc_inc_tb,
		mdr_clr => mdr_clr_tb,
		mdr_wrt => mdr_wrt_tb,
		cse_clr => cse_clr_tb,
		cse_wrt => cse_wrt_tb,
		mar_clr => mar_clr_tb,
		mar_wrt => mar_wrt_tb,
		rd => rd_tb,
		y_clr => y_clr_tb,
		y_wrt => y_wrt_tb,
		opcode_clr => opcode_clr_tb,
		opcode_wrt => opcode_wrt_tb,
		input_clr => input_clr_tb,
		input_wrt => input_wrt_tb,
		ram_rd => ram_rd_tb,
		ram_wrt => ram_wrt_tb,
		gra_in => gra_in_tb,
		grb_in => grb_in_tb,
		grc_in => grc_in_tb,
		rout => rout_tb,
		ba_out => ba_out_tb,
		rinto => rinto_tb,
		input => input_tb,
		ir_in => ir_in_tb,
		r15_out => r15_out_tb,
		bm_out => bm_out_tb,
		c_sign_extended_out => c_sign_extended_out_tb,
		five_out => five_out_tb,
		four_out => four_out_tb,
		mdr_out => mdr_out_tb,
		opcode_out => opcode_out_tb,
		pc_out => pc_out_tb,
		ram_out => ram_out_tb,
		rhi_out => rhi_out_tb,
		rlo_out => rlo_out_tb,
		two_out => two_out_tb,
		y_out => y_out_tb,
		z_out => z_out_tb,
		output_wrt => output_wrt_tb,
		output_clr => output_clr_tb,
		output => output_tb,
		zhi_out => zhi_out_tb,
		zlo_out => zlo_out_tb);

--test logic--

Clock_process : PROCESS IS
BEGIN
	clk_tb <= '1', '0' after 10 ns;
 Wait for 20 ns;
END PROCESS Clock_process;

sim_process : process(clk_tb) is
begin

	if (rising_edge(clk_tb)) then
		case Present_state is
			WHEN Default =>
				Present_state <= InitPCa;
			WHEN InitPCa =>
				Present_state <= InitPCb;
			WHEN InitPCb =>
				Present_state <= LoadRega;
			WHEN LoadRega =>
				Present_state <= LoadRegb;
			WHEN LoadRegb =>
				Present_state <= T0;
			WHEN T0 =>
				Present_state <= T1;
			WHEN T1 =>
				Present_state <= T2;
			WHEN T2 =>
				Present_state <= T3;
			WHEN T3 =>
				Present_state <= T4;

			WHEN OTHERS =>
		END CASE;
	END IF;
end process sim_process;

PROCESS(Present_state) IS 
begin
	case Present_state is
		WHEN Default=>
			
			output_wrt_tb <= '0';
			output_clr_tb <= '0';
			zero_clr_tb <= '0'; one_clr_tb <= '0';
			two_clr_tb <= '0'; three_clr_tb <= '0'; hi_in_tb <= '0';
			lo_in_tb <= '0'; zhi_in_tb <= '0'; zlo_in_tb <= '0';
			pc_in_tb <= '0'; mdr_in_tb <= '0'; ip_in_tb <= '0';
			cse_in_tb <= '0'; four_clr_tb <= '0'; five_clr_tb <= '0';
			six_clr_tb <= '0'; seven_clr_tb <= '0'; eight_clr_tb <= '0';
			nine_clr_tb <= '0'; ten_clr_tb <= '0'; eleven_clr_tb <= '0';
			twelve_clr_tb <= '0'; thirteen_clr_tb <= '0'; fourteen_clr_tb <= '0';
			fifteen_clr_tb <= '0'; hi_clr_tb <= '0'; hi_wrt_tb <= '0';
			lo_clr_tb <= '0'; lo_wrt_tb <= '0'; zhi_clr_tb <= '0';
			zhi_wrt_tb <= '0'; zlo_clr_tb <= '0'; zlo_wrt_tb <= '0';
			pc_clr_tb <= '0'; pc_wrt_tb <= '0'; pc_inc_tb <= '0';
			mdr_clr_tb <= '0'; mdr_wrt_tb <= '0'; cse_clr_tb <= '0';
			cse_wrt_tb <= '0'; mar_clr_tb <= '0'; mar_wrt_tb <= '0';
			rd_tb <= '0'; y_clr_tb <= '0'; y_wrt_tb <= '0';
			opcode_clr_tb <= '0'; opcode_wrt_tb <= '0'; input_clr_tb <= '0';
			input_wrt_tb <= '0'; ram_rd_tb <= '0'; ram_wrt_tb <= '0';
			gra_in_tb <= '0'; grb_in_tb <= '0'; grc_in_tb <= '0';
			rout_tb <= '0'; ba_out_tb <= '0'; rinto_tb <= '0';
			input_tb  <= x"00000000";
			ir_in_tb <= x"00000000";
			
		WHEN InitPCa => 
			input_tb  <= x"00000000";
			input_wrt_tb <= '1' after 10 ns, '0' after 25 ns;
		WHEN InitPCb =>
			ip_in_tb <= '1' after 10 ns, '0' after 25 ns;
			pc_wrt_tb <= '1' after 10 ns, '0' after 25 ns;	
		When LoadRega => 
			input_tb  <= "00000000000000000000000000001111";
			input_wrt_tb <= '1' after 10 ns, '0' after 25 ns;
		When LoadRegb => 
			ip_in_tb <= '1' after 10 ns, '0' after 25 ns;
			grb_in_tb <= '1'; rinto_tb <= '1'; rout_tb <= '0';
			ba_out_tb <= '0';
			ir_in_tb <= "00000000000100000000000000000010";
		
		WHEN T0 =>
			grb_in_tb <= '0'; rinto_tb <= '0'; rout_tb <= '0';
			ba_out_tb <= '0';
		
			pc_in_tb <= '1'; mar_wrt_tb <= '1'; 
			pc_inc_tb <= '1'; lo_wrt_tb <= '1';
		WHEN T1 =>
			pc_in_tb <= '0'; mar_wrt_tb <= '0'; 
			pc_inc_tb <= '1';lo_wrt_tb <= '0';

			
			lo_in_tb <= '1'; pc_wrt_tb <= '1';
			
		WHEN T2 =>
			lo_in_tb <= '0'; pc_wrt_tb <= '0'; pc_in_tb <= '1';
			grb_in_tb <= '1'; rinto_tb <= '1'; rout_tb <= '0';
			ba_out_tb <= '0';
			ir_in_tb <= "00000000011110000000000000000000";
			
			
		WHEN T3 =>
			pc_in_tb <= '0';
			
			grb_in_tb <= '1'; rinto_tb <= '0'; rout_tb <= '1';
			ba_out_tb <= '1';
			ir_in_tb <= "00000000000100000000000000000000";
			
		WHEN T4 =>
			pc_wrt_tb <= '1'; pc_inc_tb <= '0';
			mar_wrt_tb <= '1';
			
		WHEN OTHERS =>
	END CASE;
END PROCESS; 

end;

























