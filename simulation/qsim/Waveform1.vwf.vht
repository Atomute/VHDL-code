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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "10/09/2022 03:16:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Four_bit_binary_to_2_digit_7_seg
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst IS
END Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst;
ARCHITECTURE Four_bit_binary_to_2_digit_7_seg_arch OF Four_bit_binary_to_2_digit_7_seg_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL data_i : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL seven_seg_digit_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL seven_seg_digit_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL seven_seg_digit_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT Four_bit_binary_to_2_digit_7_seg
	PORT (
	clock : IN STD_LOGIC;
	data_i : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	reset : IN STD_LOGIC;
	seven_seg_digit_1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	seven_seg_digit_2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	seven_seg_digit_3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Four_bit_binary_to_2_digit_7_seg
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	data_i => data_i,
	reset => reset,
	seven_seg_digit_1 => seven_seg_digit_1,
	seven_seg_digit_2 => seven_seg_digit_2,
	seven_seg_digit_3 => seven_seg_digit_3
	);

-- clock
t_prcs_clock: PROCESS
BEGIN
LOOP
	clock <= '0';
	WAIT FOR 5000 ps;
	clock <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clock;
-- data_i[9]
t_prcs_data_i_9: PROCESS
BEGIN
	data_i(9) <= '1';
WAIT;
END PROCESS t_prcs_data_i_9;
-- data_i[8]
t_prcs_data_i_8: PROCESS
BEGIN
	data_i(8) <= '1';
WAIT;
END PROCESS t_prcs_data_i_8;
-- data_i[7]
t_prcs_data_i_7: PROCESS
BEGIN
	data_i(7) <= '1';
WAIT;
END PROCESS t_prcs_data_i_7;
-- data_i[6]
t_prcs_data_i_6: PROCESS
BEGIN
	data_i(6) <= '1';
WAIT;
END PROCESS t_prcs_data_i_6;
-- data_i[5]
t_prcs_data_i_5: PROCESS
BEGIN
	data_i(5) <= '1';
WAIT;
END PROCESS t_prcs_data_i_5;
-- data_i[4]
t_prcs_data_i_4: PROCESS
BEGIN
	data_i(4) <= '0';
	WAIT FOR 480000 ps;
	data_i(4) <= '1';
WAIT;
END PROCESS t_prcs_data_i_4;
-- data_i[3]
t_prcs_data_i_3: PROCESS
BEGIN
	data_i(3) <= '1';
	WAIT FOR 480000 ps;
	data_i(3) <= '0';
	WAIT FOR 480000 ps;
	data_i(3) <= '1';
WAIT;
END PROCESS t_prcs_data_i_3;
-- data_i[2]
t_prcs_data_i_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		data_i(2) <= '0';
		WAIT FOR 240000 ps;
		data_i(2) <= '1';
		WAIT FOR 240000 ps;
	END LOOP;
	data_i(2) <= '0';
WAIT;
END PROCESS t_prcs_data_i_2;
-- data_i[1]
t_prcs_data_i_1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		data_i(1) <= '0';
		WAIT FOR 120000 ps;
		data_i(1) <= '1';
		WAIT FOR 120000 ps;
	END LOOP;
	data_i(1) <= '0';
WAIT;
END PROCESS t_prcs_data_i_1;
-- data_i[0]
t_prcs_data_i_0: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		data_i(0) <= '0';
		WAIT FOR 60000 ps;
		data_i(0) <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	data_i(0) <= '0';
WAIT;
END PROCESS t_prcs_data_i_0;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END Four_bit_binary_to_2_digit_7_seg_arch;
