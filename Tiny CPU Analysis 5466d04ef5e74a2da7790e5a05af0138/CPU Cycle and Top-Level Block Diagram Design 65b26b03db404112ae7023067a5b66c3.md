# CPU Cycle and Top-Level Block Diagram Design

During the fetch cycle, CU waits for the input until the next clock rising edge. A user can give instructions through the instr port.

At the rising edge, the decode cycle starts. CU gives IR a clock sign to store input and propagate it to the decoder. During this cycle, the decoder decodes the instruction and spreads it to other components. CU immediately sends the ALU operation, register file read control and ALU input MUX control.[[1]](#_ftn1)<a id="_ftnref1">

At the next rising edge, execution cycle 1 starts. CU sends ALU register a clock sign to store the result of ALU.

And then, at the next rising edge, execution cycle 2 starts. CU gives the register file a clock sign to store the value into the selected register. Then repeat from fetch cycle.

In conclusion, the top-level block diagram is:

![CPU%20Cycle%20and%20Top-Level%20Block%20Diagram%20Design%2065b26b03db404112ae7023067a5b66c3/Untitled.png](CPU%20Cycle%20and%20Top-Level%20Block%20Diagram%20Design%2065b26b03db404112ae7023067a5b66c3/Untitled.png)

---

[[1]](#_ftnref1)<a id="_ftn1"> “Computer Organization and Design RISC-V edition”, Ch 4 “The Processor”.