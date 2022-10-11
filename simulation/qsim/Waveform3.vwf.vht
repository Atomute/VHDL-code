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
-- Generated on "10/11/2022 20:03:36"
                                                             
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
SIGNAL A : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL C : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL ctrl_M : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL seven_seg_digit_1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL seven_seg_digit_2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL seven_seg_digit_3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL V : STD_LOGIC;
COMPONENT Four_bit_binary_to_2_digit_7_seg
	PORT (
	A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	C : BUFFER STD_LOGIC;
	clock : IN STD_LOGIC;
	ctrl_M : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	s : BUFFER STD_LOGIC_VECTOR(4 DOWNTO 0);
	seven_seg_digit_1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	seven_seg_digit_2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	seven_seg_digit_3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	V : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Four_bit_binary_to_2_digit_7_seg
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	C => C,
	clock => clock,
	ctrl_M => ctrl_M,
	reset => reset,
	s => s,
	seven_seg_digit_1 => seven_seg_digit_1,
	seven_seg_digit_2 => seven_seg_digit_2,
	seven_seg_digit_3 => seven_seg_digit_3,
	V => V
	);

-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '0';
	WAIT FOR 480000 ps;
	A(3) <= '1';
	WAIT FOR 480000 ps;
	A(3) <= '0';
WAIT;
END PROCESS t_prcs_A_3;

-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		A(2) <= '0';
		WAIT FOR 240000 ps;
		A(2) <= '1';
		WAIT FOR 240000 ps;
	END LOOP;
	A(2) <= '0';
WAIT;
END PROCESS t_prcs_A_2;

-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		A(1) <= '0';
		WAIT FOR 120000 ps;
		A(1) <= '1';
		WAIT FOR 120000 ps;
	END LOOP;
	A(1) <= '0';
WAIT;
END PROCESS t_prcs_A_1;

-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		A(0) <= '0';
		WAIT FOR 60000 ps;
		A(0) <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	A(0) <= '0';
WAIT;
END PROCESS t_prcs_A_0;

-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	B(3) <= '0';
	WAIT FOR 480000 ps;
	B(3) <= '1';
	WAIT FOR 480000 ps;
	B(3) <= '0';
WAIT;
END PROCESS t_prcs_B_3;

-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	FOR i IN 1 TO 2
	LOOP
		B(2) <= '0';
		WAIT FOR 240000 ps;
		B(2) <= '1';
		WAIT FOR 240000 ps;
	END LOOP;
	B(2) <= '0';
WAIT;
END PROCESS t_prcs_B_2;

-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	FOR i IN 1 TO 4
	LOOP
		B(1) <= '0';
		WAIT FOR 120000 ps;
		B(1) <= '1';
		WAIT FOR 120000 ps;
	END LOOP;
	B(1) <= '0';
WAIT;
END PROCESS t_prcs_B_1;

-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	FOR i IN 1 TO 8
	LOOP
		B(0) <= '0';
		WAIT FOR 60000 ps;
		B(0) <= '1';
		WAIT FOR 60000 ps;
	END LOOP;
	B(0) <= '0';
WAIT;
END PROCESS t_prcs_B_0;

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

-- ctrl_M
t_prcs_ctrl_M: PROCESS
BEGIN
	ctrl_M <= '0';
WAIT;
END PROCESS t_prcs_ctrl_M;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END Four_bit_binary_to_2_digit_7_seg_arch;
