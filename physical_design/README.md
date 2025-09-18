The tool used for PnR is Cadence INNOVUS.
Used the generated netlist and SDC file.

 The flow included:
Floorplanning – Defined die/core area, placed I/O pins, and performed power planning.
Placement – Placed standard cells with optimization for timing and medium congestion.
Clock Tree Synthesis (CTS) – Ran a TCL script to generate a clock tree.
Routing – Performed global and detailed routing for signal interconnects along with power/ground grid connections.
Optimization & Signoff – Achieved timing closure and verified design through DRC and LVS checks.

_Initialising the design_
- Design initialization like, setting the netlist file, loading the .lef file path, MMMC table is done by sourcing a TCL file
