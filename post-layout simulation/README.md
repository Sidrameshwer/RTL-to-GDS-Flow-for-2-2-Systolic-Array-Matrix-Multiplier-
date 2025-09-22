After completing place & route in Cadence Innovus, the gate-level netlist (.v) and the timing information file (.sdf) are generated.
For post-layout simulation in Synopsys VCS, the testbench is modified to include SDF back-annotation.

The flow is as follows:

- Add the SDF file in the testbench to annotate timing delays onto the DUT instance.
- Compile the gate-level netlist and the testbench using VCS.
- Elaborate the design with VCS to prepare the simulation executable.
- Run the simulation to verify the post-layout behavior of the design with annotated delays.
- View the waveform using DVE window

__Post Layout Simulation__
  
<img width="1919" height="964" alt="image" src="https://github.com/user-attachments/assets/95bab5e6-21e3-4df5-a695-e6bbf88d76a6" />
