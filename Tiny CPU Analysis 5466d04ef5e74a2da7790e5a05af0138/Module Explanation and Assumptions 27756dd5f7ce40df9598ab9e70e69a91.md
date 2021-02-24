# Module Explanation and Assumptions

Our purpose is to design a simple CPU.

This CPU contains:

- a control unit (CU)
- a register file with 16 general purpose registers, from number 0 to 15.
- an instruction register (IR)
- an instruction decoder
- a simple ALU and an ALU register
- wires and more things between componenets[[1]](#_ftn1)<a id="_ftnref1">

This CPU follows the fetch-decode-execute cycle. But this CPU has no memory. Rather than, this CPU receives instructions from IR directly. Through the testbench, we directly give the instructions per instruction cycle. Then CPU accesses the input instruction and executes some proper process.[[2]](#_ftn2)<a id="_ftnref2">

This CPU is based on RISC. Instructions are as simple as possible, and one should be executed within one fetch-decode-execute cycle.[[3]](#_ftn3)<a id="_ftnref3">

The instrunction format is:

- 4-bit op codes
- 4-bit register indicator
- 8-bit aditional operands

And we will implement below instructions:

- **LD** reg(dest) reg(A) (DC) : load data from register(A) to register(dest)
- **LD** reg(dest) <8bit --- value> : load 8 bit immediate data to register(dest)
- **ADD** reg(dest) reg(A) reg(B) : add reg(A) and reg(B) then store to reg(dest)
- **ADD** reg(dest) reg(A) <4bit #> : add reg(A) and <#> then store to reg(dest)
- **SUB** reg(dest) reg(A) reg(B) : subtract reg(B) from reg(A) then store to reg(dest)
- **SUB** reg(dest) reg(A) <4bit #> : subtract <#> from reg(A) then store to reg(dest)
- **AND** reg(dest) reg(A) reg(B) : perform reg(A) AND reg(B) then store to reg(dest)
- **AND** reg(dest) reg(A) <4bit #> : perform reg(A) AND <#> then store to reg(dest)
- **OR** reg(dest) reg(A) reg(B) : perform reg(A) OR reg(B) then store to reg(dest)
- **OR** reg(dest) reg(A) <4bit #> : perform reg(A) OR <#> then store to reg(dest)

Assume that the values are unsigned and we don’t care the overflow. Assume the single clock period is 10 ns. This circuit is positive edge-triggered. Also this circuit follows the Moore machine and is asynchronous for reset.

The input of this system is:

clock                         : The clock of the system.

reset                          : Place FSM in initial state.

instr                           : User can give machine code directly through this signal on testbench.

The output of this system is:

*output0* ~ *output15*                  : The value of each general purpose registers.

---

[[1]](#_ftnref1)<a id="_ftn1"> ‘Wikipedia’, “Datapath”, [https://en.wikipedia.org/wiki/Datapath](https://en.wikipedia.org/wiki/Datapath) .

[[2]](#_ftnref2)<a id="_ftn2"> ‘Wikipedia’, “Instruction cycle”, [https://en.wikipedia.org/wiki/Instruction_cycle](https://en.wikipedia.org/wiki/Instruction_cycle) .

[[3]](#_ftnref3)<a id="_ftn3"> David A. Patterson, John L. Hennessy, “Computer Organization and Design RISC-V edition”, 2017. Preface. “Why RISC-V for This Edition?”