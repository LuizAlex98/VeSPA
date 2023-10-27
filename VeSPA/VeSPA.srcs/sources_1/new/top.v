`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2023 03:05:30 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    //output [4:0]opcode,
    output [31:0]operand1,
    output [31:0]operand2,
    output [31:0]result
    
    );

    Control_Unit ctrl_unit(
    .opcode(opcode), // for the instructions
    .clk(clk),
    .rst(rst),
    
    .pc_load(pc_load),
    .ir_load(ir_load),
    .pc_inc(pc_inc),
    
    .reg_write(reg_write),
    .reg_read(reg_read)
    );     

    Datapath data_path(
    .clk(clk),
    .rst(rst),
        
    .pc_load(pc_load),
    .ir_load(ir_load),
    .pc_inc(pc_inc),
    
    .reg_write(reg_write),
    .reg_read(reg_read),
    
    .opcode(opcode),
    .operand1(operand1),
    .operand2(operand2),
    .result(result)
    );    
    
endmodule
    