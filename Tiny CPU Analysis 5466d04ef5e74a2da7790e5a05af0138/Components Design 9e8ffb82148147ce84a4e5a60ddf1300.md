# Components Design

## **General-Purpose Register**

Our 16-bit *register* consists of 16 D-FFs. There are just *D*, *clock*, *Q* signals. These flip-flops catch values from *D* at the rising edge of the *clock*.[[1]](#_ftn1)<a id="_ftnref1">[[2]](#_ftn2)<a id="_ftnref2">

The implementation of the *register* is:

![Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled.png](Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled.png)

---

## **Register File**

Our *register file* contains 16 *registers*. It has 5 input signals:

*write_num*(3..0)       : Select register to write.

*write_sig* or *clock*   : Give write sign(clock) to the selected register.

*write_data*(15..0)    : Data to write.

*read1_num*(3..0)      : Indicate register to output through *data1*

*read2_num*(3..0)      : Indicate register to output through *data2*

It has 2 output signals:

*data1*(15..0)             : Data to read.

*data2*(15..0)             : Data to read.

It has 2 major functions. First, it selects the register to read and reads data using MUX. Second, it selects the register to write and writes data if *write_sig*(*clock*) is at a rising edge. In terms of writing, it has a 1:16 DEMUX to select register by *write_num*. And each output signals of the DEMUX are ANDed with the *write_sig*. By connecting this to the registers, we can conduct the write function. And the input data, *write_data* is fully connected to all registers.[[3]](#_ftn3)<a id="_ftnref3">[[4]](#_ftn4)<a id="_ftnref4">

In summary, the implementation of the *register file* is:

![Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%201.png](Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%201.png)

---

## **Instruction Register**

*Instruction register*(*IR*) stores the current instruction. At the end of the fetch cycle, *CU* sends the *clock* signal ON so that the input instruction can be correctly stored to *IR*. To implement this, just using D-FFs is enough.

![Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%202.png](Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%202.png)

---

## **ALU Register**

*ALU register* just holds the result of *ALU*. It doesn’t store the result until the *clock* signal comes from the *CU*. If it is prepared to propagate the result, then *CU* sends the clock signal ON so that it could propagate to the register file and be stored. To implement this, just using D-FFs is enough too.

The implementation of the *ALU register* is:

![Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%203.png](Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%203.png)

---

## **ALU**

We have VHDL built-in arithmetic and logic operations. We can use these.

![Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%204.png](Components%20Design%209e8ffb82148147ce84a4e5a60ddf1300/Untitled%204.png)

---

[[1]](#_ftnref1)<a id="_ftn1"> “Computer Organization and Design RISC-V edition”, Apdx A.8 “Memory Elements: Flip-Flops,

Latches, and Registers”.

[[2]](#_ftnref2)<a id="_ftn2"> ‘Wikipedia’, “Processor register”, [https://en.wikipedia.org/wiki/Processor_register](https://en.wikipedia.org/wiki/Processor_register) .

[[3]](#_ftnref3)<a id="_ftn3"> “Computer Organization and Design RISC-V edition”, Apdx A.8 “Memory Elements: Flip-Flops,

Latches, and Registers”.

[[4]](#_ftnref4)<a id="_ftn4"> ‘Wikipedia’, “Register file”, [https://en.wikipedia.org/wiki/Register_file](https://en.wikipedia.org/wiki/Register_file) .