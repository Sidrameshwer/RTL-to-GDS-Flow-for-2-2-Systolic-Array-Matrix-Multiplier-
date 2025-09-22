`timescale 1ns / 1ps

module systolic_test();
reg clk,rst;
reg [7:0]a1,b1,a2,b2; 
wire [15:0] c11,c12,c21,c22;
wire done;
initial clk=0;
always #10 clk=~clk;
systolic_2x2 uut(clk,rst,a1,b1,a2,b2,c11,c12,c21,c22,done);

initial begin
$dumpfile("systolic.vcd");
$dumpvars(0,systolic_test);
end
initial begin
$sdf_annotate("systolic2x2_postlayoutsdffile.sdf",uut);
end
initial begin
rst=1;
#100 rst=0;
    a1=1;a2=0;
    b1=5;b2=0;
#20 a1=2;a2=3;
    b1=7;b2=6;
#20 a1=0;a2=4;
    b1=0;b2=8;
#20 a1=0;a2=0;
    b1=0;b2=0;
#100 $finish;
 end
endmodule
