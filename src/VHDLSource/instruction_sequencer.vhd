LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY instruction_sequencer IS 
    PORT
      (
        opcode : in std_logic_vector(2 downto 0);
        reset : in std_logic;
        clock : in std_logic;
        t0 : out std_logic;
        t1 : out std_logic;
        t2 : out std_logic;
        t3 : out std_logic;
        t4 : out std_logic;
        t5 : out std_logic;
        t6 : out std_logic;
        t7 : out std_logic;
        execute : out std_logic  
    );
END instruction_sequencer;

ARCHITECTURE bdf of instruction_sequencer IS 
	COMPONENT d_ff
		PORT (
			reset	: 	IN STD_LOGIC;
			clock	: 	IN STD_LOGIC;
			d		: 	IN STD_LOGIC;
			q		: 	OUT STD_LOGIC
		);
	END COMPONENT;
	
	SIGNAL S : STD_LOGIC_VECTOR(2 DOWNTO 0); --current state
	SIGNAL NS : STD_LOGIC_VECTOR(2 DOWNTO 0); --next state
	
	begin
	
	d_ff2 : d_ff
		PORT MAP(reset => reset,
			 clock => clock,
			 d => NS(2),
			 q => S(2)
			 );
	
	d_ff1 : d_ff
		PORT MAP(reset => reset,
			 clock => clock,
			 d => NS(1),
			 q => S(1)
			 );
			 
	d_ff0 : d_ff
		PORT MAP(reset => reset,
			 clock => clock,
			 d => NS(0),
			 q => S(0)
			 );
			 
	NS(0) <= (not(S(2)) and not(S(0))) or (not(opcode(2)) and not(S(0))) or (not(opcode(1)) and not(S(0)));
	
	NS(1) <= (S(1) and not(S(0))) or (opcode(2) and not(S(1)) and S(0)) or (not(S(2)) and not(S(1)) and S(0))
				or (opcode(1) and not(S(1)) and S(0));
				
	NS(2) <= (S(2) and S(1) and not(S(0))) or (not(opcode(1)) and S(2) and not(S(0))) or (not(opcode(2)) and opcode(1)
				and S(2) and not(S(1))) or (not(S(2)) and S(1) and S(0)) or (opcode(2) and not(opcode(1)) and S(2) and not(S(1)));
				
	t0 <= (NOT(S(2)) AND NOT(S(1)) AND NOT(S(0))); --000
	t1 <= (NOT(S(2)) AND NOT(S(1)) AND S(0)); --001
	t2 <= (NOT(S(2)) AND S(1) AND NOT(S(0))); --010
	t3 <= (NOT(S(2)) AND S(1) AND S(0)); --011
	t4 <= (S(2) AND NOT(S(1)) AND NOT(S(0))); --100
	t5 <= (S(2) AND NOT(S(1)) AND S(0)); --101
	t6 <= (S(2) AND S(1) AND NOT(S(0))); --110
	t7 <= (S(2) AND S(1) AND S(0)); --111
	
	execute <= S(2);
	
	end bdf;