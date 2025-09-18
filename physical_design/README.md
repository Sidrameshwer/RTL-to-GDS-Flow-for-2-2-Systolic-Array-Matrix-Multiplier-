The tool used for PnR is Cadence INNOVUS.
Used the generated netlist and SDC file.

 The flow included:
Floorplanning – Defined die/core area, placed I/O pins, and performed power planning.
Placement – Placed standard cells with optimization for timing and medium congestion.
Clock Tree Synthesis (CTS) – Ran a TCL script to generate a clock tree.
Routing – Performed global and detailed routing for signal interconnects along with power/ground grid connections.
Optimization & Signoff – Achieved timing closure and verified design through DRC and LVS checks.

__Initialising the design__
- Design initialization like, setting the netlist file, loading the .lef file path, MMMC setup file(timing libraries, corners, and constraints) is done by sourcing a TCL file.
- After this, the "init_design" command is run to load the design into the Innovus database.


__Placement and Routing__
We use GUI after this to do
- Floor plan
- Pin editor
- Power plan
- Connect global nets
- Add end cap
- Special route
- Placement
- Pre CTS
- CTS
- Post CTS
- Route
- Post Route

