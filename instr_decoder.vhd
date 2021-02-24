library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity instr_decoder is
  port (
	instr_in: in std_logic_vector(15 downto 0) ;

	opcode: out std_logic_vector(3 downto 0) ;
	opr1: out std_logic_vector(3 downto 0) ;
	opr2: out std_logic_vector(3 downto 0) ;
	opr3: out std_logic_vector(3 downto 0)
  ) ;
end entity ; -- instr_decoder

architecture instr_decoder_arch of instr_decoder is

begin

	opcode <= instr_in(15 downto 12);
	opr1 <= instr_in(11 downto 8);
	opr2 <= instr_in(7 downto 4);
	opr3 <= instr_in(3 downto 0);

end architecture ; -- instr_decoder_arch

