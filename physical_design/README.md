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

__Before Placement__
<img width="1917" height="965" alt="image" src="https://github.com/user-attachments/assets/185a6d66-0b60-422d-ad38-cc3c926218cc" />
- After doing the steps before placemnt like floorplan,pin editor,power plan etc, the deisgn looks something like this.
- Save the design upto here so that you can source it later and continue the steps.

__After Placemnet__
<img width="1918" height="989" alt="image" src="https://github.com/user-attachments/assets/b4c9f536-e23f-42d8-a623-7fcf95c86f82" />

- After placement, go to Timing->Report Timing and select Design stage like pre-CTS, post -CTS, post -Route than slect hold or setup.

<img width="883" height="650" alt="image" src="https://github.com/user-attachments/assets/6f7dcc15-7626-41db-bc55-a332e3e4d54f" />

- Check whether you have any setup or hold vilations. If yes, than you can see the volated path in Timing-> Debug Timing. After knowing the path you can add buffer manullay from 'ECO' window.
- Other option is go to EC0->Optimize and select Design stage and Optimization type like setup, hold, DRV.
- Generally, we resolve setup violations(if there are any) in this stage. Hold violations are taken care after the CTS stage as hold slack becomes worst once CTS is done.

* Now, source the ccopt_spec_file.tcl and enter " ccopt_design -cts" command in innovus window.
* Your clock tree has been built
* You can go to Clock->CCopt Clock Tree Debugger to see whether the clock tree has been bulit or not.
  <img width="1851" height="906" alt="image" src="https://github.com/user-attachments/assets/5ef938db-d91a-4d26-8297-9e12da510f79" />

- Check the timings, this time chossing post -CTS as design stage.
<img width="1071" height="684" alt="image" src="https://github.com/user-attachments/assets/eb90f3d3-41af-4330-837e-259b5842fa4a" />

  
- After this, do the Routing
- Go to Route-> NanoRoute-> Route 
<img width="730" height="803" alt="image" src="https://github.com/user-attachments/assets/964b3d44-7ce0-4b92-8c47-eff059597254" />

<img width="1917" height="959" alt="image" src="https://github.com/user-attachments/assets/cd39bc76-b51a-4bc5-a938-f1efb0f60673" />

- Check the timing again this time, with Design stage as post -Route.
- Verify DRC and connectivity.
- If, DRC, connectivity everything is fine with 0 violations, __Layout is done__.
- Save layout work.

For the final layout outputs, execute the following instructions sequentially.

- streamOut alu_layout.gds
- saveNetlist alu_postlayoutnetlist.v
- extractRC
- rcOut -spef alu_postlayoutspeffile.spef
- write_sdf -recompute_parallel_arcs alu_postlayoutsdffile.sdf
- defOut alu_postlayoutdeffile.def





