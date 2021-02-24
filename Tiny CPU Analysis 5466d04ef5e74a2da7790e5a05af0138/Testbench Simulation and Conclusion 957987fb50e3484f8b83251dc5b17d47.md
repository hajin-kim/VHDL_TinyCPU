# Testbench Simulation and Conclusion

## Testbench

The testbench is:

![Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled.png](Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled.png)

## RTL Simulation Result

The RTL simulation is conducted with Quartus and Modelsim.

The result of the RTL simulation for 800ns using the above testbench is:

![Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%201.png](Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%201.png)

For convenience, the first half(0ns ~ 400ns) of the result is:

![Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%202.png](Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%202.png)

The other half(400ns ~ 800ns) is:

![Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%203.png](Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Untitled%203.png)

## Simulation Analysis

Let me analyze these carefully.

[Simulation Analysis](Testbench%20Simulation%20and%20Conclusion%20957987fb50e3484f8b83251dc5b17d47/Simulation%20Analysis%20384ea7b49bab49a98bfef291e0e0364d.csv)

## Conclusion

In conclusion, all instructions worked correctly at least under this testbench. Of course, this test may not cover all possible cases. But at least under this simulation, this circuit conducted tiny CPU functions as expected.