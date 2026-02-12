# Simple CPU (VHDL)

An 8-bit “Simple CPU” implemented in VHDL and built in Quartus Prime.  
The CPU supports an 8-instruction ISA and is verified using RTL simulation (ModelSim) with a provided test program.

## Instruction Set (8 opcodes)

| Opcode | Mnemonic | Operation |
|-------:|----------|-----------|
| 000 | Load N  | D0 ← MEM[N] |
| 001 | Store N | MEM[N] ← D0 |
| 010 | Add N   | D0 ← D0 + MEM[N] |
| 011 | Sub N   | D0 ← D0 − MEM[N] |
| 100 | Inc N   | MEM[N] ← MEM[N] + 1 |
| 101 | Dec N   | MEM[N] ← MEM[N] − 1 |
| 110 | Bra N   | PC ← N |
| 111 | Beq N   | if Z=1 then PC ← N |

## Architecture (high level)

- **Datapath:** register D0, ALU, bus logic, and status flag(s) (e.g., Zero flag Z)
- **Control unit:** instruction sequencing + opcode decoding + control signal generation
- **Memory interface:** reads/writes external memory (used by the testbench program)

## Project Structure

- `VHDLSource/` — VHDL source modules (datapath, control logic, ALU, registers, etc.)
- `simple_cpu.bdf` — top-level block diagram wiring
- `simple_cpu.qsf` / `LA9.qpf` — Quartus project files
- `simulation/` — simulation assets (ModelSim scripts + program memory file)

## How to Open in Quartus

1. Open Quartus Prime
2. **File → Open Project**
3. Select `LA9.qpf`

### Option A — Compile (synthesis)

- **Processing → Start Compilation**

### Option B — RTL Simulation (what I used)

If you only want to run the provided RTL simulation/testbench, you can run simulation without doing a full compilation first:

1. **Tools → Run Simulation Tool → RTL Simulation**
2. Launch ModelSim and run the provided `.do` script (see below)

## How to Simulate (ModelSim)

In `simulation/modelsim/`:

1. Confirm the program memory file is named `ProgramData.txt`
2. Make sure `ProgramData.txt` is in the same folder as the `.do` script
3. In ModelSim, run:
    - `testbench.do` (or `simple_cpu_run_msim_rtl_vhdl.do` if included)

> Note: The provided program is designed to exercise all 8 instructions and includes an infinite loop.

## Tools

- Quartus Prime (Intel FPGA)
- ModelSim (RTL simulation)
- VHDL

## Portfolio Notes

This repository contains my VHDL implementation and project wiring files (BDF/BSF/QSF/QPF).  
Generated Quartus build outputs (db/, incremental_db/, output_files/) are intentionally excluded.
