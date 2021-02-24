library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;
	use ieee.std_logic_arith.all;
	use ieee.std_logic_unsigned.all;

entity ALU is
  port (
	ALU_op: in std_logic_vector(1 downto 0) ;

	input_register_file: in std_logic_vector(15 downto 0) ;
	input_ALU_input_MUX: in std_logic_vector(15 downto 0) ;

	output_ALU_register: out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- ALU

architecture ALU_arch of ALU is
	
	--signal term_add: std_logic_vector(16 downto 0) ;
	--signal overflow_flag: std_logic;	--don't care

begin

	--11: ADD
	--10: SUB
	--01: AND
	--00: OR
	--with (ALU_op) select
	--	output_ALU_register <=
	--		input_register_file + input_ALU_input_MUX when "11",
	--		input_register_file - input_ALU_input_MUX when "10",
	--		input_register_file AND input_ALU_input_MUX when "01",
	--		input_register_file OR input_ALU_input_MUX when "00",
	--		"0000000000000000" when others;

	alu_proc : process( ALU_op, input_register_file, input_ALU_input_MUX )
	begin
		--term_add <= input_register_file + input_ALU_input_MUX;
		case (ALU_op) is
			--when "11" => output_ALU_register <= term_add(15 downto 0);
			when "11" => output_ALU_register <= input_register_file + input_ALU_input_MUX;
			when "10" => output_ALU_register <= input_register_file - input_ALU_input_MUX;
			when "01" => output_ALU_register <= input_register_file AND input_ALU_input_MUX;
			when "00" => output_ALU_register <= input_register_file OR input_ALU_input_MUX;
			when others => output_ALU_register <= "0000000000000000";
		end case;
	end process ; -- alu_proc

end architecture ; -- ALU_arch

