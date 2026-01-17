# ASIC Design Fundamentals: A Self-Directed Learning Project

## Project Overview

This repository documents a self-directed, accelerated study of application-specific integrated circuit (ASIC) design fundamentals. The project was undertaken as preparation for graduate study in VLSI and semiconductor engineering, with the explicit goal of building foundational competence across the complete digital ASIC design flow—from transistor-level understanding to physical implementation.

The work presented here reflects a learning-by-building approach: rather than passive study, each concept was reinforced through hands-on implementation using industry-standard open-source tools. This project does not claim production-level expertise; it represents an earnest effort to establish the conceptual and practical foundations necessary for rigorous graduate coursework and research.

## Scope of Work

### Topics Covered

- **CMOS Fundamentals**: Operation of NMOS and PMOS transistors, complementary logic, static power dissipation, and basic switching characteristics
- **Digital Logic Abstraction**: Boolean algebra, combinational and sequential logic, finite state machines, and the abstraction hierarchy from transistors to functional blocks
- **RTL Design and Simulation**: Synthesizable Verilog coding, testbench development, functional verification, and waveform analysis
- **ASIC Synthesis**: Translation of RTL to gate-level netlists, timing constraints, and optimization trade-offs
- **Physical Design**: Floorplanning, placement, clock tree synthesis, routing, and design rule checking using the OpenLane flow
- **Fabrication Mapping**: Conceptual understanding of how GDSII layout data corresponds to mask generation and silicon fabrication

### Intentionally Out of Scope

- Analog and mixed-signal design
- Custom cell library development
- Advanced timing closure techniques (multi-corner multi-mode analysis)
- Post-silicon validation and testing
- Design for manufacturability at advanced nodes

These topics require deeper specialization and are deferred to formal graduate study.

## Technical Workflow

The ASIC design process follows a well-defined progression from abstract specification to physical implementation. This section outlines each stage and its significance.

### Transistor-Level Understanding

CMOS transistors form the physical substrate of all digital logic. Understanding how NMOS and PMOS devices function as voltage-controlled switches—and how their complementary arrangement eliminates static power dissipation—provides essential intuition for interpreting synthesis results and power analysis.

### RTL Design

Register-transfer level (RTL) design abstracts hardware behavior into synchronous data transfers between registers. Verilog serves as the hardware description language for specifying this behavior. Writing synthesizable RTL requires discipline: the designer must distinguish between constructs that describe hardware and those that exist only for simulation.

### Simulation and Verification

Functional simulation validates that the RTL behaves as intended before committing to synthesis. Testbenches apply stimulus and check outputs against expected results. This step catches logical errors early, when they are inexpensive to correct.

### Synthesis

Synthesis maps RTL descriptions to a target cell library, producing a gate-level netlist. The synthesizer optimizes for timing, area, and power subject to user-defined constraints. Understanding synthesis reports is essential for diagnosing timing violations and resource utilization.

### Floorplanning and Placement

Floorplanning defines the physical die area and positions major functional blocks. Placement assigns specific locations to each standard cell. Decisions at this stage directly impact timing closure and routability; poor placement can make a design unroutable regardless of RTL quality.

### Routing and Verification

Routing connects placed cells according to the netlist, respecting metal layer constraints and design rules. After routing, design rule checking (DRC) and layout versus schematic (LVS) verification confirm that the physical design is manufacturable and functionally equivalent to the netlist.

### GDSII Generation

The final layout is exported in GDSII format, the standard interchange format for mask data. This file defines the geometric patterns that will be transferred to silicon through photolithography. Understanding this mapping—from polygons to fabricated structures—completes the conceptual link between design and manufacturing.

## Tools and Technologies

| Category | Tool / Technology |
|----------|-------------------|
| HDL | Verilog |
| Simulation | Icarus Verilog, GTKWave |
| Synthesis and Physical Design | OpenLane (RTL-to-GDSII flow) |
| Process Design Kit | SkyWater SKY130 (130nm open-source PDK) |
| Layout Viewer | KLayout |

### Rationale for Open-Source Tools

Open-source EDA tools and the SKY130 PDK provide meaningful exposure to industrial ASIC design flows without requiring proprietary licenses. While commercial tools offer superior optimization and broader process node support, the fundamental concepts—synthesis constraints, timing analysis, physical design trade-offs—remain consistent. Proficiency with open-source flows demonstrates both resourcefulness and genuine understanding, as these tools require the user to engage directly with design decisions that commercial GUIs may obscure.

## Repository Structure

```
├── fundamentals/
│   └── CMOS theory, logic gate analysis, and transistor-level exercises
├── rtl/
│   └── Verilog source files for designed modules
├── testbench/
│   └── Simulation testbenches and verification scripts
├── synthesis/
│   └── Synthesis scripts, constraint files, and timing reports
├── physical_design/
│   └── OpenLane configuration, floorplans, and layout outputs
├── gdsii/
│   └── Final GDSII files and DRC/LVS reports
└── docs/
    └── Notes on concepts, workflow documentation, and references
```

The structure reflects the logical progression of the ASIC flow rather than chronological order of study. Each directory is self-contained, with relevant scripts and documentation co-located with design artifacts.

## Key Learning Outcomes

- Developed working intuition for CMOS operation and its implications for power and delay
- Acquired proficiency in writing synthesizable Verilog and structuring testbenches for verification
- Gained practical experience with the RTL-to-GDSII flow using OpenLane
- Understood the role of timing constraints and their impact on synthesis and placement
- Recognized the relationship between physical design decisions and manufacturability
- Appreciated the abstraction hierarchy that enables tractable design of complex systems

## Academic Relevance

This project establishes the foundational knowledge expected at the start of graduate-level VLSI coursework. Familiarity with the complete ASIC flow—from RTL through physical design—provides context for advanced topics such as low-power design, high-speed signaling, and design-for-test. The hands-on experience with synthesis and place-and-route prepares the student to engage meaningfully with research problems in physical design automation, timing optimization, and emerging device technologies.

Graduate study will deepen this foundation through formal treatment of device physics, advanced circuit techniques, and exposure to state-of-the-art commercial tools and process nodes.

## Closing Note

This repository is offered as transparent documentation of a self-directed learning effort. All designs, scripts, and results are reproducible using the open-source tools specified. The work reflects genuine engagement with ASIC design fundamentals, undertaken with the motivation to build a solid foundation for graduate study and long-term contribution to the semiconductor field.

Feedback, corrections, and suggestions for improvement are welcomed.
