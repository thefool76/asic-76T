# From CMOS to Digital Logic

## Boolean Logic: The Abstraction Layer

Once you understand that CMOS gives you reliable switching between high and low, you can stop thinking about transistors and start thinking about logic. That's the abstraction.

Boolean algebra maps onto CMOS naturally. A high voltage is TRUE, low is FALSE. AND, OR, NOT—these aren't just mathematical concepts, they're things you can build with transistors. The inverter I covered earlier is just a physical NOT gate. Stack a few more transistors and you get AND, OR, NAND, NOR.

The power of this abstraction is that you can reason about behavior without worrying about voltage levels or switching speeds. You work with truth tables and logic expressions. The transistors are still there, doing their thing underneath, but you don't have to think about them constantly.

---

## NAND and NOR Are Universal

This is one of those facts that sounds academic but matters a lot in practice: NAND and NOR gates are universal. Any Boolean function—no matter how complicated—can be implemented using only NAND gates. Same goes for NOR.

Think about what that means. You don't need a library with dozens of different gate types. In theory, you could build an entire processor using nothing but NANDs. You wouldn't want to, but you could.

Why NAND and NOR specifically? A few reasons:

**Simple CMOS implementation.** A 2-input NAND is just 4 transistors—two PMOS in parallel, two NMOS in series. Clean, symmetric, easy to lay out. AND gates actually require more transistors because you need to invert the NAND output.

**Good noise margins.** The complementary structure gives you strong drive in both directions. Outputs switch cleanly between rails.

**Layout-friendly.** Standard-cell libraries are built around NAND and NOR variants. When synthesis tools map your RTL to gates, they're mostly picking from these. Understanding this helps when you're reading gate-level netlists or optimizing for area.

---

## Combinational Building Blocks

With universal gates as your foundation, you can build anything combinational. Multiplexers, decoders, adders, comparators—they're all just structured arrangements of NAND/NOR logic.

Take a half adder. Two inputs, two outputs: sum and carry. The sum is XOR, the carry is AND. Both can be decomposed into NANDs. Chain half adders together with some extra logic and you get a full adder. Chain full adders and you get a ripple-carry adder. Keep going and you're building ALUs.

The pattern here is composition. Small pieces combine into larger pieces. Each level hides the complexity of the level below. That's how you go from transistors to functional units without losing your mind.

---

## How Composition Scales

This compositional structure is what makes complex systems tractable. Nobody designs a CPU by placing individual transistors. Instead:

- Transistors form gates
- Gates form functional blocks (adders, muxes, registers)
- Blocks form execution units
- Units form cores
- Cores form chips

At each level, you work with the abstractions provided by the level below. When you write RTL, you're describing behavior in terms of registers and combinational logic. Synthesis turns that into gates. Place-and-route turns gates into physical layout. The abstractions stack.

What I find useful about understanding this hierarchy is that it demystifies the whole flow. RTL isn't magic—it's a description that eventually becomes gates that eventually become transistors. Knowing what's at the bottom makes the layers above feel less arbitrary.

---

## Practical Implications

When synthesis reports tell you a design has 50,000 gates, those gates are mostly NAND, NOR, and their inverting variants. When timing analysis shows critical paths through chains of logic, those chains are these same gates switching one after another.

Understanding that NAND/NOR dominate the physical implementation helps when:

- Reading synthesis reports
- Estimating area and power roughly
- Understanding why some RTL structures synthesize better than others
- Debugging timing at the gate level

It's not something you think about every day, but it's useful to have in your mental model.
