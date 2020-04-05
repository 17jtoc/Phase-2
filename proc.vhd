-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Sun Apr 05 11:14:36 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY proc IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		zero_clr :  IN  STD_LOGIC;
		one_clr :  IN  STD_LOGIC;
		two_clr :  IN  STD_LOGIC;
		three_clr :  IN  STD_LOGIC;
		hi_in :  IN  STD_LOGIC;
		lo_in :  IN  STD_LOGIC;
		zhi_in :  IN  STD_LOGIC;
		zlo_in :  IN  STD_LOGIC;
		pc_in :  IN  STD_LOGIC;
		mdr_in :  IN  STD_LOGIC;
		ip_in :  IN  STD_LOGIC;
		cse_in :  IN  STD_LOGIC;
		four_clr :  IN  STD_LOGIC;
		five_clr :  IN  STD_LOGIC;
		six_clr :  IN  STD_LOGIC;
		seven_clr :  IN  STD_LOGIC;
		eight_clr :  IN  STD_LOGIC;
		nine_clr :  IN  STD_LOGIC;
		ten_clr :  IN  STD_LOGIC;
		eleven_clr :  IN  STD_LOGIC;
		twelve_clr :  IN  STD_LOGIC;
		thirteen_clr :  IN  STD_LOGIC;
		fourteen_clr :  IN  STD_LOGIC;
		fifteen_clr :  IN  STD_LOGIC;
		hi_clr :  IN  STD_LOGIC;
		hi_wrt :  IN  STD_LOGIC;
		lo_clr :  IN  STD_LOGIC;
		lo_wrt :  IN  STD_LOGIC;
		zhi_clr :  IN  STD_LOGIC;
		zhi_wrt :  IN  STD_LOGIC;
		zlo_clr :  IN  STD_LOGIC;
		zlo_wrt :  IN  STD_LOGIC;
		pc_clr :  IN  STD_LOGIC;
		pc_wrt :  IN  STD_LOGIC;
		pc_inc :  IN  STD_LOGIC;
		mdr_clr :  IN  STD_LOGIC;
		mdr_wrt :  IN  STD_LOGIC;
		cse_clr :  IN  STD_LOGIC;
		cse_wrt :  IN  STD_LOGIC;
		mar_clr :  IN  STD_LOGIC;
		mar_wrt :  IN  STD_LOGIC;
		rd :  IN  STD_LOGIC;
		y_clr :  IN  STD_LOGIC;
		y_wrt :  IN  STD_LOGIC;
		opcode_clr :  IN  STD_LOGIC;
		opcode_wrt :  IN  STD_LOGIC;
		input_clr :  IN  STD_LOGIC;
		input_wrt :  IN  STD_LOGIC;
		ram_rd :  IN  STD_LOGIC;
		ram_wrt :  IN  STD_LOGIC;
		gra_in :  IN  STD_LOGIC;
		grb_in :  IN  STD_LOGIC;
		grc_in :  IN  STD_LOGIC;
		rout :  IN  STD_LOGIC;
		ba_out :  IN  STD_LOGIC;
		rinto :  IN  STD_LOGIC;
		output_wrt :  IN  STD_LOGIC;
		output_clr :  IN  STD_LOGIC;
		input :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ir_in :  IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
		bm_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		c_sign_extended_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		five_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		four_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		mdr_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		opcode_out :  OUT  STD_LOGIC_VECTOR(3 DOWNTO 0);
		output :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		pc_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		r15_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		ram_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rhi_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		rlo_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		two_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		y_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		z_out :  OUT  STD_LOGIC_VECTOR(63 DOWNTO 0);
		zhi_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0);
		zlo_out :  OUT  STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END proc;

ARCHITECTURE bdf_type OF proc IS 

COMPONENT address_decoder
	PORT(ione : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 address : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(Ain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Bin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 OPcode : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
	);
END COMPONENT;

COMPONENT bidirectional_bus
	PORT(bmeight : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmeleven : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfifteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfive : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfour : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmfourteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmHI : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmIP : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmLO : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmMDR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmnine : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmone : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmPC : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmseven : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmsix : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmten : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmthirteen : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmthree : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmtwelve : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmtwo : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmzero : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmZHIGH : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 bmZLOW : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 cSE : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 eIN : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 bmOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT bus_encoder
	PORT(zeror : IN STD_LOGIC;
		 oner : IN STD_LOGIC;
		 twor : IN STD_LOGIC;
		 threer : IN STD_LOGIC;
		 fourr : IN STD_LOGIC;
		 fiver : IN STD_LOGIC;
		 sixr : IN STD_LOGIC;
		 sevenr : IN STD_LOGIC;
		 eightr : IN STD_LOGIC;
		 niner : IN STD_LOGIC;
		 tenr : IN STD_LOGIC;
		 elevenr : IN STD_LOGIC;
		 twelver : IN STD_LOGIC;
		 thirteenr : IN STD_LOGIC;
		 fourteenr : IN STD_LOGIC;
		 fifteenr : IN STD_LOGIC;
		 hiOUT : IN STD_LOGIC;
		 loOUT : IN STD_LOGIC;
		 zhighOUT : IN STD_LOGIC;
		 zlowOUT : IN STD_LOGIC;
		 pcOUT : IN STD_LOGIC;
		 mdrOUT : IN STD_LOGIC;
		 ipOUT : IN STD_LOGIC;
		 cOUT : IN STD_LOGIC;
		 eOUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_one
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mdr_mux
	PORT(RD : IN STD_LOGIC;
		 bmOUT : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdataIN : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 mdOUT : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg0
	PORT(clr : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 BAout : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT ram
	PORT(clock : IN STD_LOGIC;
		 readin : IN STD_LOGIC;
		 writein : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		 datain : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 dataout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT opcode_register
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pcreg
	PORT(CLR : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 WRT : IN STD_LOGIC;
		 INC : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT reg_z
	PORT(D : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
		 hi : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 lo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;

COMPONENT se_decoder
	PORT(ione : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 itwo : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 zero : OUT STD_LOGIC;
		 one : OUT STD_LOGIC;
		 two : OUT STD_LOGIC;
		 three : OUT STD_LOGIC;
		 four : OUT STD_LOGIC;
		 five : OUT STD_LOGIC;
		 six : OUT STD_LOGIC;
		 seven : OUT STD_LOGIC;
		 eight : OUT STD_LOGIC;
		 nine : OUT STD_LOGIC;
		 ten : OUT STD_LOGIC;
		 eleven : OUT STD_LOGIC;
		 twelve : OUT STD_LOGIC;
		 thirteen : OUT STD_LOGIC;
		 fourteen : OUT STD_LOGIC;
		 fifteen : OUT STD_LOGIC;
		 zero_out : OUT STD_LOGIC;
		 one_out : OUT STD_LOGIC;
		 two_out : OUT STD_LOGIC;
		 three_out : OUT STD_LOGIC;
		 four_out : OUT STD_LOGIC;
		 five_out : OUT STD_LOGIC;
		 six_out : OUT STD_LOGIC;
		 seven_out : OUT STD_LOGIC;
		 eight_out : OUT STD_LOGIC;
		 nine_out : OUT STD_LOGIC;
		 ten_out : OUT STD_LOGIC;
		 eleven_out : OUT STD_LOGIC;
		 twelve_out : OUT STD_LOGIC;
		 thirteen_out : OUT STD_LOGIC;
		 fourteen_out : OUT STD_LOGIC;
		 fifteen_out : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT select_encode
	PORT(Gra : IN STD_LOGIC;
		 Grb : IN STD_LOGIC;
		 Grc : IN STD_LOGIC;
		 Rin : IN STD_LOGIC;
		 Rout : IN STD_LOGIC;
		 BAout : IN STD_LOGIC;
		 IR : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		 C_sign_extended : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		 R0in : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		 R0out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_95 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_37 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_44 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_47 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_49 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_50 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_52 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_54 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_56 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_58 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_60 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_62 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_63 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_64 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_66 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_68 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_70 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_72 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_74 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_76 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_78 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_80 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_82 :  STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_90 :  STD_LOGIC_VECTOR(63 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_91 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_92 :  STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_93 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_94 :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 
bm_out <= SYNTHESIZED_WIRE_95;
c_sign_extended_out <= SYNTHESIZED_WIRE_63;
five_out <= SYNTHESIZED_WIRE_7;
four_out <= SYNTHESIZED_WIRE_8;
mdr_out <= SYNTHESIZED_WIRE_13;
opcode_out <= SYNTHESIZED_WIRE_3;
pc_out <= SYNTHESIZED_WIRE_16;
r15_out <= SYNTHESIZED_WIRE_6;
ram_out <= SYNTHESIZED_WIRE_49;
rhi_out <= SYNTHESIZED_WIRE_10;
rlo_out <= SYNTHESIZED_WIRE_12;
two_out <= SYNTHESIZED_WIRE_23;
y_out <= SYNTHESIZED_WIRE_2;
z_out <= SYNTHESIZED_WIRE_90;
zhi_out <= SYNTHESIZED_WIRE_25;
zlo_out <= SYNTHESIZED_WIRE_26;



b2v_add_dec : address_decoder
PORT MAP(ione => SYNTHESIZED_WIRE_0,
		 address => SYNTHESIZED_WIRE_82);


b2v_alu : alu
PORT MAP(Ain => SYNTHESIZED_WIRE_95,
		 Bin => SYNTHESIZED_WIRE_2,
		 OPcode => SYNTHESIZED_WIRE_3,
		 Y => SYNTHESIZED_WIRE_90);


b2v_bus : bidirectional_bus
PORT MAP(bmeight => SYNTHESIZED_WIRE_4,
		 bmeleven => SYNTHESIZED_WIRE_5,
		 bmfifteen => SYNTHESIZED_WIRE_6,
		 bmfive => SYNTHESIZED_WIRE_7,
		 bmfour => SYNTHESIZED_WIRE_8,
		 bmfourteen => SYNTHESIZED_WIRE_9,
		 bmHI => SYNTHESIZED_WIRE_10,
		 bmIP => SYNTHESIZED_WIRE_11,
		 bmLO => SYNTHESIZED_WIRE_12,
		 bmMDR => SYNTHESIZED_WIRE_13,
		 bmnine => SYNTHESIZED_WIRE_14,
		 bmone => SYNTHESIZED_WIRE_15,
		 bmPC => SYNTHESIZED_WIRE_16,
		 bmseven => SYNTHESIZED_WIRE_17,
		 bmsix => SYNTHESIZED_WIRE_18,
		 bmten => SYNTHESIZED_WIRE_19,
		 bmthirteen => SYNTHESIZED_WIRE_20,
		 bmthree => SYNTHESIZED_WIRE_21,
		 bmtwelve => SYNTHESIZED_WIRE_22,
		 bmtwo => SYNTHESIZED_WIRE_23,
		 bmzero => SYNTHESIZED_WIRE_24,
		 bmZHIGH => SYNTHESIZED_WIRE_25,
		 bmZLOW => SYNTHESIZED_WIRE_26,
		 cSE => SYNTHESIZED_WIRE_27,
		 eIN => SYNTHESIZED_WIRE_28,
		 bmOUT => SYNTHESIZED_WIRE_95);


b2v_busmux : bus_encoder
PORT MAP(zeror => SYNTHESIZED_WIRE_29,
		 oner => SYNTHESIZED_WIRE_30,
		 twor => SYNTHESIZED_WIRE_31,
		 threer => SYNTHESIZED_WIRE_32,
		 fourr => SYNTHESIZED_WIRE_33,
		 fiver => SYNTHESIZED_WIRE_34,
		 sixr => SYNTHESIZED_WIRE_35,
		 sevenr => SYNTHESIZED_WIRE_36,
		 eightr => SYNTHESIZED_WIRE_37,
		 niner => SYNTHESIZED_WIRE_38,
		 tenr => SYNTHESIZED_WIRE_39,
		 elevenr => SYNTHESIZED_WIRE_40,
		 twelver => SYNTHESIZED_WIRE_41,
		 thirteenr => SYNTHESIZED_WIRE_42,
		 fourteenr => SYNTHESIZED_WIRE_43,
		 fifteenr => SYNTHESIZED_WIRE_44,
		 hiOUT => hi_in,
		 loOUT => lo_in,
		 zhighOUT => zhi_in,
		 zlowOUT => zlo_in,
		 pcOUT => pc_in,
		 mdrOUT => mdr_in,
		 ipOUT => ip_in,
		 cOUT => cse_in,
		 eOUT => SYNTHESIZED_WIRE_28);


b2v_inst : reg_one
PORT MAP(CLR => output_clr,
		 CLK => clk,
		 WRT => output_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => output);


b2v_mar : reg_one
PORT MAP(CLR => mar_clr,
		 CLK => clk,
		 WRT => mar_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_0);


b2v_mdr : mdr
PORT MAP(CLR => mdr_clr,
		 CLK => clk,
		 WRT => mdr_wrt,
		 D => SYNTHESIZED_WIRE_47,
		 Q => SYNTHESIZED_WIRE_13);


b2v_mdr_mux : mdr_mux
PORT MAP(RD => rd,
		 bmOUT => SYNTHESIZED_WIRE_95,
		 mdataIN => SYNTHESIZED_WIRE_49,
		 mdOUT => SYNTHESIZED_WIRE_47);


b2v_r0 : reg0
PORT MAP(clr => zero_clr,
		 clk => clk,
		 enable => SYNTHESIZED_WIRE_50,
		 BAout => ba_out,
		 D => SYNTHESIZED_WIRE_95,
		 output => SYNTHESIZED_WIRE_24);


b2v_r1 : reg_one
PORT MAP(CLR => one_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_52,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_15);


b2v_r10 : reg_one
PORT MAP(CLR => ten_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_54,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_19);


b2v_r11 : reg_one
PORT MAP(CLR => eleven_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_56,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_5);


b2v_r12 : reg_one
PORT MAP(CLR => twelve_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_58,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_22);


b2v_r13 : reg_one
PORT MAP(CLR => thirteen_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_60,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_20);


b2v_r14 : reg_one
PORT MAP(CLR => fourteen_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_62,
		 D => SYNTHESIZED_WIRE_63,
		 Q => SYNTHESIZED_WIRE_9);


b2v_r15 : reg_one
PORT MAP(CLR => fifteen_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_64,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_6);


b2v_r2 : reg_one
PORT MAP(CLR => two_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_66,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_23);


b2v_r3 : reg_one
PORT MAP(CLR => three_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_68,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_21);


b2v_r4 : reg_one
PORT MAP(CLR => four_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_70,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_8);


b2v_r5 : reg_one
PORT MAP(CLR => five_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_72,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_7);


b2v_r6 : reg_one
PORT MAP(CLR => six_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_74,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_18);


b2v_r7 : reg_one
PORT MAP(CLR => seven_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_76,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_17);


b2v_r8 : reg_one
PORT MAP(CLR => eight_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_78,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_4);


b2v_r9 : reg_one
PORT MAP(CLR => nine_clr,
		 CLK => clk,
		 WRT => SYNTHESIZED_WIRE_80,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_14);


b2v_ram : ram
PORT MAP(clock => clk,
		 readin => ram_rd,
		 writein => ram_wrt,
		 address => SYNTHESIZED_WIRE_82,
		 datain => SYNTHESIZED_WIRE_95,
		 dataout => SYNTHESIZED_WIRE_49);


b2v_rcse : reg_one
PORT MAP(CLR => cse_clr,
		 CLK => clk,
		 WRT => cse_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_27);


b2v_rhi : reg_one
PORT MAP(CLR => hi_clr,
		 CLK => clk,
		 WRT => hi_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_10);


b2v_rin : reg_one
PORT MAP(CLR => input_clr,
		 CLK => clk,
		 WRT => input_wrt,
		 D => input,
		 Q => SYNTHESIZED_WIRE_11);


b2v_rlo : reg_one
PORT MAP(CLR => lo_clr,
		 CLK => clk,
		 WRT => lo_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_12);


b2v_rop : opcode_register
PORT MAP(CLR => opcode_clr,
		 CLK => clk,
		 WRT => opcode_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_3);


b2v_rpc : pcreg
PORT MAP(CLR => pc_clr,
		 CLK => clk,
		 WRT => pc_wrt,
		 INC => pc_inc,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_16);


b2v_ry : reg_one
PORT MAP(CLR => y_clr,
		 CLK => clk,
		 WRT => y_wrt,
		 D => SYNTHESIZED_WIRE_95,
		 Q => SYNTHESIZED_WIRE_2);


b2v_rz : reg_z
PORT MAP(D => SYNTHESIZED_WIRE_90,
		 hi => SYNTHESIZED_WIRE_91,
		 lo => SYNTHESIZED_WIRE_92);


b2v_rzhi : reg_one
PORT MAP(CLR => zhi_clr,
		 CLK => clk,
		 WRT => zhi_wrt,
		 D => SYNTHESIZED_WIRE_91,
		 Q => SYNTHESIZED_WIRE_25);


b2v_rzlo : reg_one
PORT MAP(CLR => zlo_clr,
		 CLK => clk,
		 WRT => zlo_wrt,
		 D => SYNTHESIZED_WIRE_92,
		 Q => SYNTHESIZED_WIRE_26);


b2v_se_dec : se_decoder
PORT MAP(ione => SYNTHESIZED_WIRE_93,
		 itwo => SYNTHESIZED_WIRE_94,
		 zero => SYNTHESIZED_WIRE_50,
		 one => SYNTHESIZED_WIRE_52,
		 two => SYNTHESIZED_WIRE_66,
		 three => SYNTHESIZED_WIRE_68,
		 four => SYNTHESIZED_WIRE_70,
		 five => SYNTHESIZED_WIRE_72,
		 six => SYNTHESIZED_WIRE_74,
		 seven => SYNTHESIZED_WIRE_76,
		 eight => SYNTHESIZED_WIRE_78,
		 nine => SYNTHESIZED_WIRE_80,
		 ten => SYNTHESIZED_WIRE_54,
		 eleven => SYNTHESIZED_WIRE_56,
		 twelve => SYNTHESIZED_WIRE_58,
		 thirteen => SYNTHESIZED_WIRE_60,
		 fourteen => SYNTHESIZED_WIRE_62,
		 fifteen => SYNTHESIZED_WIRE_64,
		 zero_out => SYNTHESIZED_WIRE_29,
		 one_out => SYNTHESIZED_WIRE_30,
		 two_out => SYNTHESIZED_WIRE_31,
		 three_out => SYNTHESIZED_WIRE_32,
		 four_out => SYNTHESIZED_WIRE_33,
		 five_out => SYNTHESIZED_WIRE_34,
		 six_out => SYNTHESIZED_WIRE_35,
		 seven_out => SYNTHESIZED_WIRE_36,
		 eight_out => SYNTHESIZED_WIRE_37,
		 nine_out => SYNTHESIZED_WIRE_38,
		 ten_out => SYNTHESIZED_WIRE_39,
		 eleven_out => SYNTHESIZED_WIRE_40,
		 twelve_out => SYNTHESIZED_WIRE_41,
		 thirteen_out => SYNTHESIZED_WIRE_42,
		 fourteen_out => SYNTHESIZED_WIRE_43,
		 fifteen_out => SYNTHESIZED_WIRE_44);


b2v_se_enc : select_encode
PORT MAP(Gra => gra_in,
		 Grb => grb_in,
		 Grc => grc_in,
		 Rin => rinto,
		 Rout => rout,
		 BAout => ba_out,
		 IR => ir_in,
		 C_sign_extended => SYNTHESIZED_WIRE_63,
		 R0in => SYNTHESIZED_WIRE_93,
		 R0out => SYNTHESIZED_WIRE_94);


END bdf_type;