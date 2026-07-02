*** R.I.D.E Mk1 ***

Real-time Intelligent Detector of Events
R.I.D.E Mk1 is a motorcycle controller project focused on:
- action camera control
- ride event tagging
- telemetry logging
- BLE connectivity
- FOTA

Current target:
- Zephyr RTOS
- ESP32-C3

The idea is simple: A small handlebar-mounted controller that can sync with cameras, detect interesting riding events, and help generate cleaner ride footage workflows.

*** Current Status ***
The development environment and build system are up and running.

Working setup:
- VS Code Dev Containers
- WSL2
- Docker
- Zephyr RTOS
- ESP32-C3 build target
- Makefile workflow

*** Quick Start ***
Open the project in VS Code:
- code .
- Dev Containers: Reopen in Container
- make setup
- make build (or make build pristine)
- make flash

*** Planned Features ***
- BLE camera control
- GoPro support
- Insta360 support
- Multi-camera synchronization
- BLE FOTA
- IMU-based event detection
- GPS logging
- Manual event markers
- Smartphone companion app

*** Philosophy ***

A good foundation is the base of a good project.
- The goal is to keep the project:
- reproducible
- modular
- portable
- simple to build and maintain
