# ASIC Design Fundamentals: A Self-Directed Learning Project

## Table of Contents

1. [Project Overview](#project-overview)
2. [Scope of Work](#scope-of-work)
3. [Technical Workflow](#technical-workflow)
4. [Tools and Technologies](#tools-and-technologies)
5. [Repository Structure](#repository-structure)
6. [Key Learning Outcomes](#key-learning-outcomes)
7. [Academic Relevance](#academic-relevance)
8. [Reproducibility](#reproducibility)
9. [Closing Note](#closing-note)

---

## Project Overview

This repository documents a self-directed study of the digital ASIC design flow, from transistor-level fundamentals through physical implementation and GDSII generation. The project was undertaken as preparation for undergraduate study in VLSI and semiconductor engineering. It emphasizes learning through implementation rather than passive study.

---

## Scope of Work

**Summary:** This project covers the core stages of digital ASIC design using open-source tools, while deferring specialized topics to formal coursework.

### Covered

- **CMOS Fundamentals** — NMOS/PMOS operation, complementary logic, static power characteristics
- **Digital Logic** — Boolean algebra, combinational and sequential circuits, finite state machines
- **RTL Design** — Synthesizable Verilog, testbench development, functional simulation
- **Synthesis** — RTL-to-gate mapping, timing constraints, synthesis report interpretation
- **Physical Design** — Floorplanning, placement, clock tree synthesis, routing, DRC/LVS
- **Fabrication Mapping** — GDSII structure and its relationship to mask generation

### Intentionally Out of Scope

- Analog and mixed-signal design
- Custom cell library development
- Multi-corner multi-mode timing analysis
- Post-silicon validation and test
- Design for manufacturability at advanced nodes

---

## Technical Workflow

**Summary:** The ASIC flow proceeds from device-level understanding through RTL, synthesis, physical design, and layout export. Each stage builds on the previous.

### Transistor-Level Understanding

CMOS transistors function as voltage-controlled switches. The complementary arrangement of NMOS and PMOS devices eliminates static power dissipation in steady state. Understanding this foundation informs interpretation of power analysis and synthesis results.

### RTL Design

Register-transfer level design describes hardware behavior as synchronous data transfers between registers. Writing synthesizable Verilog requires distinguishing simulation-only constructs from those that map to physical hardware.

### Simulation and Verification

Testbenches apply stimulus to the design and verify outputs against expected behavior. Functional simulation identifies logic errors before synthesis, when correction cost is minimal.

### Synthesis

Synthesis maps RTL to a gate-level netlist using cells from a target library. The tool optimizes for timing, area, and power subject to user-defined constraints. Synthesis reports reveal timing slack and resource utilization.

### Physical Design

Floorplanning defines die area and block positions. Placement assigns locations to standard cells. Routing connects cells while respecting metal layer constraints. Poor physical design can render a functionally correct design unroutable.

### Design Rule and Layout Verification

Design rule checking (DRC) confirms manufacturability. Layout versus schematic (LVS) verification confirms functional equivalence between layout and netlist.

### GDSII Generation

GDSII encodes geometric mask data for fabrication. The file defines polygon shapes that correspond to physical structures on the manufactured die.

---

## Tools and Technologies

**Summary:** Open-source tools provide accessible, transparent exposure to industry-standard ASIC design concepts.

| Category | Tool |
|----------|------|
| HDL | Verilog |
| Simulation | Icarus Verilog |
| Waveform Viewer | GTKWave |
| RTL-to-GDSII Flow | OpenLane |
| Process Design Kit | SkyWater SKY130 (130nm) |
| Layout Viewer | KLayout |

### Tool Selection Rationale

Open-source EDA tools and the SKY130 PDK enable hands-on engagement with the ASIC flow without proprietary licenses. While commercial tools offer superior optimization, the underlying concepts—timing constraints, synthesis trade-offs, physical design decisions—remain consistent. OpenLane requires direct interaction with each flow stage, reinforcing conceptual understanding.

---

## Repository Structure

**Summary:** The repository is organized by design flow stage, not by study chronology.

```
fundamentals/     CMOS theory, logic gate exercises
rtl/              Verilog source files
testbench/        Testbenches and verification scripts
synthesis/        Constraint files, synthesis scripts, reports
physical_design/  OpenLane configuration, floorplans, layout outputs
gdsii/            Final GDSII files, DRC/LVS reports
docs/             Notes and references
```

Each directory is self-contained with relevant scripts and documentation.

---

## Key Learning Outcomes

- Functional understanding of CMOS transistor operation and its implications for power and delay
- Proficiency in writing synthesizable Verilog and developing effective testbenches
- Practical experience executing the RTL-to-GDSII flow using OpenLane
- Ability to interpret synthesis reports, timing constraints, and physical design outputs
- Recognition of how physical design decisions affect routability and manufacturability
- Conceptual grasp of how abstraction layers connect across the ASIC flow

---

## Academic Relevance

**Summary:** This project establishes foundational competence for undergraduate VLSI coursework.

The work provides direct preparation for topics including low-power design, high-speed circuit techniques, and design automation. Familiarity with the complete ASIC flow enables meaningful engagement with advanced material rather than learning prerequisites concurrently.

Undergraduate study will extend this foundation through formal treatment of device physics, circuit analysis, and exposure to commercial tools and modern process nodes.

---

## Reproducibility

All designs, scripts, and results in this repository are reproducible using the open-source tools listed above. The SKY130 PDK and OpenLane are publicly available. No proprietary software or hardware is required.

---

## Closing Note

This repository represents an honest documentation of self-directed learning. It demonstrates genuine engagement with ASIC design fundamentals and a commitment to building practical competence before formal study.

Corrections and suggestions are welcome.
