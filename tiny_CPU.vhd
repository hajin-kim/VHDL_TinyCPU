library ieee ;
	use ieee.std_logic_1164.all ;
	use ieee.numeric_std.all ;

entity tiny_CPU is
  port (
	clock: in std_logic;
	reset: in std_logic;
	instr: in std_logic_vector(15 downto 0);

--### OUTPUTS FOR TINY CPU ###--
	output0: out std_logic_vector(15 downto 0) ;
	output1: out std_logic_vector(15 downto 0) ;
	output2: out std_logic_vector(15 downto 0) ;
	output3: out std_logic_vector(15 downto 0) ;
	output4: out std_logic_vector(15 downto 0) ;
	output5: out std_logic_vector(15 downto 0) ;
	output6: out std_logic_vector(15 downto 0) ;
	output7: out std_logic_vector(15 downto 0) ;
	output8: out std_logic_vector(15 downto 0) ;
	output9: out std_logic_vector(15 downto 0) ;
	output10: out std_logic_vector(15 downto 0) ;
	output11: out std_logic_vector(15 downto 0) ;
	output12: out std_logic_vector(15 downto 0) ;
	output13: out std_logic_vector(15 downto 0) ;
	output14: out std_logic_vector(15 downto 0) ;
	output15: out std_logic_vector(15 downto 0)
--------------------------------
  ) ;
end entity ; -- tiny_CPU

architecture tiny_CPU_arch of tiny_CPU is

	component ALU is
	  port (
		ALU_op: in std_logic_vector(1 downto 0) ;

		input_register_file: in std_logic_vector(15 downto 0) ;
		input_ALU_input_MUX: in std_logic_vector(15 downto 0) ;

		output_ALU_register: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- ALU


	component ALU_input_MUX is
	  port (
	  	input_register_file: in std_logic_vector(15 downto 0) ;
	  	input_decoder: in std_logic_vector(15 downto 0) ;
		selector: in std_logic;

		output_ALU_input: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- ALU_input_MUX


	component ALU_register is
	  port (
		clock: in std_logic;
		reset: in std_logic;
		ALU_result_in: in std_logic_vector(15 downto 0) ;

		ALU_result_out: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- ALU_register


	component CU is
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
	end component ; -- CU


	component instr_decoder is
	  port (
		instr_in: in std_logic_vector(15 downto 0) ;

		opcode: out std_logic_vector(3 downto 0) ;
		opr1: out std_logic_vector(3 downto 0) ;
		opr2: out std_logic_vector(3 downto 0) ;
		opr3: out std_logic_vector(3 downto 0)
	  ) ;
	end component ; -- instr_decoder


	component IR is
	  port (
		clock: in std_logic;
		reset: in std_logic;
		instr_in: in std_logic_vector(15 downto 0) ;

		instr_out: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- IR


	component register_file is
	  port (
		clock: in std_logic;
		reset: in std_logic;

	--### OUTPUTS FOR TINY CPU ###--
		output0: out std_logic_vector(15 downto 0) ;
		output1: out std_logic_vector(15 downto 0) ;
		output2: out std_logic_vector(15 downto 0) ;
		output3: out std_logic_vector(15 downto 0) ;
		output4: out std_logic_vector(15 downto 0) ;
		output5: out std_logic_vector(15 downto 0) ;
		output6: out std_logic_vector(15 downto 0) ;
		output7: out std_logic_vector(15 downto 0) ;
		output8: out std_logic_vector(15 downto 0) ;
		output9: out std_logic_vector(15 downto 0) ;
		output10: out std_logic_vector(15 downto 0) ;
		output11: out std_logic_vector(15 downto 0) ;
		output12: out std_logic_vector(15 downto 0) ;
		output13: out std_logic_vector(15 downto 0) ;
		output14: out std_logic_vector(15 downto 0) ;
		output15: out std_logic_vector(15 downto 0) ;
	--------------------------------

	--read function
		read1_num: in std_logic_vector(3 downto 0) ;
		read2_num: in std_logic_vector(3 downto 0) ;
		data1: out std_logic_vector(15 downto 0) ;
		data2: out std_logic_vector(15 downto 0) ;	

	--write function
		write_num: in std_logic_vector(3 downto 0) ;
		write_data: in std_logic_vector(15 downto 0)

	  ) ;
	end component ; -- register_file


	component register_file_write_MUX is
	  port (
		input_ALU_register: in std_logic_vector(15 downto 0) ;
		input_decoder: in std_logic_vector(15 downto 0) ;
		selector: in std_logic;

		output_register_file_write: out std_logic_vector(15 downto 0)
	  ) ;
	end component ; -- register_file_write_MUX


--signals
	--from alu
	signal alu_to_alu_reg: std_logic_vector(15 downto 0) ;

	--from alu mux
	signal alu_mux_to_alu_in: std_logic_vector(15 downto 0) ;

	--from alu reg
	signal alu_reg_to_rf_mux: std_logic_vector(15 downto 0) ;

	--from cu
	signal cu_to_alu_op: std_logic_vector(1 downto 0) ;

	signal cu_to_alu_mux: std_logic;

	signal cu_to_alu_reg_clk: std_logic;
	signal cu_to_alu_reg_rst: std_logic;

	signal cu_to_ir_clk: std_logic;
	signal cu_to_ir_rst: std_logic;

	signal cu_to_rf_clk: std_logic;
	signal cu_to_rf_rst: std_logic;

	signal cu_to_rf_mux: std_logic;

	--from dec
	signal dec_opr1: std_logic_vector(3 downto 0) ;
	signal dec_opr2: std_logic_vector(3 downto 0) ;
	signal dec_opr3: std_logic_vector(3 downto 0) ;
	signal dec_to_cu: std_logic_vector(3 downto 0) ;

	signal dec_to_alu_mux: std_logic_vector(3 downto 0) ;
	signal dec_to_alu_mux_fill: std_logic_vector(11 downto 0) ;
	signal dec_to_alu_mux_comb: std_logic_vector(15 downto 0) ;

	signal dec_to_rf_wnum: std_logic_vector(3 downto 0) ;
	signal dec_to_rf_r1num: std_logic_vector(3 downto 0) ;
	signal dec_to_rf_r2num: std_logic_vector(3 downto 0) ;

	signal dec_to_rf_mux: std_logic_vector(7 downto 0) ;
	signal dec_to_rf_mux_fill: std_logic_vector(7 downto 0) ;
	signal dec_to_rf_mux_comb: std_logic_vector(15 downto 0) ;

	--from ir
	signal ir_to_dec: std_logic_vector(15 downto 0) ;

	--from rf
	signal rf_r1_to_alu_in: std_logic_vector(15 downto 0) ;
	signal rf_r2_to_alu_mux: std_logic_vector(15 downto 0) ;
	
	--from rf mux
	signal rf_mux_to_rf_w: std_logic_vector(15 downto 0) ;
begin
--fill zeros
	dec_to_alu_mux_fill <= "000000000000";
	dec_to_alu_mux_comb <= dec_to_alu_mux_fill & dec_to_alu_mux;
	dec_to_rf_mux_fill <= "00000000";
	dec_to_rf_mux_comb <= dec_to_rf_mux_fill & dec_to_rf_mux;

--components instances

	ALU_instance: ALU port map(
		ALU_op => cu_to_alu_op,

		input_register_file => rf_r1_to_alu_in,
		input_ALU_input_MUX => alu_mux_to_alu_in,

		output_ALU_register => alu_to_alu_reg
	  ) ; -- ALU


	ALU_input_MUX_instance: ALU_input_MUX port map(
	  	input_register_file => rf_r2_to_alu_mux,
	  	input_decoder => dec_to_alu_mux_comb,
		selector => cu_to_alu_mux,

		output_ALU_input => alu_mux_to_alu_in
	  ) ; -- ALU_input_MUX


	ALU_register_instance: ALU_register port map(
		clock => cu_to_alu_reg_clk,
		reset => cu_to_alu_reg_rst,
		ALU_result_in => alu_to_alu_reg,

		ALU_result_out => alu_reg_to_rf_mux
	  ) ; -- ALU_register


	CU_instance: CU port map(
		clock => clock,
		reset => reset,

		opcode => dec_to_cu,

		ALU_input_select => cu_to_alu_mux,

		ALU_op => cu_to_alu_op,

		ALU_register_clock => cu_to_alu_reg_clk,
		ALU_register_reset => cu_to_alu_reg_rst,

		IR_clock => cu_to_ir_clk,
		IR_reset => cu_to_ir_rst,

		register_file_write_select => cu_to_rf_mux,

		register_file_clock => cu_to_rf_clk,
		register_file_reset => cu_to_rf_rst
	  ) ; -- CU


	instr_decoder_instance: instr_decoder port map (
		instr_in => ir_to_dec,

		opcode => dec_to_cu,
		opr1 => dec_opr1,
		opr2 => dec_opr2,
		opr3 => dec_opr3
	  ) ; -- instr_decoder

	--additional signals from decoder
	dec_to_alu_mux <= dec_opr3;
	dec_to_rf_wnum <= dec_opr1;
	dec_to_rf_r1num <= dec_opr2;
	dec_to_rf_r2num <= dec_opr3;
	dec_to_rf_mux <= dec_opr2 & dec_opr3;


	IR_instance: IR port map(
		clock => cu_to_ir_clk,
		reset => cu_to_ir_rst,
		instr_in => instr,

		instr_out => ir_to_dec
	  ) ; -- IR


	register_file_instance: register_file port map(
		clock => cu_to_rf_clk,
		reset => cu_to_rf_rst,

	--### OUTPUTS FOR TINY CPU ###--
		output0 => output0,
		output1 => output1,
		output2 => output2,
		output3 => output3,
		output4 => output4,
		output5 => output5,
		output6 => output6,
		output7 => output7,
		output8 => output8,
		output9 => output9,
		output10 => output10,
		output11 => output11,
		output12 => output12,
		output13 => output13,
		output14 => output14,
		output15 => output15,
	--------------------------------

	--read function
		read1_num => dec_to_rf_r1num,
		read2_num => dec_to_rf_r2num,
		data1 => rf_r1_to_alu_in,
		data2 => rf_r2_to_alu_mux,

	--write function
		write_num => dec_to_rf_wnum,
		write_data => rf_mux_to_rf_w

	  ) ; -- register_file


	register_file_write_MUX_instance: register_file_write_MUX port map(
		input_ALU_register => alu_reg_to_rf_mux,
		input_decoder => dec_to_rf_mux_comb,
		selector => cu_to_rf_mux,

		output_register_file_write => rf_mux_to_rf_w
	  ) ; -- register_file_write_MUX
	

end architecture ; -- tiny_CPU_arch

