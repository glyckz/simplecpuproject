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
-- CREATED		"Tue Jul 09 16:36:35 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY alu IS 
	PORT
	(
		f1 :  IN  STD_LOGIC;
		f0 :  IN  STD_LOGIC;
		p :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		q :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		z :  OUT  STD_LOGIC;
		alu_out :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END alu;

ARCHITECTURE bdf_type OF alu IS 

COMPONENT adder_subtractor
	PORT(sel : IN STD_LOGIC;
		 cin : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 cout : OUT STD_LOGIC;
		 sum : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	sum :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	b_wire :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	a_wire :  STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN 



b2v_inst : adder_subtractor
PORT MAP(sel => f0,
		 cin => f0,
		 a => a_wire,
		 b => b_wire,
		 sum => sum);
-- 


a_wire(0) <= (not(f1) and p(0)) or (f1 and q(0));
a_wire(1) <= (not(f1) and p(1)) or (f1 and q(1));
a_wire(2) <= (not(f1) and p(2)) or (f1 and q(2));
a_wire(3) <= (not(f1) and p(3)) or (f1 and q(3));
a_wire(4) <= (not(f1) and p(4)) or (f1 and q(4));
a_wire(5) <= (not(f1) and p(5)) or (f1 and q(5));
a_wire(6) <= (not(f1) and p(6)) or (f1 and q(6));
a_wire(7) <= (not(f1) and p(7)) or (f1 and q(7));


b_wire(0) <= (not(f1) and q(0)) or (f1 and '1');
b_wire(1) <= (not(f1) and q(1)) or (f1 and '0');
b_wire(2) <= (not(f1) and q(2)) or (f1 and '0');
b_wire(3) <= (not(f1) and q(3)) or (f1 and '0') ;
b_wire(4) <= (not(f1) and q(4)) or (f1 and '0') ;
b_wire(5) <= (not(f1) and q(5)) or (f1 and '0');
b_wire(6) <= (not(f1) and q(6)) or (f1 and '0') ;
b_wire(7) <= (not(f1) and q(7)) or (f1 and '0') ;


z <= NOT(sum(0) OR sum(1) OR sum(2) OR sum(3) OR sum(4) OR sum(5) OR sum(6) OR sum(7));

alu_out <= sum;

END bdf_type;