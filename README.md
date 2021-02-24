# VHDL_TinyCPU

### Tiny CPU Implementation in VHDL  

[**Module Explanation and Assumptions**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/Module%20Explanation%20and%20Assumptions%2027756dd5f7ce40df9598ab9e70e69a91.md)  

[**CPU Cycle and Top-Level Block Diagram Design**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/CPU%20Cycle%20and%20Top-Level%20Block%20Diagram%20Design%2065b26b03db404112ae7023067a5b66c3.md)  

[**Instruction Encoding**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/Instruction%20Encoding%20bdd1ad396eeb4982a3ccbe45d230248f.md)  

[**CU Design and Implementation**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/CU%20Design%20and%20Implementation%205be3b75cfe1148d7915835c7d33a5713.md)  

[**Components Design**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300.md)  

[**Testbench Simulation and Conclusion**](Tiny%20CPU%20Analysis%205466d04ef5e74a2da7790e5a05af0138/Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47.md)  

---

### How to Run

For more informations, please refer to the above analysis.  

#### 1) Input and Output
Input:
- clock		: The clock of the system. Positive.
- reset		: Place FSM in initial state. Positive, asynchronous.
- instr		: User can give machine code directly through this signal on testbench.
Output:
- output0 ~ output15	: The value of each general purpose registers


#### 2) components
[tiny_CPU.vhd](tiny_CPU.vhd)		: top-level  
[tb_tiny_CPU.vhd](tb_tiny_CPU.vhd)		: testbench  
[ALU.vhd](ALU.vhd)  
[ALU_input_MUX.vhd](ALU_input_MUX.vhd)  
[ALU_register.vhd](ALU_register.vhd)  
[CU.vhd](CU.vhd)  
[general_register.vhd](general_register.vhd)  
[instr_decoder.vhd](instr_decoder.vhd)  
[IR.vhd](IR.vhd)  
[register_file.vhd](register_file.vhd)  
[register_file_write_MUX.vhd](register_file_write_MUX.vhd)  


#### 3) testbench usage
First, open the testbench file and go to the line 113.  
There is a block-like guide comment.  
Please put your testbenches on that file, especially in that block if no problem.  
Your code should have waiting time for *40ns* (4 clock period).  
There are some instructions for an example.  
You can use the instructions under this section.  


#### 4) instructions
operation	operand1	operand2	operand3	opcode  
LD	reg(dest)	reg(A)	(don’t care)	0101  
LD	reg(dest)	<8 bit --	-- value>	0100  
ADD	reg(dest)	reg(A)	reg(B)	1111  
ADD	reg(dest)	reg(A)	<value>	1110  
SUB	reg(dest)	reg(A)	reg(B)	1101  
SUB	reg(dest)	reg(A)	<value>	1100  
AND	reg(dest)	reg(A)	reg(B)	1011  
AND	reg(dest)	reg(A)	<value>	1010  
OR	reg(dest)	reg(A)	reg(B)	1001  
OR	reg(dest)	reg(A)	<value>	1000  
Operands are 4 bit binary numbers that means immediate value or register number.  
For example, 0100000001010110 is  
- 0100	: LD(immediate value)
- 0000	: reg0
- 01010110	: value to store

---

### Major references

1. David A. Patterson, John L. Hennessy, “Computer Organization and Design RISC-V edition”, 2017.
2. 2020-fall CSI2111, Prof. Jinho Lee, LOGIC CIRCUIT DESIGN.
3. 2020-spring CSI2107, Prof. Shindug Kim, COMPUTER SYSTEM.
4. ‘Wikipedia’, [https://en.wikipedia.org/wiki/Main_Page](https://en.wikipedia.org/wiki/Main_Page) .
5. Randy H. Katz, Gaetano Borriello, “Contemporary Logic Design”, 2005.

The detailed references are left in the comments.

---

END.  
