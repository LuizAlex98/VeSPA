`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 03:27:13 PM
// Design Name: 
// Module Name: tb_top
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

module tb_top();
    reg clk;
    reg rst;
    //wire [4:0]opcode;
    wire [31:0]operand1;
    wire [31:0]operand2;
    wire [31:0]result;
    
    
    top uut(
    .clk(clk),
    .rst(rst),
    .operand1(operand1),
    .operand2(operand2),
    .result(result)
    );
    
    initial begin
        rst = 1'b1;
        clk = 1'b0;
    end
    
    always #10 clk = ~clk;
    
    always@(posedge clk)
    begin
        rst = 1'b0;  
    end
    
endmodule
