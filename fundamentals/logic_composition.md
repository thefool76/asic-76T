# From CMOS to Digital Logic

## Okay, So We Have Transistors. Now What?

Once I got the CMOS inverter, something clicked. You've got a switch that reliably goes high or low. That's it. That's the building block. Everything else is just stacking these switches in clever ways.

Boolean algebra suddenly makes sense in a physical way. High voltage? That's TRUE. Low? FALSE. An inverter is literally just a NOT gate built from transistors. Add a few more transistors in the right configuration and you've got AND, OR, NAND, NOR. It's not abstract math anymore—it's circuits.

The nice thing is, once you trust that the transistors work, you can forget about them. You stop thinking "okay the PMOS turns on when..." and start thinking "if A AND B, then output is high." That's the abstraction doing its job.

---

## NAND and NOR: The Only Gates You Actually Need

Here's something I didn't expect: you can build literally any digital circuit using just NAND gates. Or just NOR gates. Pick one, and you're set. They call these "universal gates."

Sounds like trivia, right? But it's not. This is why standard-cell libraries aren't stuffed with hundreds of exotic gates. They're mostly NAND and NOR variants with different drive strengths. When your synthesis tool crunches through RTL and spits out a netlist, it's picking from these.

Why did NAND and NOR win? I dug into this:

A 2-input NAND is dead simple in CMOS. Four transistors. Two PMOS in parallel up top, two NMOS in series on the bottom. Symmetric, easy to lay out, efficient. Want a plain AND gate? That's actually a NAND plus an inverter—more transistors. NAND is cheaper.

Same story with noise margins. Both transistors drive the output hard toward the rails. No weak pull-ups, no resistive nonsense. Clean switching.

And layout loves them. Regular structures, predictable timing. There's a reason every PDK has a dozen NAND variants and way fewer of anything else.

---

## Building Blocks: It's Just Composition

Once you've got universal gates, you can build anything. Muxes, decoders, adders—they're all just gates wired together in patterns.

I like thinking about adders because they show the composition clearly. A half adder is two gates: XOR for the sum, AND for the carry. Break the XOR down and it's four NANDs. So a half adder is just... NANDs.

Chain two half adders with an OR and you've got a full adder. Chain a bunch of full adders and you've got a ripple-carry adder. Keep going and you're building an ALU. At no point do you need anything fancier than the gates you started with. You just keep composing.

That's the trick. Small things combine into bigger things. Each layer hides what's below it. You don't think about transistors when you're wiring up a full adder, and you don't think about full adders when you're writing RTL for a processor. The abstractions stack.

---

## Zooming Out: How This Scales to Real Chips

Nobody designs a modern chip by placing transistors. The hierarchy goes something like:

- Transistors → gates
- Gates → small blocks (adders, muxes, registers)
- Blocks → functional units (ALUs, register files)
- Units → cores
- Cores → chips

Each level works with abstractions from the level below. When I write RTL, I'm describing registers and combinational logic. Synthesis turns that into gates. Place-and-route turns gates into physical layout. GDSII turns layout into masks.

What clicked for me is that RTL isn't magic. It's just a higher-level description that eventually compiles down to gates, which compile down to transistors. Once you see the full stack, everything feels less mysterious.

---

## Why I'm Glad I Learned This

Honestly, you don't think about NAND gates every day when writing Verilog. But knowing they're there helps in specific moments:

When synthesis tells me I've got 50k gates, I know what that actually means. When timing analysis shows a long path through combinational logic, I can picture the gates switching in sequence. When some RTL construct synthesizes weirdly, I have a mental model for why.

It's background knowledge. Most of the time it just sits there. But when you need it, you really need it. And it makes the whole ASIC flow feel less like a black box.
