# Day 3 -- RTL Implementation and Functional Verification

## RTL Design and Simulation

After building a foundation in CMOS logic and digital abstraction, I
progressed to the Register-Transfer Level (RTL) stage. The objective at
this phase was to translate logic concepts into synthesizable Verilog
and verify functional correctness before moving toward physical
implementation.

At this stage, I focused on two essential categories of digital logic:

-   Combinational logic\
-   Sequential (clocked) logic

Understanding this distinction is fundamental in real digital ASIC
design workflows.

------------------------------------------------------------------------

## Combinational Logic -- 4-bit Adder

I implemented a 4-bit adder using synthesizable Verilog. The design uses
a continuous assignment statement, which models purely combinational
behavior.

``` verilog
assign sum = a + b;
```

This exercise reinforced how Boolean abstraction maps directly into RTL
hardware description.

### Verification Observations

-   Output updates immediately when inputs change\
-   No clock dependency\
-   No inferred latches\
-   Clean and predictable simulation behavior

### Waveform Evidence

![Adder Waveform](docs/adder_waveform.png)

The waveform confirms correct output values:

-   2 + 3 = 5\
-   7 + 8 = 15\
-   15 + 1 = 16

This validated correct combinational behavior prior to synthesis.

------------------------------------------------------------------------

## Sequential Logic -- 4-bit Counter

Next, I implemented a synchronous 4-bit counter using a
positive-edge-triggered clock. This introduced state and time-dependent
behavior into the design.

``` verilog
always @(posedge clk) begin
    if (rst)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end
```

### Design Decisions

-   Used `always @(posedge clk)` for clocked logic\
-   Used non-blocking assignment (`<=`) to correctly model register
    updates\
-   Implemented synchronous reset

These reflect standard digital design practices used in ASIC workflows.

### Verification Observations

-   Reset correctly initializes the counter to zero\
-   Counter increments only on rising clock edges\
-   No glitches or unintended transitions\
-   Stable waveform behavior across cycles

### Waveform Evidence

![Counter Waveform](docs/counter_waveform.png)

The waveform confirms proper sequential behavior:

-   Reset forces count to 0\
-   Count increments 0 → 1 → 2 → 3 → ...\
-   Updates occur strictly on positive clock edges

------------------------------------------------------------------------

## Verification Methodology

All RTL modules were validated using separate testbenches. Simulation
was performed prior to synthesis, following correct digital design
methodology.

Waveforms were generated using Icarus Verilog and visualized in EPWave.
This ensured functional correctness before moving to physical
implementation.

This stage reinforced an essential principle:

> Functional correctness must be established before physical design and
> synthesis.

------------------------------------------------------------------------

## Key Learning Outcomes

Through this stage, I gained practical understanding of:

-   The difference between combinational and sequential logic\
-   Hardware description versus software programming\
-   The importance of non-blocking assignments in clocked designs\
-   The role of structured verification in digital IC development\
-   How abstraction enables scalable system design

------------------------------------------------------------------------

## Reflection

This phase marked the transition from theoretical logic concepts to
actual hardware modeling. Writing RTL and validating behavior through
simulation strengthened my understanding of how digital systems are
formally described before synthesis and physical implementation.

With verified RTL in place, the next step is logic synthesis and ASIC
hardening.
