`timescale 1ns / 1ps

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

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2023 11:42:38 PM
// Design Name: 
// Module Name: Control_Unit
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
module Control_Unit(
 
    //input [4:0] branch,
    input rst,
    input clk,
 
    input [4:0] opcode, // for the instructions
    
    output ir_load,
    output pc_load,
    output pc_inc,

    output reg_write,
    output reg_read
    //output pc_jmp,
    //output pc_branch,
    //output [3:0]branch_cond,
    
    //output reg_addr_read_1,
    //output reg_addr_read_2,
    //output reg_addr_write,

    
);

  
// Variable to control the states
reg [4:0] state; // we only have 5 states -> start, fetch, decode, wait and execute the specific instruction

// States of the Control Unit
parameter s_start   = 5'b00000,
          s_fetch   = 5'b00001,
          s_decode  = 5'b00010,
          s_wait = 5'b00011,
          
          // INSTRUCTION STATES
          s_nop     = 5'b00100,
          s_add     = 5'b00101,
          s_or      = 5'b00110,
          s_and     = 5'b00111,
          s_not     = 5'b01000,
          s_xor     = 5'b01001,
          s_cmp     = 5'b01010,
          s_bxx     = 5'b01011,
          s_jmp     = 5'b01100,
          s_ld      = 5'b01101,
          s_ldi     = 5'b01110,
          s_ldx     = 5'b01111,
          s_st      = 5'b10000,
          s_stx     = 5'b10001,
          s_hlt     = 5'b10010;

// Initialize the state
initial begin 
    state <= s_start; // Defining the first state as the start state
end

always @(posedge clk) begin
    if (rst) begin
        state <= s_start;
    end else if (!rst) begin
        case (state)
            s_start: state <= s_fetch;
            s_fetch: state <= s_wait;
            s_wait: state <= s_decode; //
            s_decode: begin
                case (opcode)
                    `NOP : state <= s_nop;
                    
                    `ADD : state <= s_add;
                    
                    `OR  : state <= s_or;
                    
                    `AND : state <= s_and;
                    
                    `NOT : state <= s_not;
                    
                    `XOR : state <= s_xor;
                    
                    `CMP : state <= s_cmp;
                    
                    `BXX : state <= s_bxx; //BRANCHES
                    
                    `JMP : state <= s_jmp;
                    
                    `LD  : state <= s_ld;
                    
                    `LDI : state <= s_ldi;
                    
                    `LDX : state <= s_ldx;
                    
                    `ST  : state <= s_st;
                    
                    `STX : state <= s_stx;
                    
                    `HLT : state <= s_hlt;
                    
                    default: state <= s_start;
                endcase
              end
          s_nop: state <= s_start; 
          s_add: state <= s_start;     
          s_or: state <= s_start; 
          s_and: state <= s_start; 
          s_not: state <= s_start; 
          s_xor: state <= s_start; 
          s_cmp: state <= s_start; 
          s_bxx: state <= s_start; 
          s_jmp: state <= s_start; 
          s_ld: state <= s_start; 
          s_ldi: state <= s_start; 
          s_ldx: state <= s_start; 
          s_st: state <= s_start; 
          s_stx: state <= s_start; 
          s_hlt: state <= s_start; 
        endcase
    end
end

assign ir_load = (state == s_fetch) ? 1'b1 : 1'b0;

assign pc_inc = (state == s_fetch) ? 1'b1 : 1'b0;

assign reg_read = (state == s_add || state == s_add  || state == s_or ||
                 state == s_and || state == s_not  || state == s_xor) ? 1'b1 : 1'b0;

assign reg_write = (state == s_start) ? 1'b1 : 1'b0;

//assign pc_load = (state == s_decode) ? 1'b1 : 1'b0;

//assign pc_jmp = (state == s_jmp) ? 1'b1 : 1'b0;

//assign pc_branch = (state == s_bxx) ? 1'b1 : 1'b0; 

//assign reg_write = (state == s_start) ? 1'b1 : 1'b0;

//assign reg_read = (state == s_add || state == s_add  || state == s_or ||
//                  state == s_and || state == s_not  || state == s_xor) ? 1'b1 : 1'b0;

/*
assign pc_inc_offset = (state == s_sjmp) ? 1'b1 : 1'b0;
//Jump if not zero
assign pc_jmp_z = (state == s_jz) ? 1'b1 : 1'b0;
//Jump if zero
assign pc_jmp_nz = (state == s_jnz) ? 1'b1 : 1'b0;
//Jump if not cary
assign pc_jmp_nc = (state == s_jnc) ? 1'b1 : 1'b0;
*/


endmodule