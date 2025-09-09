`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 15:02:28
// Design Name: 
// Module Name: systolic_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module systolic_test();
reg  clk,rst;
reg [7:0]a1,b1,a2,b2;
wire [14:0] c11,c12,c21,c22;
wire done;
initial clk=0;
always #5clk=~clk;
systolic_2x2 uut(clk,rst,a1,b1,a2,b2,c11,c12,c21,c22,done);

initial begin
rst=0;
#30 rst=1;
    a1=1;a2=0;
    b1=5;b2=0;
#10 a1=2;a2=3;
    b1=7;b2=6;
#10 a1=0;a2=4;
    b1=0;b2=8;
#10 a1=0;a2=0;
    b1=0;b2=0;

end
endmodule
