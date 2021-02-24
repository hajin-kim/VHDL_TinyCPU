# Instruction Encoding

Let me assign 0000 to reset state of opcode after reset with no function.

8 arithmetic/logic operations require ALU. Thus, these should be assigned adjacently. If we encode an opcode bit to AL bit, and AL=1 for arithmetic/logic operations, then we can encode these 8 operations adjacently. Since this sorting divides the opcodes into AL and non-AL, it is good to assign this AL bit to the MSB. Therefore, 1xxx is arithmetic/logic operation code and 0xxx is not.

Especially, ADD and SUB are arithmetical, and AND and OR are logical. Thus, it is a good way to assign 11xx to arithmetic operation, and 10xx to logic operation. And then, let me assign ADD to 111x, SUB to 110x, AND to 101x, and OR to 100x.

Now, the LSB should assert 'register number' or 'immediate value'. It is a good way to assign xxx1 to the former one and xxx0 to the latter one.

For remaining LD operation, just let me assign it to 010x.

In conclusion, the opcode encoding is:

[Opcode Encoding](Instruction%20Encoding%20bdd1ad396eeb4982a3ccbe45d230248f/Opcode%20Encoding%200b0de5f3bb8840758508a9e471c05a44.csv)

Operands are 4 bit binary numbers that means immediate value or register number.