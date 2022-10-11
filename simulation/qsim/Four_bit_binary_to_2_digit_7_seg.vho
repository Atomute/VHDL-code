-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "10/11/2022 20:08:09"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Four_bit_binary_to_2_digit_7_seg IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	A : IN std_logic_vector(4 DOWNTO 0);
	B : IN std_logic_vector(4 DOWNTO 0);
	ctrl_M : IN std_logic;
	s : BUFFER std_logic_vector(4 DOWNTO 0);
	V : BUFFER std_logic;
	C : BUFFER std_logic;
	seven_seg_digit_1 : BUFFER std_logic_vector(6 DOWNTO 0);
	seven_seg_digit_2 : BUFFER std_logic_vector(6 DOWNTO 0);
	seven_seg_digit_3 : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END Four_bit_binary_to_2_digit_7_seg;

ARCHITECTURE structure OF Four_bit_binary_to_2_digit_7_seg IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_A : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_ctrl_M : std_logic;
SIGNAL ww_s : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_V : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL ww_seven_seg_digit_1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seven_seg_digit_2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seven_seg_digit_3 : std_logic_vector(6 DOWNTO 0);
SIGNAL \s[0]~output_o\ : std_logic;
SIGNAL \s[1]~output_o\ : std_logic;
SIGNAL \s[2]~output_o\ : std_logic;
SIGNAL \s[3]~output_o\ : std_logic;
SIGNAL \s[4]~output_o\ : std_logic;
SIGNAL \V~output_o\ : std_logic;
SIGNAL \C~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[0]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[1]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[2]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[3]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[4]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[5]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_1[6]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[0]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[1]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[2]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[3]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[4]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[5]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_2[6]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[0]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[1]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[2]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[3]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[4]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[5]~output_o\ : std_logic;
SIGNAL \seven_seg_digit_3[6]~output_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \addsub|sum1|sum~0_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \ctrl_M~input_o\ : std_logic;
SIGNAL \addsub|sum2|sum~combout\ : std_logic;
SIGNAL \addsub|sum2|C_out~combout\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \addsub|sum3|sum~0_combout\ : std_logic;
SIGNAL \addsub|sum3|sum~combout\ : std_logic;
SIGNAL \addsub|comb~0_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \addsub|sum4|sum~0_combout\ : std_logic;
SIGNAL \addsub|sum4|sum~combout\ : std_logic;
SIGNAL \addsub|comb~1_combout\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \addsub|sum5|sum~0_combout\ : std_logic;
SIGNAL \addsub|sum5|sum~combout\ : std_logic;
SIGNAL \addsub|sum4|C_out~combout\ : std_logic;
SIGNAL \addsub|V~combout\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \addsub|sum3|C_out~combout\ : std_logic;
SIGNAL \addsub|sum1|C_out~0_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~18\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~17_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~13_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_4~5_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~18\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~22_cout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~5_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_1[0]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~9_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_1[1]~1_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_1[2]~2_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|op_5~17_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_1[3]~3_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux6~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux5~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux4~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux3~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux2~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux1~0_combout\ : std_logic;
SIGNAL \seven_seg_display_1|Mux0~0_combout\ : std_logic;
SIGNAL \addsub|sum2|C_out~0_combout\ : std_logic;
SIGNAL \addsub|sum2|C_out~1_combout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~18\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~14\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~10\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~6\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~5_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~9_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0_combout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~13_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_4~17_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1_combout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~26_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~22_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~18_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~14_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~10_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~6_cout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~18\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~19\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~5_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_2[0]~0_combout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~9_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_2[1]~1_combout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~13_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_2[2]~2_combout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|op_5~17_sumout\ : std_logic;
SIGNAL \convert_binary|int_data_2[3]~3_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux6~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux5~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux4~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux3~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux2~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux1~0_combout\ : std_logic;
SIGNAL \seven_seg_display_2|Mux0~0_combout\ : std_logic;
SIGNAL \seven_seg_display_3|seven_seg[6]~0_combout\ : std_logic;
SIGNAL \convert_binary|int_data_2\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \seven_seg_display_1|seven_seg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \seven_seg_display_2|seven_seg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \convert_binary|int_data_1\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \seven_seg_display_3|seven_seg\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \convert_binary|int_data_3\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \addsub|ALT_INV_V~combout\ : std_logic;
SIGNAL \addsub|sum4|ALT_INV_C_out~combout\ : std_logic;
SIGNAL \addsub|sum5|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \addsub|ALT_INV_comb~1_combout\ : std_logic;
SIGNAL \addsub|sum4|ALT_INV_sum~combout\ : std_logic;
SIGNAL \addsub|sum4|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \addsub|ALT_INV_comb~0_combout\ : std_logic;
SIGNAL \addsub|sum3|ALT_INV_sum~combout\ : std_logic;
SIGNAL \addsub|sum3|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \addsub|sum2|ALT_INV_C_out~combout\ : std_logic;
SIGNAL \addsub|sum2|ALT_INV_sum~combout\ : std_logic;
SIGNAL \addsub|sum1|ALT_INV_sum~0_combout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ : std_logic;
SIGNAL \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ : std_logic;
SIGNAL \ALT_INV_B[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_ctrl_M~input_o\ : std_logic;
SIGNAL \ALT_INV_B[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_B[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_A[0]~input_o\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~1_combout\ : std_logic;
SIGNAL \addsub|sum2|ALT_INV_C_out~1_combout\ : std_logic;
SIGNAL \addsub|sum2|ALT_INV_C_out~0_combout\ : std_logic;
SIGNAL \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~0_combout\ : std_logic;
SIGNAL \addsub|sum3|ALT_INV_C_out~combout\ : std_logic;
SIGNAL \addsub|sum1|ALT_INV_C_out~0_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[17]~1_combout\ : std_logic;
SIGNAL \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[15]~0_combout\ : std_logic;
SIGNAL \convert_binary|ALT_INV_int_data_3\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \convert_binary|ALT_INV_int_data_2\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \convert_binary|ALT_INV_int_data_1\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_A <= A;
ww_B <= B;
ww_ctrl_M <= ctrl_M;
s <= ww_s;
V <= ww_V;
C <= ww_C;
seven_seg_digit_1 <= ww_seven_seg_digit_1;
seven_seg_digit_2 <= ww_seven_seg_digit_2;
seven_seg_digit_3 <= ww_seven_seg_digit_3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\addsub|ALT_INV_V~combout\ <= NOT \addsub|V~combout\;
\addsub|sum4|ALT_INV_C_out~combout\ <= NOT \addsub|sum4|C_out~combout\;
\addsub|sum5|ALT_INV_sum~0_combout\ <= NOT \addsub|sum5|sum~0_combout\;
\addsub|ALT_INV_comb~1_combout\ <= NOT \addsub|comb~1_combout\;
\addsub|sum4|ALT_INV_sum~combout\ <= NOT \addsub|sum4|sum~combout\;
\addsub|sum4|ALT_INV_sum~0_combout\ <= NOT \addsub|sum4|sum~0_combout\;
\addsub|ALT_INV_comb~0_combout\ <= NOT \addsub|comb~0_combout\;
\addsub|sum3|ALT_INV_sum~combout\ <= NOT \addsub|sum3|sum~combout\;
\addsub|sum3|ALT_INV_sum~0_combout\ <= NOT \addsub|sum3|sum~0_combout\;
\addsub|sum2|ALT_INV_C_out~combout\ <= NOT \addsub|sum2|C_out~combout\;
\addsub|sum2|ALT_INV_sum~combout\ <= NOT \addsub|sum2|sum~combout\;
\addsub|sum1|ALT_INV_sum~0_combout\ <= NOT \addsub|sum1|sum~0_combout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_4~17_sumout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_4~13_sumout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_4~9_sumout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_4~5_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_4~17_sumout\;
\convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ <= NOT \convert_binary|Mod1|auto_generated|divider|divider|op_5~17_sumout\;
\convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ <= NOT \convert_binary|Mod1|auto_generated|divider|divider|op_5~13_sumout\;
\convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ <= NOT \convert_binary|Mod1|auto_generated|divider|divider|op_5~9_sumout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\;
\convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ <= NOT \convert_binary|Mod1|auto_generated|divider|divider|op_5~5_sumout\;
\convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_5~17_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_4~13_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_5~9_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_4~5_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_5~5_sumout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\;
\ALT_INV_B[4]~input_o\ <= NOT \B[4]~input_o\;
\ALT_INV_A[4]~input_o\ <= NOT \A[4]~input_o\;
\ALT_INV_B[3]~input_o\ <= NOT \B[3]~input_o\;
\ALT_INV_A[3]~input_o\ <= NOT \A[3]~input_o\;
\ALT_INV_B[2]~input_o\ <= NOT \B[2]~input_o\;
\ALT_INV_A[2]~input_o\ <= NOT \A[2]~input_o\;
\ALT_INV_ctrl_M~input_o\ <= NOT \ctrl_M~input_o\;
\ALT_INV_B[1]~input_o\ <= NOT \B[1]~input_o\;
\ALT_INV_A[1]~input_o\ <= NOT \A[1]~input_o\;
\ALT_INV_B[0]~input_o\ <= NOT \B[0]~input_o\;
\ALT_INV_A[0]~input_o\ <= NOT \A[0]~input_o\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~1_combout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1_combout\;
\addsub|sum2|ALT_INV_C_out~1_combout\ <= NOT \addsub|sum2|C_out~1_combout\;
\addsub|sum2|ALT_INV_C_out~0_combout\ <= NOT \addsub|sum2|C_out~0_combout\;
\convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~0_combout\ <= NOT \convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0_combout\;
\addsub|sum3|ALT_INV_C_out~combout\ <= NOT \addsub|sum3|C_out~combout\;
\addsub|sum1|ALT_INV_C_out~0_combout\ <= NOT \addsub|sum1|C_out~0_combout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[17]~1_combout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\;
\convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[15]~0_combout\ <= NOT \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\;
\convert_binary|ALT_INV_int_data_3\(1) <= NOT \convert_binary|int_data_3\(1);
\convert_binary|ALT_INV_int_data_2\(3) <= NOT \convert_binary|int_data_2\(3);
\convert_binary|ALT_INV_int_data_2\(2) <= NOT \convert_binary|int_data_2\(2);
\convert_binary|ALT_INV_int_data_2\(1) <= NOT \convert_binary|int_data_2\(1);
\convert_binary|ALT_INV_int_data_2\(0) <= NOT \convert_binary|int_data_2\(0);
\convert_binary|ALT_INV_int_data_1\(3) <= NOT \convert_binary|int_data_1\(3);
\convert_binary|ALT_INV_int_data_1\(2) <= NOT \convert_binary|int_data_1\(2);
\convert_binary|ALT_INV_int_data_1\(1) <= NOT \convert_binary|int_data_1\(1);
\convert_binary|ALT_INV_int_data_1\(0) <= NOT \convert_binary|int_data_1\(0);

\s[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum1|sum~0_combout\,
	devoe => ww_devoe,
	o => \s[0]~output_o\);

\s[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum2|sum~combout\,
	devoe => ww_devoe,
	o => \s[1]~output_o\);

\s[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum3|sum~combout\,
	devoe => ww_devoe,
	o => \s[2]~output_o\);

\s[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum4|sum~combout\,
	devoe => ww_devoe,
	o => \s[3]~output_o\);

\s[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum5|sum~combout\,
	devoe => ww_devoe,
	o => \s[4]~output_o\);

\V~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|V~combout\,
	devoe => ww_devoe,
	o => \V~output_o\);

\C~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \addsub|sum4|C_out~combout\,
	devoe => ww_devoe,
	o => \C~output_o\);

\seven_seg_digit_1[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(0),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[0]~output_o\);

\seven_seg_digit_1[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(1),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[1]~output_o\);

\seven_seg_digit_1[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(2),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[2]~output_o\);

\seven_seg_digit_1[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(3),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[3]~output_o\);

\seven_seg_digit_1[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(4),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[4]~output_o\);

\seven_seg_digit_1[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(5),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[5]~output_o\);

\seven_seg_digit_1[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_1|seven_seg\(6),
	devoe => ww_devoe,
	o => \seven_seg_digit_1[6]~output_o\);

\seven_seg_digit_2[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(0),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[0]~output_o\);

\seven_seg_digit_2[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(1),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[1]~output_o\);

\seven_seg_digit_2[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(2),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[2]~output_o\);

\seven_seg_digit_2[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(3),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[3]~output_o\);

\seven_seg_digit_2[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(4),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[4]~output_o\);

\seven_seg_digit_2[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(5),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[5]~output_o\);

\seven_seg_digit_2[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_2|seven_seg\(6),
	devoe => ww_devoe,
	o => \seven_seg_digit_2[6]~output_o\);

\seven_seg_digit_3[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seven_seg_digit_3[0]~output_o\);

\seven_seg_digit_3[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_3|seven_seg\(1),
	devoe => ww_devoe,
	o => \seven_seg_digit_3[1]~output_o\);

\seven_seg_digit_3[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_3|seven_seg\(2),
	devoe => ww_devoe,
	o => \seven_seg_digit_3[2]~output_o\);

\seven_seg_digit_3[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seven_seg_digit_3[3]~output_o\);

\seven_seg_digit_3[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seven_seg_digit_3[4]~output_o\);

\seven_seg_digit_3[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seven_seg_digit_3[5]~output_o\);

\seven_seg_digit_3[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \seven_seg_display_3|seven_seg\(6),
	devoe => ww_devoe,
	o => \seven_seg_digit_3[6]~output_o\);

\A[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

\B[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

\addsub|sum1|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum1|sum~0_combout\ = !\A[0]~input_o\ $ (!\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	combout => \addsub|sum1|sum~0_combout\);

\A[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

\B[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

\ctrl_M~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ctrl_M,
	o => \ctrl_M~input_o\);

\addsub|sum2|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum2|sum~combout\ = ( \ctrl_M~input_o\ & ( !\A[1]~input_o\ $ (!\B[1]~input_o\ $ (((!\A[0]~input_o\ & \B[0]~input_o\)))) ) ) # ( !\ctrl_M~input_o\ & ( !\A[1]~input_o\ $ (!\B[1]~input_o\ $ (((\A[0]~input_o\ & \B[0]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001111011100001001011011101001000011110111000010010110111010010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	datae => \ALT_INV_ctrl_M~input_o\,
	combout => \addsub|sum2|sum~combout\);

\addsub|sum2|C_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum2|C_out~combout\ = ( \ctrl_M~input_o\ & ( (!\A[1]~input_o\ & (!\B[1]~input_o\ & ((!\B[0]~input_o\) # (\A[0]~input_o\)))) # (\A[1]~input_o\ & (((!\B[0]~input_o\) # (!\B[1]~input_o\)) # (\A[0]~input_o\))) ) ) # ( !\ctrl_M~input_o\ & ( 
-- (!\A[1]~input_o\ & (\A[0]~input_o\ & (\B[0]~input_o\ & \B[1]~input_o\))) # (\A[1]~input_o\ & (((\A[0]~input_o\ & \B[0]~input_o\)) # (\B[1]~input_o\))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100011111110111110000110100000001000111111101111100001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	datae => \ALT_INV_ctrl_M~input_o\,
	combout => \addsub|sum2|C_out~combout\);

\A[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

\B[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

\addsub|sum3|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum3|sum~0_combout\ = !\ctrl_M~input_o\ $ (!\A[2]~input_o\ $ (\B[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_B[2]~input_o\,
	combout => \addsub|sum3|sum~0_combout\);

\addsub|sum3|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum3|sum~combout\ = !\addsub|sum2|C_out~combout\ $ (!\addsub|sum3|sum~0_combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \addsub|sum3|ALT_INV_sum~0_combout\,
	combout => \addsub|sum3|sum~combout\);

\addsub|comb~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|comb~0_combout\ = !\ctrl_M~input_o\ $ (!\B[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \ALT_INV_B[2]~input_o\,
	combout => \addsub|comb~0_combout\);

\A[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

\B[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

\addsub|sum4|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum4|sum~0_combout\ = !\ctrl_M~input_o\ $ (!\A[3]~input_o\ $ (\B[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \ALT_INV_A[3]~input_o\,
	datac => \ALT_INV_B[3]~input_o\,
	combout => \addsub|sum4|sum~0_combout\);

\addsub|sum4|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum4|sum~combout\ = !\addsub|sum4|sum~0_combout\ $ (((!\addsub|sum2|C_out~combout\ & ((!\A[2]~input_o\) # (!\addsub|comb~0_combout\))) # (\addsub|sum2|C_out~combout\ & (!\A[2]~input_o\ & !\addsub|comb~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011111101000000101111110100000010111111010000001011111101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \addsub|ALT_INV_comb~0_combout\,
	datad => \addsub|sum4|ALT_INV_sum~0_combout\,
	combout => \addsub|sum4|sum~combout\);

\addsub|comb~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|comb~1_combout\ = !\ctrl_M~input_o\ $ (!\B[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110011001100110011001100110011001100110011001100110011001100110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \ALT_INV_B[3]~input_o\,
	combout => \addsub|comb~1_combout\);

\A[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

\B[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

\addsub|sum5|sum~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum5|sum~0_combout\ = !\ctrl_M~input_o\ $ (!\A[4]~input_o\ $ (\B[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0110100101101001011010010110100101101001011010010110100101101001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \ALT_INV_A[4]~input_o\,
	datac => \ALT_INV_B[4]~input_o\,
	combout => \addsub|sum5|sum~0_combout\);

\addsub|sum5|sum\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum5|sum~combout\ = ( \addsub|comb~1_combout\ & ( \addsub|sum5|sum~0_combout\ & ( (!\A[3]~input_o\ & ((!\addsub|sum2|C_out~combout\ & ((!\A[2]~input_o\) # (!\addsub|comb~0_combout\))) # (\addsub|sum2|C_out~combout\ & (!\A[2]~input_o\ & 
-- !\addsub|comb~0_combout\)))) ) ) ) # ( !\addsub|comb~1_combout\ & ( \addsub|sum5|sum~0_combout\ & ( (!\A[3]~input_o\) # ((!\addsub|sum2|C_out~combout\ & ((!\A[2]~input_o\) # (!\addsub|comb~0_combout\))) # (\addsub|sum2|C_out~combout\ & (!\A[2]~input_o\ & 
-- !\addsub|comb~0_combout\))) ) ) ) # ( \addsub|comb~1_combout\ & ( !\addsub|sum5|sum~0_combout\ & ( ((!\addsub|sum2|C_out~combout\ & (\A[2]~input_o\ & \addsub|comb~0_combout\)) # (\addsub|sum2|C_out~combout\ & ((\addsub|comb~0_combout\) # 
-- (\A[2]~input_o\)))) # (\A[3]~input_o\) ) ) ) # ( !\addsub|comb~1_combout\ & ( !\addsub|sum5|sum~0_combout\ & ( (\A[3]~input_o\ & ((!\addsub|sum2|C_out~combout\ & (\A[2]~input_o\ & \addsub|comb~0_combout\)) # (\addsub|sum2|C_out~combout\ & 
-- ((\addsub|comb~0_combout\) # (\A[2]~input_o\))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111111111111111010001110100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \addsub|ALT_INV_comb~0_combout\,
	datad => \ALT_INV_A[3]~input_o\,
	datae => \addsub|ALT_INV_comb~1_combout\,
	dataf => \addsub|sum5|ALT_INV_sum~0_combout\,
	combout => \addsub|sum5|sum~combout\);

\addsub|sum4|C_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum4|C_out~combout\ = ( \addsub|comb~1_combout\ & ( ((!\addsub|sum2|C_out~combout\ & (\A[2]~input_o\ & \addsub|comb~0_combout\)) # (\addsub|sum2|C_out~combout\ & ((\addsub|comb~0_combout\) # (\A[2]~input_o\)))) # (\A[3]~input_o\) ) ) # ( 
-- !\addsub|comb~1_combout\ & ( (\A[3]~input_o\ & ((!\addsub|sum2|C_out~combout\ & (\A[2]~input_o\ & \addsub|comb~0_combout\)) # (\addsub|sum2|C_out~combout\ & ((\addsub|comb~0_combout\) # (\A[2]~input_o\))))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010111000101111111111100000000000101110001011111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \addsub|ALT_INV_comb~0_combout\,
	datad => \ALT_INV_A[3]~input_o\,
	datae => \addsub|ALT_INV_comb~1_combout\,
	combout => \addsub|sum4|C_out~combout\);

\addsub|V\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|V~combout\ = (!\addsub|sum4|C_out~combout\ & (\A[4]~input_o\ & (!\ctrl_M~input_o\ $ (!\B[4]~input_o\)))) # (\addsub|sum4|C_out~combout\ & (!\A[4]~input_o\ & (!\ctrl_M~input_o\ $ (\B[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010010000011000001001000001100000100100000110000010010000011000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_ctrl_M~input_o\,
	datab => \addsub|sum4|ALT_INV_C_out~combout\,
	datac => \ALT_INV_A[4]~input_o\,
	datad => \ALT_INV_B[4]~input_o\,
	combout => \addsub|V~combout\);

\clock~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

\addsub|sum3|C_out\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum3|C_out~combout\ = (!\addsub|sum2|C_out~combout\ & (\A[2]~input_o\ & \addsub|comb~0_combout\)) # (\addsub|sum2|C_out~combout\ & ((\addsub|comb~0_combout\) # (\A[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001011100010111000101110001011100010111000101110001011100010111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \addsub|ALT_INV_comb~0_combout\,
	combout => \addsub|sum3|C_out~combout\);

\addsub|sum1|C_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum1|C_out~0_combout\ = (!\B[0]~input_o\ & ((\ctrl_M~input_o\))) # (\B[0]~input_o\ & (\A[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_ctrl_M~input_o\,
	combout => \addsub|sum1|C_out~0_combout\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~5_sumout\ = SUM(( !\A[1]~input_o\ $ (!\ctrl_M~input_o\ $ (!\addsub|sum1|C_out~0_combout\ $ (!\B[1]~input_o\))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\ = CARRY(( !\A[1]~input_o\ $ (!\ctrl_M~input_o\ $ (!\addsub|sum1|C_out~0_combout\ $ (!\B[1]~input_o\))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[1]~input_o\,
	datab => \ALT_INV_ctrl_M~input_o\,
	datac => \addsub|sum1|ALT_INV_C_out~0_combout\,
	datad => \ALT_INV_B[1]~input_o\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_4~22_cout\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~5_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\ = SUM(( !\addsub|sum2|C_out~combout\ $ (!\A[2]~input_o\ $ (!\ctrl_M~input_o\ $ (!\B[2]~input_o\))) ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\ = CARRY(( !\addsub|sum2|C_out~combout\ $ (!\A[2]~input_o\ $ (!\ctrl_M~input_o\ $ (!\B[2]~input_o\))) ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \ALT_INV_ctrl_M~input_o\,
	datad => \ALT_INV_B[2]~input_o\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_4~6\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~13_sumout\ = SUM(( !\addsub|sum4|sum~0_combout\ $ (((!\addsub|sum2|C_out~combout\ & ((!\A[2]~input_o\) # (!\addsub|comb~0_combout\))) # (\addsub|sum2|C_out~combout\ & (!\A[2]~input_o\ & 
-- !\addsub|comb~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\ = CARRY(( !\addsub|sum4|sum~0_combout\ $ (((!\addsub|sum2|C_out~combout\ & ((!\A[2]~input_o\) # (!\addsub|comb~0_combout\))) # (\addsub|sum2|C_out~combout\ & (!\A[2]~input_o\ & 
-- !\addsub|comb~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001011111101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \ALT_INV_A[2]~input_o\,
	datac => \addsub|ALT_INV_comb~0_combout\,
	datad => \addsub|sum4|ALT_INV_sum~0_combout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_4~10\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~13_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~17_sumout\ = SUM(( !\addsub|sum5|sum~0_combout\ $ (((!\A[3]~input_o\ & ((!\addsub|comb~1_combout\) # (!\addsub|sum3|C_out~combout\))) # (\A[3]~input_o\ & (!\addsub|comb~1_combout\ & 
-- !\addsub|sum3|C_out~combout\)))) ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~18\ = CARRY(( !\addsub|sum5|sum~0_combout\ $ (((!\A[3]~input_o\ & ((!\addsub|comb~1_combout\) # (!\addsub|sum3|C_out~combout\))) # (\A[3]~input_o\ & (!\addsub|comb~1_combout\ & 
-- !\addsub|sum3|C_out~combout\)))) ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000001111001111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \addsub|ALT_INV_comb~1_combout\,
	datac => \addsub|sum5|ALT_INV_sum~0_combout\,
	datad => \addsub|sum3|ALT_INV_C_out~combout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_4~14\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~17_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~18\);

\convert_binary|Mod0|auto_generated|divider|divider|op_4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_4~18\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\);

\convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\ = (!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_4~13_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum4|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum4|ALT_INV_sum~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	combout => \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\);

\convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ = (!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_4~5_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum2|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_sum~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	combout => \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~5_sumout\ = SUM(( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\ = CARRY(( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datad => \ALT_INV_A[0]~input_o\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~26_cout\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~5_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~9_sumout\ = SUM(( \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\ = CARRY(( \convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\ ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[15]~0_combout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~6\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~9_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\ = SUM(( (!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (((\convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\)))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (!\addsub|sum2|C_out~combout\ $ ((!\addsub|sum3|sum~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\ = CARRY(( (!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (((\convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\)))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (!\addsub|sum2|C_out~combout\ $ ((!\addsub|sum3|sum~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001001011011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \addsub|sum3|ALT_INV_sum~0_combout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~10\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~17_sumout\ = SUM(( \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\ ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\ ))
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~18\ = CARRY(( \convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\ ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[17]~1_combout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~14\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~17_sumout\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~18\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~22_cout\ = CARRY(( (!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (((\convert_binary|Mod0|auto_generated|divider|divider|op_4~17_sumout\)))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (!\addsub|sum4|C_out~combout\ $ ((!\addsub|sum5|sum~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001001011011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum4|ALT_INV_C_out~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \addsub|sum5|ALT_INV_sum~0_combout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~18\,
	cout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~22_cout\);

\convert_binary|Mod0|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Mod0|auto_generated|divider|divider|op_5~22_cout\,
	sumout => \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\);

\convert_binary|int_data_1[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_1[0]~0_combout\ = (!\addsub|V~combout\ & ((!\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_5~5_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\addsub|sum1|sum~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000010011000100000001001100010000000100110001000000010011000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum1|ALT_INV_sum~0_combout\,
	datab => \addsub|ALT_INV_V~combout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	combout => \convert_binary|int_data_1[0]~0_combout\);

\reset~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\convert_binary|int_data_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_1[0]~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_1\(0));

\convert_binary|int_data_1[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_1[1]~1_combout\ = ((!\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_5~9_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\convert_binary|Mod0|auto_generated|divider|divider|StageOut[15]~0_combout\))) # (\addsub|V~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011111110111010101111111011101010111111101110101011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[15]~0_combout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	combout => \convert_binary|int_data_1[1]~1_combout\);

\convert_binary|int_data_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_1[1]~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_1\(1));

\convert_binary|int_data_1[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_1[2]~2_combout\ = ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\ & ( (!\addsub|V~combout\ & 
-- ((!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\))) # (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum3|sum~combout\)))) ) ) ) # 
-- ( !\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\ & ( !\addsub|V~combout\ ) ) ) # ( \convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ( 
-- !\convert_binary|Mod0|auto_generated|divider|divider|op_5~13_sumout\ & ( (!\addsub|V~combout\ & ((!\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_4~9_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum3|sum~combout\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001001100010011001100110011000000010011000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum3|ALT_INV_sum~combout\,
	datab => \addsub|ALT_INV_V~combout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	datae => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	dataf => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	combout => \convert_binary|int_data_1[2]~2_combout\);

\convert_binary|int_data_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_1[2]~2_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_1\(2));

\convert_binary|int_data_1[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_1[3]~3_combout\ = ((!\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & ((\convert_binary|Mod0|auto_generated|divider|divider|op_5~17_sumout\))) # 
-- (\convert_binary|Mod0|auto_generated|divider|divider|op_5~1_sumout\ & (\convert_binary|Mod0|auto_generated|divider|divider|StageOut[17]~1_combout\))) # (\addsub|V~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101011111110111010101111111011101010111111101110101011111110111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_StageOut[17]~1_combout\,
	datac => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \convert_binary|Mod0|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	combout => \convert_binary|int_data_1[3]~3_combout\);

\convert_binary|int_data_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_1[3]~3_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_1\(3));

\seven_seg_display_1|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux6~0_combout\ = (!\convert_binary|int_data_1\(1) & (!\convert_binary|int_data_1\(3) & (!\convert_binary|int_data_1\(0) $ (!\convert_binary|int_data_1\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100000000000010010000000000001001000000000000100100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux6~0_combout\);

\seven_seg_display_1|seven_seg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(0));

\seven_seg_display_1|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux5~0_combout\ = (!\convert_binary|int_data_1\(2) & (((\convert_binary|int_data_1\(1) & \convert_binary|int_data_1\(3))))) # (\convert_binary|int_data_1\(2) & ((!\convert_binary|int_data_1\(0) $ (!\convert_binary|int_data_1\(1))) # 
-- (\convert_binary|int_data_1\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000111111000001100011111100000110001111110000011000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux5~0_combout\);

\seven_seg_display_1|seven_seg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(1));

\seven_seg_display_1|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux4~0_combout\ = (!\convert_binary|int_data_1\(2) & (\convert_binary|int_data_1\(1) & ((!\convert_binary|int_data_1\(0)) # (\convert_binary|int_data_1\(3))))) # (\convert_binary|int_data_1\(2) & (((\convert_binary|int_data_1\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000111111001000000011111100100000001111110010000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux4~0_combout\);

\seven_seg_display_1|seven_seg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(2));

\seven_seg_display_1|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux3~0_combout\ = (!\convert_binary|int_data_1\(3) & ((!\convert_binary|int_data_1\(0) & (!\convert_binary|int_data_1\(1) & \convert_binary|int_data_1\(2))) # (\convert_binary|int_data_1\(0) & (!\convert_binary|int_data_1\(1) $ 
-- (\convert_binary|int_data_1\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100100000000010010010000000001001001000000000100100100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux3~0_combout\);

\seven_seg_display_1|seven_seg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(3));

\seven_seg_display_1|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux2~0_combout\ = (!\convert_binary|int_data_1\(1) & ((!\convert_binary|int_data_1\(2) & (\convert_binary|int_data_1\(0))) # (\convert_binary|int_data_1\(2) & ((!\convert_binary|int_data_1\(3)))))) # (\convert_binary|int_data_1\(1) & 
-- (\convert_binary|int_data_1\(0) & ((!\convert_binary|int_data_1\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101000000010111010100000001011101010000000101110101000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux2~0_combout\);

\seven_seg_display_1|seven_seg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(4));

\seven_seg_display_1|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux1~0_combout\ = (!\convert_binary|int_data_1\(3) & ((!\convert_binary|int_data_1\(0) & (\convert_binary|int_data_1\(1) & !\convert_binary|int_data_1\(2))) # (\convert_binary|int_data_1\(0) & ((!\convert_binary|int_data_1\(2)) # 
-- (\convert_binary|int_data_1\(1))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000100000000011100010000000001110001000000000111000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux1~0_combout\);

\seven_seg_display_1|seven_seg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(5));

\seven_seg_display_1|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_1|Mux0~0_combout\ = (!\convert_binary|int_data_1\(3) & ((!\convert_binary|int_data_1\(1) & ((!\convert_binary|int_data_1\(2)))) # (\convert_binary|int_data_1\(1) & (\convert_binary|int_data_1\(0) & \convert_binary|int_data_1\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000100000000110000010000000011000001000000001100000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_1\(0),
	datab => \convert_binary|ALT_INV_int_data_1\(1),
	datac => \convert_binary|ALT_INV_int_data_1\(2),
	datad => \convert_binary|ALT_INV_int_data_1\(3),
	combout => \seven_seg_display_1|Mux0~0_combout\);

\seven_seg_display_1|seven_seg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_1|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_1|seven_seg\(6));

\addsub|sum2|C_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum2|C_out~0_combout\ = (\A[1]~input_o\ & (!\B[1]~input_o\ $ (!\ctrl_M~input_o\)))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001010000010100000101000001010000010100000101000001010000010100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[1]~input_o\,
	datab => \ALT_INV_B[1]~input_o\,
	datac => \ALT_INV_ctrl_M~input_o\,
	combout => \addsub|sum2|C_out~0_combout\);

\addsub|sum2|C_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \addsub|sum2|C_out~1_combout\ = ( \ctrl_M~input_o\ & ( (!\A[0]~input_o\ & (!\B[0]~input_o\ & (!\A[1]~input_o\ $ (\B[1]~input_o\)))) # (\A[0]~input_o\ & ((!\A[1]~input_o\ $ (\B[1]~input_o\)))) ) ) # ( !\ctrl_M~input_o\ & ( (\A[0]~input_o\ & (\B[0]~input_o\ 
-- & (!\A[1]~input_o\ $ (!\B[1]~input_o\)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100010000110100000000110100000001000100001101000000001101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[0]~input_o\,
	datab => \ALT_INV_B[0]~input_o\,
	datac => \ALT_INV_A[1]~input_o\,
	datad => \ALT_INV_B[1]~input_o\,
	datae => \ALT_INV_ctrl_M~input_o\,
	combout => \addsub|sum2|C_out~1_combout\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~17_sumout\ = SUM(( !\A[1]~input_o\ $ (!\ctrl_M~input_o\ $ (!\addsub|sum1|C_out~0_combout\ $ (!\B[1]~input_o\))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\ ))
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~18\ = CARRY(( !\A[1]~input_o\ $ (!\ctrl_M~input_o\ $ (!\addsub|sum1|C_out~0_combout\ $ (!\B[1]~input_o\))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000110100110010110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[1]~input_o\,
	datab => \ALT_INV_ctrl_M~input_o\,
	datac => \addsub|sum1|ALT_INV_C_out~0_combout\,
	datad => \ALT_INV_B[1]~input_o\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_4~22_cout\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_4~17_sumout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_4~18\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~13_sumout\ = SUM(( !\A[2]~input_o\ $ (!\addsub|comb~0_combout\ $ (((\addsub|sum2|C_out~1_combout\) # (\addsub|sum2|C_out~0_combout\)))) ) + ( GND ) + ( 
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~18\ ))
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~14\ = CARRY(( !\A[2]~input_o\ $ (!\addsub|comb~0_combout\ $ (((\addsub|sum2|C_out~1_combout\) # (\addsub|sum2|C_out~0_combout\)))) ) + ( GND ) + ( 
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000110100110011001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datab => \addsub|ALT_INV_comb~0_combout\,
	datac => \addsub|sum2|ALT_INV_C_out~0_combout\,
	datad => \addsub|sum2|ALT_INV_C_out~1_combout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_4~18\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_4~13_sumout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_4~14\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~9_sumout\ = SUM(( !\addsub|sum4|sum~0_combout\ $ (((!\A[2]~input_o\ & ((!\addsub|comb~0_combout\) # (!\addsub|sum2|C_out~combout\))) # (\A[2]~input_o\ & (!\addsub|comb~0_combout\ & 
-- !\addsub|sum2|C_out~combout\)))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~14\ ))
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~10\ = CARRY(( !\addsub|sum4|sum~0_combout\ $ (((!\A[2]~input_o\ & ((!\addsub|comb~0_combout\) # (!\addsub|sum2|C_out~combout\))) # (\A[2]~input_o\ & (!\addsub|comb~0_combout\ & 
-- !\addsub|sum2|C_out~combout\)))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001111001111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[2]~input_o\,
	datab => \addsub|ALT_INV_comb~0_combout\,
	datac => \addsub|sum4|ALT_INV_sum~0_combout\,
	datad => \addsub|sum2|ALT_INV_C_out~combout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_4~14\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_4~9_sumout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_4~10\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~5_sumout\ = SUM(( !\addsub|sum5|sum~0_combout\ $ (((!\A[3]~input_o\ & ((!\addsub|comb~1_combout\) # (!\addsub|sum3|C_out~combout\))) # (\A[3]~input_o\ & (!\addsub|comb~1_combout\ & 
-- !\addsub|sum3|C_out~combout\)))) ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~10\ ))
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~6\ = CARRY(( !\addsub|sum5|sum~0_combout\ $ (((!\A[3]~input_o\ & ((!\addsub|comb~1_combout\) # (!\addsub|sum3|C_out~combout\))) # (\A[3]~input_o\ & (!\addsub|comb~1_combout\ & 
-- !\addsub|sum3|C_out~combout\)))) ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000001111001111000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_A[3]~input_o\,
	datab => \addsub|ALT_INV_comb~1_combout\,
	datac => \addsub|sum5|ALT_INV_sum~0_combout\,
	datad => \addsub|sum3|ALT_INV_C_out~combout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_4~10\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_4~5_sumout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_4~6\);

\convert_binary|Div0|auto_generated|divider|divider|op_4~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_4~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_4~6\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\);

\convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0_combout\ = (!\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Div0|auto_generated|divider|divider|op_4~9_sumout\))) # 
-- (\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum4|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum4|ALT_INV_sum~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~9_sumout\,
	combout => \convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0_combout\);

\convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1_combout\ = (!\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & ((\convert_binary|Div0|auto_generated|divider|divider|op_4~17_sumout\))) # 
-- (\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (\addsub|sum2|sum~combout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0001110100011101000111010001110100011101000111010001110100011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_sum~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~17_sumout\,
	combout => \convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1_combout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~26\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~26_cout\ = CARRY(( VCC ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => GND,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~26_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~22\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~22_cout\ = CARRY(( !\B[0]~input_o\ $ (!\A[0]~input_o\) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~26_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101010110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B[0]~input_o\,
	datad => \ALT_INV_A[0]~input_o\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~26_cout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~22_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~18\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~18_cout\ = CARRY(( \convert_binary|Div0|auto_generated|divider|divider|StageOut[15]~1_combout\ ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~22_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[15]~1_combout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~22_cout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~18_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~14\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~14_cout\ = CARRY(( (!\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (((\convert_binary|Div0|auto_generated|divider|divider|op_4~13_sumout\)))) # 
-- (\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (!\addsub|sum2|C_out~combout\ $ ((!\addsub|sum3|sum~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~18_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001001011011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum2|ALT_INV_C_out~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \addsub|sum3|ALT_INV_sum~0_combout\,
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~13_sumout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~18_cout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~14_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~10\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~10_cout\ = CARRY(( \convert_binary|Div0|auto_generated|divider|divider|StageOut[17]~0_combout\ ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~14_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_StageOut[17]~0_combout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~14_cout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~10_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~6_cout\ = CARRY(( (!\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (((\convert_binary|Div0|auto_generated|divider|divider|op_4~5_sumout\)))) # 
-- (\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ & (!\addsub|sum4|C_out~combout\ $ ((!\addsub|sum5|sum~0_combout\)))) ) + ( VCC ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~10_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000001001011011110",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|sum4|ALT_INV_C_out~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \addsub|sum5|ALT_INV_sum~0_combout\,
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~5_sumout\,
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~10_cout\,
	cout => \convert_binary|Div0|auto_generated|divider|divider|op_5~6_cout\);

\convert_binary|Div0|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( GND ) + ( \convert_binary|Div0|auto_generated|divider|divider|op_5~6_cout\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Div0|auto_generated|divider|divider|op_5~6_cout\,
	sumout => \convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\);

\convert_binary|Mod1|auto_generated|divider|divider|op_5~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~5_sumout\ = SUM(( !\convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\ ) + ( !VCC ) + ( !VCC ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\ = CARRY(( !\convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\ ) + ( !VCC ) + ( !VCC ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\ = SHARE(VCC)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	cin => GND,
	sharein => GND,
	sumout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~5_sumout\,
	cout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\,
	shareout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\);

\convert_binary|Mod1|auto_generated|divider|divider|op_5~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~9_sumout\ = SUM(( !\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\ ) + ( 
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\ = CARRY(( !\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\ ) + ( 
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\ = SHARE(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111100000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datad => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	cin => \convert_binary|Mod1|auto_generated|divider|divider|op_5~6\,
	sharein => \convert_binary|Mod1|auto_generated|divider|divider|op_5~7\,
	sumout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~9_sumout\,
	cout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\,
	shareout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\);

\convert_binary|Mod1|auto_generated|divider|divider|op_5~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~13_sumout\ = SUM(( VCC ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\ = CARRY(( VCC ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\ = SHARE(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Mod1|auto_generated|divider|divider|op_5~10\,
	sharein => \convert_binary|Mod1|auto_generated|divider|divider|op_5~11\,
	sumout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~13_sumout\,
	cout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\,
	shareout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\);

\convert_binary|Mod1|auto_generated|divider|divider|op_5~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~17_sumout\ = SUM(( GND ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~18\ = CARRY(( GND ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\ ))
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~19\ = SHARE(GND)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Mod1|auto_generated|divider|divider|op_5~14\,
	sharein => \convert_binary|Mod1|auto_generated|divider|divider|op_5~15\,
	sumout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~17_sumout\,
	cout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~18\,
	shareout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~19\);

\convert_binary|Mod1|auto_generated|divider|divider|op_5~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ = SUM(( VCC ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~19\ ) + ( \convert_binary|Mod1|auto_generated|divider|divider|op_5~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000001111111111111111",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	cin => \convert_binary|Mod1|auto_generated|divider|divider|op_5~18\,
	sharein => \convert_binary|Mod1|auto_generated|divider|divider|op_5~19\,
	sumout => \convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\);

\convert_binary|int_data_2[0]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_2[0]~0_combout\ = (!\addsub|V~combout\ & ((!\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & ((\convert_binary|Mod1|auto_generated|divider|divider|op_5~5_sumout\))) # 
-- (\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & (!\convert_binary|Div0|auto_generated|divider|divider|op_5~1_sumout\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100010101000000010001010100000001000101010000000100010101000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~5_sumout\,
	combout => \convert_binary|int_data_2[0]~0_combout\);

\convert_binary|int_data_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_2[0]~0_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_2\(0));

\convert_binary|int_data_2[1]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_2[1]~1_combout\ = ((!\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & ((\convert_binary|Mod1|auto_generated|divider|divider|op_5~9_sumout\))) # 
-- (\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & (!\convert_binary|Div0|auto_generated|divider|divider|op_4~1_sumout\))) # (\addsub|V~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110111111101010111011111110101011101111111010101110111111101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Div0|auto_generated|divider|divider|ALT_INV_op_4~1_sumout\,
	datac => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datad => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~9_sumout\,
	combout => \convert_binary|int_data_2[1]~1_combout\);

\convert_binary|int_data_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_2[1]~1_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_2\(1));

\convert_binary|int_data_2[2]~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_2[2]~2_combout\ = (!\addsub|V~combout\ & (!\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & \convert_binary|Mod1|auto_generated|divider|divider|op_5~13_sumout\))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000100000001000000010000000100000001000000010000000100000001000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~13_sumout\,
	combout => \convert_binary|int_data_2[2]~2_combout\);

\convert_binary|int_data_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_2[2]~2_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_2\(2));

\convert_binary|int_data_2[3]~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \convert_binary|int_data_2[3]~3_combout\ = ((!\convert_binary|Mod1|auto_generated|divider|divider|op_5~1_sumout\ & \convert_binary|Mod1|auto_generated|divider|divider|op_5~17_sumout\)) # (\addsub|V~combout\)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101011101010111010101110101011101010111010101110101011101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \addsub|ALT_INV_V~combout\,
	datab => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~1_sumout\,
	datac => \convert_binary|Mod1|auto_generated|divider|divider|ALT_INV_op_5~17_sumout\,
	combout => \convert_binary|int_data_2[3]~3_combout\);

\convert_binary|int_data_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_2[3]~3_combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_2\(3));

\seven_seg_display_2|Mux6~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux6~0_combout\ = (!\convert_binary|int_data_2\(1) & (!\convert_binary|int_data_2\(3) & (!\convert_binary|int_data_2\(0) $ (!\convert_binary|int_data_2\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100000000000010010000000000001001000000000000100100000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux6~0_combout\);

\seven_seg_display_2|seven_seg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(0));

\seven_seg_display_2|Mux5~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux5~0_combout\ = (!\convert_binary|int_data_2\(2) & (((\convert_binary|int_data_2\(1) & \convert_binary|int_data_2\(3))))) # (\convert_binary|int_data_2\(2) & ((!\convert_binary|int_data_2\(0) $ (!\convert_binary|int_data_2\(1))) # 
-- (\convert_binary|int_data_2\(3))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000011000111111000001100011111100000110001111110000011000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux5~0_combout\);

\seven_seg_display_2|seven_seg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(1));

\seven_seg_display_2|Mux4~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux4~0_combout\ = (!\convert_binary|int_data_2\(2) & (\convert_binary|int_data_2\(1) & ((!\convert_binary|int_data_2\(0)) # (\convert_binary|int_data_2\(3))))) # (\convert_binary|int_data_2\(2) & (((\convert_binary|int_data_2\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0010000000111111001000000011111100100000001111110010000000111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux4~0_combout\);

\seven_seg_display_2|seven_seg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(2));

\seven_seg_display_2|Mux3~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux3~0_combout\ = (!\convert_binary|int_data_2\(3) & ((!\convert_binary|int_data_2\(0) & (!\convert_binary|int_data_2\(1) & \convert_binary|int_data_2\(2))) # (\convert_binary|int_data_2\(0) & (!\convert_binary|int_data_2\(1) $ 
-- (\convert_binary|int_data_2\(2))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100100100000000010010010000000001001001000000000100100100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux3~0_combout\);

\seven_seg_display_2|seven_seg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(3));

\seven_seg_display_2|Mux2~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux2~0_combout\ = (!\convert_binary|int_data_2\(1) & ((!\convert_binary|int_data_2\(2) & (\convert_binary|int_data_2\(0))) # (\convert_binary|int_data_2\(2) & ((!\convert_binary|int_data_2\(3)))))) # (\convert_binary|int_data_2\(1) & 
-- (\convert_binary|int_data_2\(0) & ((!\convert_binary|int_data_2\(3)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101110101000000010111010100000001011101010000000101110101000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux2~0_combout\);

\seven_seg_display_2|seven_seg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(4));

\seven_seg_display_2|Mux1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux1~0_combout\ = (!\convert_binary|int_data_2\(3) & ((!\convert_binary|int_data_2\(0) & (\convert_binary|int_data_2\(1) & !\convert_binary|int_data_2\(2))) # (\convert_binary|int_data_2\(0) & ((!\convert_binary|int_data_2\(2)) # 
-- (\convert_binary|int_data_2\(1))))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0111000100000000011100010000000001110001000000000111000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux1~0_combout\);

\seven_seg_display_2|seven_seg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(5));

\seven_seg_display_2|Mux0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_2|Mux0~0_combout\ = (!\convert_binary|int_data_2\(3) & ((!\convert_binary|int_data_2\(1) & ((!\convert_binary|int_data_2\(2)))) # (\convert_binary|int_data_2\(1) & (\convert_binary|int_data_2\(0) & \convert_binary|int_data_2\(2)))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1100000100000000110000010000000011000001000000001100000100000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_2\(0),
	datab => \convert_binary|ALT_INV_int_data_2\(1),
	datac => \convert_binary|ALT_INV_int_data_2\(2),
	datad => \convert_binary|ALT_INV_int_data_2\(3),
	combout => \seven_seg_display_2|Mux0~0_combout\);

\seven_seg_display_2|seven_seg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_2|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_2|seven_seg\(6));

\convert_binary|int_data_3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \addsub|V~combout\,
	clrn => \reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \convert_binary|int_data_3\(1));

\seven_seg_display_3|seven_seg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_3\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_3|seven_seg\(1));

\seven_seg_display_3|seven_seg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \convert_binary|int_data_3\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_3|seven_seg\(2));

\seven_seg_display_3|seven_seg[6]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \seven_seg_display_3|seven_seg[6]~0_combout\ = !\convert_binary|int_data_3\(1)

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101010101010101010101010101010101010101010101010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \convert_binary|ALT_INV_int_data_3\(1),
	combout => \seven_seg_display_3|seven_seg[6]~0_combout\);

\seven_seg_display_3|seven_seg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~input_o\,
	d => \seven_seg_display_3|seven_seg[6]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \seven_seg_display_3|seven_seg\(6));

ww_s(0) <= \s[0]~output_o\;

ww_s(1) <= \s[1]~output_o\;

ww_s(2) <= \s[2]~output_o\;

ww_s(3) <= \s[3]~output_o\;

ww_s(4) <= \s[4]~output_o\;

ww_V <= \V~output_o\;

ww_C <= \C~output_o\;

ww_seven_seg_digit_1(0) <= \seven_seg_digit_1[0]~output_o\;

ww_seven_seg_digit_1(1) <= \seven_seg_digit_1[1]~output_o\;

ww_seven_seg_digit_1(2) <= \seven_seg_digit_1[2]~output_o\;

ww_seven_seg_digit_1(3) <= \seven_seg_digit_1[3]~output_o\;

ww_seven_seg_digit_1(4) <= \seven_seg_digit_1[4]~output_o\;

ww_seven_seg_digit_1(5) <= \seven_seg_digit_1[5]~output_o\;

ww_seven_seg_digit_1(6) <= \seven_seg_digit_1[6]~output_o\;

ww_seven_seg_digit_2(0) <= \seven_seg_digit_2[0]~output_o\;

ww_seven_seg_digit_2(1) <= \seven_seg_digit_2[1]~output_o\;

ww_seven_seg_digit_2(2) <= \seven_seg_digit_2[2]~output_o\;

ww_seven_seg_digit_2(3) <= \seven_seg_digit_2[3]~output_o\;

ww_seven_seg_digit_2(4) <= \seven_seg_digit_2[4]~output_o\;

ww_seven_seg_digit_2(5) <= \seven_seg_digit_2[5]~output_o\;

ww_seven_seg_digit_2(6) <= \seven_seg_digit_2[6]~output_o\;

ww_seven_seg_digit_3(0) <= \seven_seg_digit_3[0]~output_o\;

ww_seven_seg_digit_3(1) <= \seven_seg_digit_3[1]~output_o\;

ww_seven_seg_digit_3(2) <= \seven_seg_digit_3[2]~output_o\;

ww_seven_seg_digit_3(3) <= \seven_seg_digit_3[3]~output_o\;

ww_seven_seg_digit_3(4) <= \seven_seg_digit_3[4]~output_o\;

ww_seven_seg_digit_3(5) <= \seven_seg_digit_3[5]~output_o\;

ww_seven_seg_digit_3(6) <= \seven_seg_digit_3[6]~output_o\;
END structure;


