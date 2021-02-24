library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity CU is
  port (
	clock: in std_logic;
	reset: in std_logic;

	opcode: in std_logic_vector(3 downto 0) ;

	ALU_input_select: out std_logic;

	ALU_op: out std_logic_vector(1 downto 0) ;

	ALU_register_clock: out std_logic;
	ALU_register_reset: out std_logic;

	IR_clock: out std_logic;
	IR_reset: out std_logic;

	register_file_write_select: out std_logic;

	register_file_clock: out std_logic;
	register_file_reset: out std_logic
  ) ;
end entity ; -- CU

architecture CU_arch of CU is
	
--cycle state
	signal cycle_current: std_logic_vector(3 downto 0) ;
	signal cycle_next: std_logic_vector(3 downto 0) ;

	--signal opcode_clock: std_logic;
	--signal out_reset: std_logic;

begin
--state logic
	cycle_next(3) <= cycle_current(2) AND (NOT cycle_current(3));
	cycle_next(2) <= cycle_current(1) AND (NOT cycle_current(2));
	cycle_next(1) <= cycle_current(0) AND (NOT cycle_current(1));
	cycle_next(0) <= (cycle_current(3) AND (NOT cycle_current(0))) OR
		(NOT (cycle_current(3) OR cycle_current(2) OR cycle_current(1) OR cycle_current(0)));

--state DFFs
	CU_d_ff : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    cycle_current <= "0000";
	  elsif( rising_edge(clock) ) then
		cycle_current <= cycle_next;
	  end if ;
	end process ; -- CU_d_ff

--output logic
	--out_reset <= NOT(cycle_current(3) OR cycle_current(2) OR cycle_current(1) OR cycle_current(0));

	--only if decode cycle
	IR_clock <= cycle_current(1);
	IR_reset <= reset;

	--11: ADD
	--10: SUB
	--01: AND
	--00: OR
	ALU_op <= opcode(2 downto 1);
	--1: register file
	--0: immediate(decoder direct)
	ALU_input_select <= opcode(0);

	--only if exeuction#1 cycle
	ALU_register_clock <= cycle_current(2);
	ALU_register_reset <= reset;

	--1: ALU register
	--0: decoder direct
	register_file_write_select <= opcode(3);

	--only if execution#2 cycle
	register_file_clock <= cycle_current(3);
	register_file_reset <= reset;

end architecture ; -- CU_arch


--library ieee ;
--	use ieee.std_logic_1164.all ;
--	use ieee.numeric_std.all ;

--entity CU is
--  port (
--	clock: in std_logic;
--	reset: in std_logic;

--	opcode: in std_logic_vector(3 downto 0) ;

--	ALU_input_select: out std_logic;

--	ALU_op: out std_logic_vector(1 downto 0) ;

--	ALU_register_clock: out std_logic;
--	ALU_register_reset: out std_logic;

--	IR_clock: out std_logic;
--	IR_reset: out std_logic;

--	register_file_write_select: out std_logic;

--	register_file_clock: out std_logic;
--	register_file_reset: out std_logic
--  ) ;
--end entity ; -- CU

--architecture CU_arch of CU is
	
----cycle state
--	signal cycle_current: std_logic_vector(3 downto 0) ;
--	signal cycle_next: std_logic_vector(3 downto 0) ;

----opcode state
--	signal opcode_current: std_logic_vector(3 downto 0) ;
--	signal opcode_next: std_logic_vector(3 downto 0) ;

--	--signal opcode_clock: std_logic;
--	--signal out_reset: std_logic;

--begin
----state logic
--	cycle_next(3) <= cycle_current(2) AND (NOT cycle_current(3));
--	cycle_next(2) <= cycle_current(1) AND (NOT cycle_current(2));
--	cycle_next(1) <= cycle_current(0) AND (NOT cycle_current(1));
--	cycle_next(0) <= (cycle_current(3) AND (NOT cycle_current(0))) OR
--		(NOT (cycle_current(3) OR cycle_current(2) OR cycle_current(1) OR cycle_current(0)));

--	--opcode_clock <= cycle_current(1) AND clock;
--	opcode_next <= opcode;

----state DFFs
--	CU_d_ff : process( clock, reset )
--	begin
--	  if( reset = '1' ) then
--	    cycle_current <= "0000";
--	    opcode_current <= "0000";
--	  elsif( rising_edge(clock) ) then
--	  	if ( cycle_current(1) = '1' ) then
--			opcode_current <= opcode_next;
--	  	end if ;
--		cycle_current <= cycle_next;
--	  end if ;
--	end process ; -- CU_d_ff

----output logic
--	--out_reset <= NOT(cycle_current(3) OR cycle_current(2) OR cycle_current(1) OR cycle_current(0));

--	--only if decode cycle
--	IR_clock <= cycle_current(1);
--	IR_reset <= reset;

--	--11: ADD
--	--10: SUB
--	--01: AND
--	--00: OR
--	ALU_op <= opcode_current(2 downto 1);
--	--1: register file
--	--0: immediate(decoder direct)
--	ALU_input_select <= opcode_current(0);

--	--only if exeuction#1 cycle
--	ALU_register_clock <= cycle_current(2);
--	ALU_register_reset <= reset;

--	--1: ALU register
--	--0: decoder direct
--	register_file_write_select <= opcode_current(3);

--	--only if execution#2 cycle
--	register_file_clock <= cycle_current(3);
--	register_file_reset <= reset;

--end architecture ; -- CU_arch


