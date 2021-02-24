# CU Design and Implementation

The state diagram of CU is:

![CU%20Design%20and%20Implementation%205be3b75cfe1148d7915835c7d33a5713/Untitled.png](CU%20Design%20and%20Implementation%205be3b75cfe1148d7915835c7d33a5713/Untitled.png)

For each states, the signal output is:

- boot
    - ALU_reg_reset = 1
    - IR_reset = 1
    - RF_reset = 1
- fetch
    - (IR receives an instruction)
- decode
    - IR_clock = 1
- execution #1
    - ALU_register_clock = 1
- execution #2
    - register_file_clock = 1

If we use one-hot encoding, the state logic can be designed easily.

We can easily design the signal logics. By the opcode design,

- register_file_write_select ← directly connect opcode(3)
    - 1: data from ALU register
    - 0: immediate value from decoder
- ALU_op ← opcode(2 downto 1)
    - 11: ADD
    - 10: SUB
    - 01: AND
    - 00: OR
- ALU_input_select ← opcode(0)
    - 1: data from register file
    - 0: immediate value from decoder

The implementation of CU in VHDL is:

![CU%20Design%20and%20Implementation%205be3b75cfe1148d7915835c7d33a5713/Untitled%201.png](CU%20Design%20and%20Implementation%205be3b75cfe1148d7915835c7d33a5713/Untitled%201.png)