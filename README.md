# 32-bit CPU/ALU ASIC Flow

## Project Summary

This project implements and analyzes a Verilog-based 32-bit CPU/ALU datapath through a standard ASIC design flow. The design explores arithmetic, logic, memory, register, comparator, and control components, with a focus on comparing multiple adder architectures and evaluating their post-place-and-route timing performance.

The project compares four 32-bit adder architectures:

- Carry Ripple Adder (CRA)
- Carry Lookahead Adder (CLA)
- Carry Skip Adder (CSA)
- Carry Select Adder (CSeA)

The design flow includes RTL simulation, synthesis, post-synthesis verification, place-and-route, equivalence checking, and layout review using Cadence and Synopsys tools.

## Project Overview

Arithmetic units are critical components of CPU datapaths because addition, subtraction, comparison, and address computation often affect the processor’s timing path. This project studies how different adder architectures affect the performance of a 32-bit CPU/ALU design after synthesis and physical implementation.

The design includes:

- 32-bit CPU/ALU datapath
- Arithmetic and logic operations
- Register and memory blocks
- Multiplier logic
- Comparator logic
- Multiple adder architecture variants
- Testbenches for functional validation
- ASIC flow reports for timing, area/cell usage, and power

## Tools Used

- Verilog HDL
- Cadence Xcelium
- Cadence SimVision
- Synopsys Design Compiler
- Synopsys Formality
- Cadence Innovus
- Cadence Virtuoso

## Architecture Overview

The project evaluates a CPU/ALU datapath using different arithmetic implementations. The main design file includes modules for datapath, control, memory, arithmetic, logic, and comparison functionality.

Key architectural components include:

- Decoder logic
- Tristate buffers
- 32-bit registers
- Memory blocks
- Logic functions
- Full adder logic
- Carry-lookahead blocks
- Multiplier
- ALU
- Comparator
- Top-level CPU module

## Adder Architectures Compared

| Architecture | Description |
|---|---|
| Carry Ripple Adder (CRA) | Simple cascaded full-adder structure where carry propagates sequentially. |
| Carry Lookahead Adder (CLA) | Uses generate/propagate logic to compute carries faster at the cost of more hardware complexity. |
| Carry Skip Adder (CSA) | Divides the adder into blocks and allows carry propagation to skip over blocks under certain conditions. |
| Carry Select Adder (CSeA) | Precomputes results for possible carry-in values and selects the correct result using multiplexers. |

## ASIC Flow

The project follows a standard-cell ASIC design flow:

1. **RTL Design**  
   Verilog modules were implemented for CPU/ALU datapath components and adder variants.

2. **RTL Simulation**  
   Functional correctness was validated using Cadence Xcelium and waveform inspection in SimVision.

3. **Logic Synthesis**  
   Designs were synthesized using Synopsys Design Compiler to generate gate-level netlists and timing/power/cell reports.

4. **Post-Synthesis Simulation**  
   Synthesized netlists were simulated to verify that the gate-level design preserved RTL functionality.

5. **Place and Route**  
   Cadence Innovus was used for physical implementation and post-place-and-route timing analysis.

6. **Equivalence Checking**  
   Synopsys Formality was used to verify functional equivalence across design stages.

7. **Layout Review**  
   Final layouts were reviewed using Cadence Virtuoso.

## Results

Post-place-and-route frequency comparison:

| Adder Architecture | Maximum Frequency |
|---|---:|
| Carry Ripple Adder | 160.000 MHz |
| Carry Lookahead Adder | 157.870 MHz |
| Carry Skip Adder | 163.180 MHz |
| Carry Select Adder | 160.102 MHz |

The Carry Skip Adder achieved the highest reported maximum frequency among the evaluated architectures. The results show that adder architecture can affect timing performance after physical implementation, even when the higher-level CPU/ALU datapath remains consistent.

## Implemented Files

| File | Description |
|---|---|
| `rtl/cpu_comp.v` | Main Verilog source containing CPU/ALU datapath modules and arithmetic logic. |
| `testbench/tb_comp.v` | Testbench for comparator/ALU functionality. |
| `testbench/tb2cpu.v` | Testbench for CPU datapath validation. |
| `docs/final_report.pdf` | Cleaned technical report with simulation, synthesis, P&R, equivalence, and layout results. |
| `results/timing_summary.txt` | Summary of post-place-and-route frequency results. |

## Folder Structure

```text
32-bit-cpu-alu-asic-flow/
├── rtl/
│   └── cpu_comp.v
├── testbench/
│   ├── tb_comp.v
│   └── tb2cpu.v
├── docs/
│   └── final_report.pdf
├── results/
│   └── timing_summary.txt
└── README.md
```

## How to Run

The Verilog source and testbenches can be simulated using a Verilog simulator such as Cadence Xcelium.

Example RTL simulation command:

```bash
xrun testbench/tb2cpu.v rtl/cpu_comp.v +access+r
```

For comparator/ALU-specific validation:

```bash
xrun testbench/tb_comp.v rtl/cpu_comp.v +access+r
```

Waveforms can be inspected using Cadence SimVision.

> Note: Full ASIC synthesis and place-and-route reproduction requires access to the appropriate standard-cell libraries, Synopsys Design Compiler/Formality setup, and Cadence Innovus/Virtuoso environment.

## Future Improvements

- Separate the monolithic Verilog file into individual modules.
- Add synthesis scripts and timing constraints where licensing allows.
- Add summarized area and power comparison tables.
- Add waveform screenshots directly in the README.
- Extend the ALU with additional operations and status flags.
- Re-run the architecture comparison with updated timing constraints.
- Add FPGA synthesis as an accessible reproduction path.

## Key Takeaway

This project demonstrates a complete RTL-to-physical-design workflow for a 32-bit CPU/ALU datapath. It shows how arithmetic architecture choices affect post-place-and-route timing and provides practical exposure to RTL simulation, synthesis, physical implementation, equivalence checking, and layout review.
