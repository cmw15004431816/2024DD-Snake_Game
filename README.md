# 2024DD-Snake_Game

This repository contains the implementation of the classic Snake game in Verilog. The project is designed for the `xz7k160tffg676-2L` FPGA board and includes detailed modules for VGA display, snake movement, and game logic.

## Table of Contents
- [Introduction](#introduction)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Design Details](#design-details)
- [Results](#results)
- [Future Work](#future-work)
- [Acknowledgements](#acknowledgements)
- [References](#references)

## Introduction
The Snake game is a popular video game where the player controls a snake that grows in length after consuming food items. The game ends when the snake collides with itself or the boundaries of the playing area. This project implements the Snake game in Verilog, showcasing hardware design skills and FPGA programming.

## Features
- **VGA Display**: The game is displayed on a VGA monitor.
- **Snake Movement**: Controlled using keyboard inputs.
- **Score Tracking**: Keeps track of the player's score.
- **Game Over Detection**: Detects collisions with the snake’s body or boundaries.
- **Modular Design**: Organized into clear and reusable modules.

## Directory Structure
```
2024DD-Snake_Game/
├── img/
│   └── ...
├── ref/
│   └── ref1
|       └── PS2.v
│   └── ref2
|       └── VGA.v
│   └── ref3
|       └── Buzzer.md
├── src/
│    ├── src/
|    |   ├── VGA.v
│    |   ├── snake_control.v
│    |   ├── top.v
│    |   └── ...
|    ├── sim/
|    |   ├── VGA_sim.v
│    |   ├── snake_control_sim.v
│    |   ├── top_sim.v
│    |   └── ...
|    └── constr/
|        └── top.xdc
├── README.md
├── report.pdf
└── snack.bit
```

## Getting Started
### Prerequisites
- Xilinx Vivado Design Suite
- `xz7k160tffg676-2L` FPGA board
- VGA monitor
- PS/2 keyboard

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/cmw15004431816/2024DD-Snake_Game.git
    ```
2. Open Vivado and [load the project](#Load-the-project).

### Or
1. If you don't want to clone the whole project, you can download the [snack.bit](https://github.com/cmw15004431816/2024DD-Snake_Game/raw/main/snack.bit) file that I have prepared for you.
2. Program the `snack.bit` bitstream file directly into your `xz7k160tffg676-2L` FPGA board.
3. **Playing the Game**:
    - Connect a VGA monitor and PS/2 keyboard to the FPGA board.
    - Reset the FPGA and start playing using the switches.

## Load the project
1. **Open Vivado and create a new project.** You can name it whatever you like, or use my name `Snake_Game`. When creating the project, you must select the **xz7k160tffg676-2L** FPGA board.
2. **Add design sources.** All the files in the [src](src/src) folder should be added as design sources.
3. **(Optional)** Add simulation sources. All the files in the [sim](src/sim) folder should be added as simulation sources.
4. **Add constrain file.** Add the [top.xdc](src/constr/top.xdc) file as the constrain.

## Usage
1. **Synthesizing and Implementing**:
    - Open the project in Vivado.
    - Run synthesis, implementation, and generate the bitstream.

2. **Loading onto FPGA**:
    - Connect the FPGA board to your computer.
    - Use the generated `snack.bit` file to program the FPGA.

3. **Playing the Game**:
    - Connect a VGA monitor and PS/2 keyboard to the FPGA board.
    - Reset the FPGA and start playing using the switches.

4. **(Optional) Run Simulation**:
   - After adding the simulation sources, you can choose one simulation file and set it as top, then run the behavioral simulation.

## Design Details
### VGA Controller
- Manages the VGA signal generation.
- Handles the resolution and synchronization signals.

### Snake Logic
- Controls the snake's movement, growth, and collision detection.
- Processes keyboard inputs for direction control.

### Top Module
- Integrates the VGA controller and snake logic.
- Manages game states and score tracking.

## Results
The project successfully implements the Snake game with smooth VGA display and responsive controls. The design is efficient, utilizing available FPGA resources effectively. Detailed results and performance analysis are available in the [report.pdf](report.pdf).

## Future Work
- **Enhancing Graphics**: Improve the visual elements of the game.
- **Adding Levels**: Introduce different levels with varying difficulties.
- **Sound Integration**: Add sound effects for game actions.

## Acknowledgements
- Special thanks to the course instructors and lab assistants for their guidance.
- Resources and references from online FPGA and Verilog communities that have been mentioned in the ref folder.

## References
- [Xilinx Vivado Documentation](https://www.xilinx.com/support/documentation-navigation/design-hubs/dh0000-vivado-design-suite-hub.html)
- [Verilog HDL Guide](https://www.asic-world.com/verilog/veritut.html)

---
