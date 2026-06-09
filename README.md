# 101 Sequence Detector (Non-Overlapping) using Verilog

## Overview

This project implements a Non-Overlapping 101 Sequence Detector using a Mealy Finite State Machine (FSM) in Verilog HDL.

The detector monitors a serial input stream and generates an output `y = 1` whenever the sequence `101` is detected. After detection, the FSM returns to the initial state, preventing overlapping detections.

## State Diagram

States used:

* State A (00): Initial state
* State B (01): Detected '1'
* State C (10): Detected '10'

State Transitions:

| Present State | Input | Next State | Output |
| ------------- | ----- | ---------- | ------ |
| A (00)        | 0     | A (00)     | 0      |
| A (00)        | 1     | B (01)     | 0      |
| B (01)        | 0     | C (10)     | 0      |
| B (01)        | 1     | B (01)     | 0      |
| C (10)        | 0     | A (00)     | 0      |
| C (10)        | 1     | A (00)     | 1      |

## Files

* `seq101.v` : Verilog implementation of the sequence detector.
* `tb_seq101.v` : Testbench for simulation.
* `seq101.vcd` : Generated waveform file.
* `state_diagram.png` : FSM state diagram.
## .gitignore

The `.gitignore` file excludes generated simulation files (such as `*.vcd`) from the repository, keeping the project clean and focused on source code.

## Simulation

Tools used:

* Icarus Verilog
* GTKWave

### Compile

```bash
iverilog -o sim seq101.v tb_seq101.v
```

### Run Simulation

```bash
vvp sim
```

### View Waveform

```bash
gtkwave seq101.vcd
```

## Test Sequence

Input stream used during simulation:

```text
1011101
```

The detector successfully identifies the sequence `101` and asserts the output signal `y`.

## Results

Simulation results verified using GTKWave show correct state transitions and successful detection of the non-overlapping sequence `101`.

## Author

Abinash
