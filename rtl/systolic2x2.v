`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.08.2025 14:25:13
// Design Name: 
// Module Name: systolic_2x2
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


module systolic_2x2(
    input clk,rst,
    input [7:0]a1,b1,a2,b2,
    output [14:0]c11,c12,c21,c22,
    output reg done
    );
    
    wire [7:0]a_temp1,b_temp1,a_temp2,b_temp2;
    integer i;
    always @(posedge clk,negedge rst)
        begin
            if(!rst) begin
                done<=0;
                i<=0;
                end
            else if( i<3)
                begin
                done<=0;
                i<=i+1;
                end
            else 
                done<=1;
        end
    
    PE u1(clk,rst,a1,b1,a_temp1,b_temp1,c11);
    PE u2(clk,rst,a2,b_temp1,a_temp2,,c21);
    PE u3(clk,rst,a_temp1,b2,,b_temp2,c12);
    PE u4(clk,rst,a_temp2,b_temp2,,,c22);
    
endmodule

//PE
module PE(
    input clk,rst,
    input [7:0] a,b,
    output reg [7:0] a_out,b_out,
    output reg [14:0] out_pe
    );
    
    always @(posedge clk,negedge rst)
        begin
            if(!rst)
                begin
                    a_out<=8'b0;
                    b_out<=8'b0;
                    out_pe<=15'b0;
                end
            else
                begin
                    a_out<=a;
                    b_out<=b;
                    out_pe<=out_pe+a*b;
                end
        end
endmodule
