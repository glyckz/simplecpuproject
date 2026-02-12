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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Sun Mar 02 22:22:41 2025"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder_subtractor IS 
	PORT
	(
		sel :  IN  STD_LOGIC;
		cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout :  OUT  STD_LOGIC;
		sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END adder_subtractor;

ARCHITECTURE bdf_type OF adder_subtractor IS 

COMPONENT fulladder
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 CIN : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	b0_sel :  STD_LOGIC;
SIGNAL	b1_sel :  STD_LOGIC;
SIGNAL	b2_sel :  STD_LOGIC;
SIGNAL	b3_sel :  STD_LOGIC;
SIGNAL	b4_sel :  STD_LOGIC;
SIGNAL	b5_sel :  STD_LOGIC;
SIGNAL	b6_sel :  STD_LOGIC;
SIGNAL	b7_sel :  STD_LOGIC;
SIGNAL	cout_0 :  STD_LOGIC;
SIGNAL	cout_1 :  STD_LOGIC;
SIGNAL	cout_2 :  STD_LOGIC;
SIGNAL	cout_3 :  STD_LOGIC;
SIGNAL	cout_4 :  STD_LOGIC;
SIGNAL	cout_5 :  STD_LOGIC;
SIGNAL	cout_6 :  STD_LOGIC;
SIGNAL	sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_adder_0 : fulladder
PORT MAP(A => a(0),
		 B => b0_sel,
		 CIN => cin,
		 S => sum_ALTERA_SYNTHESIZED(0),
		 Cout => cout_0);


b2v_adder_1 : fulladder
PORT MAP(A => a(1),
		 B => b1_sel,
		 CIN => cout_0,
		 S => sum_ALTERA_SYNTHESIZED(1),
		 Cout => cout_1);


b2v_adder_2 : fulladder
PORT MAP(A => a(2),
		 B => b2_sel,
		 CIN => cout_1,
		 S => sum_ALTERA_SYNTHESIZED(2),
		 Cout => cout_2);


b2v_adder_3 : fulladder
PORT MAP(A => a(3),
		 B => b3_sel,
		 CIN => cout_2,
		 S => sum_ALTERA_SYNTHESIZED(3),
		 Cout => cout_3);


b2v_adder_4 : fulladder
PORT MAP(A => a(4),
		 B => b4_sel,
		 CIN => cout_3,
		 S => sum_ALTERA_SYNTHESIZED(4),
		 Cout => cout_4);


b2v_adder_5 : fulladder
PORT MAP(A => a(5),
		 B => b5_sel,
		 CIN => cout_4,
		 S => sum_ALTERA_SYNTHESIZED(5),
		 Cout => cout_5);


b2v_adder_6 : fulladder
PORT MAP(A => a(6),
		 B => b6_sel,
		 CIN => cout_5,
		 S => sum_ALTERA_SYNTHESIZED(6),
		 Cout => cout_6);


b2v_adder_7 : fulladder
PORT MAP(A => a(7),
		 B => b7_sel,
		 CIN => cout_6,
		 S => sum_ALTERA_SYNTHESIZED(7),
		 Cout => cout);


b0_sel <= sel XOR b(0);


b1_sel <= sel XOR b(1);


b2_sel <= sel XOR b(2);


b3_sel <= sel XOR b(3);


b4_sel <= sel XOR b(4);


b5_sel <= sel XOR b(5);


b6_sel <= sel XOR b(6);


b7_sel <= sel XOR b(7);

sum <= sum_ALTERA_SYNTHESIZED;

END bdf_type;