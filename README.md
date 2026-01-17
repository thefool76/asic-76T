# ASIC Design Fundamentals: A Self-Directed Learning Project

## Project Overview

I built this project to prepare for undergraduate study in VLSI and semiconductor engineering. My goal was straightforward: understand the complete digital ASIC design flow from transistors to GDSII, and do it by actually building things rather than just reading about them.

This was an accelerated, self-driven effort over a short period. I do not claim production-level expertise—this is documentation of a learning process. What I can say is that I now understand why each step in the ASIC flow exists and how the pieces connect.

## Scope of Work

### What This Project Covers

- **CMOS Fundamentals**: How NMOS and PMOS transistors work, why complementary logic eliminates static power, basic switching behavior
- **Digital Logic Abstraction**: Boolean algebra, combinational and sequential circuits, FSMs, and how we get from transistors to useful building blocks
- **RTL Design and Simulation**: Writing synthesizable Verilog, building testbenches, running simulations, interpreting waveforms
- **ASIC Synthesis**: Getting from RTL to gates, working with timing constraints, reading synthesis reports
- **Physical Design**: Floorplanning, placement, CTS, routing, and DRC using OpenLane
- **Fabrication Mapping**: Understanding what GDSII actually represents and how it becomes silicon

### What I Did Not Cover

- Analog and mixed-signal design
- Building custom cell libraries
- Multi-corner multi-mode timing closure
- Post-silicon validation
- DFM considerations for advanced nodes



## Technical Workflow

The ASIC flow has a logical order, and understanding that order matters. Here is how I approached each stage.

### Transistor-Level Understanding

Before writing any Verilog, I spent time understanding what is actually happening at the device level. CMOS transistors are voltage-controlled switches, and the complementary arrangement is not arbitrary—it is what makes static power negligible. This foundation helps later when interpreting power reports or understanding why certain RTL structures synthesize poorly.

### RTL Design

RTL describes hardware as data moving between registers on clock edges. Writing Verilog that actually synthesizes to hardware (not just simulates correctly) requires care. I learned to avoid constructs that only exist in simulation and to think about what the synthesizer will produce.

### Simulation and Verification

Simulation catches mistakes before they become expensive. I wrote testbenches to apply inputs and check outputs against expected behavior. This is where most debugging happens, and it should—fixing a bug in RTL costs nothing compared to fixing it after tapeout.

### Synthesis

Synthesis translates RTL into a netlist of standard cells from a target library. The synthesizer optimizes for timing, area, and power based on constraints I provide. Learning to read synthesis reports—understanding where timing is tight, what is using the most area—was more useful than I expected.

### Floorplanning and Placement

Floorplanning sets the die size and positions major blocks. Placement assigns locations to every standard cell. I learned that bad placement can make a design unroutable even if the RTL is fine. Physical design is not just "push button after synthesis."

### Routing and Verification

Routing connects everything according to the netlist while respecting metal layer rules. After routing, DRC checks that the layout is manufacturable and LVS checks that it matches the schematic. These steps exist because errors here mean dead silicon.

### GDSII Generation

GDSII is the final output—geometric data that defines mask patterns for fabrication. Understanding that these polygons become actual structures on a wafer was clarifying. It connected everything upstream to the physical reality of manufacturing.

## Tools and Technologies

| Category | Tool / Technology |
|----------|-------------------|
| HDL | Verilog |
| Simulation | Icarus Verilog, GTKWave |
| Synthesis and PD | OpenLane |
| PDK | SkyWater SKY130 |
| Layout Viewer | KLayout |

### Why Open-Source Tools

I used open-source tools because they are accessible and because they force you to understand what is happening. Commercial tools have better optimization and polish, but the core concepts—constraints, timing, physical design trade-offs—are the same. Working with OpenLane meant I could not hide behind a GUI; I had to understand the flow.

## Repository Structure

```
├── fundamentals/
│   └── CMOS theory, logic gate exercises
├── rtl/
│   └── Verilog source files
├── testbench/
│   └── Testbenches and verification scripts
├── synthesis/
│   └── Constraint files, synthesis scripts, reports
├── physical_design/
│   └── OpenLane configs, floorplans, layout outputs
├── gdsii/
│   └── Final GDSII, DRC/LVS reports
└── docs/
    └── Notes and references
```

The structure follows the design flow, not the order I studied things. Each folder is self-contained.

## Key Learning Outcomes

- I understand how CMOS transistors work and why that matters for power and timing
- I can write synthesizable Verilog and build testbenches that actually catch bugs
- I have run the full RTL-to-GDSII flow using OpenLane and can interpret the outputs
- I understand what timing constraints do and how they affect synthesis and placement
- I recognize why physical design decisions impact manufacturability
- I see how each abstraction layer connects to the ones above and below it

## Academic Relevance

This project gives me a foundation for undergraduate level VLSI coursework. I am not starting from zero—I understand the flow, I have used the tools, and I know where the hard problems are. Topics like low-power design, high-speed circuits, and design automation will build on this base rather than introducing it from scratch.

Undergraduate study will deepen what I have started here through formal device physics, advanced circuit techniques, and experience with commercial tools and modern process nodes.

## Closing Note

This repository documents what I actually did and learned. Everything here is reproducible with the listed open-source tools. I built this to prepare for undergraduate study and to demonstrate genuine engagement with the material.

I welcome corrections and suggestions.
