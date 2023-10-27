`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 11:17:07 AM
// Design Name: 
// Module Name: DATA_FORMATS
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
`define NOP 5'b00000
`define ADD 5'b00001
`define SUB 5'b00010
`define OR  5'b00011
`define AND 5'b00100
`define NOT 5'b00101
`define XOR 5'b00110
`define CMP 5'b00111
`define BXX 5'b01000
`define JMP 5'b01001
`define LD  5'b01010
`define LDI 5'b01011
`define LDX 5'b01100
`define ST  5'b01101
`define STX 5'b01110
`define HLT 5'b11111

//---BRANCHES
`define BRA 'b0000
`define BNV 'b1000
`define BCC 'b0001
`define BCS 'b1001
`define BVC 'b0010
`define BVS 'b1010
`define BEQ 'b0011
`define BNE 'b1011
`define BGE 'b0100
`define BLT 'b1100
`define BGT 'b0101
`define BLE 'b1101
`define BPL 'b0110
`define BMI 'b1110